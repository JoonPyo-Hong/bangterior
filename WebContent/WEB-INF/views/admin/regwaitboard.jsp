<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_admin.css">
<style>
#nav {
    /* height: 1100px; */
}

      #title {
            /* border-bottom: 1px solid black; */
            width: 1200px;
            padding-top: 50px;
            font-size: 2.5em;
            margin: auto 100px;
        }



    </style>




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
        margin: 50px auto;
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

    thead tr th:nth-child(1){width: 150px;}
    thead tr th:nth-child(2){width: 550px; text-align: left;  }
    tbody tr td:nth-child(2){text-align: left; }
    thead tr th:nth-child(3){width: 80px;}
    

    a:link { color: black; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover {  text-decoration: underline;}





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
    
        ul li a {
    	text-decoratopn : none;
    	color: black;
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
	<!-- index.jsp (admin)  -->


    <!-- 전체 -->
    <div id="wrap">
        
        <!-- header -->
		<%@ include file="/WEB-INF/views/inc/admin/header.jsp" %>


        <!-- nav -->
		<%@ include file="/WEB-INF/views/inc/admin/nav.jsp" %>


        <div id="container">
            <div class="top_box">
                <ul>
                    <li><img src="/bangterior/images/admin_icon1.png"></li>
                    <li><img src="/bangterior/images/admin_icon2.png"></li>
                    <li><img src="/bangterior/images/admin_icon3.png"></li>
                </ul>
            </div>
            <div class="box">
            
            
            
                         <div id="title">매물 게시글 승인 대기 리스트</div>
			

            <div id="container">


                <div id="content">
                <!-- <h1 class="title">공지사항</h1> -->
    
                <table class="tbl">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                    
       
                    
                    <c:set var="num" value="${totalCount}" />
                    <c:forEach items="${wait_list}" var="dto">
                    <tr>
                        <td>${dto.rnum}</td>
                        
                       		 <td><a href="../bangterior/regview.do?hpseq=${dto.hpseq}&mseq=${dto.mseq}">${dto.subject} </a></td>
                       		 
                       		 <!-- </form> -->
                       
                        <td>${dto.name}</td>
                        <td>${dto.regdate}</td>
                    </tr>
                     <c:set var="num" value="${num - 1}" />
                    </c:forEach>
  
                    </tbody>
                </table>
                
                ${pagebar}
                
    
    	<form method="GET" action="/bangterior/regwaitboard.do" >
                <div class="search_area">
                    <select id="search_select" name="sel">
                        <option value="0">제목</option>
                        <option value="1">내용</option>
                        <option value="2">제목+내용</option>
                        <option value="3">작성자</option>
                    </select>
                    <input type="text" id="search_word" name="search_word" placeholder="검색어를 입력하세요.">
                    <input type="submit" id="search_btn" value="버튼">
                </div>
    	</form>
    
    
                </div>   
    
                <!-- container -->
            </div>
            
            <!-- box -->
            </div>
            
            <div style="clear:both;"></div>
        </div>

        <div style="clear:both;"></div>
    </div>
    
    
    
    <script>
    /* 메뉴 효과 스크립트 */
    $(function(){
          $(".sub").hide();
            $(".mainmenu").click(function(){
             var bbb = $(this).next().css("display");
             if(bbb=="none"){
               $(".sub").slideUp();}
             
             $(this).next().slideDown();
            
            });
      });
    </script>

</body>
</html>