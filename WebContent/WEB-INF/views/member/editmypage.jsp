<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<link rel="stylesheet" href="/bangterior/css/basic_popup.css">
    <style>
      /* #container{
            background-color:#eee;
        } */
   
      /* 서브메뉴 */
      #container:after {
        content: "";
        display: block;
        clear: both;
      }
      #container {
        /* border: 1px solid red; */
        width: 1200px;
        height: 2800px;
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
        padding-top: 10px;
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
	`	
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
        width: 200px;
        height: 30px;
        border-radius: 5px;
        margin-right: 10px;
        padding-left: 15px;
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
      /* 물음표 */
      #img1 {
        width: 15px;
        height: 15px;
        cursor: pointer;
        /* float: right; */
        margin-right: 360px;
        /* margin-bottom: 100px; */
        display: inline-block;
      }
		.img {
        width: 190px;
        height: 200px;
        border: 1px solid #ddd;
        float: left;
        margin-right: 20px;
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

      .roomimg {
        width: 250px;
        height: 200px;
        border: 1px solid black;
        float: left;
        margin-right: 20px;
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
        margin-top: 100px;
      }

      #inputline6 {
        margin-bottom: 150px;
      }
      p{
        font-weight:bold;
      }
      .btn {
      	cursor:pointer;
      }
      .upload{
      	margin:0px;
      }
      .pw{
      	margin:10px;
      }
	  #inputcontentpw{
	  	height:300px;
	  }
      
    </style>
    
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<!-- index.jsp (member)  -->



   <!-- 전체 -->
    <div id="wrap">
        
        <!-- header -->
        <%@include file="/WEB-INF/views/inc/member/header.jsp" %>
		
            <!-- nav -->template.jsp
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
 <!-- 서브메뉴 -->
      <%@ include file="/WEB-INF/views/member/my_submenu.jsp" %>
       
      
        <div id="inputcontainer" class="inputpost">
          <div id="inputcontent1" class="inputcontent">
            <div id="inputheader1" class="inputheader">
              <p>사진</p>
            </div>
            <div id="inputline1" class="inputline">
           
              <div class="imgbox">
               <img id="inputimg" class="img" src="../pic/${dto.filename}">
              </div>
            </div>
             <form method="POST" action="../member/uploadok.do" enctype="multipart/form-data">
            <input type="file" name="filename" id="uploadfile" class="
            inputbtn" />
            <button class="btn btn-default u" type="submit" >이미지 저장</button>
           	<input type="hidden" name="seq" id="seq" value="${dto.memseq }"> 
            </form>
          </div>
          <div id="inputcontent2" class="inputcontent">
            <div id="inputheader2" class="inputheader">
              <p>이름</p>
            </div>
           
            <div id="inputline2" class="inputline">
              <input
                type="text"
                name="inputname"
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
                  value="${dto.id}"
                  readonly
                />
               
              </div>
            </div>
             <div class="inputcontent" id="inputcontentpw">
             <div  class="inputheader"><p>비밀번호 수정</p></div>
             <div  class="inputline">
              	<div class="content_title">비밀번호</div>
				<div class="content_content">
				    <input type="password" id="password_1" class="pw inputtext" placeholder="비밀번호" required>
				    <span>8~15자리의 영문, 숫자만 입력이 가능합니다.</span>
				</div>
			 
				<div class="content_title">비밀번호 확인</div>
				<div class="content_content">
				    <input type="password" id="password_2" class="pw inputtext" placeholder="비밀번호 확인" required>
				    <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
				    <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
				</div>
              </div>
            </div>
            <div id="inputcontent4" class="inputcontent">
              <div id="inputheader4" class="inputheader"><p>연락처</p></div>
              <div id="inputline4" class="inputline">
                <input
                  type="text"
                  id="inputtel"
                  class="inputtext inputtel"
                  value="${dto.tel }"
                />
<!--                 <input -->
<!--                   type="text" -->
<!--                   id="tel2" -->
<!--                   class="inputtext inputtel" -->
<!--                   value="1234" -->
<!--                 />- -->
<!--                 <input -->
<!--                   type="text" -->
<!--                   id="tel3" -->
<!--                   class="inputtext inputtel" -->
<!--                   value="4567" -->
<!--                 /> -->
              </div>
            </div>
            <div id="inputcontent5" class="inputcontent">
              <div id="inputheader5" class="inputheader"><p>Email</p></div>
              <div id="inputline5" class="inputline">
              <c:set var="email_id" value="${fn:split(dto.email,'@')}"></c:set>
                <input
                  type="text"
                  id="email1"
                  class="inputtext"
                  value="${email_id[0]}"
                />@<input
                  type="text"
                  id="email2"
                  class="inputtext"
                  value="${email_id[1] }"
                />
                        <select name="selectEmail" id="selectEmail"> 
                            <option value="naver.com" selected>naver.com</option>
                            <option value="hanmail.net">daum.net</option>
                            <option value="kakao.com">kakao.com</option>
                            <option value="nate.com">nate.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="5">직접입력</option> 
                        </select>
              </div>
            </div>
            <div id="inputcontent6" class="inputcontent">
              <div id="inputheader6" class="inputheader"><p>주소</p></div>
              <div id="inputline6" class="inputline">
                   <c:set var="address_split" value="${fn:split(dto.address,' ')}"></c:set>
                <input
                  type="text"
                  id="poscode"
                  class="inputtext"
                  value="${address_split[0] }"
                />

                <input
                  type="button"
                  value="우편 번호 검색"
                  class="inputbtn"
                  id="findposcode"
                />
                <input
                  type="text"
                  id="address"
                  class="inputtext"
                  value="${address_split[1]} ${address_split[2]} ${address_split[3]}"
                />
                <input
                  type="text"
                  id="extraaddress"
                  class="inputtext"
                  value="${address_split[4]}${address_split[5]}${address_split[6]}${address_split[7]}"
                />
              </div>
            </div>
<!--             <div id="inputcontent7" class="inputcontent"> -->
<!--               <div id="inputheader7" class="inputheader"><p>직업</p></div> -->
<!--               <div id="inputline7" class="inputline"> -->
<!--                 <input -->
<!--                   type="text" -->
<!--                   class="inputtext" -->
<!--                   id="inputjob" -->
<!--                   value="무직" -->
<!--                 /> -->
<!--               </div> -->
<!--             </div> -->

            <div id="inputcontent8" class="inputcontent">
              <div id="inputheader8" class="inputheader"><p>결혼</p></div>
              <div id="inputline8" class="inputline">
                <input class="rb" type="radio" name="rb" value="1" checked /><span
                  >기혼</span
                >
                <input class="rb" type="radio" name="rb" value="0"/><span>미혼</span>
              </div>
            </div>

            <div id="inputcontent9" class="inputcontent">
              <div id="inputheader9" class="inputheader">
                <p>원하는 옵션</p>
              </div>
              <div id="inputline9" class="inputline">
              
               <form method="POST" action ="../member/optOk.do">
                <div id="cbbox">
                <c:forEach items="${allopt }" var = "allopt">
<%-- 				  ${allopt.optseq } --%>
                  <input value="${allopt.optseq}" name= "optcb" id="cb${allopt.optseq}" class="cb" type="checkbox"/>
                  <span>${allopt.optname } </span>     
                </c:forEach>                
                </div>
                <input type="hidden" name="seq" id="seq" value="${dto.memseq }">
                <button type="submit">옵션 저장</button>
              </form>
               
              </div>
            </div>
          <!-- 수정, 삭제 버튼-->
          <div id="btn">
            <input id="changebtn" class="btn" type="button" value="수정 완료" />
          </div>
        </div>
          </div>
  		
        </div>
		 
            <!-- 수정 팝업 -->
            <div class="modal"></div>
            <div class="change basic_popup">
                <div class="close_btn"><img src="../images/close.png"></div>
                <p>입력된 정보로 수정하시 겠습니까?</p>
                <div id="popup_btn_area">
                   <form id="change_form" method="GET" action="/bangterior/member/mypageOk.do">
	              	<input type="hidden" value="" name="name" id="edit_name">
	              	<input type="hidden"value="" name="tel" id="edit_tel">
	              	<input type="hidden"value="" name="email" id="edit_email">
	              	<input type="hidden" value="" name="address" id="edit_address">
	              	<input type="hidden" value="" name="marsta" id="edit_marsta">
	              	<input type="hidden" value="" name="pw" id="edit_pw">
	              	<input type="hidden" value="${dto.memseq }" name="memseq">
                    <div id="editbtn" class="ok_btn">확인</div>
                    <div class="ok_btn cancel_btn">취소</div>
	                </form> 
                </div>
           </div> 
		
        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        

	<script>
	var pic = $("#uploadfile");
	var fileValue = $("#uploadfile").val().split("\\");
	var fileName = fileValue[fileValue.length-1];

	$("#editbtn").click(function() {
		$("#change_form").submit();
	});
	$(".okonly").change(function(){
	alert(pic);
	console.log($(".cb:checked").val());
	});
	
	
    
    //버튼 클릭 시 팝업창 닫기
     $(".okonly").click(function(){
        $(".modal").attr("style", "display:none");
        $(".change").attr("style", "display:none");
    });


    //[기본] X 버튼 클릭 시 팝업창 닫기
     $(".close_btn").click(function(){
        $(".modal").attr("style", "display:none");
        $(".basic_popup").attr("style", "display:none");
    });
    
     //수정 팝업
     $("#changebtn").click(function(){
         $(".modal").attr("style", "display:block");
         $(".basic_popup").attr("style", "display:block");
         $("#edit_name").val($("#inputname").val());
         $("#edit_email").val($("#email1").val()+"@"+$("#email2").val());
         $("#edit_address").val($("#poscode").val()+" "+$("#address").val()+" "+$("#extraaddress").val());
         $("#edit_tel").val($("#inputtel").val());
         $("#edit_marsta").val($(".rb:checked").val());
         $("#edit_pw").val($("#password_2").val());
         $("#edit_img").val();
     });	  
	  
	  // 이메일 입력란
    $("#selectEmail").change(function () {
    $("#selectEmail option:selected").each(function () {
      if ($(this).val() == "5") {
        $("#email2").val("");
        $("email2").removeAttr('readonly');
      } else {
        $("#email2").val($(this).text());
        $("#email2").attr("readonly");
      }
    });
  });
	  
	  
    var findposcode = document.getElementById("findposcode");

    findposcode.onclick = function () {
      //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
      daum.postcode.load(function () {
        new daum.Postcode({
          oncomplete: function (data) {
            var addr = ""; // 주소 변수
            var extraAddr = ""; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === "R") {
              // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
            } else {
              // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("poscode").value = data.zonecode;
            document.getElementById("address").value = addr;

            document.getElementById("extraaddress").value = null;
            document.getElementById("extraaddress").focus();
          },
        }).open();
      });
    };
	
    $('.pw').focusout(function () {
        var pwd1 = $("#password_1").val();
        var pwd2 = $("#password_2").val();
 
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
    });
  
	</script>
</body>
</html>