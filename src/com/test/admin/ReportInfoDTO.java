package com.test.admin;

public class ReportInfoDTO {

	
	//허위 매물 신고 정보 
	
	//가져올 데이터 
	//매물 번호 , 거래 유형 , 보증금 , 월세 , 관리비 , 신고내용 
	
	private String hbseq;			//매물 번호 
	private String sttype;			//거래유형
	private String cost;			//가격
	private String depcost;			//보증금
	private String maincost;		//관리비
	private String REPORTREASON;	//신고사유
	private String address;			//주소
	private String filename;		//메인 파일명 
	private String state;			//상태
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getHbseq() {
		return hbseq;
	}
	public void setHbseq(String hbseq) {
		this.hbseq = hbseq;
	}
	public String getSttype() {
		return sttype;
	}
	public void setSttype(String sttype) {
		this.sttype = sttype;
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
	public String getMaincost() {
		return maincost;
	}
	public void setMaincost(String maincost) {
		this.maincost = maincost;
	}
	public String getREPORTREASON() {
		return REPORTREASON;
	}
	public void setREPORTREASON(String rEPORTREASON) {
		REPORTREASON = rEPORTREASON;
	}
	
	
	
}
