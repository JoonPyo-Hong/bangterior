package com.test.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/editmypage.do")
public class Member56 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//회원 번호 받기
		
		String seq = req.getParameter("seq");
		
		MemberDAO dao = new MemberDAO();
		MypageDTO dto = dao.getInfo(seq);
		ArrayList<MypageDTO> optlist = dao.getoption(seq);
		ArrayList<MypageDTO> allopt = dao.getalloption(seq);
		dao.close();
		
		req.setAttribute("dto", dto);
		req.setAttribute("optlist", optlist);
		req.setAttribute("allopt", allopt);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/editmypage.jsp");
		dispatcher.forward(req, resp);
		
	}
}
