<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원_5,6,9</title>
<link rel="stylesheet" type="text/css" href="../css/main_member.css" />
<!-- 구글웹폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet" />

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous" />
<link rel="stylesheet" href="/bangterior/css/회원5.css" />
<link rel="stylesheet" href="/bangterior/css/basic_popup.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>

<!-- 맵 -->

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b5d421e6999a6826353708868a05bde7&libraries=services,clusterer,drawing"></script>
<!--  해당 페이지 스타일 작업 영역  -->
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 20px;
	left: 350px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(/bangterior/images/1.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url(/bangterior/images/1.png)
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(/bangterior/images/1.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}
</style>
<style>
#part1 {
	padding: 15px;
	/* padding-bottom: 0px; */
	/* width: 100%; */
	height: 750px;
	background-image: url(/bangterior/images/background.jpg);
	background-size: cover;
	width: 100%;
	background-repeat: no-repeat;
	vertical-align: middle;
}

#btn2 {
	/* vertical-align: initial; */
	/* text-align: center center; */
	margin-top: 250px;
	/* border: 1px solid black; */
	padding: 25px;
}

.close_btn3 img {
	cursor: pointer;
	position: absolute;
	width: 15px;
	right: 30px;
	top: 25px
}
.close_btn4 img {
	cursor: pointer;
	position: absolute;
	width: 15px;
	right: 30px;
	top: 25px
}
</style>
<style type="text/css">
.basic_popup .ok_btn3 {
	cursor: pointer;
	text-align: center;
	width: 100px;
	margin: 0 auto;
	margin-top: 40px;
	height: 40px;
	line-height: 40px;
	background-color: #7674E2;
	color: white;
}

.basic_popup #popup_btn_area .ok_btn3 {
	display: inline-block;
	margin-left: 20px;
}

.modal3 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 2000; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4);
}

.popup3 {
	display: none;
	z-index: 2001;
	position: fixed;
	left: 51.3%;
	top: 65%;
	margin-left: -250px;
	margin-top: -290px;
	width: 450px;
	height: 230px;
	background-color: white;
	border: 1px solid #eee;
}

 .ok_btn4 {
	cursor: pointer;
	text-align: center;
	width: 100px;
	margin: 0 auto;
	margin-top: 40px;
	height: 40px;
	line-height: 40px;
	background-color: #7674E2;
	color: white;
}

.ok_btn4 {
	display: inline-block;
	margin-left: 20px;
}

.modal4 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 2000; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4);
}

.popup4 {
	display: none;
	z-index: 2001;
	position: fixed;
	left: 51.3%;
	top: 65%;
	margin-left: -250px;
	margin-top: -290px;
	width: 450px;
	height: 230px;
	background-color: white;
	border: 1px solid #eee;
}



/*  */
.modal4 {
    display: none;  /* 기본 화면에 숨기기 */
    position: fixed;
    z-index: 2000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%; 
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
}

.basic_popup4 {
    display: none;  /* 기본 화면에 숨기기 */
    z-index: 2001;
    position: fixed;
    left:50%; top:50%;
    margin-left: -200px;
    margin-top: -125px;
    width: 400px;
    height: 250px;
    background-color: white;
    border:1px solid #eee;
    
}

.basic_popup4 p{
    text-align: center;
    margin-top: 80px;
    color:#444;
}

.ok_btn4 {
    cursor: pointer;
    text-align: center;
    width: 100px;
    margin: 0 auto;
    margin-top: 40px;
    height: 40px;
    line-height: 40px;
    background-color: #7674E2;
    color:white;
    margin-left: 145px;
}


/* 확인 & 삭제 버튼 2개 팝업창 */
.basic_popup4 #popup_btn_area4{
    width: 280px;
    margin: 0 auto;
}

.basic_popup4 #popup_btn_area4 .ok_btn4 {
    display: inline-block;
    margin-left: 20px;
}

.basic_popup4 #popup_btn_area4 .cancel_btn4{
    background-color: #bbb;
}

/* 입력칸 추가 팝업창 */
.basic_popup4 .password_input4{
    display: block;
    width: 200px;
    height: 30px;
    margin: 0 auto;
    margin-top: 10px;
    border: 1px solid #ccc;
    text-align: center;
}

/* 입력칸 팝업창 확인 버튼 위치 조절 */
.basic_popup4 .pw_popup_margin4 {
    margin-top: 22px;
}


/* 삭제 버튼 */
.basic_popup4 .close_btn4 img{
    cursor: pointer;
    position: absolute;
    width: 15px;
    right: 30px;
    top:25px
}
</style>
</head>
<body>
	<!-- 전체 -->
	<div id="wrap">
		<!-- header -->
		<%@include file="/WEB-INF/views/inc/member/headerhouse.jsp"%>

		

	<!-- container -->
	<!-- 해당 페이지 HTML 작업 -->
	<div id="container">
		<!-- main 부모역할 포지션, 마진 처리 등 -->
		<div id="main">
			<div id="singo" class="question_btn2">
				<img id="singoimg" src="../images/siren.png" alt="" /> <span
					id="singotxt">허위매물 신고</span> 
			</div>
			<div id="left">
				<table>
					<tr>
						<td>
							<div class="title1" id="housetitle"></div>
						</td>
						<td rowspan="2"><img class="heart" src="../images/heart.png"
							alt="" /></td>
					</tr>
					<tr>
						<td>
							<div class="title2" id="cost"></div> <!-- 월세 1000/65 만원 -->
						</td>
					</tr>
				</table>
				<div class="title1">전용면적</div>
				<div class="title2">
					<!-- 23.76㎡ -->
					<span id="area"></span>
					<button id="btn1">
						<img id="btn1img" src="../images/change.png" alt="" /><span>
							평</span>
					</button>
				</div>

				<div class="budongsantitle" style="margin-top: 15px"></div>
				<!-- (주)MJ부동산중개법인 -->
				<div id="txt1">
					<div class="budongsantxt" style="width: 300px;"></div>
					<!-- 서울특별시 송파구 송파대로 111, -->
					<br />
					<div>
						대표명 | <span class="daepyoname"></span>
					</div>
					<div>
						대표번호 | <span class="daepyonum"></span>
					</div>
					<!-- 02-483-1800 -->
				</div>

				<div>
					<button class="question_btn">문의하기</button>
				</div>
				<img id="leftimg" src="../images/info_people.png" alt="" />
				<!-- left -->
			</div>
			<div id="right">
				<div id="part1">
					<div id="mamulnum"></div>
					<!-- 매물 번호 13035071 -->
					<div id="btn2">
						<span id="leftbtn"><img src="../images/arrow_btn_left.png"
							alt="" /></span> <span id="rightbtn"><img
							src="../images/arrow_btn_right.png" alt="" /></span>
					</div>
				</div>
				<div id="part2">
					<table>
						<tr>
							<td>해당층/건물층</td>
							<td id="floor"></td>
							<!-- 2층/5층 -->
							<td></td>
							<td>난방종류</td>
							<td id="nanbang"></td>
							<!-- 개별난방 -->
						</tr>
						<tr>
							<td>전용/공급면적</td>
							<td id="areatxt"></td>
							<!-- 19.83/23.14  -->
							<td></td>
							<td>엘리베이터</td>
							<td id="el"></td>
							<!-- 없음 -->
						</tr>
						<tr>
							<td>관리비</td>
							<td id="maincost"></td>
							<td></td>
							<td>입주가능일</td>
							<td id="day"></td>
							<!-- 협의가능 -->
						</tr>
					</table>
				</div>
				<div id="part3">
					<div class="righttitle"">상세설명</div>
					<div id="txt2"></div>
					<!-- 월세, 보증금 저렴한 신축 풀옵션 오픈형 원룸 -->
					<div id="detail" style="margin-bottom: 30px;">
						<!-- 주위에 은행,먹자,편의점,동사무소,pc방 등 각종 편의시설이 위치해 있어 생활에 편리합니다.
혼자 살기 딱 좋은 사이즈에 근처에 치한센터가 있어 치한걱정도 NO.
언제든지 연락주시면 최선을 다해 설명해 드리겠습니다! -->
					</div>
				</div>
				<div id="part4">
					<div class="righttitle">실거래가</div>
					<!-- 선 그래프 -->
					<div style="padding: 15px;" id="chart"></div>
					<!-- 막대 그래프 -->
					<div style="padding: 15px;" id="container2"></div>
				</div>
				<div id="part5">
					<div class="righttitle">위치 및 주변시설</div>
					<!-- 맵 -->
					<div id="mapbox">
						<div class="map_wrap">
							<div id="map">
								<ul id="category">
									<li id="BK9" data-order="0"><span class="category_bg bank"></span>
										은행</li>
									<li id="MT1" data-order="1"><span class="category_bg mart"></span>
										마트</li>
									<li id="PM9" data-order="2"><span
										class="category_bg pharmacy"></span> 약국</li>
									<li id="OL7" data-order="3"><span class="category_bg oil"></span>
										주유소</li>
									<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
										카페</li>
									<li id="CS2" data-order="5"><span
										class="category_bg store"></span> 편의점</li>
								</ul>

							</div>
						</div>
					</div>
					<div id="mapimg">
						<img src="../images/coffee.png" alt="" /> <img
							src="../images/shop.png" alt="" /> <img
							src="../images/hospital.png" alt="" /> <img
							src="../images/train.png" alt="" />
					</div>
				</div>
				<div id="part6">
					<div class="righttitle">추천도</div>
					<!-- 레이더 차트 -->

					<div id="spider"></div>

					<div id="score">
						<span id="avgscore"></span> <img id="scoreimage"
							src="../images/smile.png" alt="" />
					</div>
				</div>
				<!-- right -->
			</div>
			<!-- main -->
		</div>
	</div>

	<!-- footer -->
	<%@include file="/WEB-INF/views/inc/member/footer.jsp"%>
</div>
	<!--  문의사항 버튼 클릭 시 팝업창 -->
	<div class="modal"></div>
	<div class="popup write_popup login_popup">
		<div class="close_btn">
			<img src="../images/close.png">
		</div>
		<p>문의사항 접수</p>
		<div class="info_box">

			<span class="title"><span class="budongsantitle"></span></span><br>
			<br> <span class="budongsantxt"></span> <br>대표명 | <span
				class="daepyoname"></span><br> <span>대표번호 | <span
				class="daepyonum"></span></span><br> <br>
			<hr
				style="width: 450px; margin: 10px auto; border: 1px solid #ededed;">

			<img id="modalimg" src="../images/info_people.png">
			<div class="user_info">
				<p>
					<span>담당 : </span><span class="daepyoname"></span><br> <span
						class="phone daepyonum"></span><br> <span>연락 시 찬방에서 보고
						연락한다고 말씀하시면<br> 더욱 빠르게 상담 받을 수 있습니다.
					</span>
				</p>
			</div>
		</div>
		<hr
			style="width: 450px; margin: 10px auto; border: 1px solid #ededed;">
		<div class="sign_list">
			<p>이름</p>
			<input id="modalname" type="text" value="" readonly="readonly"
				class="name_input sign_input">
		</div>
		<div class="sign_list">
			<p>문의내역</p>
			<input type="text" class="ssn_input sign_input" id="input1"
				style="padding-bottom: 80px;" value="" autocomplete="off" placeholder="문의 내역을 입력해주세요.">
		</div>
		<div class="sign_list">
			<p>연락처</p>
			<input readonly="readonly" type="text" value=""
				class="ssn_input sign_input modaltel11" style="width: 96px;">
			- <input type="text" value="" readonly="readonly"
				class="ssn_input sign_input modaltel22" style="width: 96px;">
			- <input type="text" readonly="readonly" value=""
				class="ssn_input sign_input modaltel33" style="width: 96px;">
		</div>
		<div class="ok_btn">완료</div>
	</div>

	<!--  신고하기 버튼 클릭 시 팝업창 -->
	<div class="modal2"></div>
	<div class="popup2 write_popup2 login_popup2">
		<div class="close_btn2">
			<img src="../images/close.png">
		</div>
		<p>매물 신고</p>
		<div class="info_box2">
			<img src="../images/siren_popup.png">
			<div class="user_info">
				<p>
					해당 매물 번호: HSK00200<br> <span class="phone">허위매물을 신고해주세요</span><br>
					<span>원할한 서비스 사용을 위해 *허위매물*을 신고해주세요!<br> 신고 접수 후 매물 검증
						단계를 거쳐 삭제 등의 조치가 진행됩니다
					</span>
				</p>
			</div>
		</div>
		<hr
			style="width: 450px; margin: 10px auto; border: 1px solid #ededed;">
		<div class="sign_list2">
			<p>신고사유</p>
			<select name="false_house" id="false_house" class="sign_input2">
				<option value="false1" selected>표시된 정보와 상이</option>
				<option value="false2">존재하지 않는 매물</option>
				<option value="false3">무등록 불법 중개행위</option>
			</select>
		</div>
		<div class="sign_list2">
			<p>연락처</p>
			<input type="text" readonly="readonly" value=""
				class="ssn_input sign_input2 modaltel11" style="width: 96px;">
			- <input type="text" readonly="readonly" value=""
				class="ssn_input sign_input2 modaltel22" style="width: 96px;">
			- <input type="text" value="" readonly="readonly"
				class="ssn_input sign_input2 modaltel33" style="width: 96px;">
		</div>
		<div class="ok_btn2">완료</div>
	</div>

	<!-- 추가 팝업 작업 -->

	<div class="modal3" style="position: fixed; left: 0px; top: 0px;">
	</div>
	<div class="basic_popup popup3 complete getcom">
		<div class="close_btn3" id="comclose">
			<img src="/bangterior/images/close.png" />
		</div>
		<p>
			<span id="input">문의 내역을 입력해주세요.</span>
		</p>
		<div class="ok_btn3" id="comok">확인</div>
	</div>
	
	
		<div class="modal4" style="position: fixed; left: 0px; top: 0px;">
	</div>
	<div class="basic_popup4 popup4 complete4 getcom4">
		<div class="close_btn4" id="comclose4">
			<img src="/bangterior/images/close.png" />
		</div>
		<p>
			<span id="input4">완료 되었습니다.</span>
		</p>
		<div class="ok_btn4" id="comok4"">확인</div>
	</div>
	
	
	
	<script type="text/javascript">
	 //팝업 창 스크립트
	   //버튼 클릭 시 팝업창 닫기
	   $(".ok_btn4").click(function(){
		var nexttxt = $("#false_house option:selected").text();
		var mm = ${memseq};
		   var ss = ${seq};
		  
		  $.ajax({
			   type : "POST",
						url : "/bangterior/house/SinGO.do",
								data : "memseq=" + mm + "&seq=" + ss +"&txt=" +nexttxt,
								dataType : "json",
								success : function(result) {
									
								 
								
								  $(result).each(function(index, item) {
									 
								 });
								
								},
								error : function(a, b, c) {
									console.log(a, b, c);
									alert("실패");
									
								}
							});
		  
		$(".modal4").attr("style", "display:none");

		 $(".modal4").css("display", "none");
	     $(".basic_popup4").css("display", "none");
	     
			$(".modal2").attr("style", "display:none");
			$(".popup2").attr("style", "display:none");
	   });
	   $(".close_btn4").click(function(){
		   var nexttxt = $("#false_house option:selected").text();
			var mm = ${memseq};
			   var ss = ${seq};
			  
			  $.ajax({
				   type : "POST",
							url : "/bangterior/house/SinGO.do",
									data : "memseq=" + mm + "&seq=" + ss +"&txt=" +nexttxt,
									dataType : "json",
									success : function(result) {
										
									
									
									  $(result).each(function(index, item) {
										 
									 });
									
									},
									error : function(a, b, c) {
										console.log(a, b, c);
										alert("실패");
										
									}
								});
			$(".modal4").attr("style", "display:none");

			 $(".modal4").css("display", "none");
		     $(".basic_popup4").css("display", "none");
		     
				$(".modal2").attr("style", "display:none");
				$(".popup2").attr("style", "display:none");
		   });
	 

	     $(".ok_btn3").click(function(){
	    	 if($("#input1").val() == ""){
	 	        $(".modal3").attr("style", "display:none");
	 	        $(".basic_popup").attr("style", "display:none");	    		 
	 	    	 }else{
	 	    		 $(".modal3").attr("style", "display:none");
	 	 	        $(".basic_popup").attr("style", "display:none");
	 	 	   	$(".modal").attr("style", "display:none");
	 			$(".popup").attr("style", "display:none");
	 			
	 			var mm = ${memseq};
	 		   var ss = ${seq};
	 		   var tt = $("#input1").val();
	 		   $.ajax({
	 			   type : "POST",
	 						url : "/bangterior/house/InfoGet.do",
	 								data : "memseq=" + mm + "&seq=" + ss +"&txt=" +tt,
	 								dataType : "json",
	 								success : function(result) {
	 								
	 								
	 								  $(result).each(function(index, item) {
	 									 
	 								 });
	 								
	 								},
	 								error : function(a, b, c) {
	 									console.log(a, b, c);
	 									alert("실패");
	 									
	 								}
	 							});
	 			
	 	    	 }
	    });


	    //[기본] X 버튼 클릭 시 팝업창 닫기
	     $(".close_btn3").click(function(){
	    	
	    	 if($("#input1").val() == ""){
	        $(".modal3").attr("style", "display:none");
	        $(".basic_popup").attr("style", "display:none");	    		 
	    	 }else{
	    		 $(".modal3").attr("style", "display:none");
	 	        $(".basic_popup").attr("style", "display:none");
	 	   	$(".modal").attr("style", "display:none");
			$(".popup").attr("style", "display:none");
			var mm = ${memseq};
	 		   var ss = ${seq};
	 		   var tt = $("#input1").val();
	 		   $.ajax({
	 			   type : "POST",
	 						url : "/bangterior/house/InfoGet.do",
	 								data : "memseq=" + mm + "&seq=" + ss +"&txt=" +tt,
	 								dataType : "json",
	 								success : function(result) {
	 								
	 								
	 								  $(result).each(function(index, item) {
	 									 
	 								 });
	 								
	 								},
	 								error : function(a, b, c) {
	 									console.log(a, b, c);
	 									alert("실패");
	 									
	 								}
	 							});
			
		
			
			
	    	 }
	    });
	
	</script>
	<script>
		//버튼 클릭 시 팝업창 열기
		$(".question_btn2").click(function() {
			var mseq = ${memseq};
			if(mseq != 0){
			$(".modal2").attr("style", "display:block");
			$(".popup2").attr("style", "display:block");
				
			}else{
				$(".modalLogin").attr("style", "display:block");
				$("#login_popup").attr("style", "display:block");
			}
		
		});
		
		//[기본] X 버튼 클릭 시 팝업창 닫기
		$(".close_btn2").click(function() {
			$(".modal2").attr("style", "display:none");
			$(".popup2").attr("style", "display:none");
			$('#wrap').off('scroll touchmove mousewheel');
		});
		
		$(".ok_btn2").click(function() {
		/* 	$(".modal2").attr("style", "display:none");
			$(".popup2").attr("style", "display:none");
			$('#wrap').off('scroll touchmove mousewheel'); */
			
			 $(".modal4").css("display", "block");
		     $(".basic_popup4").css("display", "block");
		});
	</script>


	<script>
		//버튼 클릭 시 팝업창 열기
		var mseq = ${memseq};
		$(".question_btn").click(function() {
			if(mseq != 0){
			$(".modal").attr("style", "display:block");
			$(".popup").attr("style", "display:block");
			$("#input1").val("");
			
		}else{
			$(".modalLogin").attr("style", "display:block");
			$("#login_popup").attr("style", "display:block");
		}
		
		});
			
		
		
		//[기본] X 버튼 클릭 시 팝업창 닫기
		$(".close_btn").click(function() {
			$(".modal").attr("style", "display:none");
			$(".popup").attr("style", "display:none");
		
		});
		
		$(".ok_btn").click(function() {
/* 			$(".modal").attr("style", "display:none");
			$(".popup").attr("style", "display:none");
			$('#wrap').off('scroll touchmove mousewheel'); */
			
			/* $(".modal").attr("style", "display:none");
			$(".popup").attr("style", "display:none"); */
			if($("#input1").val() == ""){
				
	        $(".modal3").css("display", "block");
	        $(".basic_popup").css("display", "block");
	        $("#input").text("문의 내역을 입력해주세요.");
			}else{
			$(".modal3").css("display", "block");
		      $(".basic_popup").css("display", "block");
		      $("#input").text("완료 되었습니다.");
			}
		});
		
		//책갈피

		
	</script>
	<script type="text/javascript">
var get = ${seq};
var mmm =${memseq};
var aaa = 0;

    $.ajax({
		type : "POST",
		url : "/bangterior/house/HeartGet.do",
		data : "memseq=" + mmm + "&get=" + get,
		dataType : "json",
		success : function(result) {
			
			$(result).each(function(index, item) {
				aaa = item.index;
		}); 
		if(aaa >=1){
			$(".heart").attr("src","../images/heart_red.png");
		}else{
			$(".heart").attr("src","../images/heart.png");
		}
	
		},
		error : function(a, b, c) {
			console.log(a, b, c);
			/* alert("실패"); */
			
		}
	});
		
	</script>


	<!-- ajax -->
	<script>
	var memseq = ${memseq};


	
		
	if(memseq != 0){
		$(".heart").show();
	}else{
		$(".heart").hide();
	}
	
	setInterval(function() {  
		if(memseq != 0){
			$(".heart").show();
		}else{
			$(".heart").hide();
		}
	
	}, 100);
	
	
	/* alert($("#gnb li:nth-child(1)").text()); */
	/* alert($("#gnb li:nth-child(3)").text()); */
	</script>

	<script>
		var seq = ${seq}; //게시글 seq
		var nameqq = "${name}";
		var plist1 = [];
		var plist2 = [];
		var plist3 = [];
		
	 	$("#modalname").val(nameqq);
		var filename = [];
		var btnarea = "";
		var tel = 0;
		var tel1 = 0;
		var tel2 = 0;
		var tel3 = 0;
		var moveLatLon = "";
		var markerPosition = "";
		var marker = "";
		var graphadress = "";
		var typeseq = 0;
		var avg = 0;
		var change = 0;
		detail();
		budongsan();
		
		function detail() {
			$.ajax({
				type : "POST",
				url : "/bangterior/house/HouseSearchDetailOk.do",
				data : "seq=" + seq,
				dataType : "json",
				success : function(result) {
					
					$(result).each(function(index, item) {
						$("#housetitle").append(item.subject);
						var a = "";
						a += item.type + " ";
						if (item.depcost != 0) {
							a += item.depcost
							a += " / ";
						}
						a += item.cost;
						a += " 만원";
						$("#cost").append(a);
						$("#area").append(item.area + " ㎡");
						$("#mamulnum").append("매물번호 " + item.seq);
						$("#part1").css('background-image', 'url(/bangterior/pic/' + item.filename1 + ')');
						filename = [ item.filename1, item.filename2, item.filename3, item.filename4, item.filename5, item.filename6, item.filename7, item.filename8 ];
						$("#floor").append(item.floor + "층/" + item.totalfloor + "층");
						btnarea = $("#area").text();
						$("#areatxt").append(item.area + "/" + item.area2);
						$("#nanbang").append(item.nanbang);
						$("#el").append(item.el);
						$("#day").append(item.day);
						if (item.maincost == 0) {
							$("#maincost").append("없음");
						} else {
							$("#maincost").append(item.maincost + "만원");
						}
						$("#txt2").append(item.detailsubject);
						$("#detail").append(item.detailcontent);
						$("#leftimg").attr('src', item.filename);
						$("#modalimg").attr('src', item.filename)
						var modaltel = item.tel;
						graphadress = item.address;
						typeseq = item.typeseq;
						var modaltelspl = modaltel.split('-');
						$(".modaltel11").val(modaltelspl[0]);
						$(".modaltel22").val(modaltelspl[1]);
						$(".modaltel33").val(modaltelspl[2]);
						/* $("#modalname").val(item.seqname); */ 
						
						moveLatLon = new kakao.maps.LatLng(item.lat, item.lng);
						map.setCenter(moveLatLon);
						
						markerPosition = new kakao.maps.LatLng(item.lat, item.lng);
						
						// 마커를 생성합니다
						marker = new kakao.maps.Marker({
							position : markerPosition
						});
						
						marker.setMap(map);
						
						/* 그래프 시작 */
						/* 실거래가 */
						$.ajax({
							type : "POST",
							url : "/bangterior/house/HouseGraph.do",
							data : "typeseq=" + typeseq + "&graphadress=" + graphadress,
							dataType : "json",
							success : function(result) {
								
							 
							
							 $(result).each(function(index, item) {
								 pricelist.push(Number(item.data)); 
							 });
								/* Highcharts.chart('chart', options); */
								Highcharts.chart('container2', options2);
							},
							error : function(a, b, c) {
								console.log(a, b, c);
								alert("실패");
								
							}
						});
					
						/* 새로운 그래프 */
						
							
							
							$.ajax({
								type : "POST",
								url : "/bangterior/house/TypeGraph.do",
								data :"num=" + 1 +"&graphadress=" + graphadress,
								dataType : "json",
								success : function(result) {
									
									console.log(result);
								
								 $(result).each(function(index, item) {
									 plist1.push(Number(item.data));
				
								 });

						
									 Highcharts.chart('chart', options); 
								
								},
								error : function(a, b, c) {
									console.log(a, b, c);
									alert("실패");
									
								}
							});
							$.ajax({
								type : "POST",
								url : "/bangterior/house/TypeGraph.do",
								data :"num=" + 2 +"&graphadress=" + graphadress,
								dataType : "json",
								success : function(result) {
									
									console.log(result);
								
								 $(result).each(function(index, item) {
									 plist2.push(Number(item.data));
				
								 });

						
									 Highcharts.chart('chart', options); 
								
								},
								error : function(a, b, c) {
									console.log(a, b, c);
									alert("실패");
									
								}
							});
							
							$.ajax({
								type : "POST",
								url : "/bangterior/house/TypeGraph.do",
								data :"num=" + 3 +"&graphadress=" + graphadress,
								dataType : "json",
								success : function(result) {
									
									console.log(result);
								
								 $(result).each(function(index, item) {
									 plist3.push(Number(item.data));
				
								 });

						
									 Highcharts.chart('chart', options); 
								
								},
								error : function(a, b, c) {
									console.log(a, b, c);
									alert("실패");
									
								}
							});
						
						
						
						
						
						/* 평균가 */
						$.ajax({
							type : "POST",
							url : "/bangterior/house/HouseGraphAvg.do",
							data : "graphadress=" + graphadress,
							dataType : "json",
							success : function(result) {
								
						
							
							  $(result).each(function(index, item) {
								 pricelist2.push(Number(item.data)); 
							 });
							  /* Highcharts.chart('chart', options); */
								Highcharts.chart('container2', options2); 
							},
							error : function(a, b, c) {
								console.log(a, b, c);
								alert("실패");
								
							}
						});
						
						/* 그래프 끝  */
						/* 분석표 시작 */
						$.ajax({
							type : "POST",
							url : "/bangterior/house/HouseDoPyo.do",
							data : "seq=" + seq,
							dataType : "json",
							success : function(result) {
								
							 
							
							  $(result).each(function(index, item) {
								 pricelist3.push(Number(item.score));
								 change = parseInt(item.score);
								 avg += change;
							 });
							  avg = Math.round(avg / 5);
								
								 $("#avgscore").append(avg + " 점");
								 if(avg >=80){
									 $("#scoreimage").attr("src", "../images/happy.png");
								 }else if(avg <80 && avg >=60){
									 $("#scoreimage").attr("src", "../images/smile.png");
								 }else{
									 $("#scoreimage").attr("src", "../images/soso.png");
								 }
								 
								 
								 
							  Highcharts.chart('spider', options3);
								 
							},
							error : function(a, b, c) {
								console.log(a, b, c);
								alert("실패");
								
							}
						});
						
						$.ajax({
							type : "POST",
							url : "/bangterior/house/HouseDoPyoAvg.do",
							data : "graphadress=" + graphadress,
							dataType : "json",
							success : function(result) {
								
					
							  $(result).each(function(index, item) {
								 pricelist4.push(Number(item.score)); 
							 });
							  Highcharts.chart('spider', options3);
							},
							error : function(a, b, c) {
								console.log(a, b, c);
								alert("실패");
								
							}
						});
						/* 분석표 끝 */
					});
					
				},
				error : function(a, b, c) {
					console.log(a, b, c);
					alert("실패");
					
				}
			});
		};
		
		function budongsan() {
			$.ajax({
				type : "POST",
				url : "/bangterior/house/Budongsan.do",
				data : "seq=" + seq,
				dataType : "json",
				success : function(result) {
					
					$(result).each(function(index, item) {
						var sub1 = "";
						$(".budongsantitle").append(item.titlename);
						$(".budongsantxt").append(item.address);
						$(".daepyoname").append(item.name);
						tel = item.tel;
						if (tel.indexOf("-") != -1) {
							sub1 = tel;
						} else {
							sub1 = tel.slice(-7, -4);
							tel = tel.replace(sub1, "-" + sub1 + "-");
						}
						
						$(".daepyonum").append(tel);
						
					});
					
				},
				error : function(a, b, c) {
					console.log(a, b, c);
					alert("실패");
					
				}
			});
		};
		
		var filenum = 0;
		$("#leftbtn").click(function() {
			filenum -= 1;
			
			if (filenum < 0) {
				filenum = 7;
			}
			
			for (var i = 0; i < 7; i++) {
				if (filename[filenum] == "nopic.jpg") {
					filenum -= 1;
					if (filenum < 0) {
						filenum = 7;
					}
				}
			}
			
			$("#part1").css('background-image', 'url(/bangterior/pic/' + filename[filenum] + ')');
			
		});
		
		$("#rightbtn").click(function() {
			filenum += 1;
			
			if (filenum > 7) {
				filenum = 0;
			}
			
			for (var i = 0; i < 8; i++) {
				if (filename[filenum] == "nopic.jpg") {
					filenum += 1;
					if (filenum > 7) {
						filenum = 0;
					}
				}
			}
			
			$("#part1").css('background-image', 'url(/bangterior/pic/' + filename[filenum] + ')');
			
		});
		
		var btncontrol = 0;
		
		$("#btn1").click(function() {
			btncontrol += 1;
			if (btncontrol % 2 == 1) {
				$("#area").text(Math.ceil(($("#area").text().replace("㎡", "") / 3.31)) + " 평");
				/* alert(($("#area").text().replace("㎡","") / 3.31).toFixed(2)); */
				$("#btn1 span").text("㎡");
			} else {
				$("#area").text(($("#area").text().replace("평", "") * 3.31).toFixed(2) + " ㎡");
				$("#btn1 span").text("평");
			}
			
		});
	</script>



	<script>
	var heartdel = seq;
	
        $(document).on('click', '.heart', function(){
           
                if($(this).attr("src")=="../images/heart.png"){

                $(this).attr("src","../images/heart_red.png");
                /* alert($(this).attr('id')); */
                
                
                $.ajax({
					type : "POST",
					url : "/bangterior/house/HeartAdd.do",
					data : "memseq=" + memseq + "&heartdel=" + heartdel,
					dataType : "json",
					success : function(result) {
						
			
					
				
					},
					error : function(a, b, c) {
						console.log(a, b, c);
						/* alert("실패"); */
						
					}
				});
                
                
                
                }else if($(this).attr("src")!="../images/heart.png"){
                    $(this).attr("src","../images/heart.png");
                    
                    
                    $.ajax({
						type : "POST",
						url : "/bangterior/house/HeartDel.do",
						data : "memseq=" + memseq + "&heartdel=" + heartdel,
						dataType : "json",
						success : function(result) {
							
		
						
					
						},
						error : function(a, b, c) {
							console.log(a, b, c);
							/* alert("실패"); */
							
						}
					});
                }
                
            });             
            
            
            
            
        </script>












	<script>
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		
		var placeOverlay = new kakao.maps.CustomOverlay({
			zIndex : 1
		}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		markers = [], // 마커를 담을 배열입니다
		currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map);
		
		// 지도에 idle 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', searchPlaces);
		
		// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		contentNode.className = 'placeinfo_wrap';
		
		// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
		
		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);
		
		// 각 카테고리에 클릭 이벤트를 등록합니다
		addCategoryClickEvent();
		
		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
			if (target.addEventListener) {
				target.addEventListener(type, callback);
			} else {
				target.attachEvent('on' + type, callback);
			}
		}

		// 카테고리 검색을 요청하는 함수입니다
		function searchPlaces() {
			if (!currCategory) {
				return;
			}
			
			// 커스텀 오버레이를 숨깁니다 
			placeOverlay.setMap(null);
			
			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();
			
			ps.categorySearch(currCategory, placesSearchCB, {
				useMapBounds : true
			});
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				
				// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
				displayPlaces(data);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
				
			} else if (status === kakao.maps.services.Status.ERROR) {
				// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
				
			}
		}

		// 지도에 마커를 표출하는 함수입니다
		function displayPlaces(places) {
			
			// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
			// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
			var order = document.getElementById(currCategory).getAttribute('data-order');
			
			for (var i = 0; i < places.length; i++) {
				
				// 마커를 생성하고 지도에 표시합니다
				var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
				
				// 마커와 검색결과 항목을 클릭 했을 때
				// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
				(function(marker, place) {
					kakao.maps.event.addListener(marker, 'click', function() {
						displayPlaceInfo(place);
					});
				})(marker, places[i]);
			}
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, order) {
			var imageSrc = '/bangterior/images/1.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(11, 28)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});
			
			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다
			
			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		function displayPlaceInfo(place) {
			var content = '<div class="placeinfo">' + '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name
					+ '</a>';
			
			if (place.road_address_name) {
				content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>'
						+ '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
			} else {
				content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
			}
			
			content += '    <span class="tel">' + place.phone + '</span>' + '</div>' + '<div class="after"></div>';
			
			contentNode.innerHTML = content;
			placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
			placeOverlay.setMap(map);
		}

		// 각 카테고리에 클릭 이벤트를 등록합니다
		function addCategoryClickEvent() {
			var category = document.getElementById('category'), children = category.children;
			
			for (var i = 0; i < children.length; i++) {
				children[i].onclick = onClickCategory;
			}
		}

		// 카테고리를 클릭했을 때 호출되는 함수입니다
		function onClickCategory() {
			var id = this.id, className = this.className;
			
			placeOverlay.setMap(null);
			
			if (className === 'on') {
				currCategory = '';
				changeCategoryClass();
				removeMarker();
			} else {
				currCategory = id;
				changeCategoryClass(this);
				searchPlaces();
			}
		}

		// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		function changeCategoryClass(el) {
			var category = document.getElementById('category'), children = category.children, i;
			
			for (i = 0; i < children.length; i++) {
				children[i].className = '';
			}
			
			if (el) {
				el.className = 'on';
			}
		}
	</script>
	<!-- 선 그래프 -->

	<script type="text/javascript">
	var pricelist = [];
	var pricelist2 = [];
	var pricelist3 = [];
	var pricelist4 = [];
	var options = {
			colors : [ "#ee5656", "#3cba99", "#FCBD2E" ],
			title : {
				text : "실거래가 선그래프",
			},
			
			subtitle : {

			},
			
			yAxis : {
				title : {
					text : "가격",
				},
			},
			tooltip : {
				headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
				pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' + '<td style="padding:0"><b>{point.y:.1f} 억</b></td></tr>',
				footerFormat : "</table>",
				shared : true,
				useHTML : true,
			},
			
			xAxis : {
				accessibility : {
					rangeDescription : "Range: 2020 to 2020",
				},
				categories : [ "0", "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월" ],
			},
			
			legend : {
				layout : "vertical",
				align : "right",
				verticalAlign : "middle",
			},
			
			plotOptions : {
				series : {
					label : {
						connectorAllowed : false,
					},
					pointStart : 1,
				},
			},
			
			series : [ {
				data : plist1,
				name : "매매",
			}, {
				data : plist2,
				name : "월세",
			}, {
				data : plist3,
				name : "전세",
			}, ],
			
			responsive : {
				rules : [ {
					condition : {
						maxWidth : 500,
					},
					chartOptions : {
						legend : {
							layout : "horizontal",
							align : "center",
							verticalAlign : "bottom",
						},
					},
				}, ],
			},
		};
	Highcharts.chart('chart', options);
	</script>
	<script>
		$(".highcharts-credits").remove();
		$(".highcharts-credits").remove();
	</script>

	<!-- 막대그래프 -->
	<script type="text/javascript">
	var options2 = {
			colors : [ "#ee5656", "#3cba99" ],
			chart : {
				type : "column",
			},
			title : {
				text : "실거래가 막대그래프",
			},
			subtitle : {

			},
			xAxis : {
				categories : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월" ],
				crosshair : true,
			},
			yAxis : {
				min : 0,
				title : {
					text : "가격",
				},
			},
			tooltip : {
				headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
				pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' + '<td style="padding:0"><b>{point.y:.1f} 억</b></td></tr>',
				footerFormat : "</table>",
				shared : true,
				useHTML : true,
			},
			plotOptions : {
				column : {
					pointPadding : 0.2,
					borderWidth : 0,
				},
			},
			series : [ {
				name : "평균 가격",
				data : pricelist2,
			}, {
				name : "실거래 가격",
				data : pricelist,
			},

			],
		};
	Highcharts.chart('container2', options2);
		$(".highcharts-credits").hide();
	</script>
	<!-- 레이더 차트 -->
	<script>
	var options3 = { 
							colors : [ "#ee5656", "#3cba99" ],
							chart : {
								polar : true,
								type : "line",
							},
							
							accessibility : {
								description : "A spiderweb chart compares the allocated budget against actual spending within an organization. The spider chart has six spokes. Each spoke represents one of the 6 departments within the organization: sales, marketing, development, customer support, information technology and administration. The chart is interactive, and each data point is displayed upon hovering. The chart clearly shows that 4 of the 6 departments have overspent their budget with Marketing responsible for the greatest overspend of $20,000. The allocated budget and actual spending data points for each department are as follows: Sales. Budget equals $43,000; spending equals $50,000. Marketing. Budget equals $19,000; spending equals $39,000. Development. Budget equals $60,000; spending equals $42,000. Customer support. Budget equals $35,000; spending equals $31,000. Information technology. Budget equals $17,000; spending equals $26,000. Administration. Budget equals $10,000; spending equals $14,000.",
							},
							
							title : {
								text : "",
								x : -80,
							},
							
							pane : {
								size : "80%",
							},
							
							xAxis : {
								categories : [ "가격", "관리비", "편의시설", "보안", "고도" ],
								tickmarkPlacement : "on",
								lineWidth : 0,
							},
							
							yAxis : {
								gridLineInterpolation : "polygon",
								lineWidth : 0,
								min : 0,
							},
							
							tooltip : {
								shared : true,
								pointFormat : '<span style="color:{series.color}">{series.name}: <b>${point.y}</b><br/>',
							},
							
							legend : {
								align : "right",
								verticalAlign : "middle",
								layout : "vertical",
							},
							
							series : [ {
								name : "평균 점수",
								data : pricelist4,
								pointPlacement : "on",
							}, {
								name : "선택된 매물 점수",
								data : pricelist3,
								pointPlacement : "on",
							}, ],
							
							responsive : {
								rules : [ {
									condition : {
										maxWidth : 500,
									},
									chartOptions : {
										legend : {
											align : "center",
											verticalAlign : "bottom",
											layout : "horizontal",
										},
										pane : {
											size : "70%",
										},
									},
								}, ],
							},
						};
		$(".highcharts-credits").hide();
		Highcharts.chart('spider', options3);
	</script>
</body>
</html>
