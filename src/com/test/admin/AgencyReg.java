package com.test.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/agencyreg.do")
public class AgencyReg extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		// if null 초기값 처리
		// 검색 받기
		String search = req.getParameter("search");
		if (search == null) {
			search = "";
		}
		// 오른쪽 위 select 박스
		String sort = req.getParameter("sort");
		if (sort == null) {
			sort = "3";
		}

		// 왼쪽 밑 selcect 박스
		String sel = req.getParameter("sel");
		if (sel == null) {
			sel = "0";
		}

		// DB연결 where에 쓰일 값 처리
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("sort", sort);
		map.put("sel", sel);

		// 페이징

		// 페이징 처리 관련 변수
		int nowPage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 10; // 한페이지 당 출력 갯수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // rnum 시작 번호
		int end = 0; // rnum 끝 번호
		int n = 0; // 페이지바 관련 변수
		int loop = 0; // 페이지바 관련 변수
		int blockSize = 5; // 페이지바 관련 변수

		String page = req.getParameter("page");

		if (page == null || page == "")
			nowPage = 1; // default
		else
			nowPage = Integer.parseInt(page); //

		// nowPage -> 보려는 페이지 번호!!
		// 1page -> where rnum >= 1 and rnum <= 10
		// 2page -> where rnum >= 11 and rnum <= 20
		// 3page -> where rnum >= 21 and rnum <= 30
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		map.put("begin", begin + "");
		map.put("end", end + "");

		AdminDAO dao = new AdminDAO();

		totalCount = dao.getTotalCountJon(map);
		
		totalPage = (int) Math.ceil((double) totalCount / pageSize);

		ArrayList<BoardDTO> list = dao.list(map);
		
		// 페이지바 제작
		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;
		String pagebar = "";

		// 페이징 시작 태그
		pagebar += "<div id=\"paging\">";

		// 이전 5페이지
		if (n == 1) {
			// 현재 페이지가 첫페이지 일때
			pagebar += "<div class=\"left_btn btn\">";
			pagebar += "이전";
			pagebar += "</div>";
			pagebar += "<ul>";
		} else {
			pagebar += String.format("<a href=\"/bangterior/admin/agencyreg.do?page=%d&sel=%s&sort=%s&search=%s\">", n - 1,sel,sort,search);
			pagebar += "<div class=\"left_btn btn\">";
			pagebar += "이전";
			pagebar += "</div>";
			pagebar += "</a>";
			pagebar += "<ul>";
		}

		// 페이징 숫자 버튼
		for (int i = 1; i <= totalPage; i++) { // 40바퀴

			// 5페이지 보다 크면 출력하지 않음 ( 5번 실행 )
			while (!(loop > blockSize || n > totalPage)) {

				if (n == nowPage) {
					// 현재 보고 있는 페이지
					pagebar += "<ul >";
					pagebar += "<li class=\"view_page\">";
					pagebar += String.format("<a href=\"#!\"><span id =\"color\">%d</span></a>", n);
					pagebar += "</li>";
					pagebar += "</ul>";
				} else {
					pagebar += "<ul>";
					pagebar += "<li>";
					pagebar += String.format("<a href=\"/bangterior/admin/agencyreg.do?page=%d&sel=%s&sort=%s&search=%s\">%d</a>", n,sel,sort,search, n);
					pagebar += "</li>";
					pagebar += "</ul>";
				}
				loop++;
				n++;
			}
		}

		// 다음 페이지
		if (n > totalPage) {
			// 현재 페이지가 마지막 페이지 일때 이동 불가
			pagebar += "<div class=\"right_btn btn\">";
			pagebar += "다음";
			pagebar += "</div>";
		} else {
			pagebar += String.format("<a href=\"/bangterior/admin/agencyreg.do?page=%d&sel=%s&sort=%s&search=%s\">", n,sel,sort,search);
			pagebar += "<div class=\"right_btn btn\">";
			pagebar += "다음";
			pagebar += "</div>";
			pagebar += "</a>";
		}

		// 페이징 끝 태그
		pagebar += "</div>";
		// 페이징 끝
		req.setAttribute("list", list);
		req.setAttribute("search", search);
		req.setAttribute("sort", sort);
		req.setAttribute("sel", sel);
		req.setAttribute("page", page);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);

		req.setAttribute("pagebar", pagebar);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/agencyreg.jsp");
		dispatcher.forward(req, resp);
	}

}
