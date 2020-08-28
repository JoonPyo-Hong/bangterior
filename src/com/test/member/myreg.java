package com.test.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/myreg.do")
public class myreg extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//1. 데이터 가져오기
		
		HttpSession session = req.getSession();
		String seq = req.getParameter("seq");
		
		//2. DB
		MemberDAO dao = new MemberDAO();
		MyregDTO dto = dao.getRegHouseInfo(seq);
		ArrayList<MyregDTO> optlist = dao.getHouseOPT(seq); 
		ArrayList<MyregDTO> imglist = dao.gethouseIMG(seq);
		dao.close();
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("optlist", optlist);
		req.setAttribute("imglist", imglist);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/myreg.jsp");
		dispatcher.forward(req, resp);
		
	}
}
