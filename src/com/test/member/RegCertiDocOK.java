package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 *김영현
 *
 *매물 등록 완료시 넘어오는 서블릿
 */

//등록하기 버튼을 누를시 
@WebServlet("/member/regcertidocok.do")
public class RegCertiDocOK extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8"); //인코딩
		
		//로그인한 사람 seq가져오기
		HttpSession session = req.getSession();
		String seq = (String) session.getAttribute("seq");
		//String seq = "301";	//임시 seq
		
		
		//객체 값 받아오기
		String path = req.getRealPath("/file").replace("\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\bangterior","\\bangterior\\WebContent");; // 경로
		//System.out.println(path);
		
		//사이즈
		int size = 1024 * 1024 * 100; //100MB
		
		req.setCharacterEncoding("UTF-8");
		HashMap<String, String> map = new HashMap<String, String>();

		String filename = "";
		String orgfilename = "";
		
		try {
			
			//기존의 request 를 대신할 객체
			//cos.jar
			//MultipartRequest 객체를 만드는 순간 파일업로드도 같이 진행된다.
			MultipartRequest multi = new MultipartRequest(
					req, //기존의 request 객체
					path, //업로드 폴더
					size, //업로드 크기
					"UTF-8", //인코딩
					new DefaultFileRenamePolicy() //중복파일이 있을 경우 자동으로 넘버링 해주는 객체
					);

			//데이터 넣어주기
			String uploadfile = multi.getParameter("uploadfile");
			map.put("uploadfile", uploadfile.substring(uploadfile.lastIndexOf("\\") +1));
			map.put("inputnum", multi.getParameter("inputnum"));
			map.put("inputname", multi.getParameter("inputname"));
			map.put("address", multi.getParameter("address") + " " +  multi.getParameter("extraaddress"));
			map.put("call", multi.getParameter("call"));

		
			
			
			//첨부파일명
			filename = multi.getFilesystemName("file"); //<input type="file" name="attach">
			//System.out.println(filename);
			
			orgfilename= multi.getOriginalFileName("file"); //넘버링 되지 않은 원본 파일 이름 --> 내려받기 할 때 파일 이름 원본명으로 고칠것!
			//System.out.println(orgfilename);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
		
		} catch (Exception e) {
		
			System.out.println(e);
		
		}

		
		
		
		
		
		
				
		
		map.put("seq", seq);
		
		//System.out.println(uploadfile.substring(uploadfile.lastIndexOf("\\") +1));
		//System.out.println(map.get("address"));
		
		MemberDAO dao = new  MemberDAO();
		
		int result = dao.insertAgency(map);
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();

		writer.print("{");
		writer.printf("\"count\": \"%d\"", result); //{"count": 1 or 0}
		writer.print("}");
		writer.close();
		
		
		
	
	}//dopost
}
