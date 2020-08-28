<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<link rel="stylesheet" href="/bangterior/css/company_index.css">
</head>
<body>
	<!-- 전체 -->
	<div id="wrap">

		<!-- header -->
		<%@include file="/WEB-INF/views/inc/member/header.jsp"%>



		<!-- container -->
		<div id="container">

			<div id="top"></div>
			<div id="left">
				<div id="company">
					<div id="company_name">

						<img src="/bangterior/pic/${dto.pic}">
						<p>${dto.name}인테리어</p>
						<p>${dto.address}</p>
					</div>
					<div id="company_info">
						<table>
							<tr>
								<td>대표자</td>
								<td>${dto.ceoname}</td>
							</tr>
							<tr>
								<td>경력</td>
								<td>${dto.career} 년</td>
							</tr>
							<tr>
								<td>시공지역</td>
								<td><c:forEach items="${reglist}" var="reg">
                                ${reg.regname}&nbsp;&nbsp; 
                                </c:forEach></td>
							</tr>

							<tr>
								<td>시공범위</td>

								<td><c:forEach items="${serlist}" var="ser">
                                ${ser.sername}&nbsp;&nbsp; 
                                </c:forEach></td>

							</tr>
						</table>
					</div>
					<div id="company_details">
						<p>업체소개</p>
						<p><pre>${dto.intro}</pre></p>
					</div>
				</div>
			</div>
			<div id="right">
				<div id="buttons">
					<!-- 자신의 업체일 경우에만 뜨게 설정-->
					
					<c:if test="${mc eq 1 and dto.seq eq seq}">
						
					<div id="esti_button" class="button"
						onclick="location.href='/bangterior/counseling.do?seq=${dto.seq}'">
						<%-- 클릭시 상담관리 페이지로 이동 --%>
                     
						상담 관리
					</div>

					<div id="add_button" class="button"
						onclick="location.href='/bangterior/company/addproduct.do'">상품 등록하기
					</div>
					</c:if>
					
					
					<!-- 회원이거나, 비회원인 경우 -->
					<c:if test="${empty seq or mc eq 0}">
					<div id="esti_button" class="button"
						onclick="location.href='/bangterior/counseling.do'">
						<%-- 클릭시 상담관리 페이지로 이동
                    onclick="location.href='/bangterior/counseling.do?seq=${dto.seq}'"> --%>
						상담 신청하기
					</div>

					</c:if>
				</div>
				<div id="portfolio">
					<p>시공 인테리어</p>
					<div id="portfolio_img">
						<c:forEach items="${plist}" var="plist">
							<div class="pfimg" onclick="location.href='/bangterior/company/productview.do?seq=${plist.seq}'">
								<img src='/bangterior/pic/${plist.mainimg}'>
							</div>
						</c:forEach>
					</div>

				</div>
			</div>
			<div>
			</div>
		</div>
			<div style="clear: both;"></div>

		<!-- footer -->
		<%@include file="/WEB-INF/views/inc/member/footer.jsp"%>
	</div>

		<script>
			
		</script>
</body>
</html>