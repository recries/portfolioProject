package ezenproject.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ezenproject.dao.MemberDAO;
import ezenproject.dto.MemberDTO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImp implements MemberService{

	
	@Autowired
	private MemberDAO dao;
	
	public MemberServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public MemberDTO memberLogin(MemberDTO dto) throws Exception {
		
		return dao.loginCheck(dto);
	}
	
	
	
	@Override
	public void addMemberNumberProcess(MemberDTO dto) {
		
//		간단하게 MEM + 시간
		String memcode = null;
		Date now = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyMMddHHmmss");
		
		memcode = "MEM"+date.format(now);
		
		dto.setMember_number(memcode);
		
		
	}
	
	
	@Override
	public int addMemberProcess(MemberDTO dto) throws Exception {
		
		return dao.insertMember(dto);
	}
	
	@Override
	public void updateInformation(MemberDTO dto) throws Exception {
		dao.updateMemberInformation(dto);
		
	}
	
	
	/////////////////////////여기서부터 관리자 페이지 서비스입니다.//////
	
	@Override
	public List<MemberDTO> listProcess() {
		
		return dao.list();
	}
	
	
	@Override
	public void statusCheckProcess(int num) {
		MemberDTO dto = new MemberDTO();
		dto=dao.selectOne(num);
		
		if(dto.getMember_status()==1) {
			statusChangeOffProcess(num);
		}else if(dto.getMember_status()==0) {
			statusChangeOnProcess(num);
		}
		
		
	}
	
//	마이페이지 공용
	@Override
	public void statusChangeOffProcess(int num) {
		dao.statusChangeOff(num);
		
	}
	
	@Override
	public void statusChangeOnProcess(int num) {
		dao.statusChangeOn(num);
		
	}
	
	
	@Override
	public void typeCheckProcess(int num) {
		MemberDTO dto = new MemberDTO();
		dto=dao.selectOne(num);
		
		if(dto.getMember_type()==1) {
			typeChangeOffProcess(num);
		}else if(dto.getMember_type()==0) {
			typeChangeOnProcess(num);
		}
		
	}
	
	@Override
	public void typeChangeOnProcess(int num) {
		dao.typeChangeOn(num);
		
	}
	
	@Override
	public void typeChangeOffProcess(int num) {
		dao.typeChangeOff(num);
		
	}
	
	
	
// 마이페이지 공용	
	@Override
	public MemberDTO selectOneProcess(int num) {
		
		return dao.selectOne(num);
	}
	
	
	@Override
	public void deleteDataProcess(int num) {
		dao.deleteData(num);
		
	}
	
	///////////////////여기까지 관리자 페이지 서비스입니다.////////////////
}
