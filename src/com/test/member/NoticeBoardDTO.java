package com.test.member;

public class NoticeBoardDTO {
	
	//공지사항테이블
	private String seq;
	private String admseq;
	private String subject;
	private String content;
	private String readcnt;
	private String regdate;
	private String filename;
	
	private String rnum;	//게시판 기본 인덱스
	
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getAdmseq() {
		return admseq;
	}
	public void setAdmseq(String admseq) {
		this.admseq = admseq;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(String readcnt) {
		this.readcnt = readcnt;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	

	
}
