package com.test.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/viewrecommendfin.do")
public class ViewRecommendFin extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq"); //글번호
		String search = req.getParameter("search"); //검색어
		String sort = req.getParameter("sort"); //정렬
		
		MemberDAO dao = new MemberDAO ();
		
		FinanceDTO fdto = new FinanceDTO();
		fdto.setSeq(seq);
		fdto.setSearch(search);
		fdto.setSort(sort);
		
		
		//조회수 증가 먼저
		dao.updatereadcnt_Finance(seq);
				
		
		SeeRecommendFinDTO dto = dao.viewFinList(fdto);

		
		
		req.setAttribute("dto", dto);
		req.setAttribute("search", search);
		req.setAttribute("sort", sort);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/viewrecommendfin.jsp");
		dispatcher.forward(req, resp);

	
	}
}
