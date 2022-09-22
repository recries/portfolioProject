import React, { useState } from 'react';
import Button from '@mui/material/Button';
import TextField from '@mui/material/TextField';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import { Link } from 'react-router-dom';
import DialogTitle from '@mui/material/DialogTitle';

import axios from 'axios';

const styles = { hidden: { display: 'none' } };

const BoardReply = (props) => {
  const [open, setOpen] = React.useState(false);
  const board_type = props.board_type;

  const [input, setInput] = useState({
    filename: null,
    subject: '',
    content: '',
    board_type: props.board_type,
    re_step: props.re_step,
    re_level: props.re_level,
  });

  const { filename, subject, content } = input;

  const [inputfile, setInputfile] = useState({
    filename: '',
  });

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleFileChange = (e) => {
    e.preventDefault();
    setInput({ ...input, filename: e.target.files[0] });
    setInputfile({ ...inputfile, filename: e.target.value });
  };

  const handleValueChange = (e) => {
    let nextState = {};
    nextState[e.target.name] = e.target.value;
    setInput((prev) => {
      return { ...prev, ...nextState };
    });
  };

  const handleFormSubmit = async (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append('subject', subject);
    formData.append('content', content);
    formData.append('board_type', props.board_type);
    formData.append('ref', props.board_ref);
    formData.append('re_step', props.re_step);
    if (filename !== null) {
      formData.append('filename', filename);
    }
    const config = { headers: { 'Content-Type': 'multipart/form-data' } };

    await axios
      .post(
        `http://localhost:8090/boards/reply/${props.re_step}/${props.re_level}`,
        formData,
        config
      )
      .then((response) => {
        setInput({
          filename: '',
          subject: '',
          content: '',
          board_type: props.board_type,
          re_step: props.re_step,
          re_level: props.re_level,
        });
      })
      .catch((err) => console.error(err.message));

    setOpen(false);
    window.location.replace(`/boards/list/${props.board_type}`);
  };

  return (
    <div>
      <Button variant='contained' color='primary' onClick={handleClickOpen}>
        답글 달기
      </Button>

      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>답글 달기</DialogTitle>
        <DialogContent>
          <input
            style={styles.hidden}
            id='raised-button-file'
            type='file'
            name='filename'
            file={input.filename}
            onChange={handleFileChange}
          />
          <label htmlFor='raised-button-file'>
            <Button
              variant='contained'
              color='primary'
              component='span'
              name='filename'
            >
              {inputfile.filename === '' ? '파일추가' : inputfile.filename}
            </Button>
          </label>
          <br />
          <br />
          <TextField
            label='제목'
            variant='standard'
            type='text'
            name='subject'
            value={input.subject}
            onChange={handleValueChange}
          />
          <br />
          <br />
          <TextField
            label='내용'
            id='outlined-multiline-static'
            multiline
            rows={10}
            name='content'
            value={input.content}
            onChange={handleValueChange}
          />
          <br />
        </DialogContent>
        <DialogActions>
          <Button
            variant='contained'
            color='primary'
            onClick={handleFormSubmit}
          >
            추가
          </Button>
          <Button variant='contained' color='primary' onClick={handleClose}>
            닫기
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
};

export default BoardReply;
