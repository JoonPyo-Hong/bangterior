<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/bangterior/css/main_admin.css">
<link rel="stylesheet" href="/bangterior/css/login_admin.css">
<style>
</style>
</head>
<body>



	<!-- 전체 -->
	<div id="wrap">

		<div id="login_area">
			<p class="logo" style="font-variant: small-caps;">Bangterior Admin System</p>
			<form method="POST" action="/bangterior/admin/auth.do"
				id="login_form">
				<input type="text" placeholder="아이디" id="id_input"
					class="login_input" autocomplete="off"> 
				<input type="password" placeholder="비밀번호" id="password_input"
					class="login_input" autocomplete="off">
				<div id="login_btn">로그인</div>
			</form>
			<p class="copyright">Copyrightⓒ2020 CHANU ROOM All rights
				reserved.</p>
		</div>

	</div>
	<script>
		$("#login_btn").click(function() {
			var id = $("#id_input").val();
			var pw = $("#password_input").val();
			var userinfo = {"id":id,"pw":pw};
			
			if (id == "" || pw == "") {
				alert("로그인 정보를 입력해주세요.");
				console.log("로그인실패 정보 입력 안함");
			} else {
				$.ajax({
					url : '/bangterior/admin/auth.do',
					type : 'POST',
					data : userinfo,
					success : function(result) {
						if(result==1){ //로그인 성공
	 						location.href='/bangterior/admin/index.do'
	 					} else { //로그인 실패 
	 						alert("로그인 실패");
	 					}
					},
					error : function(a, b, c) {
						console.log(a, b, c);
					}
				});
			}
		});
	</script>
</body>
</html>