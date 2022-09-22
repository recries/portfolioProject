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
  InputLabel,
  MenuItem,
  OutlinedInput,
  Select,
} from '@mui/material';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

const styles = { hidden: { display: 'none' } };

const BookAdd = () => {
  const [open, setOpen] = React.useState(false);

  const [input, setInput] = useState({
    filename: null,
    book_title: '',
    book_author: '',
    book_publisher: '',
    book_price: '',
    book_content: '',
    book_category: '',
    book_isbn: '',
  });

  const {
    filename,
    book_title,
    book_author,
    book_publisher,
    book_price,
    book_content,
    book_category,
    book_isbn,
  } = input;

  const [inputImg, setInputImg] = useState({
    imgname: '',
  });

  const [selectCategory, setSelectCategory] = React.useState('');

  const handleCategoryChange = (event) => {
    setSelectCategory(event.target.value);
    // console.log(event.target.value);
    setInput({ ...input, book_category: event.target.value });
  };

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleFileChange = (e) => {
    e.preventDefault();
    setInput({ ...input, filename: e.target.files[0] });
    setInputImg({ ...inputImg, imgname: e.target.value });
  };

  const handleValueChange = (e) => {
    let nextState = {};
    nextState[e.target.name] = e.target.value;
    setInput((prev) => {
      return { ...prev, ...nextState };
    });
  };

  const handleFormSubmit = async (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append('book_title', book_title);
    formData.append('book_author', book_author);
    formData.append('book_publisher', book_publisher);
    formData.append('book_price', book_price);
    formData.append('book_content', book_content);
    formData.append('book_category', book_category);
    formData.append('book_isbn', book_isbn);
    if (filename !== null) {
      formData.append('filename', filename);
    }
    const config = { headers: { 'Content-Type': 'multipart/form-data' } };

    await axios
      .post('http://localhost:8090/books/newbooksave', formData, config)
      .then((response) => {
        setInput({
          filename: '',
          book_title: '',
          book_author: '',
          book_publisher: '',
          book_price: '',
          book_content: '',
          book_category: '',
          book_isbn: '',
        });
      })
      .catch((err) => console.error(err.message));

    setOpen(false);
    window.location.replace('/books');
  };

  return (
    <div>
      <Button
        variant='contained'
        color='primary'
        onClick={handleClickOpen}
        fullWidth
      >
        도서 추가
      </Button>

      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>도서 추가</DialogTitle>
        <DialogContent>
          <input
            style={styles.hidden}
            id='raised-button-file'
            accept='image/*'
            type='file'
            name='filename'
            file={input.filename}
            // value={inputImg.imgname}
            onChange={handleFileChange}
          />
          <label htmlFor='raised-button-file'>
            <Button
              variant='contained'
              color='primary'
              component='span'
              name='filename'
            >
              {inputImg.imgname === '' ? '책 표지 등록' : inputImg.imgname}
              {/* 책 표지 등록 */}
            </Button>
          </label>
          <br />
          <TextField
            label='제목'
            variant='standard'
            type='text'
            name='book_title'
            value={input.book_title}
            onChange={handleValueChange}
          />
          <br />

          <TextField
            label='저자'
            variant='standard'
            type='text'
            name='book_author'
            value={input.book_author}
            onChange={handleValueChange}
          />
          <br />
          <TextField
            label='출판사'
            variant='standard'
            type='text'
            name='book_publisher'
            value={input.book_publisher}
            onChange={handleValueChange}
          />
          <br />
          <TextField
            label='가격'
            variant='standard'
            type='number'
            name='book_price'
            value={input.book_price}
            onChange={handleValueChange}
            placeholder='원'
          />

          <br />
          <TextField
            label='도서 ISBN'
            variant='standard'
            type='text'
            name='book_isbn'
            value={input.book_isbn}
            onChange={handleValueChange}
          />
        </DialogContent>

        <DialogContent>
          <TextField
            id='outlined-multiline-static'
            label='책 소개'
            multiline
            rows={10}
            name='book_content'
            value={input.book_content}
            onChange={handleValueChange}
          />
          <br />
          <Box sx={{ minWidth: 120 }}>
            <FormControl sx={{ m: 1, minWidth: 120 }} size='small'>
              <InputLabel id='demo-simple-select-required-label'>
                장르
              </InputLabel>
              <Select
                labelId='demo-simple-select-required-label'
                id='demo-simple-select-required'
                value={selectCategory}
                label='장르'
                onChange={handleCategoryChange}
              >
                <MenuItem value={1}>시</MenuItem>
                <MenuItem value={2}>역사소설</MenuItem>
                <MenuItem value={3}>과학소설(SF)</MenuItem>
                <MenuItem value={4}>추리/미스터리 소설</MenuItem>
                <MenuItem value={5}>판타지/환상문학</MenuItem>
                <MenuItem value={6}>희곡</MenuItem>
                <MenuItem value={7}>교양인문학</MenuItem>
                <MenuItem value={8}>인문에세이</MenuItem>
                <MenuItem value={9}>철학</MenuItem>
                <MenuItem value={10}>심리/정식분석학</MenuItem>
                <MenuItem value={11}>신화/종교학</MenuItem>
                <MenuItem value={12}>문화/문화이론</MenuItem>
                <MenuItem value={13}>비평/칼럼</MenuItem>
                <MenuItem value={14}>사회문제</MenuItem>
                <MenuItem value={15}>환경/생태문제</MenuItem>
                <MenuItem value={16}>사회운동</MenuItem>
                <MenuItem value={17}>언론/미디어</MenuItem>
                <MenuItem value={18}>법과 생활</MenuItem>
                <MenuItem value={19}>동양사일반</MenuItem>
                <MenuItem value={20}>역사학</MenuItem>
                <MenuItem value={21}>한국고대~고려시대</MenuItem>
                <MenuItem value={22}>조선사</MenuItem>
                <MenuItem value={23}>서양사</MenuItem>
                <MenuItem value={24}>전쟁/분쟁사</MenuItem>
                <MenuItem value={25}>컬러링북</MenuItem>
                <MenuItem value={26}>예술/대중문화의 이해</MenuItem>
                <MenuItem value={27}>미술</MenuItem>
                <MenuItem value={28}>음악</MenuItem>
                <MenuItem value={29}>건축</MenuItem>
                <MenuItem value={30}>무용</MenuItem>
                <MenuItem value={31}>기초과학/교양과학</MenuItem>
                <MenuItem value={32}>과학사회학</MenuItem>
                <MenuItem value={33}>생명과학</MenuItem>
                <MenuItem value={34}>의학</MenuItem>
                <MenuItem value={35}>천문학</MenuItem>
                <MenuItem value={36}>화학</MenuItem>
                <MenuItem value={37}>경제학/경제일반</MenuItem>
                <MenuItem value={38}>역사소설</MenuItem>
                <MenuItem value={39}>마케팅/세일즈</MenuItem>
                <MenuItem value={40}>트렌드/미래전망</MenuItem>
                <MenuItem value={41}>재테크/투자</MenuItem>
                <MenuItem value={42}>창업/취업/은퇴</MenuItem>
              </Select>
            </FormControl>
          </Box>
        </DialogContent>
        <DialogActions>
          <Button
            variant='contained'
            color='primary'
            onClick={handleFormSubmit}
          >
            추가
          </Button>
          <Button variant='contained' color='primary' onClick={handleClose}>
            닫기
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
};

export default BookAdd;
