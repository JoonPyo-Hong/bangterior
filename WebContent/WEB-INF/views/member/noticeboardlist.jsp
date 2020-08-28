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

        /* 게시판 테이블 */
        .tbl {
            width: 1200px;
            /* height: 400px; */
            margin: 20px auto;
            border-top: 1px solid #e6e6e6;
            border-collapse: collapse;
            text-align: center;
        }

        .tbl th, .tbl td{
            border-bottom: 1px solid #e6e6e6;
        }

        thead tr{
            height:50px;
            font-size: 16px;
            color:#7674e2;
            border-top:2px solid rgb(77, 77, 77);
            border-bottom:1px solid rgb(77, 77, 77);
        }

        tbody tr{
            height:40px;
            color:#333;
        }

        tbody td:nth-child(2):hover{
            font-weight: bold;
            cursor: pointer;
            text-decoration: underline;
        }

        tbody tr:last-child{
            border-bottom:2px solid rgb(77, 77, 77);
        }

        thead tr th:nth-child(1){width: 50px;}
        thead tr th:nth-child(2){width: 120px; text-align: left;}
        tbody tr td:nth-child(2){text-align: left;}
        thead tr th:nth-child(3){width: 80px;}
        thead tr th:nth-child(4){width: 80px;}
        thead tr th:nth-child(5){width: 60px;}

        tbody tr td:nth-child(4){color:#888;}



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



        /* 검색창 영역 */

        .search_area {
            text-align: center;
        }

        #search_select {
            font-size: 18px;
            width: 130px;
            height: 40px;
            text-indent: 5px;
        }

        #search_word {
            font-size: 18px;
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
            color:white;
            font-size: 18px;
            border: none;
            cursor: pointer;
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
            <h1 class="title">공지사항</h1>

            <table class="tbl list">
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
                
                	
                    <c:if test="${not empty search and list.size() == 0}">
                    <tr>
                    	<td colspan="5">검색 결과가 없습니다.</td>
                    </tr>                    	
                    </c:if>
                    
                    <c:if test="${empty search and list.size() == 0}">
                    <tr>
                    	<td colspan="5">게시물이 없습니다.</td>
                    </tr>                    	
                    </c:if>
                    
                
                
                	<c:forEach items="${list}" var="dto">
                    <tr>
                        <td>${dto.rnum}</td>
                        <td><a href="/bangterior/member/noticeboardview.do?seq=${dto.seq}&searchfield=${searchfield}&search=${search}">${dto.subject}</a></td>
                        <td>관리자</td>
                        <td>${dto.regdate}</td>
                        <td>${dto.readcnt}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <div id="paging">
                <div class="left_btn btn">이전</div>
                <ul>
                    <li class="view_page">1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>

                </ul>
                <div class="right_btn btn">다음</div>
            </div>
			
			<!-- 검색 -->
			<form method="GET" action="/bangterior/member/noticeboardlist.do" id="searchForm">
	            <div class="search_area">
	                <select id="search_select" name="searchfield">
	                    <option value="st">제목</option>
	                    <option value="stc">제목+내용</option>
	                    <option value="sc">내용</option>
	                </select>
	                <input type="text" id="search_word" autocomplete="off" placeholder="검색어를 입력하세요." name="search" required value="${search}">
	                <input type="button" id="search_btn" value="검색" onclick="$('#searchForm').submit();">

	            </div>
	        </form>    

            </div>   


        </div>

        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
 		
	</div>
	
	<script>
	
		//select box 상태 유지
		$("#search_select").val("${searchfield}");
		
	</script>
</body>
</html>