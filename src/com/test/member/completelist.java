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
@WebServlet("/member/completelist.do")
public class completelist extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//데이터 가져오기	(회원번호)
		HttpSession session = req.getSession();
//		String seq = "1";
		String seq = session.getAttribute("seq").toString();

		
		//DB
		MemberDAO dao = new MemberDAO();
		ArrayList<contractingDTO> dto = dao.compeletelist(seq);
		completeDTO state = dao.paperstate(seq);
		MypageDTO id= dao.getid(seq);
		dao.close();
		
		req.setAttribute("id",id);
		req.setAttribute("dto", dto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/completelist.jsp");
		dispatcher.forward(req, resp);
	}
}
