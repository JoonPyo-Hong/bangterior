package com.test.member;

public class IndexDTO {
	
	private String subject;
	private String filename;
	private String[] optlist;
	private String optseq;
	private String recomopseq;
	private String readcnt;
	private String recomcnt;
	private String regdate;
	private String seq;
	private String type;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getRecomcnt() {
		return recomcnt;
	}
	public void setRecomcnt(String recomcnt) {
		this.recomcnt = recomcnt;
	}
	public String getOptseq() {
		return optseq;
	}
	public void setOptseq(String optseq) {
		this.optseq = optseq;
	}
	public String getRecomopseq() {
		return recomopseq;
	}
	public void setRecomopseq(String recomopseq) {
		this.recomopseq = recomopseq;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String[] getOptlist() {
		return optlist;
	}
	public void setOptlist(String[] optlist) {
		this.optlist = optlist;
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
