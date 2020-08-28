<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/bangterior/css/company_myheartroom.css">

<div class="modalMyHeartRoom"></div>
<div id="myRoom">
	<div class="close_btn">
		<img src="../images/close.png">
	</div>
	<p>내가 찜한 방 목록</p>
	<table>
		<form method="GET" action="/bangterior/company/memberadvice.do" id="myheartsel" name="myheartsel">
			<c:forEach items="${mhrlist}" var="mhrlist">
				<tr>


					<td><input type="radio" id="roomCheck${mhrlist.postseq}"
						name="roomCheck" value="${mhrlist.postseq}"></td>

					<td><label for="roomCheck${mhrlist.postseq}"><img
							src="/bangterior/pic/${mhrlist.mainimg}"></label></td>
					<td class="productinfo"><label for="roomCheck${mhrlist.postseq}">
							<span>${mhrlist.subject}</span>
					</label></td>
				</tr>

			</c:forEach>
				<input type="hidden" value="${pseq}" name="pseq" id="pseq">
		</form>
	</table>


	<div id="popup_btn_area">
		<div class="ok_btn">확인</div>
	</div>

</div>

<script>
	$("#popup_btn_area .ok_btn").click(function(){
		$("#myheartsel").submit();
	})
</script>