package com.test.admin;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/admin/AdminFileAdd.do")
public class AdminFileAdd extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		// 파일 경로 꼭 바꿔줄 것
		String path = req.getRealPath("/file").replace("\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\bangterior","\\bangterior\\WebContent");
		String subject = req.getParameter("subject");
		String thread = req.getParameter("thread");
		String typeseq= req.getParameter("typeseq");
		String counseq =req.getParameter("counseq");
		if(counseq ==null) {
			counseq ="null";
		}
		
		String seq = (String)session.getAttribute("seq");
		//테스트용
		if(seq==null) {
			seq = "1";
		}
		String admin = "admin";
		admin = admin + seq;
	
		
		
		int size = 1024* 1024 * 10;
		String file = "";
		String originalFile = "";
		try {
			MultipartRequest multi = new MultipartRequest(req,path,size,"UTF-8",new DefaultFileRenamePolicy());
			String text = multi.getParameter("text");
		
			String filename = multi.getFilesystemName("filename");
			if(filename == null) {
				filename = "null";
			}
			AdminDAO dao = new AdminDAO();
			dao.adminanswer(subject,thread,typeseq,text,admin,filename,counseq );
			
			
			Enumeration files = multi.getFileNames();
			
			String str = (String)files.nextElement();
			
			file = multi.getFilesystemName(str);
			originalFile = multi.getOriginalFileName(str);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		찬우씨 목록 리스트 페이지 값 입력할것
/*
 * RequestDispatcher dispatcher =
 * req.getRequestDispatcher("/WEB-INF/views/admin/.jsp");
 * dispatcher.forward(req, resp);
 */
	}
}
