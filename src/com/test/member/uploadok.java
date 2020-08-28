package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/member/uploadok.do")
public class uploadok extends HttpServlet{
	String filename = "";
	String seq = "";
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		MultipartRequest multi = new MultipartRequest(req,
				  req.getRealPath("/pic"),
				  1024 * 1024 * 10,
				  "UTF-8",
				  new DefaultFileRenamePolicy()
				  );
		
		System.out.println(req.getRealPath("/pic"));
		filename = multi.getFilesystemName("filename");
		seq =multi.getParameter("seq");
	
		MemberDAO dao = new MemberDAO();
		MyregDTO dto = new MyregDTO();
		
		dto.setMemseq(seq);
		dto.setFilename(filename);
		
		System.out.println(dto.getMemseq());
		System.out.println(dto.getFilename());
		int result = dao.upfile(dto);
		dao.close();
		if(result ==1) {
			//이미지 업로드 성공
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
		}
		else {
			//이미지 업로드 실패!
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
		
		//첨부 파일 유무 확인?
//		System.out.println(multi.getFilesystemName("pic"));
	}

}
