package ezenproject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import ezenproject.dto.BoardDTO;
import ezenproject.dto.PageDTO;


@Mapper
@Repository
public interface BoardDAO {
	public List<BoardDTO> myBoardList(HashMap<String, Object> map);
	public List<BoardDTO> listAll(int board_type);
	public int myCount(Map<String,Object> map);
	public int count(int num);
	public List<BoardDTO> list(PageDTO pv);
	public List<BoardDTO> otherBoardList(HashMap<String, Object> map);
	public void readCount(BoardDTO dto);
	public BoardDTO content(BoardDTO dto);
	public void reStepCount(BoardDTO dto);
	public void save(BoardDTO dto);
	public void update(BoardDTO dto);
	public void delete(BoardDTO dto);
	public String getFile(BoardDTO dto);
}