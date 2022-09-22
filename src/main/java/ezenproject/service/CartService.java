package ezenproject.service;

import java.util.List;

import ezenproject.dto.CartDTO;

public interface CartService {
		
		//장바구니 추가
		public int addCartProcess(CartDTO dto);
		//장바구니 정보 리스트
		public List<CartDTO> getCartProcess(String member_number);
		// 카트 수량 수정
		public int modifyCountProcess(CartDTO dto);
		//카트 삭제
		public int deleteCartProcess(int num);
		
		public CartDTO cartListProcess(String member_number);
		
		//카트 전부 삭제
				public void alldeleteCartProcess(String member_number);
}
