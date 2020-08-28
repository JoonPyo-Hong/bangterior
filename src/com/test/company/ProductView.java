package com.test.company;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/company/productview.do")
public class ProductView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 업체 번호, 상품 번호
		HttpSession session = req.getSession();

		session.getAttribute("seq");
		session.getAttribute("mc");

		// 상품 번호
		String seq = req.getParameter("seq");

		String comseq = "";

		CompanyDAO dao = new CompanyDAO();

		// 상품 정보
		ProductDTO pdto = dao.productOneInfo(seq);
		comseq = pdto.getComseq();
		
		// 업체 정보
		CompanyDTO cdto = dao.companyInfo(comseq);


		// 상품별 테마
		ArrayList<ProductThemeDTO> thelist = dao.productTheme(seq);

		// 상품별 서비스
		ArrayList<ProductDTO> pslist = dao.productService(seq);

		// 상품별 색상

		ArrayList<PossibleColorDTO> colorlist = dao.productColor(seq);
		// 리뷰
		ArrayList<ReviewDTO> revlist = new ArrayList<ReviewDTO>();
		ReviewDTO rdto = new ReviewDTO();
		revlist = dao.getReview(seq);
		
		// 리뷰 별점 카운트 
		ArrayList<ReviewDTO> starlist = dao.starCnt(seq);
		
		// 리뷰 별점 평균
		int allStar = 0;
		float starAvg =0;
		
		if (revlist.size() > 0) {
			for (ReviewDTO dto : revlist) {
				allStar += Integer.parseInt(dto.getStar());
				starAvg = allStar / revlist.size();
			}
		}
		
		
		//찜한방 전달
		ArrayList<MyHeartRoomDTO> mhrlist = dao.myheartroom((String)session.getAttribute("seq"));
		
			
		
		dao.close();

		req.setAttribute("mhrlist", mhrlist);
		req.setAttribute("staravg", starAvg);
		req.setAttribute("starlist", starlist);
		req.setAttribute("revlist", revlist);
		req.setAttribute("pseq", seq);
		req.setAttribute("pdto", pdto);
		req.setAttribute("thelist", thelist);
		req.setAttribute("pslist", pslist);
		req.setAttribute("cdto", cdto);
		req.setAttribute("colorlist", colorlist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/company/productview.jsp");
		dispatcher.forward(req, resp);
	}

}
