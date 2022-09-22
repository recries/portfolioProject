package ezenproject.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ezenproject.dao.BoardDAO;
import ezenproject.dto.BoardDTO;
import ezenproject.dto.PageDTO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImp implements BoardService{
	
	@Autowired
	private BoardDAO dao;
	 
	public BoardServiceImp() {
	
	}
	
	@Override
	public List<BoardDTO> myBoardListProcess(PageDTO pv, int board_type, String member_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pv.getStartRow());
		map.put("endRow", pv.getEndRow());
		map.put("board_type", board_type);
		map.put("member_id", member_id);
		return dao.myBoardList(map);
	}

	
	@Override
	public List<BoardDTO> listAllProcess(int board_type) {
		return dao.listAll(board_type);
	}
	
	@Override
	public int myCountProcess(Map<String,Object> map) {
		return dao.myCount(map);
	}
	
	@Override
	public int countProcess(int num) {
	
		return dao.count(num);
	}

	@Override
	public List<BoardDTO> listProcess(PageDTO pv) {
		return dao.list(pv);
	}
	
	@Override
	public List<BoardDTO> otherBoardListProcess(PageDTO pv, int board_type) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pv.getStartRow());
		map.put("endRow", pv.getEndRow());
		map.put("board_type", board_type);
		return dao.otherBoardList(map);
	}

	@Override
	public void insertProcess(BoardDTO dto) {
		if(dto.getRef()!=0) {
		dao.reStepCount(dto);
		dto.setRe_step(dto.getRe_step()+1);
		dto.setRe_level(dto.getRe_level()+1);
		}
		dao.save(dto);
	}

	@Override
	public BoardDTO contentProcess(BoardDTO dto) {
		dao.readCount(dto);
		return dao.content(dto);
	}

	@Override
	public void reStepProcess(BoardDTO dto) {

	}


	@Override
	public void updateProcess(BoardDTO dto, String urlpath) {
		
		String filename = dto.getUpload();
		if(filename!=null) {
		String path = dao.getFile(dto);
		//기존첨부 파일이 있으면 삭제
		if(path!=null) {
			File fe = new File(urlpath, path);
			fe.delete();
			}
		}
		
		dao.update(dto);
	}

	@Override
	public void deleteProcess(BoardDTO dto, String urlpath) {
			String path = dao.getFile(dto);
			//기존첨부 파일이 있으면 삭제
			if(path!=null) {
				File fe = new File(urlpath, path);
				fe.delete();
			}
			dao.delete(dto);
	}
	

	@Override
	public String fileSelectprocess(BoardDTO dto) {
		return dao.getFile(dto);
	}





}