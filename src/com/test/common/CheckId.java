package com.test.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.member.MemberDAO;

@WebServlet("/common/checkid.do")
public class CheckId extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		String id = (String) req.getParameter("id");
		
		MemberDAO mdao = new MemberDAO();
		
		int result =0;
		
		result +=mdao.checkId(id);
		
		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();
	}
}
