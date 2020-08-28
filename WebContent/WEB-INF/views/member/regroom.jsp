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

<!-- 하이차트 -->
<script src="../js/highcharts.js"></script>


<style>
/* 해당 페이지 스타일 작업 영역 */

      #container {
        width: 1200px; 
        height: 5500px;
        margin: 0px auto;
       }

      #head h1 {
        font-size: 2.5em;
        color: #7674e2;
        text-align: center;
        width: 500px;
        margin: 0px auto;
        margin-top: 30px;
        margin-bottom: 70px;
      }

      

      #inputline1{
        margin-bottom: 50px;
      }

      .inputpost {
        width: 1000px;
        margin-left: 100px;
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

      .inputline {
        height: 230px;
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

      .sels{
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

      .inputheader p {
        margin-top: 10px;
      }
/* 포스트 */
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
        width: 430px;
      }
      /* 물음표 */
      .img{
          width: 15px;
          height:15px;
          cursor: pointer;
          /* float: right; */
          margin-right: 175px;
          /* margin-bottom: 100px; */
          display: inline-block;
      }
      
      #img1, #img3{
      	margin-right:615px;
      }
      
      .yearmoney .moneyspan , .trading .moneyspan {
      	margin-right: 0px;
      	      }

      .questionmark{
          float: right;
          margin-top: 5px;
      }

      /* 보증금 */
      .inputmoney{
        margin-right: 10px;
      }

      .inputmoney + span {
        margin-right: 45px;
      }

      
      #qspan {
        margin-right: 0px;
      }

      .area, .true_area{
        margin-bottom: 30px;
        margin-right: 0px;
      }

      .areatitle, .trueareatitle{
        border: 0px;
        outline: none;
        width: 100px;
        height: 30px;
        background-color: #e8e8e8;
        text-align: center;
        display: inline-block;
        margin-right: 15px;
        border-radius: 5px;
      }

      .area + span {
        margin-right: 15px;
      }

      .cb + span, .rb + span{
        margin-right: 20px;
      }

      .cb, .rb{
        margin-right: 5px;
      }

      #complete {
        width: 130px;
        height: 50px;
        outline: none;
        border: 0px;
        background-color: #7674e2;
        cursor: pointer;
        float: right;
        text-align: center;
        /* padding-top: 20px; */
        margin-top: 150px;
        font-size: 1.1em;
        color: white;
      }

      textarea{
            margin:5px;
            width:900px;
            height:300px;
            resize: none;
            margin-right: 150px;
            float: left;
            border: 3.5px solid #e8e8e8;
        }
        
        
        /* 시세보기 팝업 css */
		  .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1001; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4);
        }
        .popup {
            display: none;
            z-index: 1002;
            position: absolute;
            left:50%; top:270%;
            margin-left: -250px;
            margin-top: -225px;
            width: 700px;
            height:660px;
            background-color: white;
            border:1px solid #eee;
        }
        .finpopup{
        top:190%;
        }

        .popup p{
            text-align: center;
            margin: 50px 0 30px 0;
            color:#444;
            font-size: 26px;
            font-weight: bold;
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
            color:white;
        }

        .popup .sign_up {
            text-align: center;
            margin-top: 30px;
            font-size: 15px;
            font-weight: normal;
            color:#888;
        }
        .popup .sign_up span {
            cursor: pointer;
            color:#7674E2;
            margin-left: 10px;
            display: inline-block;
            margin-top: 10px;
            text-align: center;
        }

        .popup .sign_up span:hover {
            text-decoration: underline;
        }

        .popup .sign_up span:nth-child(1) {
            margin-left: 0px;
        }

        #chart{
          width: 600px;
          margin-left: 40px;
        }
        
        
        /* 추가 css */
		.inputtitle{
			width: 800px;
		}
		
		/* 미리보기 상자 */
		.image_container{
			width: 300px;
			height: 200px;
            border: 3.5px solid #e8e8e8;
            display : none;
            background-repeat: no-repeat;
 			background-position: center;
 			background-size: contain;
		}
		
		/* #inputline2, #inputline3, #inputline4, #inputline5{
			margin-bottom: 100px;
		} */
		
		/* 안내문 */
		#inputheader3 #detail{
			float: right;
			color : red;
			font-size: .8em;
		}
		
		#inputheader3 p {
			width : 250px;
			float : left;
			
		}
		
		#uploadfile2_2, #uploadfile2_3, #uploadfile2_4{
			display: none;
		}
		
		#salesel{
			margin-bottom: 50px;
		}
		
		.inputmoneydiv{
			display: none;
		}
		
		.inputarea{
			border: 0px;
			margin-right:20px;
			width: 230px;
		}
		
		.areabox{
			display: inline-block;
			margin-right: 10px;
			margin-left: 10px;
		}
		
		.changeimg{
			width: 25px;
			height: 25px;
			display: inline-block;
			
		}
		
		.areacontent:first-child{
			margin-bottom: 40px;
		}
		
		#inputline12 .detailtitle{
			margin-bottom: 15px;
			margin-left: 6px;
			width: 400px;
		}
		
		.trading{
			display: block;
		}
		
		/* 슬래쉬 */
		.fa-slash{
			font-size : 1.1em;
			color: #7674E4;
		}
		
		#inputcontent13 .inputfloor{
			width: 80px;
			margin-right: 10px;
			margin-left: 10px;
		}
		
		.getcom{
			
			top: 500%;
		
		}
		
		.inputdate{
			outline: none;
			border: 3.5px solid #e8e8e8;
			width: 150px;
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
          <h1>내 방 내놓기</h1>
        </div>
		
		

        <div id="inputcontainer" class="inputpost">
        	
        	
        	<div id="inputcontent11" class="inputcontent">
            <div id="inputheader11" class="inputheader"><p>*제목</p></div>
            <div id="inputline11" class="inputline">
              <input type="text" class="inputtext inputtitle">
            </div>
          </div>
        
        
          <div id="inputcontent1" class="inputcontent">
            <div id="inputheader1" class="inputheader">
              <p>*위치 등록</p>
            </div>
            <div id="inputline1" class="inputline">
              <input
              type="text"
              id="poscode"
              class="inputtext"
              placeholder="우편 번호 검색"
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
              placeholder="주소 입력"
            />
            <input
              type="text"
              id="extraaddress"
              class="inputtext"
              placeholder="상세 주소 입력"
            />
            </div>
          </div>
          
           <div id="inputcontent14" class="inputcontent">
            <div id="inputheader14" class="inputheader"><p>*완공일</p></div>
            <div id="inputline14" class="inputline">
              <input type="date" class="inputdate" value="2020">
                    
            </div>
          </div>
          
          <div id="inputcontent13" class="inputcontent">
            <div id="inputheader13" class="inputheader"><p>*해당층/전체층</p></div>
            <div id="inputline13" class="inputline">
              <input type="text" class="inputtext inputfloor" id="floor" placeholder = "해당층"><i class="fas fa-slash"></i>
              <input type="text" class="inputtext inputfloor" id="wholefloor" placeholder = "전체층">
                    
            </div>
          </div>
          
          
          <div id="inputcontent6" class="inputcontent">
            <div id="inputheader6" class="inputheader"><p>*가격</p></div>
            <div id="inputline6" class="inputline">
            	
            	<select id="salesel" class="sels">
                <c:forEach items="${slist}" var="slist">
				<option value="${slist.seq}">${slist.saletype}</option>
				</c:forEach>
            	</select><br>
            
            	<div class="trading inputmoneydiv">
            	<input type="text"  class="inputtext inputmoney moneybox" id ="inputmoney1"><span  class = "moneyspan">만원</span><div class="questionmark"><img src="../images/questionmark.png" id="img1" class="img" alt="">
            	</div></div>
             	
             	
             	<div class = "monthmoney inputmoneydiv"><input type="text" placeholder="무보증일 경우 0을 입력하세요." class="inputtext inputmoney depcost" ><span>만원</span> 
              <span>월세:</span> <input type="text"  class="inputtext inputmoney moneybox" id ="inputmoney2"><span id="qspan">만원</span>
            <div class="questionmark"><img src="../images/questionmark.png" id="img2" alt="" class="img"></div></div>
              
              <div class = "yearmoney inputmoneydiv">
              	<input type="text"  class="inputtext inputmoney" ><span class = "moneyspan moneybox">만원</span><div class="questionmark"><img src="../images/questionmark.png" id="img3" alt="" class="img"></div> 
              </div>
            
            </div>
          </div>
          
          
          
          
          <div id="inputcontent2" class="inputcontent">
            <div id="inputheader2" class="inputheader">
              <p>*메인 사진 등록</p>
            </div>
            <div id="inputline2" class="inputline">
            	<div class="image_container" id = "imgcon1"></div>
              <input type="file" name="" id="uploadfile1" class="inputbtn" accept=".gif, .jpg, .png"/>
          </div>
          </div>
          <div id="inputcontent3" class="inputcontent">
            <div id="inputheader3" class="inputheader">
              <p>*상세 사진 등록</p><p id="detail">최대 4장까지 등록 가능합니다.</p>
            </div>
            <div id="inputline3" class="inputline">
            	<div class="image_container" id = "imgcon2_1"></div>
              <input type="file" name="" id="uploadfile2_1" class="inputbtn" accept=".gif, .jpg, .png"/>
              <div class="image_container" id = "imgcon2_2"></div>
              <input type="file" name="" id="uploadfile2_2" class="inputbtn" accept=".gif, .jpg, .png"/>
              <div class="image_container" id = "imgcon2_3"></div>
              <input type="file" name="" id="uploadfile2_3" class="inputbtn" accept=".gif, .jpg, .png"/>
              <div class="image_container" id = "imgcon2_4"></div>
              <input type="file" name="" id="uploadfile2_4" class="inputbtn" accept=".gif, .jpg, .png"/>
          </div>
          </div>
          <div id="inputcontent4" class="inputcontent">
            <div id="inputheader4" class="inputheader">
              <p>조경 사진 등록</p>
            </div>
            <div id="inputline4" class="inputline">
            	<div class="image_container" id = "imgcon3"></div>
              <input type="file" name="" id="uploadfile3" class="inputbtn" accept=".gif, .jpg, .png"/>
          </div>
          </div>
          <div id="inputcontent5" class="inputcontent">
            <div id="inputheader5" class="inputheader">
              <p>평면도 등록</p>
            </div>
            <div id="inputline5" class="inputline">
            	<div class="image_container" id = "imgcon4"></div>
              <input type="file" name="" id="uploadfile4" class="inputbtn" accept=".gif, .jpg, .png"/>
          </div>
          </div>
          
          
          <div id="inputcontent7" class="inputcontent">
            <div id="inputheader7" class="inputheader"><p>*관리비</p></div>
            <div id="inputline7" class="inputline">
              <input type="text" class="inputtext inputmoney manmoney" placeholder = "관리비가 없을 경우 0을 입력해주세요."><span>만원</span>
                    
            </div>
          </div>
          
          
          <div id="inputcontent8" class="inputcontent">
            <div id="inputheader8" class="inputheader"><p>*방 구조</p></div>
            <div id="inputline8" class="inputline">
              <select id="sel" class="sels">
                <c:forEach items="${hlist}" var="hlist">
				<option value="${hlist.seq}">${hlist.type}</option>
				</c:forEach>
            </select>
            </div>
          </div>
          
          <div id="inputcontent9" class="inputcontent">
            <div id="inputheader9" class="inputheader"><p>*방 면적</p></div>
            <div id="inputline9" class="inputline">
              <div class = "areacontent">
                <div class="areatitle">방 면적</div>
                <div class="inputtext areabox"><input type="text" class="arean inputarea" id="inputarea">			m²</div>
                <img src = "../images/change.png" id="changeimg1" class="changeimg">
                <div class="inputtext areabox"><input type="text" class="true_area inputarea" id="inputtruearea">			P</div>
            </div>
            <div  class = "areacontent">
                <div class="trueareatitle">계약 면적</div>
                <div class="inputtext areabox"><input type="text" class="arean inputarea" id="inputarea2">			m²</div>
                <img src = "../images/change.png" id="changeimg2" class="changeimg">
                <div class="inputtext areabox"><input type="text" class="true_area inputarea" id="inputtruearea2">			P</div>
            
            </div>
            </div>
          </div>
          <div id="inputcontent10" class="inputcontent">
            <div id="inputheader10" class="inputheader"><p>옵션</p></div>
            <div id="inputline10" class="inputline">
              <div id="cbbox">
              
                <c:forEach items="${olist}" var="olist">
                <input class="cb" type="checkbox" id="cb${olist.seq}" name = "cb${olist.seq}" value = "${olist.seq}"><span>${olist.optname}</span>
				</c:forEach>
                
            </div>
            </div>
          </div>
          
          
    
    
          <div id="inputcontent12" class="inputcontent">
            <div id="inputheader12" class="inputheader"><p>상세 설명</p></div>
            <div id="inputline12" class="inputline">
            <input type="text" class="inputtext detailtitle">
              <textarea class="explain"></textarea>
            </div>
          </div>
         
        </div>

       

        <input type="button" value="등록 하기" id="complete">
        
        <input type="hidden" id="jibeon" name="jibeon" value="서울시 송파구 삼전동">

          </div>
          
          
      	   	<!-- 모든 칸 입력 안내 -->
   	      <div class="basic_popup failtocom getcom" id = "failtocom">
    	      <div class="close_btn" ><img src="/bangterior/images/close.png" /></div>
    	      <p>
    	        신청 실패<br />필수 칸을 다 선택해주세요!
   	       </p>
    	      <div class="ok_btn">확인</div>
     	   </div>
     	   
     	   
            <div class="basic_popup failnoreason getcom">
          <div class="close_btn"><img src="/bangterior/images/close.png" /></div>
          <p>
            신청 실패<br />등록에 실패하였습니다. <br>잠시후에 다시 시도해주세요.
          </p>
          <div class="ok_btn">확인</div>
        </div> 
     	   
  	
  	
  	
  			  <!-- 확인 버튼 1개 팝업창 -->
            <div class="basic_popup completepopup getcom">
                <div class="close_btn"><img src="../images/close.png"></div>
                <p>해당 매물이 등록 완료되었습니다.<br>심사에는 3, 4일 정도 소요됩니다.</p>
                <div class="ok_btn" onclick="location.href='/bangterior/member/reghousemenu.do'">확인</div>
            </div>
            
             <!-- 주소창 입력 요구 팝업창 -->
            <div class="basic_popup demandpopup finpopup">
                <div class="close_btn"><img src="../images/close.png"></div>
                <p>시세 보기 팝업<br>해당 메뉴는 주소 입력 후에 <br>이용 가능합니다.</p>
                <div class="ok_btn">확인</div>
            </div>
            
            <!-- 해당 주소 데이터 없음 팝업창 -->
            <div class="basic_popup nodatapopup finpopup">
                <div class="close_btn"><img src="../images/close.png"></div>
                <p>시세 보기 팝업<br>해당 주소는 등록된 데이터가 없습니다.</p>
                <div class="ok_btn">확인</div>
            </div>
            
            
            
            <!-- 시세보기 팝업 -->
            <div class="modal"></div>
            <div class="popup write_popup seefin basic_popup finpopup">
            <p>해당 지역 시세 보기</p>

            <main>
        <div id="chart"></div>
      </main>
            <div class="ok_btn">닫기</div>
          
            </div>
            

		<!-- container -->
       



        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c814bcb953019b02e7e140224272453&libraries=services"></script>

	 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
    <!-- !!중요. - autoload=false 를 반드시 붙혀주셔야 합니다.-->
    <script>
    
  	//위도 경도 저장
  	var lat = "";
  	var lng = "";
  	
  	 var geocoder = new kakao.maps.services.Geocoder();	
     
 	var callback = function(result, status) {
 	    if (status === kakao.maps.services.Status.OK) {
 	       lng =  result[0].x;
 	       lat = result[0].y;
 	    }
 	};
   
    	
    //전송하기 버튼을 눌렀을 때 
    $("#complete").click(function(){

    	

  	//ajax 보내기용 데이터   
    var formData = new FormData();
   	
		//전체 칸이 입력되지 않은 경우
    	
    	 if($(".inputtitle").val() == "" || $("#poscode").val() == "" || $("#address").val() == "" || $("#extraadress").val() == ""
    				|| $("#floor").val() == "" || $("#wholefloor").val() == "" || $("#uploadfile1").val() == "" || ($(".depcost").val() =="" && $("#salesel").val() == "2")
    				|| $("#uploadfile2_1").val() == ""|| $("#inputmoney1").val() == "" || $(".manmoney").val() == "" || $("#inputarea").val() == ""
    				|| $("#inputarea2").val() == "" || $(".inputdate").val() == ""){ 
    		 
    			$(".modal").css("display", "block");
        	    $(".failtocom").css("display", "block");
    	} else {
    	 	
    		 	/* alert($("#jibeon").val());
    		 	alert(lat);
    		 	alert(lng); */
    			var comdate = $(".inputdate").val().replace("-", "/");
    			comdate = comdate.replace("-", "/");
    			comdate = comdate.replace("-", "/");
    			formData.append("lng",lng); //o
    			formData.append("lat",lat);  //o
    			formData.append("inputtitle",$(".inputtitle").val()); //o
    			formData.append("jibeon",$("#jibeon").val());  //o
    			formData.append("floor",$("#floor").val());  //o
    			formData.append("wholefloor",$("#wholefloor").val());  //o
    			formData.append("cost",$(".moneybox").val()); //o
    			formData.append("comdate", comdate); //o
    			if($(".depcost").val() != null){
    				//보증금이 있을 경우
    	        formData.append("depcost",$(".depcost").val()); //o
    			} else {
    	        formData.append("depcost",null); //o    				
    			}
    	        formData.append("manmoney",$(".manmoney").val()); //o
  				formData.append("area",$("#inputarea2").val() ); 
    	        
  				if($(".detailtitle").val() != null){
    				//상세 설명 제목 있을 경우
				formData.append("detailtitle",$(".detailtitle").val()); 
    			} else {
				formData.append("detailtitle",null); 
    			}
  				
  				if($(".explain").val() != null){
    				//상세 설명 내용 있을 경우
				formData.append("detailcontent",$(".explain").val()); 
    			} else {
				formData.append("detailcontent",null); 
    			}
    	        formData.append("stype",$("#salesel option:selected").val()); //매물
    	        formData.append("htype",$("#sel option:selected").val()); 
    	        
    	        
    	        //체크된 옵션들 저장 -> 배열로 반환
    	        var arropt = new Array(); //배열선언
    	        $(".cb").each(function() {
    	        	 
    	        	//체크 되었을 경우
    	        if($(this).is(":checked") == true){
    	        	arropt.push($(this).val());
    	        }
    	        	});
    	        //반환된 배열 저장
        	    formData.append("cb",arropt); 
    	        
    	        //파일 저장
    	        formData.append("main", $("#uploadfile1")[0].files[0]);
    	        
    	        if($("#uploadfile3").val() != ""){
    	        formData.append("surround", $("#uploadfile3")[0].files[0]);
    	        }
    	        if($("#uploadfile4").val() != ""){
        	        formData.append("floorimg", $("#uploadfile4")[0].files[0]);
        	        }
    	        
    	        formData.append("detail1", $("#uploadfile2_1")[0].files[0]);

    	        if($("#uploadfile2_2").val() != ""){
    	        	formData.append("detail2", $("#uploadfile2_2")[0].files[0]);	
    	        }
    	        if($("#uploadfile2_3").val() != ""){
    	        	formData.append("detail3", $("#uploadfile2_3")[0].files[0]);	
    	        }
    	        if($("#uploadfile2_4").val() != ""){
    	        	formData.append("detail4", $("#uploadfile2_4")[0].files[0]);	
    	        }
    	        
    	        
    	        
    		
    	    $.ajax({
    	    	type: "POST",
				url: 'http://localhost:8090/bangterior/member/regroomok.do',
				processData: false, // 필수 
				contentType: false, // 필수
				data: formData,
 				dataType: "json",
 				enctype: 'multipart/form-data',
				success: function(result){
					
					if(result.count == "5"){
						//등록 완료
			    		$(".modal").css("display", "block");
			    	    $(".completepopup").css("display", "block");
						
					} else {
						//등록 실패
						$(".modal").css("display", "block");
						$(".failnoreason").css("display", "block");
					}
		    		
				},
				error: function(a,b,c){
					
					//실패 팝업
					$(".modal").css("display", "block");
					$(".failnoreason").css("display", "block");
					
					console.log(a,b,c);
				}
				
				
			});//ajax
    	 } 
    	
    	
    	
    	
    	
    	
    });
    			
    
    
    
    
    	
    	//제곱 미터 입력 -> 평 
    	$("#inputarea").focusout(function(){
    		var area = $("#inputarea").val();
    		$("#inputtruearea").val(Math.ceil(area/3.3));
    	});
    	
    	$("#inputarea2").focusout(function(){
    		var area = $("#inputarea2").val();
    		$("#inputtruearea2").val(Math.ceil(area/3.3));
    	});
    	
    	
    	// 평 입력 -> 제곱미터
    	$("#inputtruearea").focusout(function(){
    		var area = $("#inputtruearea").val();
    		$("#inputarea").val(Math.ceil(area*3.3));
    	});
    	$("#inputtruearea2").focusout(function(){
    		var area = $("#inputtruearea2").val();
    		$("#inputarea2").val(Math.ceil(area*3.3));
    	});
    
    
    	
    
    	//매매 월세 전세 에 따라 나오는 가격
    	$("#salesel").change(function(){
    		if($("#salesel option:selected").val() == "1"){
    			$(".inputmoneydiv").css("display", "none");
    			$(".trading").css("display", "block");
    		} else if($("#salesel option:selected").val() == "2"){
    			$(".inputmoneydiv").css("display", "none");
    			$(".monthmoney").css("display", "block");
    		} else if($("#salesel option:selected").val() == "3"){
    			$(".inputmoneydiv").css("display", "none");
    			$(".yearmoney").css("display", "block");
    		}
    	});
    
    
    
    	//시세보기 팝업 등장
    	$(".questionmark").click(function(){
    		
    		//해당 지역 월세 or 전세 or 매매 값 저장
    		var saletype = $("#salesel option:selected").val();
    		
    		
    		//지역 값이 있을 경우 
    		if($("#address").val() != ""){
    			//지역값 저장 -> db 다녀오기
    			//ajax 처리
    			 $.ajax({
    				type: "POST",
    				url: "http://localhost:8090/bangterior/member/seemarketprice.do",
    				data: "saletype=" + saletype +"&address=" + $("#jibeon").val(), //지번 주소만 갈것
     				dataType: "json",
    				success: function(result){
    					
    					
    					//성공시 해당 팝업 등장
    					options.series = result;
    					
    					options.title.text = '2020년 ' + result[2].name + ' 시세보기';
    						

/*     		        	     title: {
    		        	         text: '2020년 oo동 시세 보기'
    		        	     },
 */
    					Highcharts.chart('chart', options);
						
    					$(".modal").css("display", "block");
    					$(".seefin").css("display", "block");
    					
    					
    					
    					
    				},
    				error: function(a,b,c){
    					
    					//빈값 팝업
    					$(".modal").css("display", "block");
    					$(".nodatapopup").css("display", "block");
    					
    					console.log(a,b,c);
    				}
    				
    				
    			});//ajax
    			
    			
    			
    			

        		
    			
    		} else {
    			//지역값 입력 요구 팝업
    			$(".modal").css("display", "block");
        	    $(".demandpopup").css("display", "block");
    		}
    	
    	
    	}); //버튼 이벤트
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	//미리보기 함수 버튼 1
    	function readURL1(input) {
 			if (input.files && input.files[0]) {
  			var reader = new FileReader();
  
  			reader.onload = function (e) {
  			$('#imgcon1').css("display", "inline-block");
   			$('#imgcon1').css('background-image', "url(" + e.target.result) + ")";  
  			}
  
  			reader.readAsDataURL(input.files[0]);
  				}
				}//readURL
				
		//이벤트 발생
		$("#uploadfile1").change(function(){
			readURL1(this);
			$("#container").css("height", "5600px");
		});
		
		//미리보기 함수 버튼 2_1
    	function readURL2_1(input) {
 			if (input.files && input.files[0]) {
  			var reader = new FileReader();
  
  			reader.onload = function (e) {
  			$('#imgcon2_1').css("display", "inline-block");
   			$('#imgcon2_1').css('background-image', "url(" + e.target.result) + ")";  
  			}
  
  			reader.readAsDataURL(input.files[0]);
  				}
				}//readURL
				
		//이벤트 발생
		$("#uploadfile2_1").change(function(){
			readURL2_1(this);
			$("#uploadfile2_2").css("display", "inline-block");
		});
		
		//미리보기 함수 버튼 2_2
    	function readURL2_2(input) {
 			if (input.files && input.files[0]) {
  			var reader = new FileReader();
  
  			reader.onload = function (e) {
  			$('#imgcon2_2').css("display", "inline-block");
   			$('#imgcon2_2').css('background-image', "url(" + e.target.result) + ")";  
  			}
  
  			reader.readAsDataURL(input.files[0]);
  				}
				}//readURL
				
		//이벤트 발생
		$("#uploadfile2_2").change(function(){
			readURL2_2(this);
			$("#uploadfile2_3").css("display", "inline-block");
			$("#inputline3").css("height", "500px");
			$("#container").css("height", "5700px");
			$(".getcom").css("top", "0%");

		});
		
				
				
		//미리보기 함수 버튼 2_3
    	function readURL2_3(input) {
 			if (input.files && input.files[0]) {
  			var reader = new FileReader();
  
  			reader.onload = function (e) {
  			$('#imgcon2_3').css("display", "inline-block");
   			$('#imgcon2_3').css('background-image', "url(" + e.target.result) + ")";  

  			}
  
  			reader.readAsDataURL(input.files[0]);
  				}
				}//readURL
				
		//이벤트 발생
		$("#uploadfile2_3").change(function(){
			readURL2_3(this);			
			$("#uploadfile2_4").css("display", "inline-block");
		});
				
				
				
			
		//미리보기 함수 버튼 2_4
    	function readURL2_4(input) {
 			if (input.files && input.files[0]) {
  			var reader = new FileReader();
  
  			reader.onload = function (e) {
  			$('#imgcon2_4').css("display", "inline-block");
   			$('#imgcon2_4').css('background-image', "url(" + e.target.result) + ")";  

  			}
  
  			reader.readAsDataURL(input.files[0]);
  				}
				}//readURL
				
		//이벤트 발생
		$("#uploadfile2_4").change(function(){
			readURL2_4(this);
		});
			
				
				
		//미리보기 함수 버튼 3
    	function readURL3(input) {
 			if (input.files && input.files[0]) {
  			var reader = new FileReader();
  
  			reader.onload = function (e) {
  			$('#imgcon3').css("display", "inline-block");
   			$('#imgcon3').css('background-image', "url(" + e.target.result) + ")";  
  			}
  
  			reader.readAsDataURL(input.files[0]);
  				}
				}//readURL
				
		//이벤트 발생
		$("#uploadfile3").change(function(){
			readURL3(this);
		});
				
				
		//미리보기 함수 버튼 4
    	function readURL4(input) {
 			if (input.files && input.files[0]) {
  			var reader = new FileReader();
  
  			reader.onload = function (e) {
  			$('#imgcon4').css("display", "inline-block");
   			$('#imgcon4').css('background-image', "url(" + e.target.result) + ")";  
  			}
  
  			reader.readAsDataURL(input.files[0]);
  				}
				}//readURL
				
		//이벤트 발생
		$("#uploadfile4").change(function(){
			readURL4(this);
		});
				
				
		
    
    
      var findposcode = document.getElementById("findposcode");

      findposcode.onclick = function () {
        //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
        daum.postcode.load(function () {
          new daum.Postcode({
            oncomplete: function (data) {
              var addr = ""; // 주소 변수
              var extraAddr = ""; // 참고항목 변수
				console.log(data);
              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === "R") {
                // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
                

                if(data.autoJibunAddress == ""){
                document.getElementById("jibeon").value = data.jibunAddress;  
                } else {
                    document.getElementById("jibeon").value = data.autoJibunAddress;
                }
              } else {
                // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
                document.getElementById("jibeon").value = data.jibunAddress;
              }
              
              

              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById("poscode").value = data.zonecode;
              document.getElementById("address").value = addr;
              document.getElementById("extraaddress").focus();

            },
          }).open();
        });
        
        geocoder.addressSearch($("#jibeon").val() , callback);

      };
        
        
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
        
        
        
     
        
        
        var options = {
        	       credits: {
        	           enabled: false,
        	         },

        	        colors: [
        	           "#FCBD2E",
        	           "#3CBA99",
        	           "#EE5656"
        	        ],
        	        
        	        title : {
        	        	text : ''
        	        },


        	     yAxis: {
        	         title: {
        	             text: '단위(만원)',
        	             
        	         }
        	     },

        	     xAxis: {
        	         accessibility: {
        	             rangeDescription: 'Range: 01 to 12',
        	             lineWidth : 1
        	             
        	         }
        	     },

        	     legend: {
        	         layout: 'horizontal',
        	         align: 'center',
        	         verticalAlign: 'bottom'
        	     },

        	     plotOptions: {
        	         series: {
        	             label: {
        	                 connectorAllowed: false
        	             },
        	             pointStart: 01,
        	            
        	         }
        	     },

        	     series: [
        	    	 
        	     ],

        	     responsive: {
        	         rules: [{
        	             condition: {
        	                 maxWidth: 600
        	             },
        	             chartOptions: {
        	                 legend: {
        	                     layout: 'horizontal',
        	                     align: 'center',
        	                     verticalAlign: 'bottom'
        	                 }
        	             }
        	         }]
        	     },};
        
        
        
        
         //   하이차트
     Highcharts.chart('chart', options);
    
    
    




    </script>
</body>
</html>