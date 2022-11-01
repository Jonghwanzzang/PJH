package kr.or.ddit.vo;
// VO Value object 값을 담아서 전달하는 역할


import java.util.Date;

// 자바 빈 클래스
//  1) 멤버 변수, 
//	2) 기본 생성자 
//	3) GETTER/SETTER 
public class BookVO { // 1)멤버 변수
	private int bookId;
	private String title;
	private String category;
	private int price;
	private Date insertDate;
// 위 변수 명은 DB컬럼명의 카멜표기법
	

	
//2) 기본 생성자, 생략 가능
	public BookVO() {
		super();
	}
	
//3) GETTER/ SETTER
	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	@Override
	public String toString() {
		return "BookVO [bookId=" + bookId + ", title=" + title + ", category=" + category + ", price=" + price
				+ ", insertDate=" + insertDate + "]";
	}
}
