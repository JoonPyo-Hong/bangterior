package com.test.admin;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/regview.do")
public class RegView extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//매물 게시물 등록 허가 
		//1. regwaitboard 에서 게시물,회원 seq 넘겨받음
		//1-1. 넘겨받은 seq DAO에 넘겨줌
		//2. 해당 seq에 해당하는 필요한 정보 DB에서 가져오기
		//3. jsp에게 넘겨주기
		
		
		AdminDAO dao = new AdminDAO();
		
		//1.
		//regwaitboard.jsp 에서 클릭한 게시물  seq 넘겨줌 > 이걸로 DB 작업 
		String hpseq = req.getParameter("hpseq");	//게시물 seq
		String mseq = req.getParameter("mseq");		//회원 seq

		
		
		//게시물seq , 멤버seq 담을 해쉬맵
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("hpseq", hpseq);
		map.put("mseq", mseq);
		
		//오른쪽 box 정보 가져옴
		ArrayList<RegViewDTO> reg_info = dao.regView(map);
		
		
		
		
		//공인인증서 등록 여부 , 신고횟수 정보 가져옴
		ArrayList<RegListDTO> reg_list = dao.regList(map);
		
		
		
		
		//자동계산 > 관리비 항목 
		//게시물 번호 들고가서 게시물  관리비 점수 가져오기
		int auto_maincost = dao.score_info(hpseq);
		

		
		//게시물 seq 들고가서 가격 가져오기
		int cost = dao.cost(hpseq);
		
		//자동계산 > 가격 항목
		//게시물 seq , 가격 들고가서 점수 가져오기
		int auto_cost = dao.auto_score(hpseq, cost);
		
		//고도 비교해서 점수내기 
		//게시물 seq 들고가서 점수 가져오기 
		int auto_alt = dao.auto_alt(hpseq);
		
		
		//총점 
		int total_score = 0;
		
		//평균 
		int avg = 0;  
		
		
		
	
		//페이징
		int nowPage = 0;			//현재 페이지 번호
		int totalCount = 0;			//총 게시물 수
		int pageSize = 1;			//한페이지당 출력 갯수
		int totalPage = 0; 			//총 페이지 수
		int begin = 0;				//rnum 시작 번호
		int end  = 0;				//rnum 끝 번호
		int n = 0;					//페이지바 관련 변수
		int loop = 0;				//페이지바 관련 변수
		int blockSize = 5; 			//페이지바 관련 변수
		
		String page = req.getParameter("page");

	      
	      
	      
	      
		//기본값 > 1페이지 
		if(page == null || page == "") {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		//총 페이지수 계산하기
		//총 페이지수 = 총 게시물 수 / 한페이지당 출력할 게시물 수  > 1페이지당 1개 출력
		totalCount = 8;

		begin = ((nowPage - 1) * pageSize ) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		//매물 이미지 정보 가져옴 
		ArrayList<RegImageDTO> reg_image = dao.regImage(map);
		
		//이미지 페이징 위한 DB결과 리스트
		ArrayList<RegImageDTO> img_list = dao.regImage(map);
		
		
		
		
		
		
		//Mth.ceil 반환값 자료형 : double임. > 형변환
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		
	      //단순히 10바퀴 루프 돌리기 위한 변수
	      loop = 1;
	      
	      //페이지 첫 숫자 
	      //** 1 , 11, 21 얻어내기 위한 변수 
	      n = ((nowPage - 1) / blockSize) * blockSize + 1;
	      
			

	      
	      String pagebar = "";
	      
	      //페이지바 시작 태그
	      pagebar += "<div id=\"page_btn\">";
	      
	      //이전 5페이지 
	      if(n == 1) {
	    	  //현재 1페이지면 이전페이지 존재하지 않음
	    	  pagebar += "<a href=\"#\">";
	    	  pagebar += "<input type=\"button\" value=\"&lt\" class=\"page_btn\" disabled>";
	    	  pagebar += "</a>";
	    	  
	      } else {
	    	  pagebar += String.format("<a href=\"/bangterior/regview.do?hpseq=%s&mseq=%s&page=%d\">"
	    			  		,map.get("hpseq") , map.get("mseq") , n - 1 );
	    	  pagebar += "<input type=\"button\" value=\"&lt\" class=\"page_btn\">";
	    	  pagebar += "</a>";
	      }
	      
	      
	      //페이징 숫자버튼	    	  
	    	  //5페이지 보다 크면 출력X
	    	  while(!(loop > blockSize || n > totalPage)) {
	    		  
	    		  if(n == nowPage) {
	    			  //현재 보고 있는 페이지 
	    			  pagebar += "<a href=\"#!\">";
	    			  pagebar += String.format("<input type=\"button\" value=\"%d\" class=\"page_btn_sel\">", n);
	    			  pagebar += "</a>";
	    		  } else {
	    			
	    	    	  pagebar += String.format("<a href=\"/bangterior/regview.do?hpseq=%s&mseq=%s&page=%d\">"
		    			  		,map.get("hpseq") , map.get("mseq") , n );
	    			  pagebar += String.format("<input type=\"button\" value=\"%d\" class=\"page_btn\">", n);
	    			  pagebar += "</a>";
	    		  }
	    		  
	    		  n++;
	    		  loop++;
	    		  
	    	  }//while
	    	  
	    	  
	    	  
	    	//다음 페이지 
		      if(n > totalPage) {
		    	  //현재 페이지가 마지막 페이지 일때 이동 불가
		    	  pagebar += "<a href=\"#\">";
		    	  pagebar += "<input type=\"button\" value=\"&gt\" class=\"page_btn\" disabled>";
		    	  pagebar += "</a>";
		      } else {
		    	  
		    	  pagebar += String.format("<a href=\"/bangterior/regview.do?hpseq=%s&mseq=%s&page=%d\">"
	    			  		,map.get("hpseq") , map.get("mseq") , n  );
		    	  pagebar += "<input type=\"button\" value=\"&gt\" class=\"page_btn\" >";
		    	  pagebar += "</a>";
		      }
	     
	      
	      //페이지바 끝 태그 
	      pagebar += "</div>";
	      
		
		
		
		
		//
		req.setAttribute("hpseq", hpseq);
		req.setAttribute("mseq", mseq);
		req.setAttribute("reg_info", reg_info);
		req.setAttribute("reg_list", reg_list);
		req.setAttribute("reg_image", reg_image);
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("auto_maincost", auto_maincost);
		req.setAttribute("auto_cost", auto_cost);
		req.setAttribute("auto_alt", auto_alt);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/regview.jsp");

		dispatcher.forward(req, resp);
	}
	
}
