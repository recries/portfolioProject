package ezenproject.dto;

import org.springframework.stereotype.Component;

@Component
public class OrderDTO {

	
	private int num;
	private String order_number;
	private int order_cost;
	private String member_number;
	private String book_id;
	private int order_status;
	private String order_phone;
	private String order_name;
	private String order_address;
	private int book_qty;
	
	private MemberDTO ezenmembers;
	private BookDTO ezenbooks;
	
	
	
	public MemberDTO getEzenmembers() {
		return ezenmembers;
	}
	public void setEzenmembers(MemberDTO ezenmembers) {
		this.ezenmembers = ezenmembers;
	}
	public BookDTO getEzenbooks() {
		return ezenbooks;
	}
	public void setEzenbooks(BookDTO ezenbooks) {
		this.ezenbooks = ezenbooks;
	}
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getOrder_number() {
		return order_number;
	}
	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}
	public int getOrder_cost() {
		return order_cost;
	}
	public void setOrder_cost(int order_cost) {
		this.order_cost = order_cost;
	}
	public String getMember_number() {
		return member_number;
	}
	public void setMember_number(String member_number) {
		this.member_number = member_number;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public int getBook_qty() {
		return book_qty;
	}
	public void setBook_qty(int book_qty) {
		this.book_qty = book_qty;
	}
	
	
	
	
	
}
