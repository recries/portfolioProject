import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogContentText,
  DialogTitle,
} from '@mui/material';
import axios from 'axios';
import React, { useState } from 'react';

const BoardDataDelete = (props) => {
  const [open, setOpen] = React.useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const submitDataDelete = async (num, board_type) => {
    await axios
      .delete(`http://localhost:8090/boards/delete/${num}/${board_type}`)
      .then((response) => {})
      .catch((err) => console.error(err.message));

    setOpen(false);
    window.location.replace(`/boards/list/${board_type}`);
  };

  return (
    <div>
      {' '}
      <Button variant='outlined' color='error' onClick={handleClickOpen}>
        게시글 삭제
      </Button>
      <Dialog
        open={open}
        onClose={handleClose}
        aria-labelledby='alert-dialog-title'
        aria-describedby='alert-dialog-description'
      >
        <DialogTitle id='alert-dialog-title'>
          {'삭제된 데이터는 복구할 수 없습니다.'}
        </DialogTitle>
        <DialogContent>
          <DialogContentText id='alert-dialog-description'>
            선택한 게시글을 삭제하면 복구할 수 없습니다. 정말로
            삭제하시겠습니까?
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>취소</Button>
          <Button
            onClick={() => {
              submitDataDelete(props.num, props.board_type);
            }}
            autoFocus
          >
            데이터 삭제
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
};

export default BoardDataDelete;
