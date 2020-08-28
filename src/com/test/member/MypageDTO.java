package com.test.member;

public class MypageDTO {
	private String filename;
	private String id;
	private String name;
	private String ssn;
	private String address;
	private String tel;
	private String email;
	private String marsta;
	private String noticnt;
	private String regdate;
	private String delfalg;
	private String memtype;
	
	private String postseq;
	private String memseq;
	private String optseq;
	private String[] optlist;
	private String pw;
	
	public String[] getOptlist() {
		return optlist;
	}
	public void setOptlist(String[] optlist) {
		this.optlist = optlist;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMemseq() {
		return memseq;
	}
	public void setMemseq(String memseq) {
		this.memseq = memseq;
	}
	public String getOptseq() {
		return optseq;
	}
	public void setOptseq(String optseq) {
		this.optseq = optseq;
	}
	public String getPostseq() {
		return postseq;
	}
	public void setPostseq(String postseq) {
		this.postseq = postseq;
	}
	private String optname;
	
	public String getOptname() {
		return optname;
	}
	public void setOptname(String optname) {
		this.optname = optname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMemtype() {
		return memtype;
	}
	public void setMemtype(String memtype) {
		this.memtype = memtype;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMarsta() {
		return marsta;
	}
	public void setMarsta(String marsta) {
		this.marsta = marsta;
	}
	public String getNoticnt() {
		return noticnt;
	}
	public void setNoticnt(String noticnt) {
		this.noticnt = noticnt;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getDelfalg() {
		return delfalg;
	}
	public void setDelfalg(String delfalg) {
		this.delfalg = delfalg;
	}
}
