package com.test.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/agencyregview.do")
public class AgencyRegView extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String seq = req.getParameter("seq");
		//현재 페이지에서 바로 확인할 수 있게 처리 나중에 없애도됨 
		if(seq == null) {
			seq ="1";
		}
		String confirm = req.getParameter("confirm");
		
		AdminDAO dao = new AdminDAO();
		ArrayList<String> list = new ArrayList<String>();
		list = dao.admindetail(seq);
		System.out.println(list.toString());
		
		
		req.setAttribute("confirm", confirm);
		req.setAttribute("list", list);
		req.setAttribute("seq", seq);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/agencyregview.jsp");
		dispatcher.forward(req, resp);
	}
}
