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

import com.test.house.HouseDAO;
import com.test.house.HouseSearchDTO;
import com.test.member.MemberDAO;
import com.test.member.MemberDTO;

@WebServlet("/company/memberadvice.do")
public class MemberAdvice extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		//세션에 저장된 정보 (회원or업체 seq,mc)
		String seq = (String) session.getAttribute("seq");
		String mc = (String) session.getAttribute("mc");
		
		System.out.println(seq);
		
		//상품번호
		String pseq = req.getParameter("pseq");
		String roomseq = req.getParameter("roomCheck");
		
		//DB
		CompanyDAO dao = new CompanyDAO();
		//상품정보
		ProductDTO pdto = dao.productOneInfo(pseq);
		//방정보
		HouseDAO hdao = new HouseDAO(); 
		HouseSearchDTO hsdto = hdao.getHouseInfo(roomseq);
		
		//회원 정보
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMemberInfo(seq);
		
		
		req.setAttribute("hsdto", hsdto);
		req.setAttribute("pdto", pdto);
		req.setAttribute("mdto", mdto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/company/memberadvice.jsp");
		dispatcher.forward(req, resp);

	}
}
