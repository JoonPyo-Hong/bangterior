package com.test.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mappop.do")
public class MapPop extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//지도보기 팝업
		
		//게시물 번호 
		String hpseq = req.getParameter("hpseq");
		
//		System.out.println("mappop.do hpseq:: " + hpseq);
		
		AdminDAO dao = new AdminDAO();
		
		
		//DB결과 담을 어레이리스트 
		ArrayList<MapPopDTO> list = dao.mapinfo(hpseq); 
		
//		System.out.println("list Lat"+list.get(0).getLat());
//		System.out.println("list Lng"+list.get(0).getLng());
		
		
		
		
		
		
		req.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/mappop.jsp");

		dispatcher.forward(req, resp);
	}
	
}
