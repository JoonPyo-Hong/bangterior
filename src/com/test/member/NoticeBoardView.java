package com.test.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

@WebServlet("/member/noticeboardview.do")
public class NoticeBoardView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		HttpSession session = req.getSession();
		
		//1. view.do?seq=1
		String seq = req.getParameter("seq");
		String search = req.getParameter("search");
		String searchfield = req.getParameter("searchfield");

		
		//2. DB
		MemberDAO dao = new MemberDAO();
		
		
		//2.3 조회수 증가
		if (session.getAttribute("read") == null || (boolean)session.getAttribute("read") == false) {
			dao.updateReadcount(seq);
			session.setAttribute("read", true);
		}
		
		
		NoticeBoardDTO dto2 = new NoticeBoardDTO();
		dto2.setSeq(seq);
		
		NoticeBoardDTO dto = dao.noticeget(dto2);
		
		
		
		
		//2.5 데이터 가공
		 String content = dto.getContent(); 
		 content = content.replace("\\r\\n", "<br>");  
		 dto.setContent(content);
		
		
		
		//3. DAO에게 반환 DTO 출력
		req.setAttribute("dto", dto);
		req.setAttribute("search", search);
		req.setAttribute("searchfield", searchfield);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/noticeboardview.jsp");
		dispatcher.forward(req, resp);

	}

}
