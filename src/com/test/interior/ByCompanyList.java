package com.test.interior;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.company.CompanyDAO;
import com.test.company.CompanyDTO;

/**
 * 시공업체별 인테리어 화면 서블릿
 */
@WebServlet("/interior/bycompanylist.do")
public class ByCompanyList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		InteriorDAO idao = new InteriorDAO();
		CompanyDAO cdao = new CompanyDAO();

		// 업체 리스트 전달
		CompanyDTO cdto = new CompanyDTO();
		
		String begin = req.getParameter("begin");
		String end = req.getParameter("end");
		ArrayList<CompanyDTO> comlistpage = idao.allCompanyPage(begin,end);

		
	
		req.setAttribute("comlist", comlistpage);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/interior/bycompany.jsp");
		dispatcher.forward(req, resp);
	}
}
