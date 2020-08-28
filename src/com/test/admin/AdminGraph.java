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

@WebServlet("/admin/AdminGraph.do")
public class AdminGraph extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		AdminDAO dao = new AdminDAO();
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<Integer> list2 = new ArrayList<Integer>();
		ArrayList<String> list3 = new ArrayList<String>();
		list = dao.admingraph();
		System.out.println(list.toString());
		
		
		dao.close();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");

		PrintWriter writer = resp.getWriter();
		list3.add("0");
		for(int i=0; i<list.size(); i++) {
			int a= Integer.parseInt(list.get(i));
			list2.add(a);
		}
		for(int i=0; i<list.size() -1; i++) {
			double a= (list2.get(i+1)) / Double.parseDouble(list2.get(i) + "");
			a = a * 100;
			a = Math.round(a);
			int b = 0;
			b += a;
			System.out.println(b);
			String c= "";
			c+=b;
			list3.add(c);
		}

		JSONArray arr = new JSONArray();
		for(int i=0; i<list.size(); i++) {
			JSONObject obj = new JSONObject();
			/* obj.put("name","" + i +""); */
			obj.put("list",list.get(i));
			obj.put("list2",list3.get(i));
			arr.add(obj);
		}
		System.out.println(arr);
		writer.print(arr);
		writer.close();
	}
		
	}
	

