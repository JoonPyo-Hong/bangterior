<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="refresh" content="5;url=/bangterior/company/productview.do?seq=${pseq}">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<script>
</script>
<style>
#main {
	border: 1px solid #F0F0F6;
	width: 1200px;
	height: 1000px;
	margin: auto auto;
	background-color: #F0F0F6;
	margin-top: 50px;
}

#content {
	/* border: 1px solid #ccc; */
	background-color: white;
	border-radius: 25px;
	width: 700px;
	height: 600px;
	margin: auto auto;
	margin-top: 180px;
	text-align: center;
}

.fa-check-circle {
	font-size: 8em;
	margin-top: 130px;
	color: #7674E2;
}

#txt {
	font-size: 2em;
	font-weight: bold;
	color: #2E364A;
	margin-top: 50px;
}
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

				<div id="content">

					<i class="far fa-check-circle"></i>

					<div id="txt">
						상담 신청이 완료 되었습니다.<br>입력하신 날짜에 상담 연락 드리겠습니다.<br>이용해 주셔서
						감사합니다.
					</div>
					<div>
						<span style="font-size: 0.9em; color: #bbb;"> 잠시 후에 상품 페이지로
							이동됩니다.</span>
					</div>

				</div>

			</div>

		</div>

		<!-- footer -->
		<%@include file="/WEB-INF/views/inc/member/footer.jsp"%>
	</div>




</body>
<script>
	$(body).onload(function(){
		
	})
</script>
</html>