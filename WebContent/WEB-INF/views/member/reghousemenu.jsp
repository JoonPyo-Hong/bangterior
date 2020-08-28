<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">    

<!-- 팝업 -->
<link rel="stylesheet" type="text/css" href="/bangterior/css/basic_popup.css" />

<style>

/* 해당 페이지 스타일 작업 영역 */
      /*컨테이너 */
      #container {
        width: 1200px;
        height: 500px;
        text-align: center;
        margin: 0px auto;
      }

      /* 서브타이틀 */
      #head {
        font-size: 2.5em;
        /* border-bottom: 1px solid rgb(235, 235, 235); */
        width: 500px;
        margin: 0px auto;
        color: #333;
        font-weight: bold;
      }
      /* 버튼 모양 */
      .btns {
        /* border: 1px solid black; */
        border-radius: 75px;
        width: 150px;
        height: 130px;
        font-size: 1.1em;
        margin-left: 16px;
        background-color: rgb(235, 235, 235);
        cursor: pointer;
        padding-top: 20px;
      }
      /* 버튼 & 컨텐츠 담는 그릇 */
      .box {
        float: left;
        margin-top: 100px;
        margin-left: 165px;
        text-align: center;
        color: #333;
      }

      /* 버튼 속 아이콘 */
      .btns .fas {
        font-size: 4em;
        margin-left: 29px;
        margin-right: 29px;
      }

      /* 버튼 속 메뉴이름 */
      .btns p {
        margin-top: 10px;
      }

      /* 컨텐츠 */
      .content {
        width: 185px;
        font-size: 0.8em;
        margin-top: 10px;
        color: #e8e8e8;
      }

      /* 버튼 위에 누르면 색상 변경 */
      .btns:hover + .content {
        color: #333;
        transition: 0.4s;
      }

      .btns:hover {
        background-color: #7674e2;
        color: white;
        transition: 0.4s;
      }
      
      
        
      
      
      
</style>
</head>
<body>
	<!-- index.jsp (member)  -->



   <!-- 전체 -->
    <div id="wrap">
        
        <!-- header -->
        <%@include file="/WEB-INF/views/inc/member/header.jsp" %>

         
    
     

        <!-- container -->
        <div id="container">
	  <div id="head">
          <p id="submenu">매물 등록</p>
        </div>
        <!-- 버튼 & 내용물 담는 상자 -->
        <div id="box1" class="box">
          <!-- 버튼 & 아이콘 -->
          <!-- 매물 등록 -->
          <div id="btn1" class="btns">
            <i class="fas fa-home"></i>
            <p>방 내놓기</p>
          </div>
          <p id="content1" class="content">
            더 이상 발품 팔지 마세요. <br>간편하게 해결하세요.
          </p>
        </div>
        <div id="box2" class="box">
          <div id="btn2" class="btns">
            <i class="fas fa-users"></i>
            <p>등본 등록</p>
          </div>
          <p id="content2" class="content">
            중개사무소를 통하지 않고 <br>직접 판매해보는 내 집!
          </p>
        </div>
        <div id="box3" class="box">
          <div id="btn3" class="btns">
            <i class="fas fa-user-tie"></i>
            <p>공인중개사 인증</p>
          </div>
          <p id="content3" class="content">
            공인중개사 등록 후 좀 더 쉽게 <br>빈 집을 판매해보세요!
          </p>
        </div>
        
     
		<!-- 확인 버튼 1개 팝업창 -->
        <div class="modal"></div>
        <div class="basic_popup nodoc">
          <div class="close_btn"><img src="/bangterior/images/close.png" /></div>
          <p>
            매물 등록 안내<br />해당 메뉴는 중개사 인증 또는 본인 인증 후에<br />
            사용하실 수 있습니다.
          </p>
          <div class="ok_btn">확인</div>
        </div>
        
        <!-- 비회원이 접근시 뜨는   -->
         <div class="basic_popup nonlogin">
          <div class="close_btn"><img src="/bangterior/images/close.png" /></div>
          <p>
            매물 등록 안내<br />해당 메뉴는 로그인 후에<br />
            사용하실 수 있습니다.
          </p>
          <div class="ok_btn">확인</div>
        </div>
        
        
        <!-- 이미 등본 등록 완료   -->
         <div class="basic_popup alreadycopy">
          <div class="close_btn"><img src="/bangterior/images/close.png" /></div>
          <p>
            등본 등록 안내<br />해당 아이디는 이미<br />
            등록 완료되었습니다.
          </p>
          <div class="ok_btn">확인</div>
        </div>
        
        
        
        <!-- 이미 자격증 등록 완료   -->
         <div class="basic_popup alreadyagency">
          <div class="close_btn"><img src="/bangterior/images/close.png" /></div>
          <p>
            공인중개사 등록 안내<br />해당 아이디는 이미<br />
            등록 완료되었습니다.
          </p>
          <div class="ok_btn">확인</div>
        </div>
        
    
		
   <!-- container -->
      </div>
  

        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        
 </div>
	<script>
	

    //버튼 클릭 시 팝업창 닫기
    $(".ok_btn").click(function () {
      $(".modal").attr("style", "display:none");
      $(".basic_popup").attr("style", "display:none");
    });
    
  //버튼 클릭 시 팝업창 닫기
    $(".close_btn").click(function () {
      $(".modal").attr("style", "display:none");
      $(".basic_popup").attr("style", "display:none");
    });
    
    
    //로그인했을 시 등본이나 자격증 등록 후에 매물 등록 가능하게끔
    $("#btn1").click(function(){
    	
    	//비회원
    	if( ${empty seq} ){
    		$(".modal").css("display", "block");
        	$(".nonlogin").css("display", "block");
        	}
    	
    	
    	//문서 갯수가 0일 경우 
    	else if(${doccnt} == 0){
    		//등록 불가 안내 팝업
    		$(".modal").css("display", "block");
    	    $(".nodoc").css("display", "block");
    	} else {
    	//문서가 등록 되어 있는 경우 화면 전환	
        	location.href="/bangterior/member/regroom.do";

    	}
    	
    	
    });
    
    
    //비회원이 접근시
    /* $(".btns").click(function(){
    	if( ${empty seq} ){
    		$(".modal").css("display", "block");
        	$(".nonlogin").css("display", "block");
        	}
    }); */

    
    //등본 등록
    $("#btn2").click(function(){
    	
    	//비회원
    	if( ${empty seq} ){
    		$(".modal").css("display", "block");
        	$(".nonlogin").css("display", "block");
        	}
    	
    	
    	else if(${copycnt} == 0){
    		//등본 등록 x --> 등본 등록
        	location.href="/bangterior/member/regattdoc.do";
    	} else {
        		//등본이 등록되어있는 경우
        		$(".modal").css("display", "block");
        	    $(".alreadycopy").css("display", "block");
    	}
    });

    //공인중개사 등록
    $("#btn3").click(function(){
    	
    	//비회원
    	if( ${empty seq} ){
    		$(".modal").css("display", "block");
        	$(".nonlogin").css("display", "block");
        	}
    	

    	else if(${agencycnt} == 0){
    		//자격증 등록 x --> 자격증 등록
        	location.href="/bangterior/member/regcertidoc.do";
    	} else {
        		//자격증이 등록되어있는 경우
        		$(".modal").css("display", "block");
        	    $(".alreadyagency").css("display", "block");
        	
    	}
    });
    
	
	
	
	
	</script>
</body>
</html>