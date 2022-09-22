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

import BookAdd from './BookAdd';
import { Link } from 'react-router-dom';
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown';
import KeyboardArrowUpIcon from '@mui/icons-material/KeyboardArrowUp';
import Collapse from '@mui/material/Collapse';
import BookDataDelete from './BookDataDelete';
import BookUpdate from './BookUpdate';

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

const BookTool = () => {
  const [booklists, setBooklists] = useState([]);
  const [searchKeyWord, setSearchKeyWord] = useState('');

  useEffect(() => {
    // db 연동
    loadData();
  }, []);

  const loadData = async () => {
    await axios
      .get('http://localhost:8090/books/list')
      .then((response) => {
        // console.log('response:', response.data);
        setBooklists(response.data.alist);
      })
      .catch((err) => console.error(err.message));
  };

  const handleValueChange = (e) => {
    setSearchKeyWord(e.target.value);
  };

  const handleStatusChange = async (num) => {
    axios
      .put(`http://localhost:8090/books/statuschange/${num}`)
      .then((response) => {
        loadData();
      })
      .catch((err) => console.error(err.message));
  };

  const handleStockChange = async (num) => {
    axios
      .put(`http://localhost:8090/books/stockchange/${num}`)
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

      return c.book_title.indexOf(searchKeyWord) > -1;
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

  const categoryCheck = (book_category) => {
    // 장르는 계속 추가될 예정
    if (book_category === 1) {
      return '시';
    } else if (book_category === 2) {
      return '역사소설';
    } else if (book_category === 3) {
      return '과학소설(SF)';
    } else if (book_category === 4) {
      return '추리/미스터리 소설';
    } else if (book_category === 5) {
      return '판타지/환상문학';
    } else if (book_category === 6) {
      return '희곡';
    } else if (book_category === 7) {
      return '교양인문학';
    } else if (book_category === 8) {
      return '인문에세이';
    } else if (book_category === 9) {
      return '철학';
    } else if (book_category === 10) {
      return '심리/정신분석학';
    } else if (book_category === 11) {
      return '신화/종교학';
    } else if (book_category === 12) {
      return '문화/문화이론';
    } else if (book_category === 13) {
      return '비평/칼럼';
    } else if (book_category === 14) {
      return '사회문제';
    } else if (book_category === 15) {
      return '환경/생태문제';
    } else if (book_category === 16) {
      return '사회운동';
    } else if (book_category === 17) {
      return '언론/미디어';
    } else if (book_category === 18) {
      return '법과 생활';
    } else if (book_category === 19) {
      return '동양사일반';
    } else if (book_category === 20) {
      return '역사학';
    } else if (book_category === 21) {
      return '한국고대~고려시대';
    } else if (book_category === 22) {
      return '조선사';
    } else if (book_category === 23) {
      return '서양사';
    } else if (book_category === 24) {
      return '전쟁/분쟁사';
    } else if (book_category === 25) {
      return '컬러링북';
    } else if (book_category === 26) {
      return '예술/대중문화의 이해';
    } else if (book_category === 27) {
      return '미술';
    } else if (book_category === 28) {
      return '음악';
    } else if (book_category === 29) {
      return '건축';
    } else if (book_category === 30) {
      return '무용';
    } else if (book_category === 31) {
      return '기초과학/교양과학';
    } else if (book_category === 32) {
      return '과학사회학';
    } else if (book_category === 33) {
      return '생면과학';
    } else if (book_category === 34) {
      return '의학';
    } else if (book_category === 35) {
      return '천문학';
    } else if (book_category === 36) {
      return '화학';
    } else if (book_category === 37) {
      return '경제학/경제일반';
    } else if (book_category === 38) {
      return '기업 경영';
    } else if (book_category === 39) {
      return '마케팅/세일즈';
    } else if (book_category === 40) {
      return '트렌드/미래전망';
    } else if (book_category === 41) {
      return '재테크/투지';
    } else if (book_category === 42) {
      return '창업/취업/은퇴';
    }
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
            {row.book_id}
          </TableCell>
          <TableCell align='right'>{row.book_title}</TableCell>
          <TableCell align='right'>{row.book_author}</TableCell>
          <TableCell align='right'>{row.book_publisher}</TableCell>
          <TableCell align='right'>{row.book_price}원</TableCell>

          <TableCell align='right'>
            {categoryCheck(row.book_category)}
          </TableCell>
          <TableCell align='right'>{row.book_isbn}</TableCell>

          <TableCell align='right'>
            {row.book_stock === 1 ? (
              <Button variant='contained' color='success'>
                재고 있음
              </Button>
            ) : (
              <Button variant='contained' color='error'>
                재고 없음
              </Button>
            )}
          </TableCell>
          <TableCell align='right'>
            {row.book_status === 1 ? (
              <Button variant='contained' color='success'>
                판매 중
              </Button>
            ) : (
              <Button variant='contained' color='error'>
                판매 중지
              </Button>
            )}
          </TableCell>
        </TableRow>
        <TableRow>
          <TableCell style={{ paddingBottom: 0, paddingTop: 0 }} colSpan={15}>
            <Collapse in={open} timeout='auto' unmountOnExit>
              <Box sx={{ border: 0 }}>
                <Typography variant='h6' gutterBottom component='div'>
                  제품 설정
                </Typography>
                <Stack direction='row' spacing={2}>
                  <div>
                    <BookUpdate num={row.num} />
                  </div>
                  <Button
                    variant='outlined'
                    onClick={() => {
                      handleStockChange(row.num);
                    }}
                  >
                    품절 여부 상태 바꾸기
                  </Button>
                  <Button
                    variant='outlined'
                    onClick={() => {
                      handleStatusChange(row.num);
                    }}
                  >
                    판매 상태 바꾸기
                  </Button>
                  <div>
                    <BookDataDelete num={row.num} />
                  </div>
                </Stack>
                <Card sx={{ minWidth: 275 }}>
                  <CardContent>
                    <Typography variant='body2'>책 소개</Typography>
                    <Typography
                      sx={{ fontSize: 14 }}
                      color='text.secondary'
                      gutterBottom
                    >
                      {row.book_content}
                    </Typography>
                  </CardContent>
                </Card>
                <Card sx={{ minWidth: 275 }}>
                  <CardContent>
                    <Typography variant='body2'>책 표지 파일</Typography>
                    <Typography
                      sx={{ fontSize: 14 }}
                      color='text.secondary'
                      gutterBottom
                    >
                      {row.book_img === null ? '표지 파일 없음' : row.book_img}
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
              제품 관리 시스템
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
      <div
        style={{
          width: '100%',
          height: '30px',
          justifyContent: 'center',
          display: 'flex',
          marginTop: '10px',
          marginBottom: '10px',
        }}
      >
        <BookAdd />
      </div>

      <Paper sx={{ width: '100%' }}>
        <TableContainer sx={{ maxHeight: 800 }}>
          <Table stickyHeader aria-label='sticky table'>
            <TableHead>
              <TableRow>
                <TableCell />
                <TableCell>도서 ID</TableCell>
                <TableCell align='center'>제목</TableCell>
                <TableCell align='center'>저자</TableCell>
                <TableCell align='center'>출판사</TableCell>
                <TableCell align='center'>가격</TableCell>

                <TableCell align='center'>장르</TableCell>
                <TableCell align='center'>도서 ISBN</TableCell>

                <TableCell align='center'>재고</TableCell>
                <TableCell align='center'>판매 유무</TableCell>
              </TableRow>
            </TableHead>

            <TableBody>
              {filteredComponents(booklists)
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
          count={booklists.length}
          rowsPerPage={rowsPerPage}
          page={page}
          onPageChange={handleChangePage}
          onRowsPerPageChange={handleChangeRowsPerPage}
        />
      </Paper>
    </Container>
  );
};

export default BookTool;
