package com.test.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/admin/fakenoticelistok.do")
public class FakeNoticeListOk extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//허위 매물 신고 정보 modal창 데이터 리 
		
		String hpseq = req.getParameter("hpseq");
		System.out.println("ok서블릿 hpseq::"+hpseq);
		
		//가져올 데이터 
		//매물 번호 , 거래 유형 , 보증금 , 월세 , 관리비 , 신고내용 
		
		AdminDAO dao = new AdminDAO();
		
		ArrayList<ReportInfoDTO> list = dao.info_list(hpseq);
		
//		System.out.println("fake ok 서블릿"+list.get(0).getHbseq());
		
		dao.close();
		
		//결과 반환 > JSON 형태로 반환 
		
		//JSON 배열 객체 생성 
//		JSONArray arr = new JSONArray();

//		for(ReportInfoDTO dto : list) {
//			JSONObject obj = new JSONObject();
//			//매물 번호 , 거래 유형 , 보증금 , 월세 , 관리비 , 신고내용 
//			obj.put("hbseq", dto.getHbseq());
//			obj.put("sttype", dto.getSttype());
//			obj.put("depcost", dto.getDepcost());
//			obj.put("maincost", dto.getMaincost());
//			obj.put("reportreason", dto.getREPORTREASON());
//			
//			arr.add(obj);
//		}
		
		
		/*
		  
		  [
		  
		  	{
		  		"hbseq":"%s",
		  		"sttype":"%s",
		  		"depcost":"%s",
		  		"maincost":"%s",
		  		"reportreason":"%s"
		  		
		  		"address":"%s",
		  		"filename":"%s"
		  		"cost":"%s"
		  		"state":"%s"
		  	}
		  
		  ],
		  
		  
		 */
		
		
		
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		
		PrintWriter writer = resp.getWriter();
		
		String temp = "";
		
		temp += "[";
		
		for(ReportInfoDTO dto : list) {
			temp += "{";
			temp += String.format("\"hbseq\":\"%s\",", dto.getHbseq());
			temp += String.format("\"sttype\":\"%s\",", dto.getSttype());
			temp += String.format("\"depcost\":\"%s\",", dto.getDepcost());
			temp += String.format("\"maincost\":\"%s\",", dto.getMaincost());
			temp += String.format("\"reportreason\":\"%s\",", dto.getREPORTREASON());
			temp += String.format("\"address\":\"%s\",", dto.getAddress());
			temp += String.format("\"filename\":\"%s\",", dto.getFilename());
			temp += String.format("\"cost\":\"%s\",", dto.getCost());
			temp += String.format("\"state\":\"%s\"", dto.getState());
			temp += "}";
			temp += ",";
		}
		
		// 마지막 "," 제거
		temp = temp.substring(0, temp.length()-1);	
		
		temp += "]";
		
		System.out.println("temp::::::"+temp);
		
		writer.print(temp);
		writer.close();
		
		
	}
	
}
