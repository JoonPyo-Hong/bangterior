package com.test.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/noticeboardlist.do")
public class NoticeBoardList extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB 작업
		//2. 결과값 전달 JSP 호출하기
		
		HttpSession session = req.getSession();
		
		//1.
		MemberDAO dao = new MemberDAO();
		//검색 : list.do:?search=검색어
		String search = req.getParameter("search");
		String searchfield = req.getParameter("searchfield");
		
		
		//System.out.println(searchfield);

		
		HashMap<String,String> map = new HashMap<String,String>(); 
		map.put("search",search);
		map.put("searchfield",searchfield);
		
		
		ArrayList<NoticeBoardDTO> list = dao.noticelist(map);
		
		
		//새로고침 조회수 증가 방지
		session.setAttribute("read", false);
		
		//select box 유지

		
		
		//2.
		req.setAttribute("list", list);
		req.setAttribute("search", search);
		req.setAttribute("searchfield", searchfield);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/noticeboardlist.jsp");
		dispatcher.forward(req, resp);
		
	}

}
