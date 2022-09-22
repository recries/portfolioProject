package ezenproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ezenproject.dao.CartDAO;
import ezenproject.dto.CartDTO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class CartServiceImp implements CartService{
	@Autowired
	private CartDAO dao;
	public CartServiceImp() {
		
	}
	
	@Override
	public int addCartProcess(CartDTO dto) {
		CartDTO checkCart = dao.checkCart(dto);
		if(checkCart != null) {
			return 2;
		}
		try {
			return dao.addCart(dto);
		}catch (Exception e) {
			return 0;
		}
	}

	@Override
	public List<CartDTO> getCartProcess(String member_number) {
		List<CartDTO> clist = dao.getCart(member_number);
		for(CartDTO dto : clist) {
			//정보 초기화
			dto.initSaleTotal();
		}
		return clist;
		
	}


	@Override
	public int modifyCountProcess(CartDTO dto) {
		return dao.modifyCount(dto);
	}

	@Override
	public int deleteCartProcess(int num) {
		return dao.deleteCart(num);
	}

	@Override
	public CartDTO cartListProcess(String member_number) {
		return dao.cartlist(member_number);
	}

	@Override
	public void alldeleteCartProcess(String member_number) {
		dao.allDelete(member_number);
	}

	
	

}