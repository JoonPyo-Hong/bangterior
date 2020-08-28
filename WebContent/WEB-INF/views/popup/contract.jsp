<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
/* 문의하기 팝업창 */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1001; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4);
}

.popup {
	display: none;
	z-index: 1002;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -250px;
	margin-top: -425px;
	width: 500px;
	height: 850px;
	background-color: white;
	border: 1px solid #eee;
}

.popup .close_btn img {
	cursor: pointer;
	position: absolute;
	width: 15px;
	right: 30px;
	top: 25px
}

.popup p {
	text-align: center;
	margin: 50px 0 20px 0;
	color: #444;
	font-size: 26px;
	font-weight: bold;
}

.popup .sign_list p {
	display: inline-block;
	width: 100px;
	text-align: left;
	font-size: 14px;
	font-weight: normal;
	line-height: 30px;
	color: #888;
	margin: 0px 0px 10px 30px;
}

.popup .sign_input {
	width: 320px;
	height: 30px;
	font-size: 16px;
	margin: 0 auto;
	margin-top: 10px;
	border: 1px solid #ccc;
	text-align: left;
	text-indent: 10px;
}

.popup .id_input {
	width: 225px;
}

.popup .sign_input:focus {
	border: 1px solid #7674E2;
}

.popup .ok_btn {
	cursor: pointer;
	text-align: center;
	width: 400px;
	margin: 0 auto;
	margin-top: 30px;
	height: 60px;
	line-height: 60px;
	font-size: 16px;
	background-color: #7674E2;
	color: white;
}

/* 집 판매자 정보 */
.info_box {
	width: 450px;
	margin: 0 auto;
}

.popup  .info_box p {
	font-size: 14px;
	color: #888;
	font-weight: normal;
	text-align: left;
	margin-top: 0px;
	margin-bottom: 0px;
}

.popup  .info_box .title {
	font-size: 18px;
	color: #333;
	font-weight: bold;
}

.popup  .info_box img {
	width: 100px;
	margin-left: 38%;
	margin-top: 20px;
}

.popup .user_info p {
	margin-top: 20px;
	margin-bottom: 20px;
	font-size: 16px;
	color: #333;
	font-weight: bold;
	text-align: center;
}

.popup .user_info p span {
	font-size: 14px;
	color: #888;
	font-weight: normal;
}

.popup .user_info p .phone {
	color: #7674E2;
	font-size: 22px;
	font-weight: bold;
}
</style>
<div class="modal"> </div>
	<c:forEach items="${inq}" var="inq" varStatus="status">
<div class="popup write_popup login_popup" id="popup${inq.postseq}">
	<div class="close_btn">
		<img src="../images/close.png">
	</div>
	<p>문의사항 내역</p>
	<div class="info_box">
		<p>
			<span class="title">${inq.office}</span> <br> <br>${inq.address}<br>대표명
			| ${inq.sellername}<br> <span>대표번호 | ${inq.sellertel}</span>
		<hr
			style="width: 450px; margin: 10px auto; border: 1px solid #ededed;">
		</p>

		<!--                             <img src="../images/info_people.png"> -->

		<div class="user_info">
			<img src="../images/info_people.png">
			<p>
				담당: ${inq.sellername } <br> <span class="phone">${inq.sellertel}</span><br>
			</p>
		</div>
		<hr
			style="width: 450px; margin: 10px auto; border: 1px solid #ededed;">
	</div>
	<!--                         <hr style="width: 450px; margin: 10px auto; border:1px solid #ededed;"> -->
	<div class="sign_list">
		<p>이름</p>
		<input type="text" value="${inq.name}"
			style="background-color: #ededed;" class="name_input sign_input">
	</div>
	<div class="sign_list">
		<p>문의내역</p>
		<input type="text" class="ssn_input sign_input"
			style="padding-bottom: 80px; background-color: #ededed;"
			value="${inq.content }" readonly>
	</div>
	<div class="sign_list">
		<p>연락처</p>
		<input type="text" value="${inq.tel }" class="ssn_input sign_input"
			style="width: 150px; background-color: #ededed;">
	</div>

	<a href="../member/conpleteok.do?seq=${seq}&postseq=${inq.postseq}"><div
			class="ok_btn" id="conplete">상담 완료</div></a>

</div>
</c:forEach>
