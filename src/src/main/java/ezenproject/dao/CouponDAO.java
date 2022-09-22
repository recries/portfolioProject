package ezenproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import ezenproject.dto.CouponDTO;
import ezenproject.dto.MemberDTO;

@Mapper
@Repository
public interface CouponDAO {

	public void saveNewCoupon(CouponDTO dto);
	public List<CouponDTO> list (String member_number);
	public void deleteCoupon (int num);
	public void usedCoupon (String coupon_number);
}
