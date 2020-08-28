package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/bypageOk.do")
public class bypageOk extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	String seq = req.getParameter("seq");

	MemberDAO dao = new MemberDAO();
	int result = dao.bye("seq");
	 System.out.println(result);
	 
	 if(result ==1) {
			//회원 정보 수정 성공
			resp.sendRedirect("/member/index.do");
		}
		else {
			//회원 정보 수정 실패!
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
		
		dao.close();
	}
}
