package com.test.member;

public class FaqBoardDTO {
	
	
	//자주묻는질문 테이블
	
	private String seq;
	private String itemseq;
	private String subject;
	private String content;
	private String regdate;
	private String delflag;
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getItemseq() {
		return itemseq;
	}
	public void setItemseq(String itemseq) {
		this.itemseq = itemseq;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	


}
