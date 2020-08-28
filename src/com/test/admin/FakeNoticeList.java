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
 * @author 희선 
 *
 */
@WebServlet("/fakenoticelist.do")
public class FakeNoticeList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//허위 매물 신고 리스트
		
		AdminDAO dao = new AdminDAO();
		
		//DB작업에 필요한 데이터
		HashMap<String,String> map = new HashMap<String,String>();
		
		
		String seq = req.getParameter("seq");
		
		
		
		//우측 상단 select box 
		String sel1 = req.getParameter("sel1");
		if(sel1 == null) {
			sel1 = "0";
		} 
		map.put("sel1", sel1);
		
		
		//검색창 select box 
		String search_select = req.getParameter("search_select");
		if(search_select == null) {
			search_select = "0";
		} 
		map.put("search_select", search_select);
		
		
		//검색어
		String search_word = req.getParameter("search_word");
		if(search_word == null) {
			search_word = "";
		}
		map.put("search_word", search_word);
		

		
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
		totalCount = dao.getfakecnt(map);
		
		String txt = "";
		
		if(totalCount == 0) {
			txt = "검색결과가  없습니다.";
		} else {
		
		begin = ((nowPage - 1) * pageSize * (-1) ) + totalCount;
		end = begin + pageSize - 19;
		
		if(end < 0) {
			end = 0;
		}

	
		
		map.put("begin", begin + "");
		map.put("end", end + "");

		
		//결과 리스트 받을 list
		ArrayList<FakeNoticeDTO> list = dao.report_list(map);
		
		

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
	    	  pagebar += String.format("<a href=\"/bangterior/fakenoticelist.do?page=%d&sel1=%s&sarch_select=%s&search_word=%s\">", n - 1 , sel1 , search_select , search_word );
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
	    			  pagebar += String.format("<a href=\"/bangterior/fakenoticelist.do?page=%d&sel1=%s&sarch_select=%s&search_word=%s\">%d</a>", n , sel1 , search_select , search_word , n );
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
	    	  
	    	  pagebar += String.format("<a href=\"/bangterior/fakenoticelist.do?page=%d&sel1=%s&sarch_select=%s&search_word=%s\">", n , sel1 , search_select , search_word);
	    	  pagebar += "<div class=\"right_btn btn\">";
	    	  pagebar += "다음";
	    	  pagebar += "</div>";
	    	  pagebar += "</a>";
	      }
	       
	
	      
	      //페이징 끝 태그
	      pagebar += "</div>";
		
		
		
		
		
		//jsp 에게 넘겨주기
	    req.setAttribute("pagebar", pagebar);
	    req.setAttribute("list", list);
	    req.setAttribute("txt", txt);
	    req.setAttribute("sel1", sel1);
	    req.setAttribute("page", page);
		}
	    
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/fakenoticelist.jsp");

		dispatcher.forward(req, resp);
	}
}
