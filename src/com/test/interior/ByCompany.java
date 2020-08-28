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
@WebServlet("/interior/bycompany.do")
public class ByCompany extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		InteriorDAO idao = new InteriorDAO();
		CompanyDAO cdao = new CompanyDAO();

		// 전체 지역 전달
		ArrayList<RegionDTO> reglist = idao.region();

		// 전체 서비스 전달
		ArrayList<ServiceDTO> serlist = idao.service();

		// 업체 리스트 전달
		CompanyDTO cdto = new CompanyDTO();
		
	
		ArrayList<CompanyDTO> comlist = idao.allCompanyInfo();

		
		req.setAttribute("reglist", reglist);
		req.setAttribute("serlist", serlist);
		req.setAttribute("comlist", comlist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/interior/bycompany.jsp");
		dispatcher.forward(req, resp);
	}
}
