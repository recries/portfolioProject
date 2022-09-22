import React, { useEffect, useState } from 'react';
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import TextField from '@mui/material/TextField';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';
import { Container } from '@mui/system';
import {
  Box,
  FormControl,
  FormHelperText,
  InputLabel,
  MenuItem,
  OutlinedInput,
  Select,
} from '@mui/material';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

const styles = { hidden: { display: 'none' } };

const CouponAdd = (props) => {
  const [open, setOpen] = React.useState(false);

  const [input, setInput] = useState({
    coupon_type: '',
    coupon_value: '',
  });

  const { coupon_type, coupon_value } = input;

  const [selectCouponType, setSelectCouponType] = React.useState('');
  const [selectCouponValue, setSelectCouponValue] = React.useState('');

  const handleCouponTypeChange = (event) => {
    setSelectCouponType(event.target.value);
    // console.log(event.target.value);
    setInput({ ...input, coupon_type: event.target.value });
  };

  const handleCouponValueChange = (event) => {
    setSelectCouponValue(event.target.value);
    // console.log(event.target.value);
    setInput({ ...input, coupon_value: event.target.value });
  };

  const typeCheck = (coupon_type) => {
    if (coupon_type == 1) {
      return (
        <FormControl sx={{ m: 1, minWidth: 150 }}>
          <InputLabel id='coupon_value'>값</InputLabel>
          <Select
            labelId='coupon_value'
            id='coupon_value'
            value={selectCouponValue}
            label='coupon_value'
            onChange={handleCouponValueChange}
          >
            <MenuItem value={5}>5%</MenuItem>
            <MenuItem value={10}>10%</MenuItem>
            <MenuItem value={15}>15%</MenuItem>
            <MenuItem value={20}>20%</MenuItem>
            <MenuItem value={25}>25%</MenuItem>
          </Select>
          <FormHelperText>할인 적용 값</FormHelperText>
        </FormControl>
      );
    } else if (coupon_type == 2) {
      return (
        <FormControl sx={{ m: 1, minWidth: 150 }}>
          <InputLabel id='coupon_value'>값</InputLabel>
          <Select
            labelId='coupon_value'
            id='coupon_value'
            value={selectCouponValue}
            label='coupon_value'
            onChange={handleCouponValueChange}
          >
            <MenuItem value={1000}>1000원</MenuItem>
            <MenuItem value={3000}>3000원</MenuItem>
            <MenuItem value={5000}>5000원</MenuItem>
            <MenuItem value={7000}>7000원</MenuItem>
            <MenuItem value={9000}>9000원</MenuItem>
          </Select>
          <FormHelperText>할인 적용 값</FormHelperText>
        </FormControl>
      );
    }
  };

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleFormSubmit = async (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append('member_number', props.member_number);
    formData.append('coupon_type', coupon_type);
    formData.append('coupon_value', coupon_value);

    await axios
      .post('http://localhost:8090/members/newcouponsave', formData)
      .then((response) => {
        setInput({
          coupon_type: '',
          coupon_value: '',
        });
      })
      .catch((err) => console.error(err.message));

    setOpen(false);
    window.location.replace('/members');
  };

  return (
    <div>
      <Button
        variant='contained'
        color='primary'
        onClick={handleClickOpen}
        fullWidth
      >
        할인권 지급
      </Button>

      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>할인권 지급</DialogTitle>
        <DialogContent>
          <Box>
            <FormControl sx={{ m: 1, minWidth: 150 }}>
              <InputLabel id='coupon_type'>유형</InputLabel>
              <Select
                labelId='coupon_type'
                id='coupon_type'
                value={selectCouponType}
                label='coupon_type'
                onChange={handleCouponTypeChange}
              >
                <MenuItem value={1}>비율 할인</MenuItem>
                <MenuItem value={2}>금액 할인</MenuItem>
              </Select>
              <FormHelperText>할인권 유형</FormHelperText>
            </FormControl>

            {typeCheck(input.coupon_type)}
          </Box>
        </DialogContent>
        <DialogActions>
          <Button
            variant='contained'
            color='primary'
            onClick={handleFormSubmit}
          >
            지급
          </Button>
          <Button variant='contained' color='primary' onClick={handleClose}>
            닫기
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
};

export default CouponAdd;
