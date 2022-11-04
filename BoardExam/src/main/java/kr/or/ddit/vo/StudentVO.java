package kr.or.ddit.vo;

public class StudentVO {
	private String stName;
	private String stage;
	private String address;
	private String stHp;
	private String gender;
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStHp() {
		return stHp;
	}
	public void setStHp(String stHp) {
		this.stHp = stHp;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "StudentVO [stName=" + stName + ", stage=" + stage + ", address=" + address + ", stHp=" + stHp
				+ ", gender=" + gender + "]";
	}
}
