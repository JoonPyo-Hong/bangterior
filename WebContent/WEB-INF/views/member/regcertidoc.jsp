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

      #container {
        width: 1200px;
        height: 1900px;
        margin: 0px auto;
      }

      .inputheader p {
    margin-top: 10px;
}

      #head {
        margin-top: 30px;
        margin-bottom: 70px;
      }

      #title {
        font-size: 2.5em;
        color: #444;
        /* display: inline-block; */
        text-align: center;
      }

      #warning {
        font-size: 0.8em;
        color: #ee5656;
        display: inline-block;
        margin-top: 35px;
        margin-left: 760px;
      }

      /* 박스 */

      .inputpost {
        width: 1000px;
        margin-left: 100px;
        /* border: 1px solid black; */
      }

      .inputheader {
        /* border: 1px solid blue; */
        height: 50px;
        font-size: 1.4em;
        border-bottom: 3px solid #c6c6f3;
        padding-top: 10px;
        /* padding-bottom: 5px; */
        color: #7674e2;
      }

      .inputheader p {
        margin-top: 10px;
      }

      .inputline {
        height: 100px;
        font-size: 1.1em;
        color: #444;
        margin-top: 50px;
        padding-left: 15px;
      }

      .inputtext {
        border: 3.5px solid #e8e8e8;
        outline: none;
        width: 285px;
        height: 30px;
        border-radius: 5px;
        margin-right: 40px;
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

      #poscode,
      #findposcode {
        margin-bottom: 30px;
      }

      #findposcode {
        margin-right: 400px;
      }

      #address {
        width: 400px;
      }

      #extraaddress {
        width: 450px;
      }
      #inputline4 {
        margin-bottom: 50px;
      }

      .getoffnum{
        top: 80%;
      }
      
      .getcom{
        top: 180%;
      }

      #uploadbtn {
        width: 130px;
        height: 50px;
        outline: none;
        border: 0px;
        background-color: #7674e2;
        cursor: pointer;
        float: right;
        text-align: center;
        padding-top: 20px;
        margin-top: 150px;
        font-size: 1.1em;
        color: white;
      }



</style>
</head>
<body>
	<!-- index.jsp (member)  -->



   <!-- 전체 -->
    <div id="wrap">
        
        <!-- header -->
        <%@include file="/WEB-INF/views/inc/member/header.jsp" %>

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
	
			
			<div id="head">
          <h1 id="title">공인중개사 인증</h1>
          <p id="warning">
            해당 메뉴는 공인중개사 사무소를 개설한 회원만 이용 가능합니다.
          </p>
        </div>
        <form method="POST" action="/member/regcertidocok.do">
        <div id="inputcontainer" class="inputpost">
      <div id="inputcontent1" class="inputcontent">
        <div id="inputheader1" class="inputheader">
          <p>공인 중개사 자격증 파일 등록</p>
        </div>
        <div id="inputline1" class="inputline">
          <input type="file" name="uploadfile" id="uploadfile" class="inputbtn" />
        </div>
      </div>
      <div id="inputcontent2" class="inputcontent">
        <div id="inputheader2" class="inputheader">
          <p>사무실 개설 등록 번호</p>
        </div>
        <div id="inputline2" class="inputline">
          <input
            type="text"
            id="inputnum"
            name="inputnum"
            class="inputtext"
            placeholder="'제', '호'를 제외한 정확한 번호를 입력하시오."
 			
          /><input
            type="button"
            value="개설 번호 인증하기"
            id="inputbtn1"
            name="inputbtn1"
            class="inputbtn"
          />
        </div>
      </div>
      <div id="inputcontent3" class="inputcontent">
        <div id="inputheader3" class="inputheader"><p>사무실 명칭</p></div>
        <div id="inputline3" class="inputline">
          <input
            type="text"
            id="inputname"
            name="inputname"
            class="inputtext"
            placeholder="예) '홍길동 부동산'"
            disabled
          />
        </div>
      </div>
      <div id="inputcontent4" class="inputcontent">
        <div id="inputheader4" class="inputheader"><p>사무소 소재지</p></div>
        <div id="inputline4" class="inputline">
          <input
            type="text"
            id="poscode"
            name="poscode"
            class="inputtext"
            placeholder="우편 번호 검색"
            disabled
          />
          <input
            type="button"
            value="우편 번호 검색"
            class="inputbtn"
            id="findposcode"
            name="findposcode"
            disabled
          />
          <input
            type="text"
            id="address"
            name="address"
            class="inputtext"
            placeholder="주소 입력"
            disabled
          />
          <input
            type="text"
            class="inputtext"
            id="extraaddress"
            name="extraaddress"
            placeholder="상세 주소 입력"
          disabled
          />
        </div>
      </div>
      <div id="inputcontent5" class="inputcontent">
        <div id="inputheader5" class="inputheader"><p>전화번호</p></div>
        <div id="inputline5" class="inputline">
          <input
            type="text"
            placeholder="예) 021235678"
            class="inputtext"
            id="call"
            name="call"
            disabled
          />
        </div>
      </div>
      <div id="inputcontent6" class="inputcontent">
        <div id="inputheader6" class="inputheader"><p>팩스</p></div>
        <div id="inputline6" class="inputline">
          <input
            type="text"
            placeholder="예) 02-789-4561"
            class="inputtext"
            id="pax"
            name="pax"
            disabled
          />
        </div>
      </div>
    </div>
              <div id="uploadbtn">등록하기</div>
  </form>
  
  		<!-- 인증 실패시  -->
        <div class="modal"></div>
        <div class="basic_popup popup_fail getoffnum">
          <div class="close_btn"><img src="/bangterior/images/close.png" /></div>
          <p>
            인증 실패<br />해당 번호는 공인 중개사 개설 번호에<br />
            등록되어 있지 않습니다.
          </p>
          <div class="ok_btn">확인</div>
        </div>
        
        <!-- 인증성공 -->
         <div class="basic_popup popup_success getoffnum">
          <div class="close_btn"><img src="/bangterior/images/close.png" /></div>
          <p>
            인증 완료<br />인증 완료되었습니다.
          </p>
          <div class="ok_btn">확인</div>
        </div>
        
        <!-- 이미 등록된 번호 -->
         <div class="basic_popup popup_alreadyexist getoffnum">
          <div class="close_btn"><img src="/bangterior/images/close.png" /></div>
          <p>
            인증 실패<br />해당 번호는 이미 등록되어있습니다.
          </p>
          <div class="ok_btn">확인</div>
        </div>
  
  
  		 <!-- 정보 전달 -->
         <div class="basic_popup complete getcom">
          <div class="close_btn" id="comclose"><img src="/bangterior/images/close.png" /></div>
          <p>
            신청 완료<br />신청이 완료되었습니다. <br>서류 심사에는 3~4일 소요될 예정입니다.
          </p>
          <div class="ok_btn"  id="comok">확인</div>
        </div>
        
        <!-- 정보 전달 -->
         <div class="basic_popup failtocom getcom" id = "failtocom">
          <div class="close_btn" ><img src="/bangterior/images/close.png" /></div>
          <p>
            신청 실패<br />모든 칸을 다 작성해주세요!
          </p>
          <div class="ok_btn">확인</div>
        </div>
        
        <!-- 등록 실패 -->
          <div class="basic_popup failnoreason getcom">
          <div class="close_btn"><img src="/bangterior/images/close.png" /></div>
          <p>
            신청 실패<br />등록에 실패하였습니다. <br>잠시후에 다시 시도해주세요.
          </p>
          <div class="ok_btn">확인</div>
        </div> 
  
		<!-- container -->
        </div>



        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        

	<!-- <script src="../js/jquery-3.5.1.js"></script> -->
    <!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
    <!-- !!중요. - autoload=false 를 반드시 붙혀주셔야 합니다.-->
    <script>
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
              document.getElementById("extraaddress").focus();
            },
          }).open();
        });
      };
      
      
      //팝업 관련 버튼

      //버튼 클릭 시 팝업창 닫기
      $(".ok_btn").click(function () {
        $(".modal").attr("style", "display:none");
        $(".basic_popup").attr("style", "display:none");
      });

      //[기본] X 버튼 클릭 시 팝업창 닫기
      $(".close_btn").click(function () {
        $(".modal").attr("style", "display:none");
        $(".basic_popup").attr("style", "display:none");
      });
      
      
      
      //성공 팝업창 
    //버튼 클릭 시 팝업창 닫기
      $("#comclose").click(function () {
        $(".modal").attr("style", "display:none");
        $(".basic_popup").attr("style", "display:none");
      //성공시 바로 전 메뉴로 넘어갈것
    	location.href="/bangterior/member/reghousemenu.do"
		
      });

      //[기본] X 버튼 클릭 시 팝업창 닫기
      $("#comok").click(function () {
        $(".modal").attr("style", "display:none");
        $(".basic_popup").attr("style", "display:none");
      //성공시 바로 전 메뉴로 넘어갈것
    	location.href="/bangterior/member/reghousemenu.do"
		
      });
      
      
      //개설 번호 인증하기 버튼 누를시
      $("#inputbtn1").click(function(){
		//ajax 처리
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "/bangterior/member/compareoffnumok.do",
			data: "inputnum=" + $("#inputnum").val(),
			dataType: "json",
			success: function(result){
				if(result.count==0){
					//실패
					$(".modal").attr("style", "display:block");
			    	$(".popup_fail").attr("style", "display:block");
					
				} else if(result.count == 1) {
					//성공
					$(".modal").attr("style", "display:block");
			    	$(".popup_success").attr("style", "display:block");
			    	
			    	//다른 박스 disabled 풀기
			    	$(".inputtext").attr("disabled", false);
			    	$("#findposcode").attr("disabled", false);
			    	
			    	//해당 박스 disabled
			    	$("#inputnum").attr("disabled", true);
			    	$("#inputbtn1").attr("disabled", true);
				} else if(result.count == 2){
					//이미 등록된 번호
					$(".modal").attr("style", "display:block");
			    	$(".popup_alreadyexist").attr("style", "display:block");
				}
			},
			error: function(a,b,c){
				console.log(a,b,c);
			}
			
			
		});
		
		
	});
      
      
      //ajax 보내기용 데이터   
      var formData = new FormData();/* 
      formData[0] = new FormData();
      formData[1] = new FormData();
      formData[2] = new FormData();
      formData[3] = new FormData();
      formData[4] = new FormData();
      formData[5] = new FormData();
      formData[6] = new FormData(); */
      
      

      
      
      
      //등록하기 버튼 누를 때 발생하는 이벤트
      $("#uploadbtn").click(function(){
    	  
    	  formData.append("uploadfile",$("#uploadfile").val()); 
          formData.append("inputnum",$("#inputnum").val()); 
          formData.append("inputname",$("#inputname").val()); 
          formData.append("address",$("#address").val()); 
          formData.append("extraaddress",$("#extraaddress").val()); 
          formData.append("call",$("#call").val()); 
          
          formData.append("file", $("input[name='uploadfile']")[0].files[0]);
    	  
    	  //모든 창이 입력되지 않은 경우
    	  if($("#inputnum").val() == "" || $("#uploadfile").val() == "" || $("#inputname").val() == ""
    		  || $("#poscode").val() == ""  || $("#address").val() == "" || $("#extraaddress").val() == ""
    			  || $("#call").val() == "" || $("#pax").val() == ""){
    		 $(".modal").css("display","block");
		   	 $("#failtocom").css("display","block");
    	  } else {
    		  //모든 창 입력 완료 --> 정보 전달 regcertidocok페이지로 넘어가기
    		 
    		//ajax 처리
    			$.ajax({
    				type: "POST",
    				url: "http://localhost:8090/bangterior/member/regcertidocok.do",
    				processData: false, // 필수 
    				contentType: false, // 필수
    				data: formData,
     				dataType: "json",
     				enctype: 'multipart/form-data',
    				success: function(result){
    					if(result.count==1){
    						
    						//성공
    						$(".modal").css("display", "block");
    				    	$(".complete").css("display", "block");
    				    	
    					} else {
    						//실패
    						$(".modal").css("display", "block");
    				    	$(".failnoreason").css("display", "block");
							 
    					}
    				},
    				error: function(a,b,c){
    					console.log(a,b,c);
    				}
    				
    				
    			});
    		  
    	  }
    	  
    	  
    	  
    	  
      });
      
      
      
      
      
      
	
      
    </script>
</body>
</html>