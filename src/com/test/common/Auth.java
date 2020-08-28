package com.test.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.company.CompanyDAO;
import com.test.company.CompanyDTO;
import com.test.member.MemberDAO;
import com.test.member.MemberDTO;


@WebServlet("/common/auth.do")
public class Auth extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//로그인 이후 인증
		
		// 1. 입력 데이터 가져오기
		
		String cb1 = req.getParameter("cb");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		// 2.DB 처리하기
		System.out.println(cb1);
		System.out.println(id);
		System.out.println(pw);
		
		int companyResult=0;
		int memberResult=0;
		
		if(cb1 != null && cb1.equals("on")) {
			CompanyDAO dao = new CompanyDAO();
			CompanyDTO dto = new CompanyDTO();
			dto.setId(id);
			dto.setPw(pw);
			
			companyResult = dao.companyLogin(dto);
			HttpSession session = req.getSession();
			
			if(companyResult==1) {
				String seq = dao.getCompanySeq(dto.getId());	
				dao.close();
				session.setAttribute("seq", seq);
				// 업체
				session.setAttribute("mc", "1");
				
				PrintWriter writer = resp.getWriter();
				writer.print("1");
				writer.close();	
			} else {
				PrintWriter writer = resp.getWriter();
				writer.print("0");
				writer.close();
			}
			


			// 업체회원 체크하지 않은 일반 회원일 경우
		} else {
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPw(pw);
			
			memberResult = dao.memberLogin(dto);
			HttpSession session = req.getSession();
			if(memberResult==1) {
			
				String seq = dao.getMemberSeq(dto.getId());	
				dao.close();
				session.setAttribute("seq", seq);
				// 회원
				session.setAttribute("mc", "0");
				//현재 페이지에 가만히 있어야하는데,,,ㅠ
				PrintWriter writer = resp.getWriter();
				writer.print("1");
				writer.close();
				
			} else {
				PrintWriter writer = resp.getWriter();
				writer.print("0");
				writer.close();
			}
			
		

		}
		

		
	}
}
