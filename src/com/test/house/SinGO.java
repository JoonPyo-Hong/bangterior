package com.test.house;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/house/SinGO.do")
public class SinGO extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String memseq = req.getParameter("memseq");
		String seq = req.getParameter("seq");
		String txt = req.getParameter("txt");
		
		HouseDAO dao = new HouseDAO();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memseq", memseq);
		map.put("seq", seq);
		map.put("txt", txt);
		
		
		dao.Singo(map);
		
		dao.close();

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		JSONArray arr = new JSONArray();
		
			JSONObject obj = new JSONObject();
			
			obj.put("index","0"); 
			arr.add(obj);
	
		
		writer.print(arr);
		writer.close();
	
	}
}
