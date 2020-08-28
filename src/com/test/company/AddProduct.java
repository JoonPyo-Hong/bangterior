package com.test.company;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/company/addproduct.do")
public class AddProduct extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String cseq = (String) session.getAttribute("seq");
		
		CompanyDAO dao = new CompanyDAO();
		
		ArrayList<PossibleServiceDTO> pslist = dao.possibleservice(cseq);
		ArrayList<ThemeDTO> tlist = dao.allTheme();
		ArrayList<ColorDTO> clist = dao.allColor();
		
		req.setAttribute("pslist", pslist);
		req.setAttribute("tlist", tlist);
		req.setAttribute("clist", clist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/company/addproduct.jsp");
		dispatcher.forward(req, resp);
		
	}
}
