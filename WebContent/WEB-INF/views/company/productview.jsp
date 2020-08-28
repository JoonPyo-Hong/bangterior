<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>

<link rel="stylesheet" href="/bangterior/css/main_member.css">

<link rel="stylesheet" href="/bangterior/css/company_productview.css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<!-- 전체 -->
	<div id="wrap">

		<!-- header -->
		<%@include file="/WEB-INF/views/inc/member/header.jsp"%>



		<!-- container -->
		<div id="container">
			<!-- 인테리어 이미지/설명 -->
			<div id="interior_thumb">
				<div>
					<img src="/bangterior/pic/${pdto.mainimg}" alt="">
				</div>
				<div>${pdto.subject}</div>
				<div id="interior_info">
					<table>
						<tr>
							<td><img src="../images/home.png"><br>금액</td>
							<td><img src="../images/home.png"><br>범위</td>
							<td><img src="../images/home.png"><br>테마</td>
							<td><img src="../images/home.png"><br>색상</td>
						</tr>
						<tr>
							<td><fmt:formatNumber value="${pdto.cost}" pattern="#,###" />
								원</td>
							<td><c:forEach items="${pslist}" var="pslist">${pslist.sername}</c:forEach></td>
							<td><c:forEach items="${thelist}" var="thelist">#${thelist.thename}&nbsp;</c:forEach></td>
							<td><select id="color_list">
									<option value="-1">전체보기</option>
									<c:forEach items="${colorlist}" var="colorlist">
										<option value="${colorlist.colseq}">${colorlist.colname}</option>
									</c:forEach>
							</select></td>
						</tr>
					</table>
				</div>
			</div>

			<!-- 인테리어 견적/업체 -->
			<%@ include file="/WEB-INF/views/popup/myheartroom.jsp"%>
			<div id="interior_esti">
				<div id="like_apply_esti" class="apply_esti">내가 찜한방으로 견적 상담하기</div>
				<div id="nor_apply_esti" class="apply_esti">일반 견적 상담하기</div>
				<div id="interior_company">${cdto.name}인테리어<br>${cdto.address}</div>
			</div>

			<!-- 인테리어 상세이미지 -->
			<div id="interior_details">
				<p>상품 정보</p>
				<div id="detail_img">
					<img src="/bangterior/pic/${pdto.detailimg}" alt="">
					<div id="more_detail">자세히보기</div>
				</div>


			</div>

			<div id="review">

			<!-- 인테리어 후기 -->


				<span class="heading"> 리뷰 </span>

				<div id="input_review">리뷰쓰기</div>

				<div class="row">
					<div class="row_left">
						<p>${staravg}</p>
						<span class="full-star _star_gauge _star_gauge_5"
							style="font-size: 1.5em;"></span> <span class="fa fa-star"></span>
						<span class="fa fa-star"></span> <span class="fa fa-star"></span>
						<span class="fa fa-star"></span> <span class="fa fa-star"></span>

					</div>
					<div class="row_right">
						<c:forEach items="${starlist}" var="i">

							<div class="side">
								<div>${i.star}star</div>
							</div>
							<div class="middle">
								<div class="bar-container">
									<c:if test="${i.starCnt != null}">
										<div class="bar-${i.starCnt}"></div>
									</c:if>
									<c:if test="${i.starCnt == null}">
										<div class="bar-0"></div>
									</c:if>
								</div>
							</div>
							<div class="side right">
								<div>${i.starCnt}</div>
							</div>
						</c:forEach>
					</div>
					<div id="review_option">
						<div id="review_new">
							<span>최신순</span>
						</div>
						<div id="review_img">
							<img src="../images/photo.png"> <span>사진 리뷰</span>
						</div>
						<div id="review_star">
							<span>별점 </span>
							<div id="star">
								<div class="five_star">
									<span class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span class="review_cnt">${revlist.size()}</span>
								</div>
								<div class="four_star">
									<span class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span class="fa fa-star"></span>
									<span class="review_cnt">(1개)</span>
								</div>
								<div class="three_star">
									<span class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span> <span class="review_cnt">(0개)</span>
								</div>
								<div class="two_star">
									<span class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span> <span class="fa fa-star"></span>
									<span class="review_cnt">(0개)</span>
								</div>
								<div class="one_star">
									<span class="fa fa-star checked"></span> <span
										class="fa fa-star"></span> <span class="fa fa-star"></span> <span
										class="fa fa-star"></span> <span class="fa fa-star"></span> <span
										class="review_cnt">(15개)</span>
								</div>
							</div>

						</div>
					</div>




					<c:if test="${revlist.size() > 0}">
						<c:forEach items="${revlist}" var="rev">
							<div class="customer_review">
								<div class="customer_info">

									<p>
										<span>${rev.memname}</span> 고객님 x <span>${rev.comname}</span>
									</p>
									<p>
										시공 범위 <span>${rev.sername}</span> 공사일 <span>${rev.regdate}</span>
									</p>
								</div>
								<div class="score_info">
									<p>
										<span><fmt:formatNumber value="${rev.star}"
												pattern=".0" /></span>/<span>5.0 </span> <span class="fa fa-star"></span>
										<span class="fa fa-star"></span> <span class="fa fa-star"></span>
										<span class="fa fa-star"></span> <span class="fa fa-star"></span>
									</p>
								</div>

								<div class="review_text">
									<span><pre>${rev.content}</pre></span>
								</div>

							</div>
						</c:forEach>
						<!-- 리뷰페이징 -->


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
					</c:if>
					<c:if test="${revlist.size() == 0}">
						<div class="customer_review">
							<div id="no_review">
								<p>등록된 리뷰가 없습니다.</p>
							</div>
						</div>
					</c:if>
			</div>
				</div>

				<!-- 해당 업체 전체 리뷰 -->
				<!-- <div id="company_review">
					<div id="see_company_review">해당 업체 시공 보러가기</div>
				</div> -->




		</div>
		<!-- footer -->
		<%@include file="/WEB-INF/views/inc/member/footer.jsp"%>
	</div>
	<%@include file="/WEB-INF/views/popup/writereview.jsp"%>

	<script>
			$("#input_review").click(function(e) {
			
				var reviewLeft = e.clientX + 10;
				var reviewTop = e.clientY + 5;

				$(".modal").attr("style", "display:block");
				
				$(".review_popup").css("display","block");
				$(".review_popup").css("top",($(window).height()-$(".review_popup").outerHeight())/2+$(window).scrollTop());
				$(".review_popup").css("left",($(window).width()-$(".review_popup").outerWidth())/2+$(window).scrollLeft());
				$('body').css("overflow","hidden"); 
			});

			

			$(".review_popup .close_btn").click(function() {
				$(".modal").attr("style", "display:none");
				$(".review_popup").attr("style", "display:none");
				$('body').css("overflow","auto"); 
			});

			$("#review_star").mouseover(function() {
				$("#star").css("opacity", "1");
			});
			$("#review_star").mouseleave(function() {
				$("#star").css("opacity", "0");
			});
		
			
			$("#like_apply_esti").click(function(e){
				var myroomLeft = e.clientX -130;
				var myroomTop = e.clientY + 50;
			if(${mhrlist.size()>1}){
				$("#myRoom").height(${mhrlist.size()*100+150});
			}
			if(${seq !=null} && ${mc eq 0}){
				$(".modalMyHeartRoom").attr("style","display:block");
				$("#myRoom").attr("style", "display:block");
				$("#myRoom").css("top",($(window).height()-$("#myRoom").outerHeight())/2+$(window).scrollTop()+"px");
				$("#myRoom").css("left",myroomLeft+"px");
				$('body').css("overflow","hidden"); 
			} else {
				alert("로그인 후 이용하실 수 있습니다.");
				console.log("아이구");
			}
			});

			$("#myRoom .close_btn").click(function() {
				$(".modalMyHeartRoom").attr("style", "display:none");
				$("#myRoom").attr("style", "display:none");
				 $('body').css("overflow","auto"); 
			});
			
			
		</script>
</body>
</html>