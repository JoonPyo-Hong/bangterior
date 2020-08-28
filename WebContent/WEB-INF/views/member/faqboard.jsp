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
        /* 해당 페이지 스타일 작업 영역 */
        #content {
            width: 1400px;
            height:5000px;
            margin: 0 auto;
            /* background-color: #ededed; */
        }

        /* 서브메뉴 타이틀 */
        .title {
            font-size: 36px;
            text-align: center;
            padding: 30px 0;
        }

        /* 자주하는 질문 항목 */
        .faq_select {
            width: 550px;
            margin: 40px auto;
            height: 40px;
            border-bottom: 1px solid #ddd;
        }


        .faq_select ul li{
            cursor: pointer;
            float: left;
            margin-left: 25px;
        }

        .faq_select ul li:hover {
            text-decoration: underline;
        }

        .faq_select ul li.click {
            font-weight: bold;
            text-decoration: underline;
        }



        /* 자주묻는 질문 아코디언 */
        .accordion-box{
            width: 1200px;
            margin:  0 auto;
        }

        p.faq{
            width: 1200px;  
            line-height: 60px; 
            background: #ededed; 
            color: #444; 
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            box-sizing: border-box;
            padding: 0 10px;
            cursor: pointer;
            text-indent: 10px;
        }

        .con{
            padding: 40px 0px;
            display:none;
            border-bottom: 1px solid #ddd;
        }

        .con p{
            margin-left: 20px;
        }



        /* 페이징 영역 */

        #paging {
            width: 500px;
            margin: 0 auto;
            text-align: center;
            margin-top: 30px;
            margin-bottom: 40px;
        }

        #paging ul {
            display: inline-block;
            height: 30px;
        }

        #paging ul li{
            cursor: pointer;
            float: left;
            font-size: 18px;
            margin: 0 15px;
            color:#666;
            line-height: 40px;
        }

        #paging ul li.view_page{
            font-weight: bold;
            color:#333;
            text-decoration:underline;
        }

        #paging .btn {
            font-size: 14x;
            cursor: pointer;
            display: inline-block;
            padding:7px 10px;
            border:1px solid #888;
            margin: 0 10px;
        }

        #paging .btn:hover {
            transition: all 0.5s;
            background-color: black;
            color:white;
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


            <div id="content">
            <h1 class="title">자주하는 질문</h1>

            <!-- 자주하는 질문 항목 -->
            <div class="faq_select">
                <ul>
                    <li class="click">전체보기</li>
                    <li>회원 정보</li>
                    <li>중개사</li>
                    <li>시공 서비스</li>
                    <li>홈페이지 이용</li>
                    <li>기타</li>
                </ul>
                <div style="clear: both;"></div>
            </div>

            <!-- 자주묻는 질문 아코디언  -->
            <div class="accordion-box">
                <ul class="list">
                
                <c:forEach items="${faqlist}" var="dto">
                  <li>
                   <p class="faq">Q. ${dto.subject}</p>
                   <div class="con"><p>${dto.content}</p>
                    </div>
                 </li>
                 </c:forEach>
                 
<!--                  <li>
                   <p class="faq">Q. 회원탈퇴는 어떻게 하나요?</p>
                   <div class="con"><p> 서비스 회원탈퇴를 원하실 경우<br>
                    <br>
                    ▶ ‘마이페이지’ 메뉴에서 ‘정보수정’으로 이동 후 화면 하단에 '회원탈퇴'를 탭하시면 탈퇴가 가능합니다.
                    <br>
                    ▶ 앱과 PC에서 모두 회원탈퇴가 가능하며, 개선점에 대한 건의 사항은 하단 이메일로 보내주시면 서비스 개선에 큰 도움이 됩니다.</p></div>
                 </li>
                 <li>
                   <p class="faq">Q. 허위매물은 어떻게 관리 하나요?</p>
                   <div class="con"><p>허위매물 전담팀이 수시로 매물을 살펴보고 허위매물을 필터링하고 있습니다.
                       <br><br>
                    ▶ 지역구별 평균 시세를 파악해 시세에 비해 확연히 저렴한 매물이나 실사진이 아닌 사진이 포함된 경우 직접 연락을 취해 정보 수정을 요청합니다.
                    <br>
                    ▶ 광고 기간이 30일이 지난 매물의 경우 자동으로 비공개 처리하여 계약이 완료된 매물의 노출 가능성을 줄였고,
                    <br>
                    ▶ 사용자가 직접 허위매물을 신고할 수 있도록 관련 제도를 마련하여 다방면에서 허위매물 ZERO를 위한 노력을 기울이고 있습니다.</p></div>
                  </li> -->
                 </ul>
             </div>


        </div>




        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        
        </div>

    <script>
    
        // 아코디언 메뉴
        $("p.faq").on('click',function(){
            $(this).next(".con").slideToggle(100);
        });
        
    </script>
</body>
</html>