<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- header -->
<div id="header">

	<div class="logo_area">
		<img class="logo" src="/bangterior/images/favicon.png" style="width: 60px; height : auto;">
		<a href="/bangterior/member/index.do"><p>Bangterior</p></a>
		<!-- 로그인 전 -->
		<!-- 로그인 전 -->
		<c:if test="${empty memseq || memseq eq 0}">
			<ul id="gnb">
				<li class=login_btn><a href="#">로그인</a></li>
				<li>|</li>
				<li class="signUp_btn"><a href="#">회원가입</a></li>
			</ul>
		</c:if>

		<!-- 로그인 후 -->
		<c:if test="${not empty memseq && memseq ne 0}">
			<ul id="gnb">
				<li class="logout_btn"><a href="/bangterior/common/logout.do">로그아웃</a></li>
				<c:if test="${mc eq 0}">
				<li>|</li>
				<li><a href="/bangterior/member/mypage.do">마이페이지</a></li>
				</c:if>
			</ul>
		</c:if>
	</div>

	<!-- nav -->
		<div id="nav">
		<ul>
			<li><a href="/bangterior/house/HouseSearch.do">매물 조회</a></li>
			<li><a href="/bangterior/member/reghousemenu.do">매물 등록</a></li>
			<li><a href="/bangterior/interior/index.do">인테리어</a>
				<ul id="interior">
					<li><a href="/bangterior/interior/servicedetail.do?serseq=1">장판</a></li>
					<li><a href="/bangterior/interior/servicedetail.do?serseq=2">도배</a></li>
					<li><a href="/bangterior/interior/servicedetail.do?serseq=3">욕실</a></li>
					<li><a href="/bangterior/interior/servicedetail.do?serseq=4">주방</a></li>
					<!-- 업체가 로그인할경우 마이페이지 드롭다운 메뉴에 추가 -->
					<c:if test="${mc eq 1 and not empty seq}">
						<li><a href="/bangterior/company/index.do?seq=${seq}">마이
								페이지 </a></li>
						<script>
							/* 업체 마이페이지 메뉴가 보일시 css수정 */
							$("#interior").css("width","200px");
							$("#interior").css("left","280px");
						</script>
					</c:if>
				</ul></li>
			<li><a href="/bangterior/member/noticeboardlist.do">고객서비스</a>
				<ul id="member_service">
					<li><a href="/bangterior/member/noticeboardlist.do">공지사항</a></li>
					<li><a href="/bangterior/member/faqboard.do">자주하는질문</a></li>
					<li><a href="/bangterior/member/inquiryboardlist.do">문의사항</a></li>
					<li><a href="/bangterior/member/inconveniencelist.do">불편사항</a></li>
				</ul></li>
		</ul>
	</div>



</div>



<%@ include file="/WEB-INF/views/popup/login.jsp"%>
<%@ include file="/WEB-INF/views/popup/signup.jsp"%>

<script>
	
/* 로그인 버튼 */
$(".login_btn").click(function() {
		$(".modalLogin").attr("style", "display:block");
		$("#login_popup").attr("style", "display:block");
		$('body').attr("style","overflow:hidden");
	});

	/* 회원가입 버튼 */
	$(".signUp_btn").click(function() {
		$(".modalSignup").attr("style", "display:block");
		$("#signup_popup").attr("style", "display:block");
		$('body').attr("style","overflow:hidden");
	});
	
	/* 팝업 닫기 */
	$(".close_btn").click(function() {
		$(".modalLogin").attr("style", "display:none");
		$(".modalSignup").attr("style", "display:none");
		$("#login_popup").attr("style", "display:none");
		$("#signup_popup").attr("style", "display:none");
	});
	

	
	
	/* 드롭다운 메뉴  */
	/* 인테리어 */
	$("#nav>ul>li:nth-child(3)").mouseover(function(){
		$("#interior").css("opacity","1").css("visibility","visible");
	});
	$("#nav>ul>li:nth-child(3)").mouseleave(function(){
		$("#interior").css("opacity","0").css("visibility","hidden");
	});
	$("#interior>li").mouseover(function() {
		$(this).css("text-decoration","underline");
		$(this).css("font-weight","bold");
	});
	$("#interior>li").mouseleave(function() {
		$(this).css("text-decoration","none");
		$(this).css("font-weight","normal");
	});
	/* 고객서비스 */
	$("#nav>ul>li:nth-child(4)").mouseover(function(){
		$("#member_service").css("opacity","1").css("visibility","visible");
	});
	$("#nav>ul>li:nth-child(4)").mouseleave(function(){
		$("#member_service").css("opacity","0").css("visibility","hidden");
	});
	
	$("#member_service>li").mouseover(function() {
		$(this).css("text-decoration","underline");
		$(this).css("font-weight","bold");
	});
	$("#member_service>li").mouseleave(function() {
		$(this).css("text-decoration","none");
		$(this).css("font-weight","normal");
	});
</script>
