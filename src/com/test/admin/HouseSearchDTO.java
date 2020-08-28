package com.test.admin;

public class HouseSearchDTO {

	private int seq;		//번호
	private String subject;	//제목
	private String cost;	//가격
	private String depcost; //보증금
	private int maincost; 	//관리비
	private String filename;//파일명
	private String area;	//면적
	private int floor;		//층수
	private String type; 	//매매 유형
	private String lat;		//위도
	private String lng;		//경도
	private String address;	//주소
//	private int totalnum; 	//총 방 갯수
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getDepcost() {
		return depcost;
	}
	public void setDepcost(String depcost) {
		this.depcost = depcost;
	}
	public int getMaincost() {
		return maincost;
	}
	public void setMaincost(int maincost) {
		this.maincost = maincost;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
//	public String getSum() {
//		return sum;
//	}
//	public void setSum(String sum) {
//		this.sum = sum;
//	}
//	public int getTotalnum() {
//		return totalnum;
//	}
//	public void setTotalnum(int totalnum) {
//		this.totalnum = totalnum;
//	}
//	
//	
//	
//	
//	
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String adress) {
		this.address = adress;
	}
}
