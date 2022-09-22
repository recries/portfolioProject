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
import MemberDataDelete from './MemberDataDelete';
import CouponAdd from './CouponAdd';
import CouponList from './CouponList';

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
const MemberTool = () => {
  const [memberlists, setMemberlists] = useState([]);
  const [searchKeyWord, setSearchKeyWord] = useState('');

  useEffect(() => {
    // db 연동
    loadData();
  }, []);

  const loadData = async () => {
    await axios
      .get('http://localhost:8090/members/list')
      .then((response) => {
        // console.log('response:', response.data);
        setMemberlists(response.data.alist);
      })
      .catch((err) => console.error(err.message));
  };

  const handleValueChange = (e) => {
    setSearchKeyWord(e.target.value);
  };

  const handleStatusChange = async (num) => {
    axios
      .put(`http://localhost:8090/members/statuschange/${num}`)
      .then((response) => {
        loadData();
      })
      .catch((err) => console.error(err.message));
  };

  const handleTypeChange = async (num) => {
    axios
      .put(`http://localhost:8090/members/typechange/${num}`)
      .then((response) => {
        loadData();
      })
      .catch((err) => console.error(err.message));
  };

  const filteredComponents = (data) => {
    data = data.filter((c) => {
      // console.log('===', c.name);
      // console.log(c.book_title);
      // console.log(data.num);

      return c.member_id.indexOf(searchKeyWord) > -1;
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
            {row.member_number}
          </TableCell>
          <TableCell align='center'>{row.member_id}</TableCell>
          <TableCell align='center'>{row.member_pass}</TableCell>

          <TableCell align='center'>
            {row.member_type === 1 ? (
              <Button variant='contained' color='secondary'>
                관리자 계정
              </Button>
            ) : (
              <Button variant='contained' color='success'>
                일반 회원
              </Button>
            )}
          </TableCell>

          <TableCell align='center'>
            {row.member_status === 1 ? (
              <Button variant='contained' color='success'>
                활동 중
              </Button>
            ) : (
              <Button variant='contained' color='warning'>
                탈퇴 처리 됨
              </Button>
            )}
          </TableCell>
        </TableRow>
        <TableRow>
          <TableCell style={{ paddingBottom: 0, paddingTop: 0 }} colSpan={15}>
            <Collapse in={open} timeout='auto' unmountOnExit>
              <Box sx={{ border: 0 }}>
                <Typography variant='h6' gutterBottom component='div'>
                  회원 설정
                </Typography>
                <Stack direction='row' spacing={2}>
                  <Button
                    variant='outlined'
                    onClick={() => {
                      handleTypeChange(row.num);
                    }}
                  >
                    회원 유형 바꾸기
                  </Button>
                  <Button
                    variant='outlined'
                    onClick={() => {
                      handleStatusChange(row.num);
                    }}
                  >
                    계정 상태 바꾸기
                  </Button>

                  <div>
                    <CouponAdd member_number={row.member_number} />
                  </div>
                  <div>
                    <MemberDataDelete num={row.num} />
                  </div>
                </Stack>
                <Card sx={{ minWidth: 275 }}>
                  <CardContent>
                    <Typography variant='body2'>회원 등록 정보</Typography>
                    <Typography
                      sx={{ fontSize: 14 }}
                      color='text.secondary'
                      gutterBottom
                    >
                      이름 :{row.member_name}
                    </Typography>
                    <Typography
                      sx={{ fontSize: 14 }}
                      color='text.secondary'
                      gutterBottom
                    >
                      연락처 :{row.member_phone}
                    </Typography>
                    <Typography
                      sx={{ fontSize: 14 }}
                      color='text.secondary'
                      gutterBottom
                    >
                      주소 :{row.member_address}
                    </Typography>
                    <Typography
                      sx={{ fontSize: 14 }}
                      color='text.secondary'
                      gutterBottom
                    >
                      이메일 :{row.member_email}
                    </Typography>
                  </CardContent>
                </Card>
                <Card sx={{ minWidth: 100 }}>
                  <CardContent>
                    <Typography variant='body2'>보유 할인권</Typography>
                    <CouponList member_number={row.member_number} />
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
              회원 관리 시스템
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
                <TableCell>회원 번호</TableCell>
                <TableCell align='center'>ID</TableCell>
                <TableCell align='center'>비밀 번호</TableCell>

                <TableCell align='center'>회원 유형</TableCell>

                <TableCell align='center'>계정 상태</TableCell>
              </TableRow>
            </TableHead>

            <TableBody>
              {filteredComponents(memberlists)
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
          count={memberlists.length}
          rowsPerPage={rowsPerPage}
          page={page}
          onPageChange={handleChangePage}
          onRowsPerPageChange={handleChangeRowsPerPage}
        />
      </Paper>
    </Container>
  );
};

export default MemberTool;
