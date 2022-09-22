import {
  Box,
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  FormControl,
  InputLabel,
  MenuItem,
  OutlinedInput,
  Select,
} from '@mui/material';
import axios from 'axios';
import React, { useState } from 'react';

const OrderStatusChange = (props) => {
  const [open, setOpen] = React.useState(false);
  const [input, setInput] = useState({
    order_status: '',
  });
  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = (event, reason) => {
    if (reason !== 'backdropClick') {
      setOpen(false);
    }
  };

  const [selectStatus, setSelectStatus] = React.useState('');
  const handleSelectStatus = (event) => {
    setSelectStatus(event.target.value);
    // // console.log(event.target.value);
    setInput({ ...input, order_status: event.target.value });
  };

  const handleStatusChange = async (num) => {
    // e.preventDefault();
    const formData = new FormData();
    formData.append('num', props.num);
    formData.append('order_status', input.order_status);

    axios
      .put(`http://localhost:8090/orders/statuschange`, formData)
      .then((response) => {})
      .catch((err) => console.error(err.message));

    setOpen(false);
    window.location.replace('/orders');
  };
  return (
    <div>
      <Button
        onClick={handleClickOpen}
        variant='contained'
        color='primary'
        size='large'
      >
        주문 상태 변경
      </Button>
      <Dialog disableEscapeKeyDown open={open} onClose={handleClose}>
        <DialogTitle>주문 상태 변경하기</DialogTitle>
        <DialogContent>
          <Box component='form' sx={{ display: 'flex', flexWrap: 'wrap' }}>
            <FormControl sx={{ m: 1, minWidth: 120 }}>
              <InputLabel id='demo-dialog-select-label'>주문 상태</InputLabel>

              <Select
                labelId='demo-simple-select-label'
                id='demo-simple-select'
                value={selectStatus}
                label='주문 상태'
                onChange={(e) => {
                  handleSelectStatus(e);
                }}
              >
                <MenuItem value={1}>주문 접수</MenuItem>
                <MenuItem value={0}>주문 취소 / 불가</MenuItem>
                <MenuItem value={2}>상품 준비 중</MenuItem>
                <MenuItem value={3}>배송 준비 중</MenuItem>
                <MenuItem value={4}>배송 중</MenuItem>
                <MenuItem value={5}>배송 완료</MenuItem>
              </Select>
            </FormControl>
          </Box>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>취소</Button>
          <Button onClick={handleStatusChange}>변경하기</Button>
        </DialogActions>
      </Dialog>
    </div>
  );
};

export default OrderStatusChange;
