package kr.or.ddit.vo;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Member1VO {
	
	private String memId;
	private String memName;
	private String memJob;
	private String memLike;
	private String memHp;
	
	// MEMBER_BACK 테이블에 없어도 사용 가능함
	private MultipartFile picture;
	private MultipartFile picture2;
	private List<MultipartFile> picturelist; // name="picturelist" 
	private MultipartFile[] pictureArray; // name="pictureArray"
	private String userId;
	private String password;
	
	
	
	public Member1VO() {}



	public String getMemId() {
		return memId;
	}



	public void setMemId(String memId) {
		this.memId = memId;
	}



	public String getMemName() {
		return memName;
	}



	public void setMemName(String memName) {
		this.memName = memName;
	}



	public String getMemJob() {
		return memJob;
	}



	public void setMemJob(String memJob) {
		this.memJob = memJob;
	}



	public String getMemLike() {
		return memLike;
	}



	public void setMemLike(String memLike) {
		this.memLike = memLike;
	}



	public String getMemHp() {
		return memHp;
	}



	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}



	public MultipartFile getPicture() {
		return picture;
	}



	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}



	public MultipartFile getPicture2() {
		return picture2;
	}



	public void setPicture2(MultipartFile picture2) {
		this.picture2 = picture2;
	}



	public List<MultipartFile> getPicturelist() {
		return picturelist;
	}



	public void setPicturelist(List<MultipartFile> picturelist) {
		this.picturelist = picturelist;
	}



	public MultipartFile[] getPictureArray() {
		return pictureArray;
	}



	public void setPictureArray(MultipartFile[] pictureArray) {
		this.pictureArray = pictureArray;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Member1VO [memId=" + memId + ", memName=" + memName + ", memJob=" + memJob + ", memLike=" + memLike
				+ ", memHp=" + memHp + ", picture=" + picture + ", picture2=" + picture2 + ", picturelist="
				+ picturelist + ", pictureArray=" + Arrays.toString(pictureArray) + ", userId=" + userId + ", password="
				+ password + "]";
	}
}
