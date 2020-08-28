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

@WebServlet("/member/contractinglist.do")
public class contractinglist extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
//		String seq = "208";	//회원번호	
		String seq = session.getAttribute("seq").toString();
		String conseq = req.getParameter("conseq");
		MemberDAO dao = new MemberDAO();
		ArrayList<contractingDTO> dto = dao.contractinglist(seq);
		
		ArrayList<completeDTO> inq = dao.getinqagency(seq);
		dao.close();
		int size = dto.size();
		
		req.setAttribute("conseq", conseq);
		req.setAttribute("seq",seq);
		req.setAttribute("size", size);
		req.setAttribute("seq", seq);
		req.setAttribute("dto", dto);
		req.setAttribute("inq",inq);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/contractinglist.jsp");

		dispatcher.forward(req, resp);
	}
}
