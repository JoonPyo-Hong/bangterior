package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/member/mypageOk.do")
public class mypageOk extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		String memseq = req.getParameter("memseq");
		String name = req.getParameter("name");
		String pw = req.getParameter("pw");
		String tel = req.getParameter("tel");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		String marsta = req.getParameter("marsta");
		int result =0;

			//DB 작업 -> 위임
			// -DB 작업  객체 -> XXDAO
			// -Data Access Object
			MemberDAO dao = new MemberDAO();
			MypageDTO dto = new MypageDTO();
			
//			dto.setFilename(filename.equals("null")?"nonpic.png":filename);
			dto.setEmail(email);
			dto.setName(name);
			dto.setTel(tel);
			dto.setAddress(address);
			dto.setPw(pw);
			dto.setMarsta(marsta);
			dto.setMemseq(memseq);
			
			
			//dao.add(id,name,email,pw,pic);
			System.out.println(dto.getEmail());
			System.out.println(dto.getName());
			System.out.println(dto.getTel());
			System.out.println(dto.getAddress());
			System.out.println(dto.getPw());
			System.out.println(dto.getMarsta());
			System.out.println(dto.getMemseq());
			
			result = dao.mypageEdit(dto);

		if(result ==1) {
			//회원 정보 수정 성공
			resp.sendRedirect("../member/mypage.do?seq="+dto.getMemseq());
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
		//JSP 작업 위임(X) -> Servlet 직접
	}
}

