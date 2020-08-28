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

@WebServlet("/member/complete.do")
public class complete extends HttpServlet{
	
//	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//데이터 가져오기 (로그인 한 회원 번호)
		HttpSession session = req.getSession();
		
		//회원 번호 가져오기
		String seq = (String)session.getAttribute("seq");
		//String seq  = "53"; //임시로 값 바꿔주기
		
		
//		req.getParameter("postseq");
		String postseq = req.getParameter("postseq");
//		String postseq = "86";

		//DB
		MemberDAO dao = new MemberDAO();
		completeDTO hinfo = dao.complete_hinfo(postseq); 
		completeDTO ainfo = dao.agency_info(postseq);
		ArrayList<MyregDTO> himages = dao.getimage(postseq);
		
		//영현 - 문의 번호 가져오기
		String hconseq = dao.getContactSeq(postseq, seq); 
		
		//영현 - 서류 번호 가져오기
		String docseq = dao.getDocumentSeq(hinfo.getStype());
		dao.close();
		
		req.setAttribute("himages", himages);
		req.setAttribute("hinfo", hinfo);
		req.setAttribute("ainfo", ainfo);
		req.setAttribute("hconseq", hconseq);
		req.setAttribute("docseq", docseq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/complete.jsp");
		dispatcher.forward(req, resp);
	}
}
