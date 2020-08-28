package com.test.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/auth.do")
public class Auth extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 로그인 이후 인증

		// 1. 입력 데이터 가져오기

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");

		// 2.DB 처리하기
		System.out.println(id);
		System.out.println(pw);

		resp.setContentType("application/json");

		AdminDAO adao = new AdminDAO();
		AdminDTO adto = new AdminDTO();

		adto.setId(id);
		adto.setPw(pw);

		HttpSession session = req.getSession();
				
		int loginResult = adao.adminLogin(adto);
		
		if(loginResult==1) 
			session.setAttribute("id", id);
		
		System.out.println(loginResult);
		
		PrintWriter writer = resp.getWriter();
		writer.print(loginResult);
		writer.close();

	}
}
