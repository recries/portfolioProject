package ezenproject.dto;

import org.springframework.stereotype.Component;

@Component
public class CartDTO {
	private int num;
	private String member_number;
	private String book_id;
	private int cart_amount;
	//book
	
	private int money;
	private String book_author;
	private String book_publisher;
	private int book_category;
	private String book_title;
	private int book_price;
	private String book_img;
	
	//추가 기능
	private int saleprice;
    private int totalPrice;
    private int point;
    private int totalPoint;  
    private double book_coupon;
	
    //판매가 변수
	private int sellprice;
	
	
	public int getSellprice() {
		return sellprice;
	}


	public void setSellprice(int sellprice) {
		this.sellprice = sellprice;
	}


	public int getSaleprice() {
		return saleprice;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public int getPoint() {
		return point;
	}


	public int getTotalPoint() {
		return totalPoint;
	}


	public double getBook_coupon() {
		return book_coupon;
	}


	public int getBook_category() {
		return book_category;
	}


	public void setBook_category(int book_category) {
		this.book_category = book_category;
	}


	public String getBook_publisher() {
		return book_publisher;
	}


	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}


	public String getBook_author() {
		return book_author;
	}


	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}



	
		
	public String getBook_img() {
		return book_img;
	}


	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}


	public String getBook_title() {
		return book_title;
	}


	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}


	public int getBook_price() {
		return book_price;
	}


	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

	public CartDTO() {
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
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




	public int getCart_amount() {
		return cart_amount;
	}


	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}


	public int getmoney() {
		return money;
	}

	public int getMoney() {
		return money;
	}


	public void setMoney(int money) {
		this.money = money;
	}

	
	public void initSaleTotal() {
		this.saleprice = (int) (this.book_price /10*9);
		this.totalPrice = this.saleprice*this.cart_amount;
		this.point = (int)(Math.floor(this.saleprice*0.05));
		this.totalPoint = this.point * this.cart_amount;
	}
	


}