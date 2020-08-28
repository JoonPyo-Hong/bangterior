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



@WebServlet("/house/HeartDel.do")
public class HeartDel extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String memseq = req.getParameter("memseq");
		String heartdel = req.getParameter("heartdel");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memseq", memseq);
		map.put("heartdel", heartdel);
		
		HouseDAO dao = new HouseDAO();
		dao.heartdel(map);
		
		PrintWriter writer = resp.getWriter();
		JSONObject obj = new JSONObject();
		JSONArray arr = new JSONArray();
		obj.put("score","d");
		arr.add(obj);
		writer.print("");
		writer.close();
		
	}
}
