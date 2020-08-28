package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/conpleteok.do")
public class conpleteok extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		String postseq = req.getParameter("postseq");
		
		MemberDAO dao = new MemberDAO();
		int result = dao.conplete(seq,postseq);
		dao.close();
		
		req.setAttribute("result", result);
		
		if(result ==1) {
			//승인 성공
			System.out.println(seq+","+postseq);
			System.out.println("성공");
			resp.sendRedirect("../member/contractinglist.do");
		}
		else {
			//승인 실패!
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		
		}
		
		
	}
}
