import { styled, alpha } from '@mui/material/styles';
import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import IconButton from '@mui/material/IconButton';
import Typography from '@mui/material/Typography';
import InputBase from '@mui/material/InputBase';

import SearchIcon from '@mui/icons-material/Search';
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import Paper from '@mui/material/Paper';
import {
  Button,
  Card,
  CardContent,
  Container,
  Stack,
  Table,
  TableContainer,
  TablePagination,
} from '@mui/material';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import TableCell from '@mui/material/TableCell';
import TableBody from '@mui/material/TableBody';

import { Link } from 'react-router-dom';
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown';
import KeyboardArrowUpIcon from '@mui/icons-material/KeyboardArrowUp';
import Collapse from '@mui/material/Collapse';
import OrderStatusChange from './OrderStatusChange';
import OrderDataDelete from './OrderDataDelete';

const Search = styled('div')(({ theme }) => ({
  position: 'relative',
  borderRadius: theme.shape.borderRadius,
  backgroundColor: alpha(theme.palette.common.white, 0.15),
  '&:hover': {
    backgroundColor: alpha(theme.palette.common.white, 0.25),
  },
  marginLeft: 0,
  width: '100%',
  [theme.breakpoints.up('sm')]: {
    marginLeft: theme.spacing(1),
    width: 'auto',
  },
}));

const SearchIconWrapper = styled('div')(({ theme }) => ({
  padding: theme.spacing(0, 2),
  height: '100%',
  position: 'absolute',
  pointerEvents: 'none',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
}));

const StyledInputBase = styled(InputBase)(({ theme }) => ({
  color: 'inherit',
  '& .MuiInputBase-input': {
    padding: theme.spacing(1, 1, 1, 0),
    // vertical padding + font size from searchIcon
    paddingLeft: `calc(1em + ${theme.spacing(4)})`,
    transition: theme.transitions.create('width'),
    width: '100%',
    [theme.breakpoints.up('sm')]: {
      width: '12ch',
      '&:focus': {
        width: '20ch',
      },
    },
  },
}));
const OrderTool = () => {
  const [orderlists, setOrderlists] = useState([]);
  const [searchKeyWord, setSearchKeyWord] = useState('');

  useEffect(() => {
    // db 연동
    loadData();
  }, []);

  const loadData = async () => {
    await axios
      .get('http://localhost:8090/orders/list')
      .then((response) => {
        // console.log('response:', response.data);
        setOrderlists(response.data.alist);
      })
      .catch((err) => console.error(err.message));
  };

  const handleValueChange = (e) => {
    setSearchKeyWord(e.target.value);
  };

  const statusCheck = (order_status) => {
    if (order_status === 1) {
      return (
        <Button variant='contained' color='info'>
          주문 접수 됨
        </Button>
      );
    } else if (order_status === 0) {
      return (
        <Button variant='contained' color='error'>
          주문 취소 됨
        </Button>
      );
    } else if (order_status === 2) {
      return (
        <Button variant='contained' color='secondary'>
          상품 준비 중
        </Button>
      );
    } else if (order_status === 3) {
      return (
        <Button variant='contained' color='warning'>
          배송 준비 중
        </Button>
      );
    } else if (order_status === 4) {
      return (
        <Button variant='contained' color='warning'>
          배송 중
        </Button>
      );
    } else if (order_status === 5) {
      return (
        <Button variant='contained' color='success'>
          배송 완료
        </Button>
      );
    }
  };

  const filteredComponents = (data) => {
    data = data.filter((c) => {
      // console.log('===', c.name);
      // console.log(c.book_title);
      // console.log(data.num);

      return c.order_number.indexOf(searchKeyWord) > -1;
    });

    return data;
  };

  const [page, setPage] = React.useState(0);
  const [rowsPerPage, setRowsPerPage] = React.useState(10);

  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(+event.target.value);
    setPage(0);
  };

  function Row(props) {
    const { row } = props;
    const [open, setOpen] = React.useState(false);

    return (
      <React.Fragment>
        <TableRow sx={{ '& > *': { borderBottom: 'unset' } }}>
          <TableCell>
            <IconButton
              aria-label='expand row'
              size='small'
              onClick={() => setOpen(!open)}
            >
              {open ? <KeyboardArrowUpIcon /> : <KeyboardArrowDownIcon />}
            </IconButton>
          </TableCell>
          <TableCell component='th' scope='row'>
            {row.order_number}
          </TableCell>
          <TableCell align='center'>{row.member_number}</TableCell>
          <TableCell align='center'>{row.ezenmembers.member_id}</TableCell>
          <TableCell align='center'>{row.book_id}</TableCell>
          <TableCell align='center'>{row.ezenbooks.book_title}</TableCell>
          <TableCell align='center'>{row.book_qty}권</TableCell>
          <TableCell align='center'>{row.order_cost} 원</TableCell>

          <TableCell align='center'>{statusCheck(row.order_status)}</TableCell>
        </TableRow>
        <TableRow>
          <TableCell style={{ paddingBottom: 0, paddingTop: 0 }} colSpan={15}>
            <Collapse in={open} timeout='auto' unmountOnExit>
              <Box sx={{ border: 0 }}>
                <Typography variant='h6' gutterBottom component='div'>
                  주문 설정
                </Typography>
                <Stack direction='row' spacing={2}>
                  <div>
                    <OrderStatusChange num={row.num} />
                  </div>
                  <div>
                    <OrderDataDelete num={row.num} />
                  </div>
                </Stack>
                <Card sx={{ minWidth: 275 }}>
                  <CardContent>
                    <Typography variant='body2'>배송 정보</Typography>
                    <Typography
                      sx={{ fontSize: 14 }}
                      color='text.secondary'
                      gutterBottom
                    >
                      배송지 :{row.order_address}
                    </Typography>
                    <Typography
                      sx={{ fontSize: 14 }}
                      color='text.secondary'
                      gutterBottom
                    >
                      받는 분 :{row.order_name}
                    </Typography>
                    <Typography
                      sx={{ fontSize: 14 }}
                      color='text.secondary'
                      gutterBottom
                    >
                      받는 분 연락처 :{row.order_phone}
                    </Typography>
                    <Typography
                      sx={{ fontSize: 14 }}
                      color='text.secondary'
                      gutterBottom
                    >
                      주문자 이름 :{row.ezenmembers.member_name}
                    </Typography>
                    <Typography
                      sx={{ fontSize: 14 }}
                      color='text.secondary'
                      gutterBottom
                    >
                      주문자 연락처 :{row.ezenmembers.member_phone}
                    </Typography>
                  </CardContent>
                </Card>
              </Box>
            </Collapse>
          </TableCell>
        </TableRow>
      </React.Fragment>
    );
  }

  return (
    <Container maxWidth='xl'>
      <Box sx={{ flexGrow: 1 }}>
        <AppBar position='static'>
          <Toolbar>
            <Typography
              variant='h6'
              noWrap
              component='div'
              sx={{ flexGrow: 1, display: { xs: 'none', sm: 'block' } }}
            >
              주문 관리 시스템
            </Typography>

            <Link to='/'>
              <Button variant='contained' size='large' color='success'>
                관리 홈으로
              </Button>
            </Link>
            <Search>
              <SearchIconWrapper>
                <SearchIcon />
              </SearchIconWrapper>
              <StyledInputBase
                placeholder='Search…'
                inputProps={{ 'aria-label': 'search' }}
                value={searchKeyWord}
                onChange={handleValueChange}
              />
            </Search>
          </Toolbar>
        </AppBar>
      </Box>

      <Paper sx={{ width: '100%' }}>
        <TableContainer sx={{ maxHeight: 800 }}>
          <Table stickyHeader aria-label='sticky table'>
            <TableHead>
              <TableRow>
                <TableCell />
                <TableCell>주문 번호</TableCell>
                <TableCell align='center'>주문 회원 번호</TableCell>
                <TableCell align='center'>주문 회원 ID</TableCell>
                <TableCell align='center'>도서 ID</TableCell>
                <TableCell align='center'>도서 제목</TableCell>
                <TableCell align='center'>수량(권)</TableCell>
                <TableCell align='center'>총 금액(주문단위 금액)</TableCell>

                <TableCell align='center'>주문 상태</TableCell>
              </TableRow>
            </TableHead>

            <TableBody>
              {filteredComponents(orderlists)
                .slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
                .map((row) => (
                  <Row key={row.num} row={row} />
                ))}
            </TableBody>
          </Table>
        </TableContainer>

        <TablePagination
          rowsPerPageOptions={[10, 25, 100]}
          component='div'
          count={orderlists.length}
          rowsPerPage={rowsPerPage}
          page={page}
          onPageChange={handleChangePage}
          onRowsPerPageChange={handleChangeRowsPerPage}
        />
      </Paper>
    </Container>
  );
};

export default OrderTool;
