package com.test.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/doclease.do")
public class DocLease extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();
		String seq = (String)session.getAttribute("seq"); //고객의 번호
//		String seq = "53";
		
		String docseq = req.getParameter("docseq"); //서류 번호 받기
		String hconseq = req.getParameter("hconseq"); //서류 번호 받기
		String address = req.getParameter("address").replaceAll(" ", "#"); //주소
		String area = req.getParameter("area"); //면적
		String cost = req.getParameter("cost"); //가격
		String agaddress = req.getParameter("agaddress").replaceAll(" ", "#"); //사무소 주소
		String atel = req.getParameter("atel").replaceAll("-", "#"); //사무소 전화번호
		String aoffice = req.getParameter("aoffice"); //사무소 이름
		String aname = req.getParameter("aname"); //사무소 주인장 이름
		
		MemberDAO dao = new MemberDAO();
		MemberDocInfoDTO dto = new MemberDocInfoDTO();
		dto = dao.GetmemberDocInfo(seq);
		
		req.setAttribute("seq", seq);
		req.setAttribute("docseq", docseq);
		req.setAttribute("hconseq", hconseq);
		req.setAttribute("address", address);
		req.setAttribute("area", area);
		req.setAttribute("cost", cost);
		req.setAttribute("agaddress", agaddress);
		req.setAttribute("atel", atel);
		req.setAttribute("aoffice", aoffice);
		req.setAttribute("aname", aname);
		req.setAttribute("maddress", dto.getAddress());
		req.setAttribute("mname", dto.getName());
		req.setAttribute("mtel", dto.getTel());
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/doclease.jsp");
		dispatcher.forward(req, resp);

	
	
	}

}
