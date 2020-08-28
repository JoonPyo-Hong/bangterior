package com.test.company;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/company/addproductok.do")
public class AddProductOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String cseq = (String) session.getAttribute("seq");
		String savePath = req.getRealPath("/pic");
		System.out.println(savePath);
		int sizeLimit = 10 * 1024 * 1024;

		String thumb_file = "";
		String thumb_title = "";
		String mainimg = "";
		String pcost = "";
		String pser = "";
		String[] theme = {};
		String[] color = {};
		String detail_file = "";

		req.setCharacterEncoding("UTF-8");

		// form 데이터 가져오기
		try {

			MultipartRequest multi = new MultipartRequest(req, savePath, sizeLimit, "UTF-8",
					new DefaultFileRenamePolicy());
			thumb_file = multi.getFilesystemName("thumb_img");
			thumb_title = multi.getParameter("thumb_title");
			mainimg = multi.getParameter("mainimg");
			pcost = multi.getParameter("pcost");
			pser = multi.getParameter("psra");
			theme = multi.getParameterValues("tch");
			color = multi.getParameterValues("cch");
			detail_file = multi.getFilesystemName("detail_img");
			
			System.out.println(thumb_file);
			CompanyDAO dao = new CompanyDAO();

			// 2. map에 담기(insert하는 DB에 전달 예정)
			HashMap<String, String> pmap = new HashMap<String, String>();
			pmap.put("seq", cseq); // comseq
			pmap.put("pser", pser); // serseq
			pmap.put("pcost", pcost); // cost
			pmap.put("thumb_file", thumb_file); // mainimg
			pmap.put("detail_file", detail_file); // detailimg
			pmap.put("thumb_title", thumb_title); // subject
			System.out.println(pmap.toString());
			
			int result = dao.insertProduct(pmap);

			if (result == 1) {
				resp.sendRedirect("/bangterior/company/index.do");
			} else {
				resp.sendRedirect("/bangterior/company/productview.do");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
