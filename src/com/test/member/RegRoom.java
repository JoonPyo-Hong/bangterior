package com.test.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/regroom.do")
public class RegRoom extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		
		//옵션 저장
		ArrayList<SaleTypeDTO> slist = 	dao.getSaleType();

		//집 종류 저장
		ArrayList<HouseTypeDTO> hlist = dao.getHouseType();
		
		//옵션 저장
		ArrayList<OptionTypeDTO> olist = dao.getOptionType();

		req.setAttribute("slist", slist);
		req.setAttribute("hlist", hlist);
		req.setAttribute("olist", olist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/regroom.jsp");
		dispatcher.forward(req, resp);

	}
}
