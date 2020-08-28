package com.test.member;

/**
 * 
 * @author 영현
 * 서류를 위한 멤버 정보가 담긴 그릇
 */
public class MemberDocInfoDTO {

	
	private String address;
	private String tel;
	private String name;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
