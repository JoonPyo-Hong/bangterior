package com.test.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/common/logout.do")
public class Logout extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
		HttpSession session = req.getSession();
		
		session.invalidate();
		
		// 현재 페이지 or 인증 해제시 완전 메인으로 이동..어떻게해????????????? 
		PrintWriter writer = resp.getWriter();
		writer.print(1);
		writer.close();
	}
	
}










