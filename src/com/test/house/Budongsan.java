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

@WebServlet("/house/Budongsan.do")
public class Budongsan extends HttpServlet {

	@Override
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String seq = req.getParameter("seq");

		HouseDAO dao = new HouseDAO();
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("seq", seq);
		String memseq = dao.Memseq(map);
		map.put("memseq", memseq);
		ArrayList<String> list = dao.Budongsan(map);
		dao.close();

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		

		JSONArray arr = new JSONArray();
		JSONObject obj = new JSONObject();
		obj.put("titlename",list.get(0));
		obj.put("address",list.get(1));
		obj.put("name",list.get(2));
		obj.put("tel",list.get(3));
		obj.put("filename",list.get(4));
		arr.add(obj);
		writer.print(arr);
		writer.close();
	}
}
