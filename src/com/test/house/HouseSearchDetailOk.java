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

@WebServlet("/house/HouseSearchDetailOk.do")
public class HouseSearchDetailOk extends HttpServlet {
	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String seq = req.getParameter("seq");
		
		HouseDAO dao = new HouseDAO();
		HashMap<String, String> map = new HashMap<String, String>();
		Random rnd = new Random();
		
		map.put("seq", seq);

		ArrayList<String> list = dao.HouseDetail(map);
		dao.close();

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");

		PrintWriter writer = resp.getWriter();
		/* System.out.println(list); */

		JSONArray arr = new JSONArray();
		JSONObject obj = new JSONObject();
		
		obj.put("seq", list.get(0));
		String a = list.get(1).replace("\"", "");
		obj.put("subject",a);
		obj.put("cost",list.get(2));
		obj.put("depcost",list.get(3));
		obj.put("maincost",list.get(4));
		obj.put("area",list.get(5));
		obj.put("floor",list.get(6));
		obj.put("address",list.get(7));
		obj.put("type",list.get(8));
		String b = list.get(9).replace("\"", "");
		obj.put("detailsubject",b);
		String c = list.get(10).replace("\"", "");
		obj.put("detailcontent",c);
		obj.put("lng",list.get(11));
		obj.put("lat",list.get(12));
		obj.put("totalfloor",list.get(13));
		obj.put("tel",list.get(14));
		obj.put("seqname",list.get(15));
		obj.put("typeseq",list.get(16));
		obj.put("filename1",list.get(17));
		obj.put("filename2",list.get(18));
		obj.put("filename3",list.get(19));
		obj.put("filename4",list.get(20));
		obj.put("filename5",list.get(21));
		obj.put("filename6",list.get(22));
		obj.put("filename7",list.get(23));
		obj.put("filename8",list.get(24));
		double d =  Double.valueOf(list.get(5));
		d += 3;
		String d1 = "";
		d1 += d;
		obj.put("area2", d1);
		String[] nanbang = {"개별 난방","중앙 난방","지역 난방"};
		String nanbangrnd = nanbang[rnd.nextInt(3)];
		obj.put("nanbang",nanbangrnd);
		String[] el = {"있음","없음"};
		String elrnd = el[rnd.nextInt(2)];
		obj.put("el",elrnd);
		String[] day = {"즉시입주","협의가능"};
		String dayrnd = day[rnd.nextInt(2)];
		obj.put("day",dayrnd);
		arr.add(obj);
		writer.print(arr);
		writer.close();
	
		
	}
}
