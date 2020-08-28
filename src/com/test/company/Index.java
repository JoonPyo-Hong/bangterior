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

@WebServlet("/company/index.do")
public class Index extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 로그인한 업체 seq 전달받을 세션 선언
		HttpSession session = req.getSession();

		String seq = "";
		// 전달받은 업체seq가 없다. > 로그인 통해 바로 인덱스로 전달
		
		if (req.getParameter("seq") == null) {
			seq = (String) session.getAttribute("seq");
		} else {
			seq = (String) req.getParameter("seq");
		}

		// DB > 업체 정보 가져오기..

		// DB객체
		CompanyDAO dao = new CompanyDAO();
		// Company테이블 DTO
		CompanyDTO cdto = dao.companyInfo(seq);

		// 시공가능서비스 뷰DTO
		PossibleServiceDTO psdto = new PossibleServiceDTO();

		// 시공가능 서비스 DTO 담을 배열
		ArrayList<PossibleServiceDTO> serlist = dao.possibleservice(seq);

		// 시공가능지역 뷰DTO
		PossibleRegionDTO prdto = new PossibleRegionDTO();

		// 시공가능지역 DTO 담을 배열
		ArrayList<PossibleRegionDTO> reglist = dao.possibleregion(seq);

		// Product테이블 DTO
		ArrayList<ProductDTO> plist = dao.productInfo(seq);
		dao.close();

		// 배열 전달. . . .!
		req.setAttribute("plist", plist);
		req.setAttribute("serlist", serlist);
		req.setAttribute("reglist", reglist);
		req.setAttribute("dto", cdto);
		req.setAttribute("comseq", seq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/company/index.jsp");
		dispatcher.forward(req, resp);
	}

}
