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

@WebServlet("/house/HouseSearchOk.do")
public class HouseSearchOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		String begin = req.getParameter("begin");
		String end = req.getParameter("end");
		String sel = req.getParameter("sel");
		String searchtext = req.getParameter("searchtext");
		String sort = req.getParameter("sort");
		String sae = req.getParameter("sae");
		String area = req.getParameter("area");
		String money = req.getParameter("money");
		String f = req.getParameter("f");
		String mapseq = req.getParameter("mapseq");

		HouseDAO dao = new HouseDAO();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("sel", sel);
		map.put("searchtext", searchtext);
		map.put("sort", sort);
		map.put("sae", sae);
		map.put("area", area);
		map.put("money", money);
		map.put("f", f);
		map.put("mapseq", mapseq);
		
		ArrayList<HouseSearchDTO> list = dao.HouseSearchlist(map);
		dao.close();

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");

		PrintWriter writer = resp.getWriter();

		String temp = "";

		temp += "[";

		for (HouseSearchDTO dto : list) {
			temp += "{";

			String re = "";
			re = dto.getSubject().replace("\"", "");
			temp += String.format("\"seq\": \"%s\",", dto.getSeq());
			temp += String.format("\"subject\": \"%s\", ", re);
			temp += String.format("\"cost\": \"%s\",", dto.getCost());
			temp += String.format("\"depcost\": \"%s\",", dto.getDepcost());
			temp += String.format("\"maincost\": \"%s\",", dto.getMaincost());
			temp += String.format("\"filename\": \"%s\",", dto.getFilename());
			temp += String.format("\"area\": \"%s\",", dto.getArea());
			temp += String.format("\"floor\": \"%s\",", dto.getFloor());
			temp += String.format("\"type\": \"%s\"", dto.getType());

			temp += "}";
			temp += ",";
		}

		temp = temp.substring(0, temp.length() - 1);

		temp += "]";
		/* System.out.println(temp); */
		writer.print(temp);
		writer.close();

	}
}
