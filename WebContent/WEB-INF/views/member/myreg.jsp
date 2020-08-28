<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<style>
<%@ include file="/css/basic_popup.css" %>
</style>
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
        height: 3500px;
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
        /* end */

        #container #submenu .click{
            text-decoration: underline;
            font-weight: bold;
        }
      /* 정보창 */
      .inputpost {
        width: 1000px;
        /* margin: 0px auto.; */
        margin-left: 100px;
      }

      .inputheader {
        /* border: 1px solid blue; */
        height: 30px;
        font-size: 1.4em;
        border-bottom: 3px solid #c6c6f3;
        padding-top: 40px;
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
        width: 285px;
        height: 30px;
        border-radius: 5px;
        margin-right: 40px;
        padding-left: 15px;
        background-color: #e8e8e8;
        /* cursor: not-allowed; */
        /* readonly는 추후 기능 추가 */
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
        /* margin-bottom: 100px; */
        display: inline-block;
      }

      #questionmark {
        margin-top: 5px;
      }

      /* 보증금 */
      .inputmoney {
        margin-right: 10px;
      }

      .inputmoney + span {
        margin-right: 45px;
      }

      #qspan {
        margin-right: 0px;
      }

      .area,
      .true_area {
        margin-bottom: 30px;
        margin-right: 0px;
      }

      .areatitle,
      .trueareatitle {
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
      }

      #inputline2 {
        height: 500px;
      }
      textarea {
        margin: 5px;
        width: 800px;
        height: 300px;
        resize: none;
        margin-right: 150px;
        float: left;
        border: 3.5px solid #e8e8e8;
      }

      #inputcontainer {
        margin-top: 100px;
      }

      .state {
        font-size: 1.4em;
        /* border: 0px solid #e8e8e8; */
        outline: none;
        border-radius: 5px;
        width: 150px;
        height: 40px;
        text-align: center;
        background-color: #3cba99;
        color: white;
        float: right;
        margin-top: 80px;
        margin-right: 100px;
      }
       /* 수정 버튼 */
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
        margin: 50px 15px;
      }
      .btn:after{
        content:"";
        display:block;
        clear:both;
      }
      #changebtn:hover, #deletebtn:hover{
        cursor:pointer;
      }
      .room_img{
        width:300px;
        height:200px;
      }
      .room_img:nth-last-child(){
        position:relative;
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
        top:270%;
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
    </style>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
	 <script src="../WEB-INF/code/highcharts.js"></script>
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
        <!-- submenu -->

        <div class="state">
          <p>${dto.state }</p>
        </div>
         <div id="inputcontainer" class="inputheader">
           ${dto.subject }
		</div>
        <div id="inputcontainer" class="inputpost">
          <div id="inputcontent1" class="inputcontent">
          
            <div id="inputheader1" class="inputheader">
              <p>주소</p>
            </div>
            <div id="inputline1" class="inputline">
<!--               <input type="text" id="poscode" class="inputtext" value="05630" /> -->
              <input
                type="text"
                id="address"
                class="inputtext"
                value="${dto.address}"
              />
<!--               <input -->
<!--                 type="text" -->
<!--                 id="extraaddress" -->
<!--                 class="inputtext" -->
<!--                 value="1234번지 해피빌라 4567동 8965호" -->
<!--               /> -->
            </div>
          </div>
          <div id="inputcontent2" class="inputcontent">
            <div id="inputheader2" class="inputheader">
              <p>사진</p>
            </div>
            <div id="inputline2" class="inputline">
              <div class="imgbox">
              <c:forEach items="${imglist}" var="himg">
                <a href="../pic/${himg.filename}" data-title="${himg.filename }" data-lightbox="example-set"><img class="room_img" src="../pic/${himg.filename }" alt=""></a>
              </c:forEach>
              </div>
            </div>
            <div id="inputcontent3" class="inputcontent">
              <div id="inputheader3" class="inputheader"><p>가격</p></div>
              <div id="inputline3" class="inputline">
               ${dto.stype }
                <c:if test="${dto.stype=='월세'}"> 
                <input
                  type="text"
                  value="${dto.depcost}"
                  class="inputtext inputmoney"
                /><span>만원</span>
                <input
                  type="text"
                  value="${dto.cost }"
                  class="inputtext inputmoney"
                /><span id="qspan">만원</span>
                </c:if>
                
                <c:if test="${dto.stype=='전세'}"> 
                <input
                  type="text"
                  value="${dto.cost}"
                  class="inputtext inputmoney"
                /><span>원</span> 
                </c:if>
                
                  <c:if test="${dto.stype=='매매'}"> 
                <input
                  type="text"
                  value="${dto.cost}"
                  class="inputtext inputmoney"
                  id=
                /><span>원</span> 
                </c:if>
         		<img id="img1" src="../images/questionmark.png">
              </div>
            </div>
            <div id="inputcontent4" class="inputcontent">
              <div id="inputheader4" class="inputheader"><p>방 구조</p></div>
              <div id="inputline4" class="inputline">
               	 <input
                    type="text"
                    class="area inputtext"
                    value="${dto.htype}"
                  />
              </div>
            </div>
            <div id="inputcontent5" class="inputcontent">
              <div id="inputheader5" class="inputheader"><p>관리비</p></div>
              <div id="inputline5" class="inputline">
                <input
                  type="text"
                  class="inputtext inputmoney"
                  value="${dto.depcost }"
                /><span>원</span>
<!--                 <span>관리비 포함 항목></span> -->
<!--                 <input type="checkbox" class="cb" /><span>전기세</span> -->
<!--                 <input type="checkbox" class="cb" /><span>가스</span> -->
<!--                 <input type="checkbox" class="cb" /><span>수도</span> -->
<!--                 <input type="checkbox" class="cb" /><span>인터넷</span> -->
<!--                 <input type="checkbox" class="cb" /><span>T V</span> -->
              </div>
            </div>
            <div id="inputcontent6" class="inputcontent">
              <div id="inputheader6" class="inputheader"><p>방 면적</p></div>
              <div id="inputline6" class="inputline">
                <div>
                  <div class="areatitle">전체 면적</div>
                  <input
                    type="text"
                    class="area inputtext"
                    id="inputarea"
                    value="${dto.area+3}m²"
                  />
                  <span> ▶ </span>
                  <input
                    type="text"
                    class="true_area inputtext"
                    value="<fmt:formatNumber value="${(dto.area+3)*0.3 }" pattern='.00'/>평"
                    id="inputtruearea"
                  />
                </div>
                <div>
                  <div class="trueareatitle">계약 면적</div>
                  <input type="text" class="area inputtext" value="${dto.area }㎡" id="inputarea2"/>
                  <span> ▶ </span>
                  <input 
                  type="text" 
                  class="true_area inputtext"
                  id="true_area2" 
                  value="<fmt:formatNumber value="${(dto.area)*0.3 }" pattern='.00'/>평"
                    />
                </div>
              </div>
            </div>
            <div id="inputcontent7" class="inputcontent">
              <div id="inputheader7" class="inputheader"><p>선택한 옵션</p></div>
              <div id="inputline7" class="inputline">
                <div id="cbbox">
                <c:forEach items="${optlist}" var="optlist">
                <span style="margin-right:15px;">${optlist.hoption}</span>
              	</c:forEach>
                </div>
              </div>
            </div>

            <div id="inputcontent8" class="inputcontent">
            
              <c:forEach items="${optlist}" var="optlist">
              	<c:if test="${optlist.hoption=='대출'} and ${dto.stype=='전세'} ">
              <div id="inputheader8" class="inputheader"><p>전세 대출</p></div>
              <div id="inputline8" class="inputline">
       
                <span style="margin-right:15px;">전세 대출 가능</span>
                
<!--                	<span style="margin-right:15px;">전세 대출 불가</span> -->
              </div>
              
                </c:if>
              	</c:forEach>
            </div>

            <div id="inputcontent9" class="inputcontent">
              <div id="inputheader9" class="inputheader"><p>${dto.detailsubject}</p></div>
              <div id="inputline9" class="inputline">
                <textarea readonly class="explain">${dto.detailcontent } </textarea>
              </div>
            </div>
                 <!-- 수정, 삭제 버튼-->
           <!-- 수정, 삭제 버튼-->
           <div id="btn">
            <input
              id="changebtn"
              class="btn"
              type="button"
              value="회원 정보 수정"
            />
            <input id="deletebtn" class="btn" type="button" value="게시물 삭제" />
          </div>
          </div>
       
        <!-- container -->
        
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
      </div>
 </div>
        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        
        
	<script>
	$("#myreg").attr("class","click");
	$("input[type=text]").attr("readonly","true");
	
	 //버튼 클릭 시 팝업창 열기
    $("#img1").click(function(){
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
    
   //시세보기 팝업 등장
     $("#img1").click(function(){
        
        //해당 지역 월세 or 전세 or 매매 값 저장
        var saletype = "0";
        //
        
        //지역 값이 있을 경우 
        if($("#address").val() != "서울특별시 강남구 개포동"){
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
                    

/*                           title: {
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