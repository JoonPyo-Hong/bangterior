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
        margin: 0 auto;
        width: 1200px;
      }
      #mypage {
        /* border:1px solid red; */
        width: 1200px;   
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
        width: 510px;
        font-size: 0.8em;
      }

      #namecardimg {
        width: 80px;
        /* display: inline-block; */
        /* border: 1px solid black; */
        float: left;
        margin-top: 15px;
        margin-right: 10px;
      }

      tr .td:first-child {
        width: 100px;
      }

      tr .td:last-child {
        width: 300px;
      }

      .inputinform {
        float: left;
        margin-right: 10px;
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
          background-color: #bbb;
          font-size: 1.1em;
          color: white;
          width: 150px;
          height: 3 0px;
          text-align: center;
          float: right;
          border-radius: 5px;
      }

      #inputinformtitle span:hover{
          text-decoration: underline;
          cursor: pointer;
      }

      #sellerbox{
            width:1200px;
            height:1500px;
            margin:80px auto;
            /* background-color:burlywood; */
        }

        #seller{
            /* background-color:thistle; */
            height:585px;   
            width:400px;
            /* float:left; */
        }
        #tbl{
            margin:45px;
            border-collapse: collapse;
        }
        #tbl th{
            border-top:1px solid black;
            border-right:1px solid #aaa;
            width:100px;
            font-size:1.4em;
        }
        #tbl td{
            border-top:1px solid #aaa;
            border-right:1px solid #aaa;
            border-bottom:1px solid black;
            width:300px;
            padding:10px;
            font-size:0.7em;
        }
        #tbl th:last-child{
            border-right:0px;
        }
        #tbl td:last-child{
            border-right:0px;
        }
        #tbl input[type="text"]{
            text-align:center;
            background-color:transparent;
            font-size:1.3em;
            border:0px;
            width:170px;
        }
        .explain {
            text-align: center;
            background-color:white;
            margin: 5px auto;
            width:585px;
            height:200px;   
            border:1px solid black;
            overflow:hidden;
            /* float:left; */
        }
        .title1{
            width:600px;
            display:block;
            font-size:1.4em;
            margin-bottom:20px;
            color:slateblue;  
            margin-left:200px;
        }
        .title2{
            width:600px;
            display:block;
            font-size:1.4em;
            margin-bottom:20px;
            color:slateblue;  
            margin-left:150px;
        }
        .home_pic{
            width:840px;
            height:310px;
            /* background-color:chartreuse; */
            position:relative;
            left:170px;
            margin:30px 0;
        }
        .pic{
            margin-top:5px;
            margin-left:5px;
            width: 200px;
            height:150px;
            float:left;
        }
        .pic:first-child{
            width:400px;
            height:300px;
        }
        .pci:last-child{
            opacity:.7;
        }
        
        #pic1{ background-image:url("../images/room1.jpg"); background-size:cover; background-repeat: no-repeat;}
        #pic2{ background-image:url("../images/room2.jpg"); background-size:cover; background-repeat: no-repeat;}
        #pic3{ background-image:url("../images/room3.jpg"); background-size:cover; background-repeat: no-repeat;}
        #pic4{ background-image:url("../images/room4.jpg"); background-size:cover; background-repeat: no-repeat;}
        #pic5{ background-image:url("../images/room5.jpg"); background-size:cover; background-repeat: no-repeat;}

        #mediate{
            /* background-color:teal; */
            margin-top: 100px;
            width:1100px;
            height:650px;
            margin: 20px auto;
        }

        #mediate .mediate_info{
            border:1px solid black;
            /* background-color:whitesmoke; */
            width: 785px;
            height:300px;
            margin: 5px auto;
        }

        .mediate_info .mediate_pic{
            margin:30px;
            background-color:peachpuff;
            width:200px;
            height:250px;  
            float:left;
        }
        #mediate .info{ 
            /* background-color:#ccc; */
            width:410px;
            margin:55px;
            font-size:1.1em;
            font-weight: bold;
            text-align: right;
            float:left;
        }
        #mediate .info:after{
            content:"";
            display:block;
            clear:both;
        }
     
        #mediate .info input[type="text"]{
            display:inline;
            border:0px;
            background-color:transparent;
            font-size:1.1em;
            margin-left : 15px;
        }
        #mediate .info p{
            text-align: left;
        }
        #mediate .info span{
            display:inline-block;
            width:65px;
            text-align:left;
            margin-right:10px;
        }

        #agreebtn{
            font-size:1em;
            width:100px;
            font-weight: bold;
            margin-left: 60px;
        }
        #disagreebtn{
            font-size:1em;
            width:100px;
            font-weight: bold;
            margin-left:100px;
        }
        #agreebox{
          /* background-color:#aaa; */
          width: 400px;
          height: 70px;
          margin : 60px auto;
        }
        /* 옵션 */
        #option{
            /* background-color:peachpuff; */
            width:800px;
            height:200px;
            margin: 10px auto;

        }
        #option span{
            font-size:1.4em;
            width:800px;
            display:block;
            color:slateblue;
        }
        .icon{
            width:50px;
            height:50px;   
            float:left;
            margin:30px;
            margin-left:40px;
        }
        #option #icon1{ background-image:url("..images/option1.png");background-size:cover;background-repeat: no-repeat; margin-left:100px;}
        #option #icon2{ background-image:url("../images/option2.png");background-size:cover;background-repeat: no-repeat; margin-left:100px;}
        #option #icon3{ background-image:url("../images/option3.png");background-size:cover;background-repeat: no-repeat;}
        #option #icon4{ background-image:url("../images/option4.png");background-size:cover;background-repeat: no-repeat;}
        #option #icon5{ background-image:url("../images/optiont5.png");background-size:cover;background-repeat: no-repeat;}
        #option #icon6{ background-image:url("../images/option6.png");background-size:cover;background-repeat: no-repeat;}
        #option #icon7{ background-image:url("../images/option7.png");background-size:cover;background-repeat: no-repeat;}
        #option #icon8{ background-image:url("../images/option8.png");background-size:cover;background-repeat: no-repeat;}
        #option #icon9{ background-image:url("../images/option9.png");background-size:cover;background-repeat: no-repeat;}
        #option #icon10{ background-image:url("../images/option10.png");background-size:cover;background-repeat: no-repeat;}
        #option #icon11{ background-image:url("../images/option11.png");background-size:cover;background-repeat: no-repeat;}
        
       
        #sellerbox a {
            font-size:1.4em;
        }
     
        .office{
            /* background-color:white; */
            font-size:1.4em;
            width:400px;
        }

        
        #intro{
            font-size:1.4em;
            font-weight:bold;
        }
  
        body{
                font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif; 
        }
        .converter{
            font-size:1em;
            cursor:pointer;
        }
        .explain{
            transition: all 0.5s;
        }
        .open{
            width:650px;
            text-align:right;
            color:blue;
        }
        .open:hover{
            text-decoration: underline;
            cursor:pointer;
        }
        hr{
            width:785px;
            margin:20px auto;
        }
         /* 버튼 & 컨텐츠 담는 그릇 */
      .btnbox {
          width: 1200px;
          margin: 0px auto;
          /* border: 1px solid black; */
          float: left;
          text-align: center;
          margin-top: 100px;

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

      hr{
        border:2px solid #ddd; 
        color:slateblue;
      }
       .room_img{
        width:300px;
        height:200px;
      }
      .room_img:nth-last-child(){
        position:relative;
      }
      
        #width{
        display:inline-block;
        width:170px;
        font-size:1.7em;
        height:30px;
        }
      
      .agreebtn{
     	cursor: pointer;
	    text-align: center;
	    width: 100px;
	    margin: 0 auto;
	    margin-top: 40px;
	    height: 40px;
	    line-height: 40px;
	    background-color: #7674E2;
	    color:white;
	    outline:none;
	    border:2px solid #eee;
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

          
        

        <!-- container -->
         <div id="container">
        <!-- 서브메뉴 -->
        <%@ include file="/WEB-INF/views/member/my_submenu.jsp" %>
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
                ><span class="detailcontent">${hinfo.address }</span>
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
                <a href="../pic/${img.filename }" data-title="" data-lightbox="example-set"><img class="room_img" src="../pic/${img.filename }" alt=""></a>
                </c:forEach>
            </div>
          </div>

          <div id="option">
            <span>옵션</span>
            <hr>
            <div id="option_icon">
            <c:forEach items ="${hoptions}" var="hoptions">
                <div class="icon" id="icon${hoptions.optseq }"></div>
            </c:forEach>
            </div>
        </div>

        <span class="title1">방 설명${hinfo.memseq }</span>
        <hr>
        <div class="explain">
            <pre>
${hinfo.detailcontent}
            </pre>
        </div>  <!--explain-->
<!-- <div class="open">↓펼치기</div> -->

</div>  <!-- sellerbox-->
    

<input hidden type="radio" id="agent">
<div id="agreebox">
<c:if test="${(hinfo.sellerconfirm=='상담완료'||hinfo.sellerconfirm=='계약완료') && (hinfo.consumerconfirm=='상담완료'||hinfo.consumerconfirm=='계약완료') }">
<c:if test="${hinfo.sellerseq!=seq }">
<!-- 구매자 -->
<a href="../member/myregagreeok.do?memseq=${seq }&postseq=${hinfo.postseq}&agree=1&conseq=${conseq}"><button type="button" id="agreebtn" class="agreebtn">계약 완료</button></a>
<a href="../member/myregagreeok.do?memseq=${seq }&postseq=${hinfo.postseq}&agree=2&conseq=${conseq}"><button type="button" id="disagreebtn" class="agreebtn">거래 취소</button></a>
</c:if>
<!-- 판매자 -->
<c:if test="${hinfo.sellerseq==seq }">
<a href="../member/regagreeok.do?memseq=${seq }&postseq=${hinfo.postseq}&agree=1&conseq=${conseq}"><button type="button" id="myagreebtn" class="agreebtn">계약 완료</button></a>
<a href="../member/regagreeok.do?memseq=${seq }&postseq=${hinfo.postseq}&agree=2&conseq=${conseq}"><button type="button" id="mydisgreebtn" class="agreebtn">계약 취소</button></a>
</c:if>
</c:if>
</div>

        </div>




        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        </div>

 <script>
      // 서류제출 누르면 서류제출 팝업창
      // 면적 버튼 누르면 면적->평수, 평수->면적 계산

   	var flag=0;
	$(".changebtn").click(function(){
	if(flag==0){
		$("#width").text(Math.ceil($("#pyung").val())+"평");
		flag=1;
	}
	else{
		$("#width").text($("#width").data("width")+" ㎡");
		flag=0;
	}
	});

       // 방 설명 슬라이드
       var flag =true;
        var regbox_height = $("#regbox").css("height");
        var explain_height = $(".explain").css("height");
        // console.log(regbox_height);
        // console.log(explain_height);
        $(".open").mousedown(function(){
         if(flag){
            // $("#regbox")
            //         .css("height",parseInt(regbox_height)+1300+"px");
            $(".explain")
                    .css("height",parseInt(explain_height)+1300+"px");
          $(".open").text("↑접기");
            flag=false;
         }
         else{
            // $("#regbox")
            //         .css("height",regbox_height);
            $(".explain")
                    .css("height",explain_height);
          $(".open").text("↓펼치기");
            flag=true;
         }
        });
        
        $("#mying").attr("class","click");
    </script>
</body>
</html>