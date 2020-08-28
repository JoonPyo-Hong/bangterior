package com.test.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/recommendthemelist.do")
public class RecommendThemeList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AdminDAO dao = new AdminDAO();
		ArrayList<RecommendThemeDTO> list = new ArrayList<RecommendThemeDTO>();
		
		list = dao.getRecommendList();
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/recommendthemelist.jsp");
		dispatcher.forward(req, resp);

	
	}
}
