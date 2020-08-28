package com.test.house;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/house/HouseSearchDetail.do")
public class HouseSearchDetail extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		// 세션 받기
		HttpSession session = req.getSession();
		String memseq = (String) session.getAttribute("seq");
		// 세션 null값일때 처리
		if (memseq == null) {
			memseq = "0";
		}
		String name = "";
		if(!memseq.equals("0")) {
			HouseDAO dao = new HouseDAO();
			name = dao.selectname(memseq);
			
		}
		
		
		String seq = req.getParameter("seq");
		//테스트용
		if(seq == null) {
			seq = "1";
		}
		
		req.setAttribute("seq", seq);
		req.setAttribute("memseq", memseq);
		req.setAttribute("name", name);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/house/HouseSearchDetail.jsp");
		dispatcher.forward(req, resp);
		
		
	}
}
