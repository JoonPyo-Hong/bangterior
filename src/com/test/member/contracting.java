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

@WebServlet("/member/contracting.do")
public class contracting extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		//데이터 가져오기 (로그인 한 회원 번호)
				HttpSession session = req.getSession();
				String seq = req.getParameter("seq");		//회원번호
				String postseq = req.getParameter("postseq");//게시물번호
				String conseq = req.getParameter("conseq");	//문의번호
//				System.out.println(postseq);
				
//				System.out.prinCtln("아이"+seq);
				//DB
				MemberDAO dao = new MemberDAO();
				completeDTO hinfo = dao.complete_hinfo(postseq); 
				completeDTO ainfo = dao.agency_info(postseq);
				ArrayList<MyregDTO> himages = dao.getimage(postseq);
				ArrayList<completeDTO> hoptions = dao.gethoption(postseq);
				
				dao.close();
				req.setAttribute("seq", seq);
				req.setAttribute("postseq", postseq);
				req.setAttribute("conseq", conseq);
				req.setAttribute("himages", himages);
				req.setAttribute("hinfo", hinfo);
				req.setAttribute("ainfo", ainfo);
				req.setAttribute("hoptions", hoptions);
			
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/contracting.jsp");

		dispatcher.forward(req, resp);
	}
}
