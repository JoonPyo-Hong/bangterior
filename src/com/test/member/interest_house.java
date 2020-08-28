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


@WebServlet("/member/interest_house.do")
public class interest_house extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
//		session.getAttribute("seq");
		
		String seq = "1"; //회원 번호
		MemberDAO dao = new MemberDAO();
		ArrayList<jjimDTO> list = dao.getjjim(seq);
		dao.close();
		req.setAttribute("list", list);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/interest.jsp");
		dispatcher.forward(req, resp);
	
	}
}
 