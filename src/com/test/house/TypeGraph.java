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

@WebServlet("/house/TypeGraph.do")
public class TypeGraph  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
	
		String graphadress = req.getParameter("graphadress");
		String num = req.getParameter("num");
		HouseDAO dao = new HouseDAO();
		
		

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("graphadress", graphadress);
		map.put("num", num);
		HashMap<Integer, String> list2 = dao.typegraph(map);
		
		dao.close();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");

		

		JSONArray arr = new JSONArray();
		for(int j=1; j<=8; j++) {
			JSONObject obj = new JSONObject();
			/* obj.put("name","" + i +""); */
			obj.put(String.format("data") ,list2.get(j));
			arr.add(obj);
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print(arr);
		writer.close();
		}
		
		
	
		
	
}
