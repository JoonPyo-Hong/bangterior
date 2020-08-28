package com.test.house;

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

@WebServlet("/house/HouseHeart.do")
public class HouseHeart extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String memseq = req.getParameter("memseq");
		
		ArrayList<String> list = new ArrayList<String>();
		HouseDAO dao = new HouseDAO();
		
		list = dao.househeart(memseq);
		dao.close();

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		JSONArray arr = new JSONArray();
		for(int i=0; i<list.size(); i++) {
			JSONObject obj = new JSONObject();
			
			obj.put("index",list.get(i));
			arr.add(obj);
		}
		
		writer.print(arr);
		writer.close();
	}
}
