<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<link rel="stylesheet" href="/bangterior/css/basic_popup.css">
<style>
	
	
	 /* 해당 페이지 스타일 작업 영역 */
      #content {
        width: 1400px;
        height: 1000px;
        margin: 0 auto;
        /* background-color: #ededed; */
      }

      /* 서브메뉴 타이틀 */
      .title {
        font-size: 2.5em;
        text-align: center;
        padding: 30px 0;
      }

      /* 게시판 테이블 */
      .tbl {
        width: 1200px;
        /* height: 400px; */
        margin: 20px auto;
        border-top: 1px solid #e6e6e6;
        border-collapse: collapse;
        text-align: center;
      }

      .tbl th,
      .tbl td {
        border-bottom: 1px solid #e6e6e6;
      }

      thead tr {
        height: 50px;
        font-size: 1.1em;
        color: #7674e2;
        border-top: 2px solid rgb(77, 77, 77);
        border-bottom: 1px solid rgb(77, 77, 77);
      }

      tbody tr {
        height: 40px;
        color: #333;
      }

      tbody td:nth-child(2):hover {
        font-weight: bold;
        cursor: pointer;
        text-decoration: underline;
      }

      tbody tr:last-child {
        border-bottom: 2px solid rgb(77, 77, 77);
      }

      thead tr th:nth-child(1) {
        width: 50px;
      }
      thead tr th:nth-child(2) {
        width: 120px;
        text-align: left;
      }
      tbody tr td:nth-child(2) {
        text-align: left;
      }
      thead tr th:nth-child(3) {
        width: 80px;
      }
      thead tr th:nth-child(4) {
        width: 80px;
      }
      thead tr th:nth-child(5) {
        width: 60px;
      }

      tbody tr td:nth-child(4) {
        color: #888;
      }

      /* 페이징 영역 */

      #paging {
        /* width: 800px; */
        /* margin: 0 auto; */
        text-align: center;
        margin-top: 30px;
        margin-bottom: 40px;
      }

      #paging ul {
        display: inline-block;
        height: 30px;
      }

      #paging ul li {
        cursor: pointer;
        float: left;
        font-size: 1.1em;
        margin: 0 15px;
        color: #666;
        line-height: 40px;
      }

      #paging ul li.view_page {
        font-weight: bold;
        color: #333;
        text-decoration: underline;
      }

      #paging .btn {
        font-size: 1.1em;
        cursor: pointer;
        display: inline-block;
        padding: 7px 10px;
        border: 1px solid #888;
        margin: 0 10px;
      }

      #paging .btn:hover {
        transition: all 0.5s;
        background-color: black;
        color: white;
      }

      /* 검색창 영역 */

      .search_area {
        text-align: center;
      }

      #search_select {
        font-size: 1.1em;
        width: 100px;
        height: 40px;
        text-indent: 5px;
      }

      #search_word {
        font-size: 1.1em;
        width: 400px;
        height: 40px;
        border: none;
        border-bottom: 1px solid #333;
        margin-left: 20px;
        margin-right: 20px;
        text-indent: 5px;
      }

      #search_btn {
        width: 100px;
        height: 40px;
        border-radius: 1px;
        background-color: #7674e2;
        color: white;
        font-size: 1.1em;
        border: none;
        cursor: pointer;
      }
      
      .basic_popup{
      	top: 70%;
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
			
			<div id="content">
          <h1 class="title">금융 추천 서비스</h1>

          <table class="tbl">
            <thead>
              <tr>
                <th>No.</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="dto">
              <tr>
                <td>${dto.rnum} </td>
                <td><a href='/bangterior/member/viewrecommendfin.do?seq=${dto.seq}&search=${search}&sort=${sort}'>${dto.subject}</a></td>
                <td>관리자</td>
                <td>${dto.regdate }</td>
                <td>${dto.readcnt }</td>
              </tr>
             </c:forEach>
            </tbody>
          </table>

              ${pagebar}

          <div class="search_area">
            <select id="search_select">
              <option value="subject">제목</option>
              <option value="contentsubject">제목+내용</option>
            </select>
            <input
              type="text"
              id="search"
              name="search"
              placeholder="검색어를 입력하세요."
            />
            <input type="button" id="search_btn" value="검색" name="search_btn"/>
          </div>
          
          <!-- 검색어에 입력이 안되어있을 경우 -->
          <div class="modal"></div>
         <div class="basic_popup ">
          <div class="close_btn" id="comclose"><img src="/bangterior/images/close.png" /></div>
          <p>
            검색어를 입력해주세요!
          </p>
          <div class="ok_btn"  id="comok">확인</div>
        </div>
          
          
        </div>
        
        
        
        
			
			
			
			
  

        </div>



        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        

	<script>
	
	
	//팝업 창 스크립트
	//버튼 클릭 시 팝업창 닫기
     $(".ok_btn").click(function(){
        $(".modal").css("display", "none");
        $(".basic_popup").css("display", "none");
    });


    	//[기본] X 버튼 클릭 시 팝업창 닫기
     	$(".close_btn").click(function(){
     	   $(".modal").css("display", "none");
      	  $(".basic_popup").css("display", "none");
 	   });
			
		
	
	$("#pagebar").val(${page});
	
	
	$("#search_btn").click(function(){
		//검색을 누를시
		//안에 내용이 있을 시
		if($("#search").val() != ""){
		location.href='/bangterior/member/listrecommendfin.do?page=1&search='+$("#search").val() + "&sort=" + $("#search_select :selected").val();			
		} else {
			 $(".modal").css("display", "block");
	      	 $(".basic_popup").css("display", "block");
		}
		
	});
	
	//값 고정하기
	
	//선택된 select box 값 유지하기
	if(${sort} != "4"){
		$("#sort").val(${sort});		
	} else {
		$("#sort").val(${sort});				
	}
	
	//입력한 검색어 유지야기
	$("#search").val(${search});
	
	
	
	
	
	</script>
</body>
</html>