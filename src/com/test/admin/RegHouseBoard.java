package com.test.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author user 
 * 등록된 매물 게시물 리스트 
 *
 */
@WebServlet("/reghouseboard.do")
public class RegHouseBoard extends HttpServlet{

	//등록된 매물 리스트 게시판
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		//상태 select , 검색 정보 
		HashMap<String,String> map = new HashMap<String,String>();
		
		RegHouseDTO dto = new RegHouseDTO();
		
		
		//1. 데이터 가져오기
		AdminDAO dao = new AdminDAO();
		
		//등록일 
		String regdate = req.getParameter("regdate");
		
		//상태 선택 select box
		//선택된 셀렉트 박스 값 
		String sel1 = req.getParameter("sel1");
		
  	    //sel1 값이 null이면 4로 바꿔주기 > "전체" 기본 선택 
  	    if(sel1 == null) {
  	 	  sel1 = "4";
  	  	  map.put("sel1", sel1);
  	    } else {
  	 	  map.put("sel1", sel1);
  	    }
		
  	    
  	    
  	    //검색 select box 
  	    String sel2 = req.getParameter("sel2");
//  	    map.put("sel2", sel2);
  	    
  	    //sel1 값이 null이면 0으로 바꿔주기  > "제목" 기본 선택
  	    if(sel2 == null) {
  	 	  sel2= "0";
  	  	  map.put("sel2", sel2);
  	    } else {
  	 	  map.put("sel2", sel2);
  	    }
  	  
  	  
  	  
  	  //검색창
  	  String search_word = req.getParameter("search_word");
  	  
  	  //null값 처리
  	  if(search_word == null) {
  		search_word = "";
  		map.put("search_word", search_word); 	 
  	  } else {
  		map.put("search_word", search_word); 	 
  	  }

  	  
  	  //검색어 주고 검색결과 반환받기 
  	  ArrayList<RegHouseDTO> search_list = dao.post_list(map);
  	  
	  	  
	  	  
		
		//페이징		
		int nowPage = 0;			//현재 페이지 번호
		int totalCount = 0;			//총 게시물 수
		int pageSize = 10;			//한페이지당 출력 갯수
		int totalPage = 0; 			//총 페이지 수
		int begin = 0;				//rnum 시작 번호
		int end  = 0;				//rnum 끝 번호
		int n = 0;					//페이지바 관련 변수
		int loop = 0;				//페이지바 관련 변수
		int blockSize = 5; 			//페이지바 관련 변수
		
		
		String page = req.getParameter("page");
		
		
		
		if(page == null || page == "") {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		//총 페이지수 계산하기
		//총 페이지수 = 총 게시물 수 / 한페이지당 출력할 게시물 수 
		totalCount = Integer.parseInt((dao.getTotalCount(map).get(0)));
		
		
		begin = ((nowPage - 1) * pageSize * (-1) ) + totalCount;
		end = begin + pageSize - 19;

		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		//게시물 리스트 정보 담을 arraylist
		ArrayList<RegHouseDTO> list = dao.post_list(map);
		
		
		//Mth.ceil 반환값 자료형 : double임. > 형변환
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		
	      //단순히 10바퀴 루프 돌리기 위한 변수
	      loop = 1;
	      
	      //페이지 첫 숫자 
	      //** 1 , 11, 21 얻어내기 위한 변수 
	      n = ((nowPage - 1) / blockSize) * blockSize + 1;
	      
	      
	      String pagebar = "";
	      
	      //페이징 시작 태그
	      pagebar += "<div id=\"paging\">";
	      
	      //이전 5페이지 
	      if(n == 1) {
	    	  //현재 페이지가 첫페이지 일때 
	    	  pagebar += "<div class=\"left_btn btn\">";
	    	  pagebar += "이전";
	    	  pagebar += "</div>";
	    	  pagebar += "<ul>";
	      } else {
	    	  pagebar += String.format("<a href=\"/bangterior/reghouseboard.do?page=%d&sel1=%s&sel2=%s\">", n - 1 , sel1 , sel2);
	    	  pagebar += "<div class=\"left_btn btn\">";
	    	  pagebar += "이전";
	    	  pagebar += "</div>";
	    	  pagebar += "</a>";
	    	  pagebar += "<ul>";
	      }
	      
	      
	      
	      
	      //페이징 숫자 버튼 
	      for(int i=1; i<=totalPage; i++) {	//40바퀴
	    	  
	    	  //5페이지 보다 크면 출력하지 않음 ( 5번 실행 )
	    	  while(!(loop > blockSize || n > totalPage)) {
	    		  
	    		  if(n == nowPage) {
	    			  //현재 보고 있는 페이지 
	    			  pagebar += "<ul>";
	    			  pagebar += "<li class=\"view_page\">";
	    			  
	    			  pagebar += String.format("<a href=\"#!\">%d</a>", n);
				      pagebar += "</li>";
				      pagebar += "</ul>";
	    		  } else {
	    			  pagebar += "<ul>";
	    			  pagebar += "<li>";
	    			  pagebar += String.format("<a href=\"/bangterior/reghouseboard.do?page=%d&sel1=%s&sel2=%s&search_word=%s\">%d</a>", n ,sel1, sel2 ,search_word,n );
	    			  pagebar += "</li>";
	    			  pagebar += "</ul>";
	    		  }
	    		  loop++; 
	    		  n++;
	    	  }
	      }
	      
	      
	      
	      
	      //다음 페이지 
	      if(n > totalPage) {
	    	  //현재 페이지가 마지막 페이지 일때 이동 불가
	    	  pagebar += "<div class=\"right_btn btn\">";
	    	  pagebar += "다음";
	    	  pagebar += "</div>";
	      } else {
	    	  
	    	  pagebar += String.format("<a href=\"/bangterior/reghouseboard.do?page=%d&sel1=%s&sel2=%s&search_word=%s\">", n , sel1 , sel2, search_word);
	    	  pagebar += "<div class=\"right_btn btn\">";
	    	  pagebar += "다음";
	    	  pagebar += "</div>";
	    	  pagebar += "</a>";
	      }
	       
	
	      
	      //페이징 끝 태그
	      pagebar += "</div>";
	      
	      
	      
		
		//2.jsp에 게시글 데이터 넘겨주기
	    req.setAttribute("list", list);
		req.setAttribute("page", page);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("regdate", regdate);
		

		req.setAttribute("sel1", sel1);
		req.setAttribute("sel2", sel2);
		
		
		
			
			
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/reghouseboard.jsp");

		dispatcher.forward(req, resp);
		
	}
	
}
