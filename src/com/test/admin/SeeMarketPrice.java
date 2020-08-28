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

import com.test.member.MemberDAO;


@WebServlet("/admin/seemarketprice.do")
public class SeeMarketPrice extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//1. 데이터 불러오기
		req.setCharacterEncoding("UTF-8");

		String address = req.getParameter("address");
		
		
		System.out.println(address);
		String firstfilter = address.split(" ")[0]; //서울
		String secondfilter = address.split(" ")[1]; //송파구
		String thirdfilter = address.split(" ")[2]; //송파구
		
		String saletype = req.getParameter("saletype"); //매매 형태 1 or 2
		
		
		//2. 데이터 가공
		com.test.member.FilterDTO dto = new com.test.member.FilterDTO();
		
		dto.setFirstfilter(firstfilter);
		dto.setSecondfilter(secondfilter);
		dto.setThirdilter(thirdfilter);
		dto.setSaletype(saletype);
		
		MemberDAO dao = new MemberDAO();
		
		ArrayList<com.test.member.MarketDTO> list = dao.getcount(dto);
		
		
		ArrayList<com.test.member.MarketDTO> faclist = dao.ManufactList(list);
		
		/*
		 * { name: '서울시', data: [43934, 52503, 57177, 69658, 97031, 119931, 137133,
		 * 154175] }, 
		 * 
		 * { name: '송파구', data: [24916, 24064, 29742, 29851, 32490, 30282,
		 * 38121, 40434] },
		 */
		
		//254945,984137,475824,314318,361015,618646,879173,879173
		
		
		JSONArray arr = new JSONArray();
		
		for (com.test.member.MarketDTO dto2 : faclist) {
			JSONObject obj = new JSONObject();
			obj.put("name", dto2.getFilter());
			
			String[] temp = dto2.getAvg().split(",");
			
			JSONArray subarr = new JSONArray();
			for (String t : temp) {
				int tempnum = Integer.parseInt(t);
				subarr.add(tempnum);
			}
			
			
			obj.put("data", subarr);
			
			arr.add(obj);
		}
		
		System.out.println(arr);
		
		
		
		
		
		
		//3. 데이터 보내기

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.print(arr);
		writer.close();
	
	}//dopost
}
