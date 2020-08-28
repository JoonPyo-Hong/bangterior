<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
   <style>
      /* #container{
            background-color:#eee;
        } */
      #container:after {
        content: "";
        display: block;
        clear: both;
      }

      #container {
        height: 3000px;
      }
      /* 서브메뉴 */
      #container:after {
        content: "";
        display: block;
        clear: both;
      }
      #container {
        /* border: 1px solid red; */
        width: 1200px;
        height: 3000px;
        margin: 0px auto;
      }
     /* 서브메뉴 */
     #submenu{
            /* background-color:skyblue; */
            width:900px;
            height:150px;
            margin:0 auto;
            border-bottom:1px solid #ddd;
        }
      
        #submenu #subtitle{
            color:#444;
            font-size:2.5em;
            display:block;
            font-weight: bold;
            text-align: center;
            margin-top:60px;
            margin-bottom: 40px;
        }
        #submenu input[type="text"]{
            /* margin-left:0px; */
            width: 120px;
            text-align: center;
            font-size:1.1em;
            cursor:pointer;
            border:0px;
        }
        #submenu a{
            font-size:16px;
            margin-left:18px;
        }
        #submenu a input:hover{
            text-decoration: underline;
        }
        #container #submenu .click{
            text-decoration: underline;
            font-weight: bold;
        }
        /* end */

      .inputpost {
        width: 1000px;
        margin: 0px auto;
        margin-top: 100px;
      }

      .inputheader {
        /* border: 1px solid blue; */
        height: 30px;
        font-size: 1.4em;
        border-bottom: 3px solid #c6c6f3;
        padding-top: 30px;
        padding-bottom: 5px;
        color: #7674e2;
      }

      .inputline {
        height: 100px;
        font-size: 1.1em;
        color: #444;
        margin-top: 50px;
        padding-left: 15px;
      }

      .inputbtn {
        border: 0px;
        background-color: #e8e8e8;
        outline: none;
        height: 30px;
        width: 150px;
        cursor: pointer;
      }

      #uploadfile {
        width: 300px;
        background-color: white;
      }

      .sels {
        width: 200px;
        border: 2px solid #e8e8e8;
        outline: none;
        height: 30px;
        border-radius: 5px;
        padding-left: 15px;
      }

      /* 공통 버튼 & 공통 입력창 */

      .inputtext {
        border: 3.5px solid #e8e8e8;
        outline: none;
        width: 200px;
        height: 30px;
        border-radius: 5px;
        margin-right: 10px;
        padding-left: 15px;
        background-color: #e8e8e8;
        cursor: not-allowed;
        /* readonly는 추후 기능 추가 */
      }

      .inputtext:nth-child(2),
      .inputtext:nth-child(3) {
        margin-left: 10px;
      }

      .inputbtn {
        border: 0px;
        background-color: #e8e8e8;
        outline: none;
        height: 30px;
        width: 150px;
        cursor: pointer;
      }

      /* 포스트 */
      #poscode,
      #findposcode {
        margin-bottom: 30px;
      }

      #poscode {
        margin-right: 800px;
      }

      #address {
        width: 400px;
        margin-left: 0px;
      }

      #extraaddress {
        width: 430px;
      }

      .cb + span,
      .rb + span {
        margin-right: 20px;
      }

      .cb,
      .rb {
        margin-right: 5px;
      }

      #inputline1 {
        margin-bottom: 50px;
        height: 200px;
      }

      .img {
        width: 190px;
        height: 200px;
        border: 1px solid #ddd;
        float: left;
        margin-right: 20px;
      }

      /* 팝업 */

      .modal {
        display: none; /* 기본 화면에 숨기기 */
        position: fixed;
        z-index: 1001;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0, 0, 0);
        background-color: rgba(0, 0, 0, 0.4);
      }
      .basic_popup {
        display: none; /* 기본 화면에 숨기기 */
        z-index: 1002;
        position: absolute;
        left: 50%;
        top: 50%;
        margin-left: -200px;
        width: 500px;
        height: 700px;
        background-color: white;
        border: 1px solid #eee;
      }

      .basic_popup .ok_btn {
        cursor: pointer;
        text-align: center;
        width: 100px;
        margin-top: 40px;
        height: 40px;
        line-height: 40px;
        background-color: #7674e2;
        color: white;
        float: left;
        margin-left: 100px;
      }

      .basic_popup #popup_btn_area {
        width: 10px;
        margin: 0 auto;
      }

      .basic_popup #popup_btn_area .ok_btn {
        display: inline-block;
        margin-left: 10px;
      }

      .basic_popup #popup_btn_area .cancel_btn {
        background-color: #bbb;
        float: left;
      }
      #map {
        margin: 0 auto;
        width: 300px;
        height: 300px;
      }
      #addresspop {
        width: 300px;
        margin: 20px auto;
      }
      h1 {
        text-align: center;
        margin-bottom: 20px;
      }

      .btn {
        background-color: #7674e2;
        outline: none;
        border: 0px;
        width: 180px;
        height: 50px;
        font-size: 1.4em;
        color: white;
        border-radius: 5px;
        float: right;
        margin-right: 15px;
        margin-top: 150px;
      }

      #inputline6 {
        margin-bottom: 150px;
      }
      p{
        font-weight:bold;
      }
      input[type="button"]{
      	cursor:pointer;
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
 <!-- 서브메뉴 -->
        <%@ include file="/WEB-INF/views/member/my_submenu.jsp" %>
        
        <div id="inputcontainer" class="inputpost">
          <div id="inputcontent1" class="inputcontent">
            <div id="inputheader1" class="inputheader">
              <p>사진</p>
            </div>
            <div id="inputline1" class="inputline">
              <div class="imgbox">
               <img class="img" src="../pic/${dto.filename}">
              </div>
            </div>
          </div>
          <div id="inputcontent2" class="inputcontent">
            <div id="inputheader2" class="inputheader">
              <p>이름</p>
            </div>
            <div id="inputline2" class="inputline">
              <input
                type="text"
                id="inputname"
                class="inputtext"
                value="${dto.name }"
              />
            </div>
            <div id="inputcontent3" class="inputcontent">
              <div id="inputheader3" class="inputheader"><p>아이디</p></div>
              <div id="inputline3" class="inputline">
                <input
                  type="text"
                  id="inputid"
                  class="inputtext"
                  value="${dto.id }"
                />
              </div>
            </div>
            <div id="inputcontent4" class="inputcontent">
              <div id="inputheader4" class="inputheader"><p>휴대폰</p></div>
              <div id="inputline4" class="inputline">
                <input
                  type="text"
                  id="tel1"
                  class="inputtext inputtel"
                  value="${dto.tel }"
                />
              </div>
            </div>
            <div id="inputcontent5" class="inputcontent">
              <div id="inputheader5" class="inputheader"><p>Email</p></div>
              <div id="inputline5" class="inputline">
                <input
                  type="text"
                  id="email1"
                  class="inputtext"
                  value="${dto.email}"
                />
              </div>
            </div>
            <div id="inputcontent6" class="inputcontent">
              <div id="inputheader6" class="inputheader"><p>주소</p></div>
              <div id="inputline6" class="inputline">
                <!-- <input
                  type="text"
                  id="poscode"
                  class="inputtext"
                  value="05630"
                /> 우편번호 없음 -->
                <input
                  type="text"
                  id="address"
                  class="inputtext"
                  value="${dto.address}"
                />
              </div>
            </div>
             <div id="inputcontent7" class="inputcontent">
              <div id="inputheader7" class="inputheader"><p>회원 유형</p></div>
              <div id="inputline7" class="inputline">
                <input
                  type="text"
                  class="inputtext"
                  id="inputjob"
                  value="${dto.memtype}"
                />
              </div>
            </div> 

            <div id="inputcontent8" class="inputcontent">
              <div id="inputheader8" class="inputheader"><p>결혼</p></div>
              <div id="inputline8" class="inputline">
                <input class="rb married" type="radio" name="rb" /><span id="married">기혼</span>
                <input class="rb nonmarried" type="radio" name="rb" /><span id="nonmarried">미혼</span>
              </div>
            </div>

            <div id="inputcontent9" class="inputcontent">
              <div id="inputheader9" class="inputheader">
                <p>원하는 옵션</p>
              </div>
              <div id="inputline9" class="inputline">
                <div id="cbbox">
                  <c:forEach items="${optlist}" var="dto">
                 <span style="margin-right:10px;">${dto.optname} </span>
                  </c:forEach>
                </div>
              </div>
            </div>
          </div>
          <!-- 수 정, 삭제 버튼-->
          <div id="btn">
          <a href = "../member/editmypage.do?seq=${dto.memseq }">
            <input
              id="changebtn"
              class="btn"
              type="button"
              value="회원 정보 수정"
            />
            </a>
            <input id="deletebtn" class="btn" type="button" value="회원 탈퇴" />
          </div>
        </div>
       </div>
      </div>
    <!-- 삭제 팝업 -->
            <div class="modal"></div>
            <div class="delete basic_popup">
                <div class="close_btn"><img src="../images/close.png"></div>
                <p>회원 탈퇴를 하시겠습니까?</p>
                <div id="popup_btn_area">
                    <a href="../member/bypageOk.do?seq=${dto.memseq}"><div class="ok_btn">확인</div></a>
                    <div class="ok_btn cancel_btn">취소</div>
                </div>
            </div> 
			


        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        

	<script>
    //버튼 클릭 시 팝업창 열기
    $("#deletebtn").click(function(){
        $(".modal").attr("style", "display:block");
        $(".basic_popup").attr("style", "display:block");
    });
    
    //버튼 클릭 시 팝업창 닫기
     $(".ok_btn").click(function(){
        $(".modal").attr("style", "display:none");
        $(".basic_popup").attr("style", "display:none");
    });


    //[기본] X 버튼 클릭 시 팝업창 닫기
     $(".close_btn").click(function(){
        $(".modal").attr("style", "display:none");
        $(".basic_popup").attr("style", "display:none");
    });
    
	if(${dto.marsta}==0){
		$(".rb.nonmarried").attr("checked","false");
		$(".rb").hide();	
		$("#married").attr("hidden","true");
		
	}
	else{
		$(".married.rb").attr("checked","true");
		$(".rb").hide();
		$("#nonmarried").attr("hidden","true");
	}
	
	$("#myinfo").attr("class","click");
	


	</script>
</body>
</html>