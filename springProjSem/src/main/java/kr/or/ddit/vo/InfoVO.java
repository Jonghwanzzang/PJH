package kr.or.ddit.vo;

import java.util.List;

public class InfoVO {
	
	private String name;
	private String no;
	private String address;
	private String phoneNum;
	private String car;
	private List<MyInfoVO> list;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getCar() {
		return car;
	}
	public void setCar(String car) {
		this.car = car;
	}
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	
	public List<MyInfoVO> getList() {
		return list;
	}
	public void setList(List<MyInfoVO> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "InfoVO [name=" + name + ", no=" + no + ", address=" + address + ", phoneNum=" + phoneNum + ", car="
				+ car + ", list=" + list + "]";
	}
}
