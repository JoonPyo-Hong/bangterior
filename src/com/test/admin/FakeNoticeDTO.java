package com.test.admin;

public class FakeNoticeDTO {

	private String seq;
	private String postseq;
	private String memseq;
	private String reportreason;
	private String regdate;
	private String state;
	private String hpseq;
	private String subject;
	private String rnum;
	private String id;		//신고자 아이디
	private String hbseq;	//매물번호 ( house_basic seq)

	
	
	
	public String getHbseq() {
		return hbseq;
	}
	public void setHbseq(String hbseq) {
		this.hbseq = hbseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getHpseq() {
		return hpseq;
	}
	public void setHpseq(String hpseq) {
		this.hpseq = hpseq;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getPostseq() {
		return postseq;
	}
	public void setPostseq(String postseq) {
		this.postseq = postseq;
	}
	public String getMemseq() {
		return memseq;
	}
	public void setMemseq(String memseq) {
		this.memseq = memseq;
	}
	public String getReportreason() {
		return reportreason;
	}
	public void setReportreason(String reportreason) {
		this.reportreason = reportreason;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	

	
}
