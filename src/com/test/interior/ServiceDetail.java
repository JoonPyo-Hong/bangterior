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

@WebServlet("/interior/servicedetail.do")
public class ServiceDetail extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String serseq = req.getParameter("serseq");
		System.out.println(serseq);
		
		InteriorDAO idao = new InteriorDAO();
		// 서비스 선택
		ArrayList<ServiceDTO> slist = idao.service();
		
		// 서비스별 상품 정렬
		// 1. 새로 들어온 상품
		ArrayList<ProductDTO> plist = idao.newpro(serseq);
		// 2. 전체 상품
		
		req.setAttribute("plist", plist);
		req.setAttribute("slist", slist);
		req.setAttribute("serseq", serseq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/interior/servicedetail.jsp");
		dispatcher.forward(req, resp);
	}

}
