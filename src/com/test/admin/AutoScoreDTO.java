package com.test.admin;

public class AutoScoreDTO {
	
	private String hpseq;	//게시물 번호 
	private int cost;		//매물 가격 
	private int maincost;	//관리비
	
	
	
	public int getMaincost() {
		return maincost;
	}
	public void setMaincost(int maincost) {
		this.maincost = maincost;
	}
	public String getHpseq() {
		return hpseq;
	}
	public void setHpseq(String hpseq) {
		this.hpseq = hpseq;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	
	

}
