package com.test.admin;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.net.aso.h;

@WebServlet("/regviewok.do")
public class RegViewOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//대기중인 게시글 > 등록 or 삭제 처리
		
		String reg_btn = req.getParameter("reg_btn"); 
		String del_btn = req.getParameter("del_btn");
		
		System.out.println("reg_btn::"+reg_btn);
		System.out.println("del_btn::"+del_btn);
		
		
		//상태 업데이트 하기 위한 seq
		//승인 대기 게시물 > 승인 or 삭제 버튼 클릭시 게시물seq 넘어옴
		String hpseq_ok = req.getParameter("hpseq_ok");
		System.out.println("hpseq_ok:::"+hpseq_ok);
				
		
		//등록 , 삭제 한번에 넘어옴 
		//null값 처리
		if(reg_btn == null) {
			reg_btn = "";
		} 
		if(del_btn == null) {
			del_btn = "";
		}
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("reg_btn", reg_btn);
		map.put("del_btn", del_btn);
		map.put("hpseq_ok", hpseq_ok);
		
		
		AdminDAO dao = new AdminDAO();
		
		String result = dao.update(map);
		
		System.out.println("regviewok 서블릿 hpseq_ok::" + hpseq_ok);
		System.out.println("regviewok 서블릿 reg::" + reg_btn);
		System.out.println("regviewok 서블릿 del::" + del_btn);
		
		//update 완료후 > 매물 승인 리스트 
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/regviewok.jsp");

		dispatcher.forward(req, resp);
	}
}
