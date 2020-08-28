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



@WebServlet("/house/HouseMap.do")
public class HouseMap extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		
		HouseDAO dao = new HouseDAO();
		ArrayList<HouseSearchDTO> maplist = dao.HouseMap();
		
		JSONArray arr = new JSONArray();
		
		for (HouseSearchDTO dto : maplist) {
			String a= "new kakao.maps.LatLng(";
			a+=dto.getLat();
			a+= ",";
			a+=dto.getLng();
			a+= ")";
			JSONObject obj = new JSONObject();
			int b = 0;
			/* b +="'"; */
			/* b += dto.getSubject().replace("\"", ""); */
			b +=dto.getSeq();
			/* b +="'"; */
			obj.put("title", b);
			obj.put("lat", dto.getLat());
			obj.put("lng", dto.getLng());
			arr.add(obj);
		}
		
		/* System.out.println(arr); */
		//3.
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("application/json");
				
				PrintWriter writer = resp.getWriter();		
				writer.print(arr);
				writer.close();
		
	}
}
