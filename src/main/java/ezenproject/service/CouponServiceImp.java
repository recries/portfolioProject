package ezenproject.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ezenproject.dao.CouponDAO;
import ezenproject.dto.CouponDTO;
import ezenproject.dto.MemberDTO;


@Service
@Transactional(propagation = Propagation.REQUIRED)
public class CouponServiceImp implements CouponService{

	@Autowired
	private CouponDAO dao;
	
	public CouponServiceImp() {
		// TODO Auto-generated constructor stub
	}

	
	@Override
	public void usedCouponProcess(String coupon_number) {
		dao.usedCoupon(coupon_number);
		
	}
	
	
//	/////////////////////여기부터 관리자 서비스/////////////////////////////
	@Override
	public void saveNewCouponProcess(CouponDTO dto) {
		
		dao.saveNewCoupon(dto);
	}
	
	@Override
	public void newCouponCodeProcess(CouponDTO dto) {
//		새로운 할인권 코드 생성. 간단하게 타입 코드랑 현재시간 조합
		String couponcode = null;
		String type = null;
		Date now = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyMMddHHmmss");
		
		
//		coupon_type = 1 : 퍼센트 할인 => PER
//		coupon_type = 2 : 일정 금액 할인 => DIR
		
		if(dto.getCoupon_type()==1) {
			type = "PER";
		}else if (dto.getCoupon_type()==2) {
			type ="DIR";
		}
		couponcode = type+date.format(now);
		
		dto.setCoupon_number(couponcode);
		
	}
	
//	[공용] 결제 페이지
	@Override
	public List<CouponDTO> listProcess(String member_number) {
		
		return dao.list(member_number);
	}
	
	@Override
	public void deleteCouponProcess(int num) {
		dao.deleteCoupon(num);
		
	}
	
//	///////////////////여기까지 관리자 서비스///////////////////////////////////////
	
}
