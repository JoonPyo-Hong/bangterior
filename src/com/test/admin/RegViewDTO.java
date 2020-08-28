package com.test.admin;

public class RegViewDTO {
	
	private String seq;
	private String id;
	private String postal;		//우편번호
	private String address;		//주소 
	private String cost;			//보증금 
	private String depcost;		//월세
	//private String type;		//매물 종류 (아파트 , 원룸 ,,)
	private String maincost;		//관리비
	private	int area;			//면적
	private String detailcontent;	//게시물 상세설명 
	private String filename;		//회원파일명

	private String sttype;			//거래유형 
	private String httype;			//방유형 
	private String optseq;			//옵션 번호 (대출 > 2)
	
	private String hpseq;			//게시물 seq
	
	

	public String getHpseq() {
		return hpseq;
	}
	public void setHpseq(String hpseq) {
		this.hpseq = hpseq;
	}
	public String getOptseq() {
		return optseq;
	}
	public void setOptseq(String optseq) {
		this.optseq = optseq;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getSttype() {
		return sttype;
	}
	public void setSttype(String sttype) {
		this.sttype = sttype;
	}
	public String getHttype() {
		return httype;
	}
	public void setHttype(String httype) {
		this.httype = httype;
	}
	public String getPostal() {
		return postal;
	}
	public void setPostal(String postal) {
		this.postal = postal;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public String getDetailcontent() {
		return detailcontent;
	}
	public void setDetailcontent(String detailcontent) {
		this.detailcontent = detailcontent;
	}




}
