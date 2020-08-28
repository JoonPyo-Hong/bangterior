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
@WebServlet("/member/myreglist.do")
public class myreglist extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.값 가져오기
		HttpSession session = req.getSession();
		String seq = "155"; //회원번호
//		String seq = session.getAttribute("seq").toString();
		//2.DB
		MemberDAO dao = new MemberDAO();
		ArrayList<MyregDTO> dto = dao.myreglist(seq);
		ArrayList<MyregDTO> statlist = dao.statlist();
		
		req.setAttribute("dto", dto);
		req.setAttribute("statlist",statlist);
		//3.결과 출력
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/myreglist.jsp");
		dispatcher.forward(req, resp);
	}

}
