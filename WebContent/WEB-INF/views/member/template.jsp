<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
 <style type="text/css">
        #chart1, .highcharts-data-table table {
            min-width: 200px; 
            max-width: 800px;
            margin: 1em auto;
        }

        #chart1 {
            height: 270px;
        }
     
        .highcharts-figure, .highcharts-data-table table {
            min-width: 400px; 
            max-width: 660px;
            margin: 1em auto;
        }
        
        .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #EBEBEB;
            margin: 10px auto;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }
        .highcharts-data-table caption {
            padding: 1em 0;
            font-size: 1.2em;
            color: #555;
        }
        .highcharts-data-table th {
            font-weight: 600;
            padding: 0.5em;
        }
        .highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
            padding: 0.5em;
        }
        .highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }
        .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }
        #chart1box,#chart2box{
            /* border:1px solid black; */
            width:400px;
            float:left;
        }
        #chart3box{
            margin-left:60px;
            width:800px;
            height:500px;
            float:left;
        }

        #chart2, .highcharts-data-table table {
            min-width: 300px; 
            max-width: 800px;
            margin: 1em auto;
        }

        #chart2 {
            width:340px;
            height:270px;
        }
        .highcharts-figure, .highcharts-data-table table {
            min-width: 250px; 
            max-width: 660px;
            margin: 0.5em auto;
        }
        
        .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #EBEBEB;
            margin: 10px auto;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }
        .highcharts-data-table caption {
            padding: 1em 0;
            font-size: 1em;
            color: #555;
        }
        .highcharts-data-table th {
            font-weight: 600;
            padding: 0.5em;
        }
        .highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
            padding: 0.5em;
        }
        .highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }
        .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }
        #chart1box,#chart2box{
            border:1px solid #ccc;
            width:300px;
            margin:2px;
        }
        #chart2box:after{
            content:"";
            display:block;
            clear:both;
        }

       /* 막대그래프 */

       #chart3 {
        width:400px;
        height: 300px; 
        }
        #chart3box{
            width:400px;
            height:300px;
        }

        #chart3 .highcharts-figure, .highcharts-data-table table {
            min-width: 310px; 
            max-width: 800px;
            margin: 1em auto;
        }

        #chart3 .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #EBEBEB;
            margin: 10px auto;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }
        #chart3 .highcharts-data-table caption {
            padding: 1em 0;
            font-size: 1.2em;
            color: #555;
        }
        #chart3 .highcharts-data-table th {
            font-weight: 600;
            padding: 0.5em;
        }
        #chart3 .highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
            padding: 0.5em;
        }
        #chart3 .highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }
        #chart3 .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }

        
       
        .box{
            width:1400px !important;
            height:800px !important;
        }
    
        .ctitle{
            font-size:1.4em;
            margin-right:250px;
        }
        #chartTitle span:first-child{
            margin-right:540px;
            margin-left:150px;
        }
        
        /* 게시판 */
        
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
            margin: 40px auto;
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


       

        /* 검색창 영역 */

        .search_area {
            text-align: center;
        }

        #search_select {
            font-size: 18px;
            width: 100px;
            height: 40px;
            text-indent: 5px;
            position:relative;
            right:750px;
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
            position:relative;
            right:650px;
            top:-40px;
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
            position: relative;
            right:200px;
            top:-80px;
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
            position:relative;
            right:0px;
        }
        #container{
            height:1000px;
        }
        #box2{
            margin:0 auto;
            /* background-color:yellowgreen; */
            width:1200px;
            height:320px;
            
        }
        #tbltitle{
            margin-left:100px;
            /* border:1px solid black; */
            margin-top:70px;
            margin-bottom:-30px;
        }
        .more{
            /* border:1px solid red; */
            display:inline-block;
            position:relative;
            left:880px;
            font-size:1.1em;
        }
        a{
            color:black;
        }
        .tblsubject{
            font-size:1.4em;
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
	
  

        </div>



        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        

	<script>
	</script>
</body>
</html>