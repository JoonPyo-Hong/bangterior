package com.test.house;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/house/HeartGet.do")
public class HeartGet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		String memseq = req.getParameter("memseq");
		String get = req.getParameter("get");
		int num = 0;
		HouseDAO dao = new HouseDAO();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memseq", memseq);
		map.put("get", get);
		num = dao.heartget(map);
		
		dao.close();

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		JSONArray arr = new JSONArray();
		
			JSONObject obj = new JSONObject();
			
			obj.put("index",num);
			arr.add(obj);
	
		
		writer.print(arr);
		writer.close();
	}
}
