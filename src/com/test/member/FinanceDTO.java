package com.test.member;
/**
 * 
 * @author 영현
 *	금융 추천 게시판 -> 게시글 들어갈 때 담아갈 정보가 담긴 그릇
 */
public class FinanceDTO {
	
	private String seq; //글번호
	private String sort; //전 글에서 정렬 상태
	private String search; //전 글에서 검색어
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
	
	

}
