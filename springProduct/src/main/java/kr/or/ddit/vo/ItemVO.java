package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

public class ItemVO {
	
	// 멤버 변수
	private int itemId;
	private String itemName;
	private int price;
	private String description;
	private String pictureUrl;
	private String pictureUrl2;
	private MultipartFile picture; // MultopartFile 이 중요
	// 변수명도 input tag name 과 일치 해야함
	// input 태그에 multiple 넣으면 여러개의 이미지를 올릴 수 있는데
	// 그럼 MultipartFele[] 배열로 만들어 줘야됨
	
	//1대 N의 관계
	private List<ItemAttachVO> itemAttachVOList; 

	//기본 생성자
	public ItemVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//getter , setter
	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public String getPictureUrl2() {
		return pictureUrl2;
	}

	public void setPictureUrl2(String pictureUrl2) {
		this.pictureUrl2 = pictureUrl2;
	}

	public MultipartFile getPicture() {
		return picture;
	}

	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}

	public List<ItemAttachVO> getItemAttachVOList() {
		return itemAttachVOList;
	}

	public void setItemAttachVOList(List<ItemAttachVO> itemAttachVOList) {
		this.itemAttachVOList = itemAttachVOList;
	}

	@Override
	public String toString() {
		return "ItemVO [itemId=" + itemId + ", itemName=" + itemName + ", price=" + price + ", description="
				+ description + ", pictureUrl=" + pictureUrl + ", pictureUrl2=" + pictureUrl2 + ", picture=" + picture
				+ ", itemAttachVOList=" + itemAttachVOList + "]";
	}
}
