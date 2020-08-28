package com.test.house;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/house/HouseCount.do")
public class HouseCount extends HttpServlet{
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.setCharacterEncoding("UTF-8");


		String sel = req.getParameter("sel");
		String searchtext = req.getParameter("searchtext");
		String sort = req.getParameter("sort");
		String sae = req.getParameter("sae");
		String area = req.getParameter("area");
		String money = req.getParameter("money");
		String f = req.getParameter("f");
		String mapseq = req.getParameter("mapseq");
		HouseDAO dao = new HouseDAO();
		HashMap<String,String> map = new HashMap<String,String>();
	
		map.put("sel", sel);
		map.put("searchtext", searchtext);
		map.put("sort", sort);
		map.put("sae", sae);
		map.put("area", area);
		map.put("money", money);
		map.put("f", f);
		map.put("mapseq", mapseq);
		int totalnum = dao.getHouseTotalCount(map);
			
		dao.close();
		
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
//		System.out.println(totalnum);
		String temp = "";
		temp += "{";
		temp += "\"totalnum\"";
		temp += ":";
		temp += "\"";
		temp += totalnum;
		temp += "\"";
		temp += "}";
		
		/* System.out.println(temp); */
		writer.print(temp);
		writer.close();
		
		}
}
