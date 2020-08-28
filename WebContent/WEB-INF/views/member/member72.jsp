<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<style>
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
        #container #submenu .click{
            text-decoration: underline;
            font-weight: bold;
        }
        /* end */
  
        #regbox{
            margin-top:30px;
            /* border:1px solid blue; */
            width:1200px;
            height:400px;
            margin:30px auto;
        }
        #container:after{
            content:"";
            display:block;
            clear:both;
        }
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

        thead tr th:nth-child(1){width: 40px;}
        thead tr th:nth-child(2){width: 300px;}
        thead tr th:nth-child(3){width: 100px; text-align: left;}
        tbody tr td:nth-child(3){text-align: left;}
        thead tr th:nth-child(4){width: 50px;}
      

        .tbl .completed {
            background-color: #ededed;
            color: #4e4eff;
            padding: 3px 6px;
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



        /* 검색창 영역 */

        .search_area {
            text-align: center;
        }

        #search_select {
            font-size: 18px;
            width: 100px;
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
        
        #selbox{
            width:1200px;
            text-align:right;
        }
        
</style>
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
            
            <!-- 마이페이지 등록한 게시물 -->
            <div id="regbox">
                <!-- 게시판 테이블 -->
                <div id="content">
                    <table class="tbl">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>업체명</th>
                                <th>서비스명</th>
                                <th>요청 날짜</th>
                            </tr>
                            </thead>
                            <tr>
                                <td>3</td>
                                <td>쌍용인테리어</td>
                                <td>인테리어 시공</td>
                                <td>2020-07-21</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>일랑인테리어</td>
                                <td>인테리어 시공</td>
                                <td>2020-07-10</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>호호인테리어</td>
                                <td>인테리어 시공</td>
                                <td>2020-07-09</td>
                            </tr>
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
        
        
                    <div class="search_area">
                        <select id="search_select">
                            <option>업체명</option>
                            <option>요청 날짜</option>
                        </select>
                        <input type="text" id="search_word" placeholder="검색어를 입력하세요.">
                        <input type="button" id="search_btn" value="검색">
                    </div>
        
                    </div>   
        
            </div> <!--regbox-->
    </div> <!-- container -->



        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        

	<script>
	</script>
</body>
</html>