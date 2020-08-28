package com.test.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/inquiryboardview.do")
public class InquiryBoardView extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		
		//1. view.do?seq=?
		String seq = req.getParameter("seq");
		String search = req.getParameter("search");
		String searchfield = req.getParameter("searchfield");
		
		//2.DB
		MemberDAO dao = new MemberDAO();
		
		
		InquiryBoardDTO dto2 = new InquiryBoardDTO();
		dto2.setSeq(seq);
		
		InquiryBoardDTO dto = dao.inquiryget(dto2);
		
		
		//2.5 데이터가공 ( \\r\\n -> <br> )
		String content = dto.getContent();
		content= content.replace("\\r\\n", "<br>");
		dto.setContent(content);
		
		
		//3. DAO에게 반환 DTO 출력
		req.setAttribute("dto", dto);
		req.setAttribute("search", search);
		req.setAttribute("searchfiled", searchfield);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/inquiryboardview.jsp");
		dispatcher.forward(req, resp);

		
	}

}
