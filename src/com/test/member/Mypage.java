package com.test.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/member/mypage.do")
public class Mypage extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(사진,이름,아이디,휴대폰,email,주소,직업,결혼,원하는 옵션)
		//2. DB작업 > select
		//3. 결과 반환 > 완료 처리
		
		//1.
		HttpSession session = 	req.getSession();
//		String seq = "1";
		
		String seq = session.getAttribute("seq").toString();

		//2.
			
		MemberDAO dao = new MemberDAO();
		MypageDTO dto = dao.getInfo(seq);
		ArrayList<MypageDTO> optlist = dao.getoption(seq);
		dao.close();
		
		req.setAttribute("dto", dto);
		req.setAttribute("optlist",optlist);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp");
				dispatcher.forward(req, resp);
	
	}

}
