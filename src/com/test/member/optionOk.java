package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/optOk.do")
public class optionOk extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		String seq = "";
		String[] optlist = {};
		
		seq = req.getParameter("seq");
		optlist = req.getParameterValues("optcb");
		int chk = 0, cnt=0;
		for(String optseq : optlist) {
			
			System.out.println(optseq+","+seq);
			chk = dao.optchk(seq,optseq); //select
			if(chk==1) {
				System.out.println("있다");
				dao.upopt(seq,optseq); //update
				cnt++;
			}
			else {
				System.out.println("없다");
				dao.intopt(seq,optseq); //insert
				cnt++;
			}
		}
		
		if (cnt== optlist.length) {
			//옵션 저장 성공
			System.out.println("성공");
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		} else {
			//옵션 저장 실패
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
