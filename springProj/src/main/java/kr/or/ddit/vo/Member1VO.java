package kr.or.ddit.vo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class Member1VO {
	
	@NotNull(message = "안녕하세요") // 필수 입력
	private String memId;
	
	@NotBlank // 필수 입력
	@Size(max=3) // 최대 3글자 입력
	private String memName;
	private String memJob;
	private String memLike;
	private String memHp;
	
	//자기소개
	private String introduction;
	
	
	// MEMBER_BACK 테이블에 없어도 사용 가능함
	private MultipartFile picture;
	private MultipartFile picture2;
	private List<MultipartFile> picturelist; // name="picturelist" 
	private MultipartFile[] pictureArray; // name="pictureArray"
	private String userId;
	private String password;
	
	
	private int coin = 1000; //보유 코인
	private Date birth; // 생일
	private String gender; // 성별
	private String nationality; // 국적
	private String[] cars; // 차
	private String car;
	private String[] hobbyList; // 취미
	private String hobby;
	private boolean marriaged; // 결혼 유무
	private AddressVO addressVO; // 중첩 자바빈 -> 자바빈 안에 자반이 있음(1:1관계)
	private List<CardVO> cardVOList; // 중첩 자바빈 -> 1 : N 관계
	private String developer; 
	private boolean foreigner;
	
	//AttachVO
	private List<AttachVO> attachVOList;
	
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


	public String getIntroduction() {
		return introduction;
	}


	public void setIntroduction(String introduction) {
		this.introduction = introduction;
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


	public int getCoin() {
		return coin;
	}


	public void setCoin(int coin) {
		this.coin = coin;
	}


	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getNationality() {
		return nationality;
	}


	public void setNationality(String nationality) {
		this.nationality = nationality;
	}


	public String[] getCars() {
		return cars;
	}


	public void setCars(String[] cars) {
		this.cars = cars;
	}


	public String getCar() {
		return car;
	}


	public void setCar(String car) {
		this.car = car;
	}


	public String[] getHobbyList() {
		return hobbyList;
	}


	public void setHobbyList(String[] hobbyList) {
		this.hobbyList = hobbyList;
	}


	public String getHobby() {
		return hobby;
	}


	public void setHobby(String hobby) {
		this.hobby = hobby;
	}


	public boolean isMarriaged() {
		return marriaged;
	}


	public void setMarriaged(boolean marriaged) {
		this.marriaged = marriaged;
	}


	public AddressVO getAddressVO() {
		return addressVO;
	}


	public void setAddressVO(AddressVO addressVO) {
		this.addressVO = addressVO;
	}


	public List<CardVO> getCardVOList() {
		return cardVOList;
	}


	public void setCardVOList(List<CardVO> cardVOList) {
		this.cardVOList = cardVOList;
	}


	public String getDeveloper() {
		return developer;
	}


	public void setDeveloper(String developer) {
		this.developer = developer;
	}


	public boolean isForeigner() {
		return foreigner;
	}


	public void setForeigner(boolean foreigner) {
		this.foreigner = foreigner;
	}


	public List<AttachVO> getAttachVOList() {
		return attachVOList;
	}


	public void setAttachVOList(List<AttachVO> attachVOList) {
		this.attachVOList = attachVOList;
	}


	@Override
	public String toString() {
		return "Member1VO [memId=" + memId + ", memName=" + memName + ", memJob=" + memJob + ", memLike=" + memLike
				+ ", memHp=" + memHp + ", introduction=" + introduction + ", picture=" + picture + ", picture2="
				+ picture2 + ", picturelist=" + picturelist + ", pictureArray=" + Arrays.toString(pictureArray)
				+ ", userId=" + userId + ", password=" + password + ", coin=" + coin + ", birth=" + birth + ", gender="
				+ gender + ", nationality=" + nationality + ", cars=" + Arrays.toString(cars) + ", car=" + car
				+ ", hobbyList=" + Arrays.toString(hobbyList) + ", hobby=" + hobby + ", marriaged=" + marriaged
				+ ", addressVO=" + addressVO + ", cardVOList=" + cardVOList + ", developer=" + developer
				+ ", foreigner=" + foreigner + ", attachVOList=" + attachVOList + "]";
	}

	
	
}
