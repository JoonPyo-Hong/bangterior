<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<style>
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

                <div class="main_search">
                    <p><span>어떤 동네, 어떤 방</span>에서<br>살고 싶으신가요?</p>
                    <input class="search_txt" type="text" value="">
                    <input class="search_btn" type="button" value="방 찾기">
                </div>
                
                <div class="main_room">
                    <p><span>추천 매물 리스트</span><br>방 찾기 초보를 위한 초간단 솔루션!</p>                   
                    <ul class="list">
                        <li><div class="list_box"></div></li>
                        <li><div class="list_box"></div></li>
                        <li><div class="list_box"></div></li>
                        <li><div class="list_box"></div></li>
                    </ul>
                </div>
                
                <div class="main_services">
                    <p><span>추천 금융 서비스</span><br>방 찾기와 함께 맞춤형 금융 서비스를 소개!</p>                   
                    <ul class="list">
                        <li><div class="list_box"></div></li>
                        <li><div class="list_box"></div></li>
                        <li><div class="list_box"></div></li>
                        <li><div class="list_box"></div></li>
                    </ul>
                </div>
                

                <div class="main_notic">
                    <p><span>Logo의 고객서비스</span><br>공지사항과 관련 뉴스를 소개!</p>                   
                    <ul class="list">
                        <li><div class="list_box">[영상]</div></li>
                        <li><div class="list_box">[공지사항]</div></li>
                        <li><div class="list_box">[자주묻는질문]</div></li>
                    </ul>
                </div>


                <div class="main_interior">
                    <div id="background">
                        <p>리모델링 1분만에 해결!<span><br>시공업체 BEST업체 추천</span></p>
                    </div>
                </div>

        </div>



        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        
        

        <!-- 방찾기 아이콘 -->
        <%@include file="/WEB-INF/views/inc/member/housesearch.jsp" %>



    


	
	<script>
	</script>
</body>
</html>