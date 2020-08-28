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
 * 매물 승인 대기 리스트 게시판 
 *
 */
@WebServlet("/regwaitboard.do")
public class RegWaitBoard extends HttpServlet{
	
	//매물 승인 대기 리스트 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		//제목
		String subject = req.getParameter("subject");
		//작성자
		String name = req.getParameter("name");
		//등록일
		String regdate = req.getParameter("regdate");
		
		//DB작업에 필요한 데이터
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("subject", subject);
		map.put("name", name);
		map.put("regdate", regdate);
		
		AdminDAO dao = new AdminDAO();
		

		
		String sel = req.getParameter("sel");
		String search_word = req.getParameter("search_word");
		
		
  	    //sel1 값이 null이면 0으로 바꿔줌 > '제목' 기본선택 
  	    if(sel == null) {
  	 	  sel = "0";
  	  	  map.put("sel", sel);
  	    } else {
  	 	  map.put("sel", sel);
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
		totalCount = Integer.parseInt((dao.getWaitTotalCount(map).get(0)));
		
		
		begin = ((nowPage - 1) * pageSize * (-1) ) + totalCount;
		end = begin + pageSize - 19;

		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		//결과 리스트 받을 list
		ArrayList<RegWaitDTO> list = dao.wait_post(map);
		
		
		//게시물 리스트 정보 담을 arraylist
		ArrayList<RegWaitDTO> wait_list = dao.wait_post(map);
		

		
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
	    	  pagebar += String.format("<a href=\"/bangterior/regwaitboard.do?page=%d\">", n - 1 );
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
	    			  pagebar += String.format("<a href=\"/bangterior/regwaitboard.do?page=%d\">%d</a>", n ,n );
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
	    	  
	    	  pagebar += String.format("<a href=\"/bangterior/regwaitboard.do?page=%d\">", n );
	    	  pagebar += "<div class=\"right_btn btn\">";
	    	  pagebar += "다음";
	    	  pagebar += "</div>";
	    	  pagebar += "</a>";
	      }
	       
	
	      
	      //페이징 끝 태그
	      pagebar += "</div>";
		
		
		
		req.setAttribute("list", list);
		req.setAttribute("wait_list", wait_list);
		req.setAttribute("subject", subject);
		req.setAttribute("name", name);
		req.setAttribute("regdate", regdate);
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("page", page);
		req.setAttribute("totalcount", totalCount);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/regwaitboard.jsp");

		dispatcher.forward(req, resp);
	}

}
