package kr.or.ddit.vo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

//자바빈 클래스
public class MemberVO {

	private String userId = "gwangyu";	// 회원 아이디
	private String password = "java"; //비밀번호
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
	
	public MemberVO() {} // 기본 생성자
	
	// Getter , Setter
	public Date getBirth() {
		return birth;
	}
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	public void setBirth(Date birth) {
		this.birth = birth; 
		// 생일(기본 : 2022/11/01 -> 변경 : 20221101)
		// datetimefoemat에 패턴을 지정해주면 다른 형식으로도 받을 수 있다.
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

	public String[] getHobbyList() {
		return hobbyList;
	}

	public void setHobbyList(String[] hobbyList) {
		this.hobbyList = hobbyList;
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
	
	public String getCar() {
		return car;
	}

	public void setCar(String car) {
		this.car = car;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", password=" + password + ", coin=" + coin + ", birth=" + birth
				+ ", gender=" + gender + ", nationality=" + nationality + ", cars=" + Arrays.toString(cars) + ", car="
				+ car + ", hobbyList=" + Arrays.toString(hobbyList) + ", hobby=" + hobby + ", marriaged=" + marriaged
				+ ", addressVO=" + addressVO + ", cardVOList=" + cardVOList + "]";
	}
}
