package ezenproject.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ezenproject.dto.BoardDTO;
import ezenproject.dto.PageDTO;



public interface BoardService {
	public List<BoardDTO> myBoardListProcess(PageDTO pv, int board_type, String member_id);
	public List<BoardDTO> listAllProcess(int board_type);
	public int myCountProcess(Map<String,Object> map);
	public int countProcess(int num); 
	public List<BoardDTO> listProcess(PageDTO pv);
	public List<BoardDTO> otherBoardListProcess(PageDTO pv, int board_type);
	public void insertProcess(BoardDTO dto);
	public BoardDTO contentProcess(BoardDTO dto);
	public void reStepProcess(BoardDTO dto);
	public void updateProcess(BoardDTO dto, String urlpath);
	public void deleteProcess(BoardDTO dto, String urlpath);
	public String fileSelectprocess(BoardDTO dto);

}