import {
  Button,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
} from '@mui/material';
import axios from 'axios';
import React, { useEffect, useState } from 'react';

const CouponList = (props) => {
  const [couponlists, setCouponlists] = useState([]);

  useEffect(() => {
    // db 연동
    loadData(props.member_number);
  }, []);

  const loadData = async (member_number) => {
    await axios
      .get(`http://localhost:8090/members/couponlist/${member_number}`)
      .then((response) => {
        // console.log('response:', response.data);
        setCouponlists(response.data.alist);
      })
      .catch((err) => console.error(err.message));
  };

  const deleteCoupon = async (num) => {
    await axios
      .delete(`http://localhost:8090/members/deletecoupon/${num}`)
      .then((response) => {
        loadData(props.member_number);
      })
      .catch((err) => console.error(err.message));
  };

  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 100 }} size='small' aria-label='a dense table'>
        <TableHead>
          <TableRow>
            <TableCell>할인권 번호</TableCell>
            <TableCell align='right'>할인 내용</TableCell>
            <TableCell align='right'></TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {couponlists.map((row) => (
            <TableRow
              key={row.num}
              sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
            >
              <TableCell component='th' scope='row'>
                {row.coupon_number}
              </TableCell>
              {row.coupon_type === 1 ? (
                <TableCell align='right'>{row.coupon_value}% 할인</TableCell>
              ) : (
                <TableCell align='right'>{row.coupon_value}원 할인</TableCell>
              )}
              <TableCell align='right'>
                <Button
                  variant='text'
                  color='error'
                  onClick={() => {
                    deleteCoupon(row.num);
                  }}
                >
                  삭제하기
                </Button>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
};

export default CouponList;
