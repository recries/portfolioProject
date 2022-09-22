package ezenproject.dto;

import org.springframework.stereotype.Component;

@Component
public class CouponDTO {

	private int num;
	private String coupon_number;
	private String member_number;
	private int coupon_type;
	private int coupon_value;
	
	
	public CouponDTO() {
		// TODO Auto-generated constructor stub
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getCoupon_number() {
		return coupon_number;
	}


	public void setCoupon_number(String coupon_number) {
		this.coupon_number = coupon_number;
	}


	public String getMember_number() {
		return member_number;
	}


	public void setMember_number(String member_number) {
		this.member_number = member_number;
	}


	public int getCoupon_type() {
		return coupon_type;
	}


	public void setCoupon_type(int coupon_type) {
		this.coupon_type = coupon_type;
	}


	public int getCoupon_value() {
		return coupon_value;
	}


	public void setCoupon_value(int coupon_value) {
		this.coupon_value = coupon_value;
	}
	
	
	
	
}
