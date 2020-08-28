<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<link rel="stylesheet" href="/bangterior/css/interior_servicedetail.css">

<style>
</style>
</head>
<body>
	<!-- index.jsp (member)  -->



	<!-- 전체 -->
	<div id="wrap">

		<!-- header -->
		<%@include file="/WEB-INF/views/inc/member/header.jsp"%>



		<!-- container -->
		<div id="container">
		
		
			<div id="main_title">${slist.get(serseq-1).name}</div>
		

			<div id="content">
				<div id="sub_title">
					<i class="fas fa-cart-plus"></i>새로 들어온 상품
				</div>

				
				<img src="../images/back_img.png" id="back_img" class="direc">

				<div id="imgs">
					<c:forEach items="${plist}" var="plist" begin="0" end="3">
					<div id="new1" class="new">
						<img src="/bangterior/pic/${plist.mainimg}" id="img1" class="new_img">
						<div id="info1" class="info">
							<div class="type">[NEW]</div>
							<div class="best_txt">${plist.subject}</div>
							<div class="price"><fmt:formatNumber value="${plist.cost}" pattern="#,###" />
								원</div>
							<!-- <i class="fas fa-star"> 4.7</i>
                            <span class="review">리뷰 334개</span> -->
						</div>
					</div>
					</c:forEach>




				</div>
				<img src="../images/next_img.png" class="direc" id="next_img">
			</div>


			<div id="content2">

				<div id="option">
					<!-- <select id="price_sel" name="가격">
                        <option value="최소">최소</option>
                        <option value="최대">최대</option>
                    </select> -->

					<button id="price_btn">가격</button>

					<select id="business_type">
						<option value="1">A업체</option>
						<option value="2">B업체</option>
						<option value="3">C업체</option>
						<option value="4">D업체</option>
						<option value="5">E업체</option>
					</select>

					<div id="search">
						<input type="text" id="in_txt"> <i class="fas fa-search"
							title="검색하기"></i>
						<!-- <button id="ok_btn">검색</button> -->
					</div>


					<select id="sort_sel">
						<option value="1">인기순</option>
						<option value="2">판매순</option>
						<option value="3">낮은 가격순</option>
						<option value="4">높은 가격순</option>
					</select>



					<div id="total_count">전체 126</div>



					<div id="img_list">
					<c:forEach items="${plist}" var="plist" begin="0" end="8">
						<div id="item1" class="item">
							<img src="/bangterior/pic/${plist.mainimg}" id="img1" class="item_img">
							<div id="info1" class="info">
								<!-- <div class="type">[NEW]</div>  -->
								<div class="best_txt">${plist.subject}</div>
								<div class="price"><fmt:formatNumber value="${plist.cost}" pattern="#,###" />
								원</div>
								z
							</div>
						</div>
					</c:forEach>
						

					</div>

					<div id="paging">
						<div class="left_btn btn">이전</div>
						<ul>
							<li class="view_page">1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>

						</ul>
						<div class="right_btn btn">다음</div>
					</div>


				</div>
			</div>


		</div>
		<!-- footer -->
		<%@include file="/WEB-INF/views/inc/member/footer.jsp"%>

	</div>








	<script>
	</script>
</body>
</html>