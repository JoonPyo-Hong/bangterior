package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/regagreeok.do")
public class regagreeok extends HttpServlet{
	/**
	 * 김찬우
	 * 판매자가 계약완료/취소를 하는 클래스
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	String memseq = req.getParameter("memseq");
	String postseq = req.getParameter("postseq");
	String conseq = req.getParameter("conseq");
	String agree = req.getParameter("agree");
	
	System.out.println("판매자"+conseq);

	MemberDAO dao = new MemberDAO();
	int state, result;
	
	if(agree.equals("1")) {
		result = dao.myagree(conseq);
		System.out.println(result);
		if(result ==1) {
			//승인 성공
			resp.sendRedirect("../member/contracting.do?seq="+memseq+"&postseq="+postseq);
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
	else if(agree.equals("2")){
		result = dao.mydisagree(conseq);
		dao.close();
		System.out.println(result);
		if(result ==1) {
			//승인 취소 성공
			resp.sendRedirect("../member/contracting.do?seq="+memseq+"&postseq="+postseq);
		}
		else {
			//승인 취소 실패!
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
}
