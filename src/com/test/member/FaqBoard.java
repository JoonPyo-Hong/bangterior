package com.test.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/faqboard.do")
public class FaqBoard extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//1. DB 작업
		//2. 결과값 전달 JSP 호출하기
		
		
		HttpSession session = req.getSession();
		
		//1.
		MemberDAO dao = new MemberDAO();
		
		ArrayList<FaqBoardDTO> faqlist = dao.faqlist();
		
		
		//2.
		req.setAttribute("faqlist", faqlist);
		
		
		

		//2.5 데이터 가공
		for(FaqBoardDTO dto : faqlist) {
			
			String content = dto.getContent(); 
			content = content.replace("\\r\\n", "<br>");  
			dto.setContent(content);
		}
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/faqboard.jsp");
		dispatcher.forward(req, resp);

		
	}

}
