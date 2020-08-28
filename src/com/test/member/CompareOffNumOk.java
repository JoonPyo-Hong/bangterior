package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author 김영현
 * 개설번호와 비교
 *
 */

@WebServlet("/member/compareoffnumok.do")
public class CompareOffNumOk extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String inputnum = req.getParameter("inputnum");
		
		MemberDAO dao = new MemberDAO();
		
		String result = dao.compareOffNum(inputnum);
		
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();

		writer.print("{");
		writer.printf("\"count\": \"%s\"", result); //{"count": 1 or 0}
		writer.print("}");
		writer.close();
		
	}//dopost
	
	
}
