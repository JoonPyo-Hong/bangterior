<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_admin.css">
<link rel="stylesheet" href="/bangterior/css/agencyregview.css">
<style>
#nav {
    /* height: 1100px; */
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
	<!-- index.jsp (admin)  -->


    <!-- 전체 -->
    <div id="wrap">
        
        <!-- header -->
		<%@ include file="/WEB-INF/views/inc/admin/header.jsp" %>


        <!-- nav -->
		<%@ include file="/WEB-INF/views/inc/admin/nav.jsp" %>


        <div id="container">
            <div class="top_box"></div>
            <div class="box">
            <!-- 작업 내용 -->
            
            
            
                   <!-- 실제 컨텐츠 구역  -->
                <div id="title">중개사 승인</div>

                <div id="sub_box">

                    <!-- 왼쪽 컨텐츠 -->
                    <div id="left">
                        <img src="../images/${list[0]}" id="img1">
                        <!-- <div id="info_id">생년월일: <input type="text" id="id_text" value="A중개사" readonly></div> -->
                        <div id="info1"" class="basic_info">
                            <span class="s">성별</span>
                            <img src="../images/gender-fluid.png" id="info_img1" class="info_img">
                            <div class="sub_txt">${list[1]}</div>
                        </div>
                        
                        <div id="info2"" class="basic_info">
                            <span class="s">생년월일</span>
                            <img src="../images/year.png" id="info_img2" class="info_img">                            
                            <div class="sub_txt">${list[2]}</div>
                        </div>
                        
                        <div id="info3"" class="basic_info">
                            <span class="s">전화번호</span>
                            <img src="../images/call.png" id="info_img3" class="info_img">                            
                            <div class="sub_txt">${list[3]}</div>
                        </div>

                    </div>

                    <!-- 오른쪽 컨텐츠 -->
                    <div id="right">

                        <div id="main">
                        <div id="content">

                            <div id="name" class="info"><span class="s">이름</span> ${list[4]}</div>
                            <div id="member_id" class="info"><span class="s">아이디</span> ${list[5]} </div>
                            <div id="info_file" class="info">
                                <span class="s">공인중개사 자격증 파일</span> 
                                <!-- <input type="button" value="file Download" id="download"> -->
                                ${list[6]}
                                <img src="../images/download.png" id="download">
                            </div>
                            
                            <div id="reg_num" class="info"><span class="s">개설 등록 번호</span> ${list[7]}</div>
                            <div id="comp_name" class="info"><span class="s">사무소 명칭</span> ${list[8]}</div>
                            <div id="address" class="info"><span class="s" id="info_s">사무소 소재시</span> <div id="address_txt">${list[9]}</div></div>
                            <div id="tel" class="info"><span class="s">전화번호</span> ${list[10]}</div>
                            <!-- <div id="fax" class="info"><span class="s">팩스</span> 02-1234-5678</div> -->


                        </div>
							<c:if test="${confirm eq '대기'}">
                            <div id="btns">
                                <input type="button" value="인증 확인" id="reg_btn">
                                <input type="button" value="신청 거부" id="del_btn">
                            </div>
							</c:if>
                    

                </div>
            
            
            
            
            
            
            
            
            
            </div>
            
            <div style="clear:both;"></div>
        </div>

        <div style="clear:both;"></div>
    
    
    
    		<div class="modal4" style="position: fixed; left: 0px; top: 0px;">
	</div>
	<div class="basic_popup4 popup4 complete4 getcom4">
		<div class="close_btn4" id="comclose4">
			<img src="/bangterior/images/close.png" />
		</div>
		<p>
			<span id="input4">완료 되었습니다.</span>
		</p>
		<div class="ok_btn4" id="comok4">확인</div>
	</div>

</body>
<script type="text/javascript">
var temp = 0;
$('#reg_btn').click(function(){
	temp = 1;
	$(".modal4").attr("style", "display:block");
	$("#input4").text("승인이 완료 되었습니다.");
	$(".modal4").css("display", "block");
	$(".basic_popup4").css("display", "block");
});
$('#del_btn').click(function(){
	temp = 2;
	$(".modal4").attr("style", "display:block");
	$("#input4").text("승인거부가 완료 되었습니다.");
	$(".modal4").css("display", "block");
	$(".basic_popup4").css("display", "block");
});
$(".close_btn4").click(function(){
	$(".modal4").attr("style", "display:none");
	$(".modal4").css("display", "none");
	$(".basic_popup4").css("display", "none");
	location.href = '/bangterior/admin/agencyregviewOk.do?temp=' +temp +"&seq=" + ${seq};
});
$(".ok_btn4").click(function(){
	$(".modal4").attr("style", "display:none");
	location.href = '/bangterior/admin/agencyregviewOk.do?temp=' +temp +"&seq=" + ${seq};
	$(".modal4").css("display", "none");
	$(".basic_popup4").css("display", "none");
});
</script>
</html>