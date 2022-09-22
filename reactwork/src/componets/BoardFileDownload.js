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

const BoardFileDownload = (props) => {
  const [open, setOpen] = React.useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const downloadFile = async (num, board_type) => {
    await axios({
      url: `http://localhost:8090/boards/contentdownload/${board_type}/${num}`,
      method: 'GET',
      responseType: 'blob',
    })
      .then((response) => {
        const blob = new Blob([response.data]); // 특정 타입을 정의해야 경우에는 옵션을 사용해 MIME 유형을 정의 할 수 있습니다. // const blob = new Blob([this.content], {type: 'text/plain'}) // blob을 사용해 객체 URL을 생성합니다.
        const fileObjectUrl = window.URL.createObjectURL(blob); // blob 객체 URL을 설정할 링크를 만듭니다.
        const link = document.createElement('a');
        link.href = fileObjectUrl;
        link.style.display = 'none';
        link.download = props.upload.split('_')[1];

        document
          .getElementById('downBtn')
          .setAttribute('onClick', link.click());
        setOpen(false);
      })
      .catch((err) => console.error(err.message));
  };

  return (
    <div>
      {props.upload != null ? (
        <div>
          <Button variant='contained' color='primary' onClick={handleClickOpen}>
            다운로드
          </Button>
          <Dialog
            open={open}
            onClose={handleClose}
            aria-labelledby='alert-dialog-title'
            aria-describedby='alert-dialog-description'
          >
            <DialogTitle id='alert-dialog-title'>
              {'첨부파일 다운로드'}
            </DialogTitle>
            <DialogContent>
              <DialogContentText id='alert-dialog-description'>
                {props.upload.split('_')[1]} 파일을 다운로드 하시겠습니까?
              </DialogContentText>
            </DialogContent>
            <DialogActions>
              <Button onClick={handleClose}>취소</Button>
              <Button
                id='downBtn'
                onClick={() => {
                  downloadFile(props.num, props.board_type);
                }}
                autoFocus
              >
                다운로드
              </Button>
            </DialogActions>
          </Dialog>
        </div>
      ) : (
        ''
      )}
    </div>
  );
};

export default BoardFileDownload;
