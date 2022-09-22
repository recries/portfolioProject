import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogContentText,
  DialogTitle,
} from '@mui/material';
import axios from 'axios';
import React from 'react';

const OrderDataDelete = (props) => {
  const [open, setOpen] = React.useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const submitDataDelete = async (num) => {
    await axios
      .delete(`http://localhost:8090/orders/deletedata/${num}`)
      .then((response) => {})
      .catch((err) => console.error(err.message));

    setOpen(false);
    window.location.replace('/orders');
  };

  return (
    <div>
      {' '}
      <Button variant='outlined' color='error' onClick={handleClickOpen}>
        주문 데이터 영구 삭제
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
            선택한 주문의 데이터를 삭제하면 복구할 수 없습니다. 정말로
            삭제하시겠습니까?
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>취소</Button>
          <Button
            onClick={() => {
              submitDataDelete(props.num);
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

export default OrderDataDelete;
