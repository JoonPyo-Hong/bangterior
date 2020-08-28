package com.test.house;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/house/HouseGraph.do")
public class HouseGraph extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String typeseq = req.getParameter("typeseq");
		String graphadress = req.getParameter("graphadress");
		
		HouseDAO dao = new HouseDAO();
		HashMap<String, String> map = new HashMap<String, String>();
		
		
		map.put("typeseq", typeseq);
		map.put("graphadress", graphadress);
		HashMap<Integer, String> list2 = dao.graph(map);
		
		dao.close();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");

		PrintWriter writer = resp.getWriter();
		

		JSONArray arr = new JSONArray();
		for(int i=1; i<=8; i++) {
			JSONObject obj = new JSONObject();
			/* obj.put("name","" + i +""); */
			obj.put("data",list2.get(i));
			arr.add(obj);
		}
		
		writer.print(arr);
		writer.close();
	}
}
