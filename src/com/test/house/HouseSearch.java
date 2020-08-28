package com.test.house;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//매물 페이지
@WebServlet("/house/HouseSearch.do")
public class HouseSearch extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
			
		HttpSession session = req.getSession();
		
		//테스트용 나중에 지울것
		/* session.setAttribute("seq", "1"); */
		/* session.invalidate(); */
		
		
		// 세션 받기
		String seq = (String) session.getAttribute("seq");
		// 세션 null값일때 처리
		/* System.out.println("1 = " + seq); */
		if (seq == null) {
			seq = "0";
		}
		/* System.out.println("2 =" + seq); */

		String searchtext = req.getParameter("searchtext");
		if (searchtext == null) {
			searchtext = "";
		}

		HashMap<String, String> map = new HashMap<String, String>();

		HouseDAO dao = new HouseDAO();

		map.put("begin", "1");
		map.put("end", "12");
		map.put("searchtext", searchtext);
		ArrayList<HouseSearchDTO> list = dao.HouseSearchlist(map);

		int totalnum = dao.getHouseTotalCount(map);
		
		
		//hot매물에 쓰일 하트 처리
		int hot1 = dao.hotheart(seq,10);
		int hot2 = dao.hotheart(seq,15);
		int hot3 = dao.hotheart(seq,78);
		int hot4 = dao.hotheart(seq,143);
		
		
		
		req.setAttribute("map", map);
		req.setAttribute("list", list);
		//하트 구현 및 로그인에 필요한것
		req.setAttribute("hot1", hot1);
		req.setAttribute("hot2", hot2);
		req.setAttribute("hot3", hot3);
		req.setAttribute("hot4", hot4);
		req.setAttribute("memseq", seq);
		req.setAttribute("totalnum", totalnum);
		req.setAttribute("searchtext", searchtext);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/house/HouseSearch.jsp");
		dispatcher.forward(req, resp);

	}
}
