<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/bangterior/css/login.css">


<div class="modalLogin"></div>
	<div id="login_popup">
	
		<div class="close_btn">
			<img src="../images/close.png">
		</div>
		<p>로그인</p>
		
		<form method="POST" action="/bangterior/common/auth.do" id="loginForm">
		<div class="login_check">
		<!-- 기업회원 체크 -->
			<input type="checkbox" class="user_chcek" id="cb1" name="cb1"> <label
				for="cb1">기업회원</label>
		</div>
		<input type="id_input" placeholder="아이디" class="id_input login_input" id="id" name="id" autocomplete="off">
		<input type="password" placeholder="비밀번호"
			class="password_input login_input" id="pw" name="pw" autocomplete="off">
		<div class="ok_btn">로그인</div>
		</form>
		<p class="password_forget" onclick="location.href='/bangterior/member/index.do';">비밀번호 찾기</p>
		
		<!-- 08/25 아직 미구현 -->
		<p class="sign_up"onclick="location.href='/bangterior/member/index.do';">
			아직 회원이 아니세요?<br> <span>개인 회원가입</span><span>기업 회원가입</span>
		</p>
		
	</div>

<script>
	
	
	$("#login_popup .ok_btn").click(function(){
		var cb = $("input[name='cb1']:checked").val();
		var id = $("#id").val();
		var pw = $("#pw").val();
		var userinfo = {"cb" : cb, "id":id,"pw":pw};
		$.ajax({
 				
 				url:"/bangterior/common/auth.do",
 				type : 'post',
 				data : userinfo,
 				success : function(result){
 					if(result==0){ //로그인 실패 
 						alert("로그인 실패");
 					} else { //로그인 성공 
 						$(".modalLogin").attr("style", "display:none");
 						$("#login_popup").attr("style", "display:none");
 						$('body').attr("style","overflow:auto");
 						history.go(0);
 					}
 				},
 				error : function(a,b,c){
 					console.log(a,b,c);
 				}
 			});
	});
</script>