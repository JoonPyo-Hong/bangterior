package com.test.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/index.do")
public class Index extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		ArrayList<IndexDTO> hreco = dao.recohouse();
		ArrayList<IndexDTO> ereco = dao.recoeco();
		ArrayList<IndexDTO> notice = dao.notice();
		ArrayList<IndexDTO> faq = dao.faq();
		dao.close();
		
		
		req.setAttribute("hreco",hreco);
		req.setAttribute("ereco",ereco);
		req.setAttribute("notice", notice);
		req.setAttribute("faq", faq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("../WEB-INF/views/member/index.jsp");
		dispatcher.forward(req, resp);

		
	}
	
	

}
 