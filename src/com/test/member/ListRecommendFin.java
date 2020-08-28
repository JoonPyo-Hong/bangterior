package com.test.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//금융 추천 게시판 
@WebServlet("/member/listrecommendfin.do")
public class ListRecommendFin extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		//1. DB 작업 > select
		//2. 결과값 전달 + JSP 호출하기
				
		HttpSession session = req.getSession(); //아이디 불러오기
		//String seq = (String) session.getAttribute("seq"); //로그인한 멤버 seq
		String seq = "301";
		
		//담을 객체
		HashMap<String,String> map = new HashMap<String,String>();

		
		//검색어 반환
		String search = req.getParameter("search");
		
		//null값 처리
	  	  if(search == null) {
	  		search = "";
	  		map.put("search", search); 	 
	  	  } else {
	  		map.put("search", search); 	 
	  	  }
		
		//제목으로 검색 or 제목 + 내용
		String sort = req.getParameter("sort");
		
		//sort 값이 null이면 "4"으로 바꿔주기 > "전체" 기본 선택 
  	    if(sort == null) {
  	    	sort = "4";
  	  	  map.put("sort", sort);
  	    } else {
  	 	  map.put("sort", sort);
  	    }
		
		
		
		
		//페이징 처리 관련 변수
				int nowPage = 0;			// 현재 페이지 번호
				int totalCount = 0;			// 총 게시물 수
				int pageSize = 10;			// 한 페이지 당 출력 갯수
				int totalPage = 0;			// 총 페이지 수 
				int begin = 0;				// rnum 시작 번호
				int end = 0;				// rnum 끝 번호
				int n = 0;					// 페이지바 관련 변수
				int loop = 0;				// 페이지바 관련 변수
				int blockSize = 5;			// 페이지바 관련 변수
				
				
				
				
		
		
		//1.
		MemberDAO dao = new MemberDAO();
		
		//총 페이지 수 계산하기
		
		//검색어 있을 경우 대비
		totalCount = dao.getTotalCount(map);
		
		totalPage = (int)Math.ceil((double)totalCount/pageSize); //올림 함수
		
		
		
		
		//list.do -> list.do?page=1 변경
		//list.do?page=1
		String page = req.getParameter("page");
		
		if(page == null || page == "") nowPage = 1; //default
		else nowPage = Integer.parseInt(page); //
		
		//nowPage -> 보려는 페이지 번호!
		//2page -> where rnum >= 1 and rnum <= 10
		//1page -> where rnum >= 11 and rnum <= 20
		begin = ((totalPage - nowPage) * pageSize) + 1;
		end = ((totalPage - nowPage) * pageSize) + 10;
		
		map.put("begin", begin+"");
		map.put("end", end+"");
		
		ArrayList<SeeRecommendFinDTO> list = dao.finlist(map);

		
		
		//페이지바 제작
		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;
		
		//list.do?page=1
		//1 2 3 4 5
		
		//list.do?page=3
		//1 2 3 4 5

		//list.do?page=11
		//11 12 13 14 15
		
		String pagebar = "";

		pagebar += "<div id=\"paging\">";
		
		  //이전 5페이지
		
		if(totalPage >= 5) {
        if(n == 1) {
           //현재 페이지가 첫페이지 일때 
           pagebar += "<div class=\"left_btn btn\">";
           pagebar += "이전";
           pagebar += "</div>";
           pagebar += "<ul>";
        } else {
           pagebar += String.format("<a href=\"/bangterior/member/listrecommendfin.do?page=%d&search=%s&sort=%s\">", n - 1,search, sort);
           pagebar += "<div class=\"left_btn btn\">";
           pagebar += "이전";
           pagebar += "</div>";
           pagebar += "</a>";
           pagebar += "<ul>";
        }
		}
		
		for(int i = 1; i <= totalPage; i++) {
		
		while(! (loop > blockSize || n > totalPage)) {
		//페이지 번호
			
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
                  pagebar += String.format("<a href=\"/bangterior/member/listrecommendfin.do?page=%d&search=%s&sort=%s\">%d</a>", n,search, sort , n);
                  pagebar += "</li>";
                  pagebar += "</ul>";
               }
               loop++; 
               n++;
            }

		}
		if(totalPage >= 5) {

	    //다음 페이지 
        if(n > totalPage) {
           //현재 페이지가 마지막 페이지 일때 이동 불가
           pagebar += "<div class=\"right_btn btn\">";
           pagebar += "다음";
           pagebar += "</div>";
        } else {
           pagebar += String.format("<a href=\"/bangterior/member/listrecommendfin.do?page=%d&search=%s&sort=%s\">", n,search, sort);
           pagebar += "<div class=\"right_btn btn\">";
           pagebar += "다음";
           pagebar += "</div>";
           pagebar += "</a>";
        }
         
		}
        
        //페이징 끝 태그
        pagebar += "</div>";
		
			
		
		
		
		//2.
		req.setAttribute("list", list);
		req.setAttribute("pagebar", pagebar);
		
		req.setAttribute("sort", sort);
		req.setAttribute("search", search);
		
		


		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/listrecommendfin.jsp");
		dispatcher.forward(req, resp);

	
	
	}
}
