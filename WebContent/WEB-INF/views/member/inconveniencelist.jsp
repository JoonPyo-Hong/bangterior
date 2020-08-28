<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

        tbody td:nth-child(3):hover{
            font-weight: bold;
            cursor: pointer;
            text-decoration: underline;
        }

        tbody tr:last-child{
            border-bottom:2px solid rgb(77, 77, 77);
        }

        thead tr th:nth-child(1){width: 40px;}
        thead tr th:nth-child(2){width: 40px;}
        thead tr th:nth-child(3){width: 90px; text-align: left;}
        tbody tr td:nth-child(3){text-align: left;}
        thead tr th:nth-child(4){width: 50px;}
        thead tr th:nth-child(5){width: 50px;}
        tbody tr td:nth-child(5){color:#888;}
        thead tr th:nth-child(6){width: 50px;}

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
        

        /* 관리자 글쓰기 버튼 추가 */

        #write_btn {
            text-align: center;
            width: 100px;
            height: 30px;
            border-radius: 1px;
            background-color: #444;
            line-height: 30px;
            color:white;
            font-size: 14px;
            border: none;
            cursor: pointer;
            display: inline-block;
            float: right;
            margin:0;
            margin-right: 100px;
            margin-top: -10px;
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
            <h1 class="title">불편사항</h1>

            <table class="tbl">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>항목</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>3</td>
                        <td>[매물 계약]</td>
                        <td>매물계약 관련 불편 서비스 개선 건의</td>
                        <td>이지윤</td>
                        <td>2020.07.04</td>
                        <td>대기중</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>[업체 신고]</td>
                        <td>블랙리스트 업체 신고합니다.</td>
                        <td>이지윤</td>
                        <td>2020.07.02</td>
                        <td><span class="completed">답변완료</span></td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td></td>
                        <td><img src="../images/arrow.png"> [ 답변 ] 블랙리스트 업체 신고합니다.</td>
                        <td>관리자</td>
                        <td>2020.07.01</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            
            <!-- 관리자 글쓰기 버튼 추가 -->
            <div id="write_btn">
                <div class="write_btn">글쓰기</div>
            </div>


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
                    <option>항목</option>
                    <option>제목</option>
                    <option>제목+내용</option>
                    <option>내용</option>
                </select>
                <input type="text" id="search_word" placeholder="검색어를 입력하세요.">
                <input type="button" id="search_btn" value="검색">
            </div>

            </div>   


        </div>




        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        
        </div>

	<script>
	</script>
</body>
</html>