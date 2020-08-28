<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<link rel="stylesheet" type="text/css" href="../css/basic_popup.css" />

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
        margin: 0 auto;
        width: 1200px;
        height: 1800px;
      }
      #mypage {
        /* border:1px solid red; */
        width: 1200px;
        height: 600px;
        margin: 40px auto;
        float: left;
      }
      /* 서브메뉴 */
      #submenu {
        /* background-color:skyblue; */
        width: 900px;
        height: 150px;
        margin: 0 auto;
        border-bottom: 3px solid #e8e8e8;
        padding-bottom: 10px;
      }

      #submenu #subtitle {
        color: #444;
        font-size: 2.5em;
        display: block;
        font-weight: bold;
        text-align: center;
        margin-top: 60px;
        margin-bottom: 60px;
      }
      #submenu input[type="text"] {
        /* margin-left:0px; */
        width: 120px;
        text-align: center;
        font-size: 1.1em;
        cursor: pointer;
        border: 0px;
      }
      #submenu a {
        font-size: 16px;
        margin-left: 18px;
      }
      #submenu a input:hover {
        text-decoration: underline;
      }
      #container #submenu .click {
        text-decoration: underline;
        font-weight: bold;
      }
      /* end */

      .head,
      #inputcontainer {
        width: 1200px;
        /* border: 1px solid black; */
      }

      .head {
        color: #444;
        width:1500px;
        height: 150px;
        float: left;
        margin-bottom: 50px;
      }

      #namecard {
        float: right;
        border: 2px solid #e8e8e8;
        margin-top: 20px;
        border-radius: 5px;
      }
  

      #inputcontainer {
        color: #444;
      }
      #face {
        width: 80px;
        height: auto;
      }

      #namecardcontent {
      	float:left;
        width: 550px;
        font-size: 0.8em;
        margin-bottom:100px;
      }

      #namecardimg {
        width: 80px;
        /* display: inline-block; */
        /* border: 1px solid black; */
        float: left;
        margin-top: 15px;
        margin-right: 30px;
      }

      tr .td:first-child {
        width: 100px;
      }

      tr .td:last-child {
        width: 300px;
      }

      .inputinform {
        float: left;
        margin-right: 20px;
        border-right: 3px solid #e8e8e8;
        padding-right: 10px;
        margin-top: 40px;
        font-size: 1.4em;
      }

      .inputinform span:first-child {
        font-size: 1.8em;
        margin: 0px 5px 0px 5px;
      }

      #headchangebtn {
        float: right;
        margin-top: 15px;
      }

      .changebtn {
        cursor: pointer;
      }

      #inputcontent1 {
        height: 300px;
        /* margin-top: 50px; */
      }
      #inputcontent2 {
        height: 400px;
        margin-left: 140px;
        overflow:hidden;
        margin-bottom: 100px;	
        /* margin-top: 50px; */
      }

      .inputdetail {
        float: left;
        margin-right: 110px;
        font-size: 1.1em;
      }

      .detailtitle {
        color: #c6c6f3;
        margin-right: 20px;
      }

      .detailcontent {
        color: #444;
      }

      /* 방 이미지 */
      .imgbox{
          border: 1px solid black;
          width: 150px;
          height: 180px;
          float: left;
          margin-right: 30px;
      }

      #regbox{
          margin-top: 100px;
      }
      #inputinformtitle{
        width:1180px;
      }

      #inputinformtitle span{
          font-size: 2.0em;
          color: #444;
      }
     
      #state{
          outline: none;
          background-color: #aaa;
          font-size: 1.1em;
          color: white;
          width: 150px;
          height: 30px;
          text-align: center;
          float: right;
          border-radius: 5px;
      }

      #inputinformtitle span:hover{
          text-decoration: underline;
          cursor: pointer;
      }

       /* 버튼 모양 */
      .btns {
        /* border: 1px solid black; */
        border-radius: 75px;
        width: 150px;
        height: 130px;
        float: left;
        margin-top: 50px;
        font-size: 1.1em;
        background-color: rgb(235, 235, 235);
        cursor: pointer;
        padding-top: 20px;
        margin-left: 300px;
      }
      /* 버튼 & 컨텐츠 담는 그릇 */
      .btnbox {
          width: 1200px;
          margin: 100px auto;
          /* border: 1px solid black; */
          float: left;
          text-align: center;
      }

      /* 버튼 속 아이콘 */
      .btns .fas {
        font-size: 4em;
      }

      /* 버튼 속 메뉴이름 */
      .btns p {
        margin-top: 10px;
      }

      /* 컨텐츠 */
      #btncontent {
        /* width: 5px; */
        font-size: 0.8em;
        margin-top: 40px;
        color: #333;
        display: none;
      }

      /* 버튼 위에 누르면 색상 변경 */
      .btns:hover #btncontent {
        transition: 0.4s;
        display: inline-block;
      }

      .btns:hover {
        background-color: #7674e2;
        color: white;
        transition: 0.4s;
      }

      #submit{
        width:800px;
        /* border:1px solid red; */
        /* margin: 15px auto; */
        border-collapse: collapse;
        font-size:1.1em;
      }

      .sub_title{
        font-size:1.1em;  
        padding: 0 5px;
        border-left:4px solid #484848;
      }
      .sub_tbl {
            width: 1200px;
            /* height: 400px; */
            margin: 20px auto;
            border-top: 1px solid #e6e6e6;
            border-collapse: collapse;
            text-align: center;
        }

        .sub_tbl th, .tbl td{
            border-bottom: 1px solid #e6e6e6;
        }

        .sub_tbl thead tr{
            height:50px;
            font-size: 16px;
            color:#7674e2;
            border-top:2px solid rgb(77, 77, 77);
            border-bottom:1px solid rgb(77, 77, 77);
        }

       .sub_tbl tbody tr{
            height:40px;
            color:#333;
        }


	 .room_img{
        width:300px;
        height:200px;
      }
      .room_img:nth-last-child(){
        position:relative;
      }


       .sub_tbl tr th:nth-child(1){width: 100px;}
       .sub_tbl tr th:nth-child(2){width: 100px;}
       .sub_tbl tr th:nth-child(3){width: 100px;}
       .sub_tbl tr th:nth-child(4){width: 100px;}
       .sub_tbl tr th:nth-child(5){width: 100px;}
       .sub_tbl tr th:nth-child(6){width: 100px;}
       .sub_tbl tr td input[type="button"]{width: 100px;}
       .sub_tbl tr td:nth-child(5){color:#888;}

        .sub_tbl .completed {
            background-color: #ededed;
            color: #4e4eff;
            padding: 3px 6px;
        }
        .btns{
          font-size:1em;
        }
        #width{
        display:inline-block;
        width:170px;
        font-size:1.7em;
        height:30px;
        }
        
        
        /* 팝업 위치 조정 */
        .basic_popup{
        	top: 155%;
        }
        
    </style>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
</head>
<body>
	<!-- index.jsp (member)  -->



   <!-- 전체 -->
    <div id="wrap">
        
        <!-- header -->
        <%@include file="/WEB-INF/views/inc/member/header.jsp" %>

                <ul>
                    <li><a href="#">매물 조회</a></li>
                    <li><a href="#">매물 등록</a></li>
                    <li><a href="#">인테리어</a></li>
                    <li><a href="#">고객서비스</a></li>
                </ul>
            

        <!-- container -->
        <div id="container">
        <!-- 서브메뉴 -->
        <%-- <%@ include file="/WEB-INF/views/member/my_submenu.jsp" %> --%>
        <!-- submenu -->

        <!-- 마이페이지 등록한 게시물 -->
        <div id="regbox">
            <div id="inputinformtitle"><span>${hinfo.subject}</span> <div id="state">미완료</div></div>
          <div id="inputhead" class="head">
            <div class="inputinformbox">
            <c:if test="${hinfo.depcost!=0 }">
              <div class="inputinform" id="inputinform1">
                ${hinfo.htype}<span>${hinfo.cost}/${hinfo.depcost}</span><span>원</span>
              </div>
              </c:if>
             <c:if test="${hinfo.depcost==0 }">
             	 <div class="inputinform" id="inputinform1">
             	${hinfo.htype}<span>${hinfo.cost}</span><span>원</span>
            	 </div>
             </c:if>
            
              <div class="inputinform" id="inputinform2">
                <div id="width" data-width="${hinfo.area }">${hinfo.area} ㎡</div>
                <input type="hidden" value="${hinfo.area*0.3}" id="pyung">                
                <div id="headchangebtn" class="changebtn">
                  <i class="fas fa-sync"></i>
                </div>
           
              </div>
              <div class="inputinform" id="inputinform3">
                관리비<span>${hinfo.maincost }</span>만원
              </div>
                <div id="namecardcontent">
              <div class="inputinform" id="namecard">
                <div id="namecardimg">
                  <img src="../pic/${ainfo.filename}" id="face" />
                </div>
                  <table id="namecardtbl" class="tbl">
                    <tr class="tr" id="namecardtr1">
                      <td id="namecardtd1" class="td">판매자	</td>
                      <td id="namecardtd2" class="td">${ainfo.office}/${ainfo.name}</td>
                    </tr>
                    <tr class="tr" id="namecardtr2">
                      <td id="namecardtd3" class="td">전화번호</td>
                      <td id="namecardtd4" class="td">${ainfo.tel}</td>
                    </tr>
                    <tr class="tr" id="namecardtr3">
                      <td id="namecardtd5" class="td">이메일</td>
                      <td id="namecardtd6" class="td">${ainfo.email}</td>
                    </tr>
                    <tr class="tr" id="namecardtr4">
                      <td id="namecardtd7" class="td">주소</td>
                      <td id="namecardtd8" class="td">${ainfo.address}</td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <div id="inputcontainer">
            <div id="inputcontent1" class="inputcontent">
              <div id="inputdetail1" class="inputdetail">
                <span class="detailtitle">▶ 해당층/건물층</span
                ><span class="detailcontent">${hinfo.floor }층/${hinfo.totalfloor }층</span>
              </div>
              <div id="inputdetail2" class="inputdetail">
                <span class="detailtitle">▶ 위치</span
                ><span class="detailcontent"><c:set var="TextValue" value="${hinfo.address}"/> ${hinfo.address }</span>
              </div>
              <div id="inputdetail3" class="inputdetail">
                <span class="detailtitle">▶ 방 개수</span
                ><span class="detailcontent">2개</span>
              </div>
              <div id="inputdetail4" class="inputdetail">
                <span class="detailtitle">▶ 방 형태</span
                ><span class="detailcontent">${hinfo.htype }</span>
              </div>
            </div>
            <div id="inputcontent2" class="inputcontent">
                <c:forEach items="${himages}" var="img">
                <a href="../pic/${img.filename}" data-title="" data-lightbox="example-set"><img class="room_img" src="../pic/${img.filename}" alt=""></a>
                </c:forEach>
            </div>
          </div>
          <!-- 서류 제출 현황 -->
          <div id="submit">
            <div class="sub_title">증빙서류</div>
            <div class="sub_status">
              <table class="sub_tbl">
                <tr>
                  <th>지원서비스</th>
                  <th>요청서류</th>
                  <th>주민센터</th>
                  <th>제출기관</th>
                  <th>제출상태</th>
                  <th>업로드</th>
                </tr>
                <tr>
                  <td>전입신고</td>
                  <td>전입신고서</td>
                  <td> <c:set var = "length" value = "${fn:length(TextValue)}"/>
    				<c:set var = "TextValue" value = "${fn:substring(TextValue, length -3, length)}" />
    				${TextValue} 주민센터
    				</td>
                  <td></td>
                  <td>요청중</td>
                  <td>
                  <input type="file" name="housereport" id="housereport">
                  <input type="button" value="업로드">
                  </td>
                </tr>
                <tr>
                  <td>계약서등록</td>
                  <td>
                  ${hinfo.stype } 계약서
                  <input type="hidden" value="${hinfo.stype }" id="stype">
                  </td>
                  <td></td>
                  <td>쌍용부동산</td>
                  <td>요청중</td>
                  <td id="salebox">
                  <input type="file" name="salereport" id="salereport">
                  <input type="button" value="업로드" id="salebtn">
                  </td>
                </tr>
              </table>
            </div>
          <!-- 서류 등록 버튼 -->

          <div class="btnbox">
            <div id="btn1" class="btns">
             <i class="fas fa-file-invoice-dollar"></i>            
              <p>계약서 작성</p><p class="content" id="btncontent">해당 매물은 '${hinfo.stype}'입니다.</p>
            </div>
          
            <div id="btn2" class="btns">
                <i class="fas fa-file-invoice"></i>
              <p>전입신고서 작성</p>
            </div>
        </div>
        </div>
        </div> <!--regbox-->
        
        <!-- 팝업칸 -->
     	
		<!-- 증빙서류 등록 빈칸 시 안내 팝업-->
			<div class="modal"></div>
          <div class="basic_popup nofile ">
          <div class="close_btn"><img src="/bangterior/images/close.png" /></div>
          <p>
            업로드 안내<br />파일을 선택 해주세요!
          </p>
          <div class="ok_btn">확인</div>
        </div> 
        
        <!-- 등록 실패 -->
          <div class="basic_popup failnoreason">
          <div class="close_btn"><img src="/bangterior/images/close.png" /></div>
          <p>
            신청 실패<br />파일 업로드에 실패하였습니다. <br>잠시후에 다시 시도해주세요.
          </p>
          <div class="ok_btn">확인</div>
        </div> 
        
        
     	</div> <!-- container -->
     	</div> <!-- wrap -->
     	



        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
	<script>
	$("#complete").attr("class","click");
	var flag=0;
	
	//평 <-> 제곱미터
	$(".changebtn").click(function(){
	if(flag==0){
		$("#width").text(Math.ceil($("#pyung").val())+"평");
		flag=1;
	}
	else{
		$("#width").text($("#width").data("width")+"㎡");
		flag=0;
	}
	});
	
	//----------------김영현
	
	//계약서 작성을 누를 시
	$("#btn1").click(function(){
		
		//공통 팝업 옵션
		var options = "width = 1200, height = 800, top = 100, left = 100, location = no"
		
	//매매 or (전세 or 월세) 
	if("${hinfo.stype}"== "매매"){
		
		window.open("/bangterior/member/doclease.do?hconseq=${hconseq}&docseq=${docseq}&address=${hinfo.address}&area=${hinfo.area}&cost=${hinfo.cost}&agaddress=${ainfo.address}&atel=${ainfo.tel}&aoffice=${ainfo.office}&aname=${ainfo.name}", "매매", options);
	 	
	} else if("${hinfo.stype}" == "월세" || "${hinfo.stype}" == "전세"){
		
		window.open("/bangterior/member/docrent.do?hconseq=${hconseq}&docseq=${docseq}&address=${hinfo.address}&area=${hinfo.area}&cost=${hinfo.cost}&agaddress=${ainfo.address}&atel=${ainfo.tel}&aoffice=${ainfo.office}&aname=${ainfo.name}", "매매", options);

		
	}
	

	});
	
	$("#btn2").click(function(){
		var options = "width = 1200, height = 800, top = 100, left = 100, location = no"
		window.open("/bangterior/member/paper2.do?seq=${hinfo.memseq}","_blank",options);
		});
	//업로드버튼을 누를시(매매 or 월세 전세 계약서)
	$("#salebtn").click(function(){
		
		//파일 선택을 하지 않은 경우
		if($("#salereport").val() == ""){
			$(".modal").css("display", "block");
	         $(".nofile").css("display", "block");
		} else {
			
			//파일이 선택 된 경우 --> 업로드
			
			//폼데이터에 저장
     		var formData = new FormData();
			formData.append("hconseq", "${hconseq}");
			formData.append("docseq", "${docseq}");
	        formData.append("file", $("input[name='salereport']")[0].files[0]);
			 $.ajax({
 				type: "POST",
 				url: "http://localhost:8090/bangterior/member/uploadsalefile.do",
 				processData: false, // 필수 
 				contentType: false, // 필수
 				data: formData,
  				dataType: "json",
  				enctype: 'multipart/form-data',
 				success: function(result){
 					if(result.count==1){
 						//성공
 						var fileValue = $("#salereport").val().split("\\");
						var fileName = fileValue[fileValue.length-1]; // 파일명

 						
 						$("#salereport").css("display", "none");
 						$("#salebtn").css("display", "none");	
 						$("#salebox").append("<i class='fas fa-check'></i>"+fileName);
 						$("#salebox").css("color", "#7674e2");
 						

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
	
	
	
	
	//팝업 창 스크립트
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
	
	
	</script>
</body>
</html>