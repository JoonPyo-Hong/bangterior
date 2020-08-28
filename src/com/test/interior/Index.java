package com.test.interior;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.company.ProductDTO;

@WebServlet("/interior/index.do")	
public class Index extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		InteriorDAO idao = new InteriorDAO();
		ArrayList<ProductDTO> pdto = idao.bestProductByService();
		req.setAttribute("pdto", pdto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF\\views\\interior/index.jsp");
		dispatcher.forward(req, resp);
	}

}
