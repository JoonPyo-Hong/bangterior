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


@WebServlet("/member/inquiryboardlist.do")
public class InquiryBoardList extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB 작업
		//2. 결과값 전달 JSP 호출하기
		
		HttpSession session = req.getSession();
		
		//1.
		MemberDAO dao = new MemberDAO();
		//검색
		String search = req.getParameter("search");
		String searchfield = req.getParameter("searchfield");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searh", search);
		map.put("searchfield", searchfield);
		
		
		
		
		ArrayList<InquiryBoardDTO> list = dao.inquirylist(map);	
		
		
		
		
		
		//2.
		req.setAttribute("list", list);
		req.setAttribute("search", search);
		req.setAttribute("searchfield", searchfield);
	
		int rownum = list.size(); //200
		req.setAttribute("rownum", rownum);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/inquiryboardlist.jsp");
		dispatcher.forward(req, resp);

		
	}

}
