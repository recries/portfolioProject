package ezenproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import ezenproject.dto.CartDTO;
import ezenproject.dto.MemberDTO;
@Mapper
@Repository
public interface CartDAO {
	
    
    /* 카트 추가 */
	public int addCart(CartDTO dto) throws Exception;
	
	/* 카트 삭제 */
	public int deleteCart(int num);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDTO dto);
	
	/* 카트 목록 1*/
	public CartDTO cartlist(String member_number);
	
	/* 카트 목록 2*/
	public List<CartDTO> getCart(String member_number);	
	
	/* 카트 확인 */
    public CartDTO checkCart(CartDTO dto);
    
    /* 카트 전부 삭제 */
	public void allDelete(String member_number);

    
}