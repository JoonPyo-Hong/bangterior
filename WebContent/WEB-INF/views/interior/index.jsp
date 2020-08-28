<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<link rel="stylesheet" href="/bangterior/css/interior_index.css">

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

			<!-- 메인 상단 이미지  -->
			<div id="main">




				<div class="op">
					<div id="sub_main_1" class="main">
						<div class="sub_main_txt">
							<span class="sub_t"><i class="far fa-list-alt"></i>시공
								카테고리별 보러가기</span>
						</div>
					</div>
					<div id="sub_main_2" class="main"
						onclick="location.href='/bangterior/interior/bycompany.do'">
						<div class="sub_main_txt">
							<span class="sub_t"><i class="far fa-building"></i>업체별
								보러가기</span>
						</div>
					</div>
				</div>

				<!-- main -->
			</div>




			<div id="sub_main">
				<div id="img_txt">당신이 원하는 테마별 상품!</div>

				<div id="btn1" class="btn_img"
					onclick="location.href='/bangterior/interior/servicedetail.do?serseq=1'">
					<img src="../images/img3.png" class="imgs" title="장판">
					<div id="sub_txt1" class="sub_txt">장판</div>
				</div>

				<div id="btn2" class="btn_img"
					onclick="location.href='/bangterior/interior/servicedetail.do?serseq=2'">
					<img src="../images/img4.png" class="imgs" title="도배">
					<div id="sub_txt2" class="sub_txt">도배</div>
				</div>

				<div id="btn3" class="btn_img"
					onclick="location.href='/bangterior/interior/servicedetail.do?serseq=3'">
					<img src="../images/img1.png" class="imgs" title="욕실">
					<div id="sub_txt3" class="sub_txt">욕실</div>
				</div>

				<div id="btn4" class="btn_img"
					onclick="location.href='/bangterior/interior/servicedetail.do?serseq=4'">
					<img src="../images/img2.png" class="imgs" title="주방">
					<div id="sub_txt4" class="sub_txt">주방</div>
				</div>
			</div>



			<c:if test="${not empty seq }">
				<div id="berner">
					<div id="sub_berner">
						<i class="far fa-thumbs-up"></i>
						<div id="berner_txt">요즘 핫한 시공 아이템은?</div>
						<div id="more">더 보러가기</div>
					</div>
				</div>
			</c:if>
			<c:if test="${empty seq }">
				<div id="berner">
					<div id="sub_berner">
						<!-- <i class="fas fa-tools"></i> -->
						<div id="berner_txt">업체 이신가요?</div>
						<div id="more">더 보러가기</div>
					</div>
				</div>
			</c:if>




			<div id="content">
				<div id="con_txt">금주의 인기 키워드</div>
				<div id="keyword1" class="key">
					<div></div>
					<div class="in_txt">
						<span class="t">#아늑한</span>
					</div>
				</div>
				<div id="keyword2" class="key">
					<div></div>
					<div class="in_txt">
						<span class="t">#편안한</span>
					</div>
				</div>
				<div id="keyword3" class="key">
					<div></div>
					<div class="in_txt">
						<span class="t">#쾌적한</span>
					</div>
				</div>
				<div id="keyword4" class="key">
					<div></div>
					<div class="in_txt">
						<span class="t">#차분한</span>
					</div>
				</div>
			</div>



			<div id="content1">

				<div id="con_txt1">BEST</div>

				<img src="../images/back_img.png" id="back_img" class="direc">
				<c:forEach items="${pdto}" var="pdto" begin="1" end="3" varStatus="status" step="1">	
				<div id="best${status.index}" class="best">
					
						<img src="/bangterior/pic/${pdto.mainimg}" id="best1_img"
							class="best_img">
						<div id="info1" class="info">
							<div class="type">[${pdto.sername} 시공]</div>
							<div class="best_txt">${pdto.subject}</div>
							<div class="price"><fmt:formatNumber value="${pdto.cost}" pattern="#,###" />원</div>
							<i class="fas fa-star"></i> <span class="review">리뷰
								${status.index+status.index*(51+status.index*status.index)}개</span>
						</div>
				</div>
				</c:forEach>
			
					
				<img src="../images/next_img.png" class="direc" id="back_img">

			</div>

		</div>



		<!-- footer -->
		<%@include file="/WEB-INF/views/inc/member/footer.jsp"%>
	</div>
	<script>
		$("#sub_main_1").click(function() {
			// 시공 카테고리별 보러가기 클릭시
			$("#sub_main").slideToggle();

		});
	</script>
</body>
</html>