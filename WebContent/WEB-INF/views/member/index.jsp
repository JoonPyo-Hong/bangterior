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
	.list_box{
	background-repeat:no-repeat !important;
	background-size:cover;
	}
	
	.QnA, .notice{
		border-bottom: 2px solid black;
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

                <div class="main_search">
                    <p><span>어떤 동네, 어떤 방</span>에서<br>살고 싶으신가요?</p>
                    <input class="search_txt" type="text" value="">
                    <input class="search_btn" type="button" value="방 찾기">
                </div>
                
                <div class="main_room">
                    <p><span>추천 매물 리스트</span><br>방 찾기 초보를 위한 초간단 솔루션! </p>                   
                    <ul class="list">
                        <li><div class="list_box" style="background-image:url('/bangterior/images/index_img1.jpg')"></div>나만을 위한 추천</li>
                    <c:forEach items ="${hreco }" var="hreco">
                   		 <li><div class="list_box" style="background-image:url('/bangterior/images/${hreco.filename }')"></div>${hreco.subject}</li>
                    </c:forEach>
                    </ul>
                </div>
                
                <div class="main_services">
                    <p><span>추천 금융 서비스</span><br>방 찾기와 함께 맞춤형 금융 서비스를 소개!</p>                   
                    <ul class="list">
                    	<c:forEach items="${ereco}" var="ereco" begin="0" end="2">
                        <li><div class="list_box" style="background-image:url('/bangterior/images/${ereco.filename}')" ></div>제목:${ereco.subject}<br>조회수:${ereco.readcnt }<br>추천수:${ereco.recomcnt}</li>
                        </c:forEach>
                    </ul>
                </div>
                

                <div class="main_notic">
                    <p><span>Logo의 고객서비스</span><br>공지사항과 관련 뉴스를 소개!</p>                   
                    <ul class="list">
                        <li><iframe id="player" type="text/html" class="list_box"
  src="http://www.youtube.com/embed/M7lc1UVf-VE?enablejsapi=1&origin=https://youtu.be/x1kevdZmeW8"
  frameborder="0"></iframe></li>
                        <li>
                        <div class="list_box">[공지사항]
                        <c:forEach items="${notice }" var="noti">
                        	<div class="notice">
                        	<span class="mainlist">${noti.subject }[${noti.regdate }]</span>
                        	</div>
                        </c:forEach>
                        </div></li>
                        <li>
                        <div class="list_box">[자주묻는질문]
                        <c:forEach items="${faq }" var="faq">
                        	<div class="QnA">
                        	<span class="mainlist">${faq.subject }[${faq.type }]</span>
                        	</div>
                       	</c:forEach>
                        </div>
                        </li>
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
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '360',
          width: '640',
          videoId: 'M7lc1UVf-VE',
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          setTimeout(stopVideo, 6000);
          done = true;
        }
      }
      function stopVideo() {
        player.stopVideo();
      }
    </script>
</body>
</html>