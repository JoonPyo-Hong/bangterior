package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * 
 * @author 영현
 *	 계약 완료 매물 -> 증빙서류 -> 계약서 등록 시 파일 업로드
 */
@WebServlet("/member/uploadsalefile.do")
public class UploadSaleFile extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	

		System.out.println("넘어옴");
		
		//로그인한 사람 seq가져오기
		HttpSession session = req.getSession();
		String seq = (String) session.getAttribute("seq");
		//String seq = "153";	//임시 seq
		
		
		//객체 값 받아오기
		String path = req.getRealPath("/file").replace("\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BangteriorProject","\\BangteriorProject\\WebContent");; // 경로
		//사이즈
		int size = 1024 * 1024 * 100; //100MB
		
		req.setCharacterEncoding("UTF-8"); //인코딩
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
			map.put("hconseq", multi.getParameter("hconseq"));
			map.put("docseq", multi.getParameter("docseq"));

			
			
			//첨부파일명
			filename = multi.getFilesystemName("file"); //<input type="file" name="attach">
			//System.out.println(filename);
			
			map.put("file", filename);

			//System.out.println(orgfilename);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
		
		} catch (Exception e) {
		
e.printStackTrace();		
		}

	
		//map 객체 확인
		//System.out.println(map.toString());
		
		//DB
		MemberDAO dao = new MemberDAO();
		
		System.out.println(map.toString());
		int result = dao.insertContractDoc(map);
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();

		writer.print("{");
		writer.printf("\"count\": \"%d\"", result); //{"count": 1 or 0}
		writer.print("}");
		writer.close();
	
	
	
	}
	
	
	
	
}
