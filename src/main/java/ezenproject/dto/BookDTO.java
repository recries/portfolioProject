package ezenproject.dto;


import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;



@Component
public class BookDTO {

	private int num;
	private String book_id;
	private String book_title;
	private String book_author;
	private String book_publisher;
	private int book_price;
	private String book_content;
	private int book_category;
	private String book_isbn;
	
	private int book_stock;
	private int book_status;
	
//	첨부파일 처리해주는 멤버 변수
	private String book_img;
	
	
//	 페이지에서 파일첨부를 받아 처리해주는 멤버변수
	private MultipartFile filename;

	
//	판매가 변수
	private int sellprice;
	
	
//	할인권 적용 가격 변수
	private int couponprice;
	
	
	public void setSellprice(int sellprice) {
		this.sellprice = sellprice;
	}
	
	public int getSellprice() {
		return sellprice;
	}
	
	
	public int getCouponprice() {
		return couponprice;
	}

	public void setCouponprice(int couponprice) {
		this.couponprice = couponprice;
	}

	public BookDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	

	public String getBook_author() {
		return book_author;
	}


	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}


	public String getBook_publisher() {
		return book_publisher;
	}


	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getBook_id() {
		return book_id;
	}


	public void setBook_id(String book_id) {
		this.book_id = book_id;
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


	public String getBook_content() {
		return book_content;
	}


	public void setBook_content(String book_content) {
		this.book_content = book_content;
	}


	public int getBook_category() {
		return book_category;
	}


	public void setBook_category(int book_category) {
		this.book_category = book_category;
	}


	public String getBook_isbn() {
		return book_isbn;
	}


	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}


	public int getBook_stock() {
		return book_stock;
	}


	public void setBook_stock(int book_stock) {
		this.book_stock = book_stock;
	}


	public int getBook_status() {
		return book_status;
	}


	public void setBook_status(int book_status) {
		this.book_status = book_status;
	}


	public String getBook_img() {
		return book_img;
	}


	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}


	public MultipartFile getFilename() {
		return filename;
	}


	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}
	
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("%d %s %s %s %s %s %d %d 이미지 :%s",num, book_title, book_author, book_publisher, book_content, book_isbn, book_price, book_category,book_img);
	}
	
	
}
