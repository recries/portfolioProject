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
    // db ??????
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
    // ????????? ?????? ????????? ??????
    if (book_category === 1) {
      return '???';
    } else if (book_category === 2) {
      return '????????????';
    } else if (book_category === 3) {
      return '????????????(SF)';
    } else if (book_category === 4) {
      return '??????/???????????? ??????';
    } else if (book_category === 5) {
      return '?????????/????????????';
    } else if (book_category === 6) {
      return '??????';
    } else if (book_category === 7) {
      return '???????????????';
    } else if (book_category === 8) {
      return '???????????????';
    } else if (book_category === 9) {
      return '??????';
    } else if (book_category === 10) {
      return '??????/???????????????';
    } else if (book_category === 11) {
      return '??????/?????????';
    } else if (book_category === 12) {
      return '??????/????????????';
    } else if (book_category === 13) {
      return '??????/??????';
    } else if (book_category === 14) {
      return '????????????';
    } else if (book_category === 15) {
      return '??????/????????????';
    } else if (book_category === 16) {
      return '????????????';
    } else if (book_category === 17) {
      return '??????/?????????';
    } else if (book_category === 18) {
      return '?????? ??????';
    } else if (book_category === 19) {
      return '???????????????';
    } else if (book_category === 20) {
      return '?????????';
    } else if (book_category === 21) {
      return '????????????~????????????';
    } else if (book_category === 22) {
      return '?????????';
    } else if (book_category === 23) {
      return '?????????';
    } else if (book_category === 24) {
      return '??????/?????????';
    } else if (book_category === 25) {
      return '????????????';
    } else if (book_category === 26) {
      return '??????/??????????????? ??????';
    } else if (book_category === 27) {
      return '??????';
    } else if (book_category === 28) {
      return '??????';
    } else if (book_category === 29) {
      return '??????';
    } else if (book_category === 30) {
      return '??????';
    } else if (book_category === 31) {
      return '????????????/????????????';
    } else if (book_category === 32) {
      return '???????????????';
    } else if (book_category === 33) {
      return '????????????';
    } else if (book_category === 34) {
      return '??????';
    } else if (book_category === 35) {
      return '?????????';
    } else if (book_category === 36) {
      return '??????';
    } else if (book_category === 37) {
      return '?????????/????????????';
    } else if (book_category === 38) {
      return '?????? ??????';
    } else if (book_category === 39) {
      return '?????????/?????????';
    } else if (book_category === 40) {
      return '?????????/????????????';
    } else if (book_category === 41) {
      return '?????????/??????';
    } else if (book_category === 42) {
      return '??????/??????/??????';
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
          <TableCell align='right'>{row.book_price}???</TableCell>

          <TableCell align='right'>
            {categoryCheck(row.book_category)}
          </TableCell>
          <TableCell align='right'>{row.book_isbn}</TableCell>

          <TableCell align='right'>
            {row.book_stock === 1 ? (
              <Button variant='contained' color='success'>
                ?????? ??????
              </Button>
            ) : (
              <Button variant='contained' color='error'>
                ?????? ??????
              </Button>
            )}
          </TableCell>
          <TableCell align='right'>
            {row.book_status === 1 ? (
              <Button variant='contained' color='success'>
                ?????? ???
              </Button>
            ) : (
              <Button variant='contained' color='error'>
                ?????? ??????
              </Button>
            )}
          </TableCell>
        </TableRow>
        <TableRow>
          <TableCell style={{ paddingBottom: 0, paddingTop: 0 }} colSpan={15}>
            <Collapse in={open} timeout='auto' unmountOnExit>
              <Box sx={{ border: 0 }}>
                <Typography variant='h6' gutterBottom component='div'>
                  ?????? ??????
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
                    ?????? ?????? ?????? ?????????
                  </Button>
                  <Button
                    variant='outlined'
                    onClick={() => {
                      handleStatusChange(row.num);
                    }}
                  >
                    ?????? ?????? ?????????
                  </Button>
                  <div>
                    <BookDataDelete num={row.num} />
                  </div>
                </Stack>
                <Card sx={{ minWidth: 275 }}>
                  <CardContent>
                    <Typography variant='body2'>??? ??????</Typography>
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
                    <Typography variant='body2'>??? ?????? ??????</Typography>
                    <Typography
                      sx={{ fontSize: 14 }}
                      color='text.secondary'
                      gutterBottom
                    >
                      {row.book_img === null ? '?????? ?????? ??????' : row.book_img}
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
              ?????? ?????? ?????????
            </Typography>

            <Link to='/'>
              <Button variant='contained' size='large' color='success'>
                ?????? ?????????
              </Button>
            </Link>
            <Search>
              <SearchIconWrapper>
                <SearchIcon />
              </SearchIconWrapper>
              <StyledInputBase
                placeholder='Search???'
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
                <TableCell>?????? ID</TableCell>
                <TableCell align='center'>??????</TableCell>
                <TableCell align='center'>??????</TableCell>
                <TableCell align='center'>?????????</TableCell>
                <TableCell align='center'>??????</TableCell>

                <TableCell align='center'>??????</TableCell>
                <TableCell align='center'>?????? ISBN</TableCell>

                <TableCell align='center'>??????</TableCell>
                <TableCell align='center'>?????? ??????</TableCell>
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
