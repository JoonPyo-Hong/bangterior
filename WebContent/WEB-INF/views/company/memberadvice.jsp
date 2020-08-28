<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<link rel="stylesheet" href="/bangterior/css/company_memberadvice.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
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
		<div id="nav">
			<ul>
				<li><a href="#">매물 조회</a></li>
				<li><a href="#">매물 등록</a></li>
				<li><a href="#">인테리어</a></li>
				<li><a href="#">고객서비스</a></li>
			</ul>
		</div>
	</div>

	<!-- container -->
	<div id="container">

		<div id="main">

			<div id="item1">
				<img src="../images/support.png" class="support">
				<div id="content1">
					<div id="txt1">안녕하세요. 방테리어 상담 담당자 입니다. 😊</div>
				</div>
			</div>

			<div id="item2">
				<img src="../images/support.png" class="support">
				<div id="content2">
					<div id="txt2">
						고객님에게 연락드릴 수 있도록 <br> 필요한 내용을 입력해주세요. <br>상담에서 시공까지 고객님을
						도와드리겠습니다 🙌
					</div>
				</div>
			</div>



			<div id="content3">
				<form method='POST' action="/bangterior/company/advicefinish.do"
					name="adviceok" id="adviceok">
					<!-- 선택 상품 정보 -->
					<div id="product_info">
						<img src="/bangterior/pic/${pdto.mainimg}" id="prod_img">
						<div id="prod_name">${pdto.subject}</div>
						<div id="type">
							업체정보: <span class="s">${pdto.comname}인테리어</span>
						</div>
					</div>
					<hr>

					<!-- 찜한 방 정보 -->
					<div id="room_info">
						<img src="/bangterior/pic/${hsdto.filename}" id="room_img">
						<div id="room_name">${hsdto.subject}</div>
						<div id="room_num">
							매물번호: <span class="s">${hsdto.seq}</span>
						</div>
						<div id="room_area">
							면적: <span class="s">${hsdto.area}㎡</span>
						</div>
						<div id="room_space">
							평수: <span class="s"><fmt:formatNumber
									value="${hsdto.area/3.31}" maxFractionDigits="0" />평</span>
						</div>
					</div>

					<hr>

					<!-- 시공 지역 선택 -->
					<div id="region">
						<div id="reg_txt">시공할 지역을 확인해 주세요.</div>
						<select id="sell">
							<option value="1">서울특별시</option>
							<option value="2">부산광역시</option>
							<option value="3">대구광역시</option>
							<option value="4">인천광역시</option>
							<option value="5">광주광역시</option>
							<option value="6">대전광역시</option>
							<option value="7">강원도</option>
							<option value="8">경기도</option>
							<option value="9">경상남도</option>
							<option value="10">제주특별자치도</option>
						</select>
					</div>


					<!-- 이름 입력 -->
					<div id="info_name">
						<div id="name_txt">고객님의 이름을 확인해 주세요.</div>
						<input type="text" id="input_name" value="${mdto.name}">
					</div>



					<!-- 전화번호 입력 -->
					<div id="info_tel">
						<div id="tel_txt">상담받을 전화번호를 확인해 주세요.</div>
						<input type="text" id="input_tel1" class="tel"
							value="${mdto.tel.substring(0,3)}"> - <input type="text"
							id="input_tel2" class="tel" value="${mdto.tel.substring(4,8)}">
						- <input type="text" id="input_tel3" class="tel"
							value="${mdto.tel.substring(9)}">
					</div>


					<!-- 날짜 입력 -->
					<div id="info_date">
						<div id="date_txt">상담받을 날짜를 선택해 주세요.</div>
						<input type="text" id="testDatepicker" class="date"
							value="선택하시면 달력이 출력됩니다.">
					</div>



					<!-- 동의약관 -->
					<div id="agree">
						<div id="agree1" class="agr">
							<input type="checkbox" id="cb1" class="cb"> <label
								for="cb1">전체 동의하기</label>
						</div>

						<div id="agree2" class="agr">
							<input type="checkbox" id="cb2" class="cb" name="cb"> <label
								for="cb2">서비스 이용을 위한 제3자 정보제공 동의 (필수)</label>
						</div>

						<div id="agree3" class="agr">
							<input type="checkbox" id="cb3" class="cb" name="cb"> <label
								for="cb3">개인정보처리방침 동의 (필수)</label>
						</div>

						<div id="agree4" class="agr">
							<input type="checkbox" id="cb4" class="cb" name="cb"> <label
								for="cb4">이벤트 등 프로모션 알림 수신 동의 (선택)</label>
						</div>

					</div>



					<!-- 확인버튼 -->
					<div id="ok">
						<button type="submit" id="ok_btn">
							<span id="ok_btn_txt">완료</span>
						</button>
					</div>
				</form>
				<!-- content3 -->
			</div>



			<!-- main -->
		</div>
		<!-- container -->
	</div>



	<!-- footer -->
	<%@include file="/WEB-INF/views/inc/member/footer.jsp"%>







	</div>


	<script>
		window.onload = function() {
			$("#item1").fadeIn(1000);
			$("#item2").fadeIn(3000);
			$("#content3").fadeIn(5000);

		};
		$(function() {
			$("#testDatepicker").datepicker({
				changeMonth : true,
				changeYear : true,
				nextText : '다음 달',
				prevText : '이전 달',

				showButtonPanel : true,
				currentText : '오늘 날짜',
				closeText : '닫기',
				dateFormat : "yy년mm월dd일",

				minDate : 0,
			});
		});
		
		$("#agree1").click(function() {
			if ($("input[name='cb']:checked").length != $("input[name='cb']").length) {
				$("input[name='cb']").prop("checked", true);
			} else {
				$("input[name='cb']").prop("checked", false);
			}
		});
	</script>
</body>
</html>