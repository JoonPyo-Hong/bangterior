package com.test.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/reghousemenu.do")
public class RegHouseMenu extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//session 에서 seq값 불러오기
		HttpSession session = req.getSession();
		MemberDAO dao = new MemberDAO();
		
		//seq 저장
		String seq = (String)session.getAttribute("seq");
		//String seq = "301"; //임시 seq
		
		//업체 or 회원
		String mc = (String)session.getAttribute("mc");
		//String mc = "0";
//		if(!seq.equals("")) {
		//등본 등록 x or 자격증 등록 x 일시
		String doccnt = dao.getDocCount(seq); //갯수
		
		//등본 등록되엉있는지 여부 카운트
		String copycnt = dao.getCopyCount(seq);
		
		//자격증 등록되어있는지 여부 카운트
		String agencycnt = dao.getAgencyCount(seq);
		
		
		//데이터 넘기기
		req.setAttribute("doccnt", doccnt);
		req.setAttribute("copycnt", copycnt);
		req.setAttribute("agencycnt", agencycnt);
		
		
		
		
		
		

		//데이터 넘기기 (회원 아이디 , 업체 여부)
		req.setAttribute("seq", seq);
		req.setAttribute("mc", mc);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/reghousemenu.jsp");
		dispatcher.forward(req, resp);
		

	}
}
