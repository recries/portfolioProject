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

import { Link, useParams } from 'react-router-dom';
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown';
import KeyboardArrowUpIcon from '@mui/icons-material/KeyboardArrowUp';
import Collapse from '@mui/material/Collapse';
import BoardDataDelete from './BoardDataDelete';
import BoardReply from './BoardReply';
import BoardFileDownload from './BoardFileDownload';
import answer from '../img/answer.png';
import level from '../img/level.gif';

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
const BoardTool = () => {
  const [boardlists, setBoardlists] = useState([]);
  const [searchKeyWord, setSearchKeyWord] = useState('');
  const params = useParams();
  let [board_type, setBoard_type] = useState(
    params.board_type != undefined ? params.board_type : 0
  );
  console.log(params.board_type);
  let [num, setNum] = useState(0);

  useEffect(() => {
    // db 연동

    loadData();
  }, [board_type]);

  const loadData = async () => {
    await axios
      .get(`http://localhost:8090/boards/list/${board_type}`)
      .then((response) => {
        console.log('response:', response.data);
        setBoardlists(response.data.alist);
      })
      .catch((err) => console.error(err.message));
  };

  const handleValueChange = (e) => {
    setSearchKeyWord(e.target.value);
  };

  const filteredComponents = (data) => {
    data = data.filter((c) => {
      // console.log('===', c.name);
      // console.log(c.book_title);
      // console.log(data.num);

      return c.subject.indexOf(searchKeyWord) > -1;
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

  const handleFreeBoard = () => {
    board_type = 0;
    setBoard_type(board_type);
  };
  const useReviewBoard = () => {
    board_type = 1;
    setBoard_type(board_type);
  };
  const handleQnaBoard = () => {
    board_type = 2;
    setBoard_type(board_type);
  };

  function Row(props) {
    const { row } = props;
    const [open, setOpen] = React.useState(false);

    return (
      <React.Fragment>
        <TableRow sx={{ '& > *': { borderBottom: 'unset' } }}>
          <TableCell>
            {row.re_level > 0 ? (
              <span>
                <img src={level} width={20 * row.re_level} height='15' />
                <img src={answer} height='15' />
              </span>
            ) : (
              ''
            )}
            <IconButton
              aria-label='expand row'
              size='small'
              onClick={() => setOpen(!open)}
            >
              {open ? <KeyboardArrowUpIcon /> : <KeyboardArrowDownIcon />}
            </IconButton>
          </TableCell>
          <TableCell component='th' scope='row'>
            {row.num}
          </TableCell>
          <TableCell align='center'>{row.subject}</TableCell>
          <TableCell align='center'>{row.member_id}</TableCell>
          <TableCell align='center'>{row.readcount}</TableCell>
        </TableRow>
        <TableRow id='downloadBtn'>
          <TableCell style={{ paddingBottom: 0, paddingTop: 0 }} colSpan={15}>
            <Collapse in={open} timeout='auto' unmountOnExit>
              <Box sx={{ border: 0 }}>
                <Typography variant='h6' gutterBottom component='div'>
                  게시글 내용
                </Typography>
                <Stack direction='row' spacing={2}></Stack>
                <Card sx={{ minWidth: 275 }}>
                  <CardContent>
                    <Typography variant='body2'>{row.content}</Typography>
                    <Typography
                      sx={{ fontSize: 14 }}
                      color='text.secondary'
                      gutterBottom
                    ></Typography>
                    <Stack direction='row' spacing={2}>
                      <BoardReply
                        board_type={row.board_type}
                        board_ref={row.ref}
                        re_step={row.re_step}
                        re_level={row.re_level}
                      />
                      <BoardFileDownload
                        num={row.num}
                        board_type={row.board_type}
                        upload={row.upload}
                      />
                      <BoardDataDelete
                        num={row.num}
                        board_type={row.board_type}
                      />
                    </Stack>
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
              게시판 관리 시스템
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
      <br />
      <div align='center'>
        <Button variant='contained' color='primary' onClick={handleFreeBoard}>
          자유 게시판
        </Button>
        <Button variant='contained' color='primary' onClick={useReviewBoard}>
          리뷰 게시판
        </Button>
        <Button variant='contained' color='primary' onClick={handleQnaBoard}>
          상품문의 게시판
        </Button>
      </div>
      <br />
      <Paper sx={{ width: '100%' }}>
        <TableContainer sx={{ maxHeight: 800 }}>
          <Table stickyHeader aria-label='sticky table'>
            <TableHead>
              <TableRow>
                <TableCell />
                <TableCell>게시판 번호</TableCell>
                <TableCell align='center'>제목</TableCell>
                <TableCell align='center'>작성 회원 ID</TableCell>
                <TableCell align='center'>조회수</TableCell>
              </TableRow>
            </TableHead>

            <TableBody>
              {filteredComponents(boardlists)
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
          count={boardlists.length}
          rowsPerPage={rowsPerPage}
          page={page}
          onPageChange={handleChangePage}
          onRowsPerPageChange={handleChangeRowsPerPage}
        />
      </Paper>
    </Container>
  );
};

export default BoardTool;
