package ezenproject.service;

import java.util.List;

import ezenproject.dto.MemberDTO;

public interface MemberService {

	
	
	
	///////////////여기서부터 관리자 페이지 서비스입니다.///////////////
	public List<MemberDTO> listProcess();
	public void statusCheckProcess(int num);
	public void statusChangeOnProcess(int num);
	
//	마이페이지 공용
	public void statusChangeOffProcess(int num);
	
	public void typeCheckProcess(int num);
	public void typeChangeOnProcess(int num);
	public void typeChangeOffProcess(int num);
	
	public void deleteDataProcess(int num);
	
//	마이 페이지 공용
	public MemberDTO selectOneProcess(int num);
	public MemberDTO memberLogin(MemberDTO dto) throws Exception;
	
	///////////////여기까지 관리자 페이지 서비스입니다.////////////////
	
	
	public int addMemberProcess(MemberDTO dto) throws Exception;
	public void addMemberNumberProcess(MemberDTO dto);
	public void updateInformation(MemberDTO dto) throws Exception;
	
	
}
