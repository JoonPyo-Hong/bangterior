<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<link rel="stylesheet" href="/bangterior/css/interior_bycompany.css">

<style>
</style>
</head>
<body>
	<!-- index.jsp (member)  -->



	<!-- 전체 -->
	<div id="wrap">

		<!-- header -->
		<%@include file="/WEB-INF/views/inc/member/header.jsp"%>

		<!-- nav -->


		<!-- container -->
		<div id="container">

			<div id="main">

				<div id="filter">

					<select id="sel1" name="sel1">
						<option value="0" selected>지역선택</option>
						<c:forEach items="${reglist}" var="reglist">
							<option value="${reglist.seq}">${reglist.name}</option>
						</c:forEach>
					</select> <select id="sel2" name="sel2">
						<option value="0" selected>시공종류</option>
						<c:forEach items="${serlist}" var="serlist">
							<option value="${serlist.seq}">${serlist.name}</option>
						</c:forEach>
					</select>


					<div id="search">
						<input type="text" id="in_txt" placeholder="검색어를 입력하세요.">
						<i class="fas fa-search" title="검색하기"></i>
						<!-- <button id="ok_btn">검색</button> -->
					</div>


					<!-- filter -->
				</div>


				<c:forEach items="${comlist}" var="comlist" begin="0" end="5">
					<div class="item1">
						<img src="/bangterior/pic/${comlist.pic}" id="img${comlist.seq}"
							class="img" style="width : 250px; height:250px">
						<div class="info">
							<a href="/bangterior/company/index.do?seq=${comlist.seq}"><div id="business_name" class="name">${comlist.name}인테리어</div></a>
							<button id="reg" class="btn">상담 신청하기</button>
							<a href="/bangterior/company/index.do?seq=${comlist.seq}"><div class="detail">${comlist.intro}</div></a> 
						</div>
						<!-- item1 -->
					</div>
				</c:forEach>





				<div id="paging">
					<div class="left_btn pbtn">이전</div>
					<ul>
						
					<c:forEach var="i" begin="1" end="${comlist.size()/5+(comlist.size()%5>0.5?1:0)}">
						<li>${i}</li>
					</c:forEach>
					</ul>
					<div class="right_btn pbtn">다음</div>
				</div>




			</div>


		</div>


		<!-- footer -->
		<%@include file="/WEB-INF/views/inc/member/footer.jsp"%>



	</div>





	<script>
		/*
		 * // 페이징 처리 관련 변수 int nowPage = 0; // 현재 페이지 번호
		 int totalCount = 0; // 총 업체 수
		 * int pageSize = 5; // 한페이지 당 출력 갯수 
		 int totalPage = 0; // 총 페이지 수 int begin =
		 * 0; // rnum 시작 번호 int end = 0; // rnum 끝 번호 int n = 0; // 페이지바 관련 변수 int loop
		 * = 0; // 페이지바 관련 변수 int blockSize = 10; // 페이지바 관련 변수
		 * 
		 * // list.do -> list.do?page=1 변경 // list.do?page=3 // String page =
		 * req.getParameter("page"); String page = 3+"";
		 * 
		 * if (page == null || page == "") nowPage = 1; // default else nowPage =
		 * Integer.parseInt(page); //
		 * 
		 * // nowPage -> 보려는 페이지 번호!! // 1page -> where rnum >= 1 and rnum <= 10 //
	 * 2page -> where rnum >= 11 and rnum <= 20 // 3page -> where rnum >= 21 and
		 * rnum <= 30 begin = ((nowPage - 1) * pageSize) + 1; end = begin + pageSize -
		 * 1; // // map.put("begin", begin + ""); // map.put("end", end + "");
		 * 
		 * // 1. // BoardDAO dao = new BoardDAO();
		 * 
		 * // 총 페이지 수 계산하기 // 총 페이지 수 = 총 게시물 수 / 한페이지당 출력 게시물 수 // ? = 175 / 10 -> 17.5
		 * -> 18 // totalCount = dao.getTotalCount(map); //
		 * System.out.println(totalCount);
		 * 
		 * totalPage = (int) Math.ceil((double) totalCount / pageSize); //
		 * System.out.println(totalPage);
		 */
		 var totalCount = ${comlist.size()}
		 $.ajax({
			 url : "/bangterior/interior/bycompanylist.do",
			 data : "p="++"&`"
		 })
	</script>
</body>
</html>