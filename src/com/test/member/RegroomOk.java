package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/member/regroomok.do")
public class RegroomOk extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
				//로그인한 사람 seq가져오기
				HttpSession session = req.getSession();
				String seq = (String) session.getAttribute("seq");
				//String seq = "301";	
				
				
				//객체 값 받아오기
				String path = req.getRealPath("/pic").replace("\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\bangterior","\\bangterior\\WebContent");; // 경로
				
				//사이즈
				int size = 1024 * 1024 * 100; //100MB
				
				req.setCharacterEncoding("UTF-8");
				HashMap<String, String> infomap = new HashMap<String, String>();
				HashMap<String, String> basicmap = new HashMap<String, String>();
				HashMap<String, String[]> optmap = new HashMap<String, String[]>();
				HashMap<String, String> postmap = new HashMap<String, String>();
				HashMap<String, String> imgmap = new HashMap<String, String>();

				
				//고도용 랜덤
				Random rnd = new Random();
				
				MemberDAO dao = new  MemberDAO();
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
					

					
					//tbl_house_info
					//데이터 넣어주기
					String[] addressroot = multi.getParameter("jibeon").split(" ");
					infomap.put("comdate", multi.getParameter("comdate")); //완공일
					infomap.put("address", addressroot[0] + " " + addressroot[1] + " " + addressroot[2]); //주소
					infomap.put("lat", multi.getParameter("lat")); //위도
					infomap.put("lng", multi.getParameter("lng")); //경도
					infomap.put("alt", rnd.nextInt(9) + ""); //고도
					infomap.put("area", multi.getParameter("area")); //면적
					infomap.put("floor", multi.getParameter("floor")); //해당 층
					infomap.put("totalfloor", multi.getParameter("wholefloor")); //전체 층
					
					//확인용
					//System.out.println(infomap.toString());
					
					//tbl_house_basic
					//데이터 넣어주기
					basicmap.put("htype", multi.getParameter("htype")); //매물 종류 번호
					basicmap.put("stype", multi.getParameter("stype")); //매물 거래 번호
					
					//tbl_house_option
					//데이터 넣어주기
					optmap.put("op", multi.getParameterValues("cb")); //옵션 번호들 
					//System.out.println(optmap.get("op"));
					
					//tbl_house_post
					//데이터 넣어주기
					postmap.put("memseq", seq);
					postmap.put("subject", multi.getParameter("inputtitle"));
					postmap.put("cost", multi.getParameter("cost"));
					postmap.put("depcost", multi.getParameter("depcost"));
					postmap.put("maincost", multi.getParameter("manmoney"));
					postmap.put("detailsubject", multi.getParameter("detailtitle"));
					postmap.put("detailcontent", multi.getParameter("detailcontent"));
					postmap.put("state", 0 + "");
					//확인용
					//System.out.println(postmap.toString());
					
					//tbl_post_image
					//데이터 넣어주기
					imgmap.put("main", multi.getFilesystemName("main"));
					imgmap.put("detail1", multi.getFilesystemName("detail1"));
					imgmap.put("detail2", multi.getFilesystemName("detail2"));
					imgmap.put("detail3", multi.getFilesystemName("detail3"));
					imgmap.put("detail4", multi.getFilesystemName("detail4"));
					imgmap.put("surround", multi.getFilesystemName("surround"));
					imgmap.put("floorimg", multi.getFilesystemName("floorimg"));
					//System.out.println(imgmap.toString());
					
					
					                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
				
				} catch (Exception e) {
				
					e.printStackTrace();
				
				}
				
				//tbl_house_info 에 정보 넣기
				ResultDTO dto = dao.insertInfo(infomap);
				String hinfoseq = dto.getSeq();
				int result = Integer.parseInt(dto.getResult());
				
				//tbl_house_basic 에 정보 넣기
				basicmap.put("hinfoseq", hinfoseq); //houseinfo seq
				dto = dao.insertBasic(basicmap);
				
				String hbasseq = dto.getSeq(); //housebasic seq
				result += Integer.parseInt(dto.getResult());
				
				//tbl_house_post 에 정보 넣기
				postmap.put("hbasseq", hbasseq);
				dto = dao.insertPost(postmap);
				String pseq = dto.getSeq();
				result += Integer.parseInt(dto.getResult());

				
				
				//tbl_house_option 에 정보 넣기
				dto = dao.insertOption(optmap, hbasseq);
				result += Integer.parseInt(dto.getResult());
				
				//tbl_post_image 에 정보 넣기
				imgmap.put("pseq", pseq);
				dto = dao.insertImage(imgmap);
				result += Integer.parseInt(dto.getResult());

				
				resp.setContentType("application/json");
				
				PrintWriter writer = resp.getWriter();

				
				  writer.print("{"); 
				  writer.printf("\"count\": \"%d\"", result); //{"count": 1or 0 or 5}
				  writer.print("}"); 
				  writer.close();
				 
		
		
	
	
	}
	
}
