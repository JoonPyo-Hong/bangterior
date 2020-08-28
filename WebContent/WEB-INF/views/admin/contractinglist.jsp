<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
  <style>
      
      
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
        #content{
        	margin-top:60px;
        }
        #regbox{
            margin-top:30px;
            /* border:1px solid blue; */
            width:1300px;
            height:500px;
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

        thead tr th:nth-child(1){width: 90px;}
/*         thead tr th:nth-child(2){text-align: left;} */
/*         tbody tr td:nth-child(2){text-align: left;} */
/*          thead tr th:nth-child(3){width: 20px;}  */
/*          tbody tr td:nth-child(3){text-align: center;}  */
        /* thead tr th:nth-child(4){width: 10px;} */
        /* thead tr th:nth-child(5){width: 15px;} */
        tbody tr td:nth-child(5){color:#888;}
        /* thead tr th:nth-child(6){width: 20px;} */

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

        td input{
            width:90px;
            text-align:center;  
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
<!--             <div id="nav"> -->
<!--                 <ul> -->
<!--                     <li><a href="#">매물 조회</a></li> -->
<!--                     <li><a href="#">매물 등록</a></li> -->
<!--                     <li><a href="#">인테리어</a></li> -->
<!--                     <li><a href="#">고객서비스</a></li> -->
<!--                 </ul> -->
<!--             </div> -->
       

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
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>구매자 승인</th>
                                <th>판매자 승인</th>
                                <th>문의 내역</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${dto}" var="dto">
                            <tr>
                                <td>${dto.rownum} </td>
                                <td><a href="../member/contracting.do?postseq=${dto.postseq}&seq=${seq}&conseq=${dto.conseq}">${dto.subject}</a></td>
                                <td>${dto.id}</td>
                                <td>${dto.regdate }</td>	
                                <td><input type="text" value="${dto.consumerconfirm}" disabled></td>
                                <td><input type="text" value="${dto.sellerconfirm }" disabled></td>
                                <td><img src="../images/search_black.png" width="20px" style="cursor: pointer;" class="question_btn" 
                                id="pop${dto.postseq }"  onclick=popup()></td>
                            </tr>
                           	<input type="hidden" value="${size }"  name="size" id="size">
                        </c:forEach> 

                        </tbody>
                    </table>
                    
                    <div id="paging">
                        <div class="left_btn btn">이전</div>
                        <ul>
                            <li class="view_page">1</li>
        
                        </ul>
                        <div class="right_btn btn">다음</div>
                    </div>
        
        
                    <div class="search_area">
                        <select id="search_select">
                            <option>항목 </option>
                            <option>제목</option>
                        </select>
                        <input type="text" id="search_word" placeholder="검색어를 입력하세요.">
                        <input type="button" id="search_btn" value="검색">
                    </div>

              <input type="hidden" value="${seq}" id="memseq">  
            
		 <%@ include file="/WEB-INF/views/popup/contract.jsp" %>
			
			


        
                </div>   
        
            </div> <!--regbox-->
    </div> <!-- container -->
          
		


        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp"%>
         </div>
	<script>
	$("#mying").attr("class","click");
	
	function popup() {
// 		console.log($(event.target) );
		var i = $(event.target).attr("id").substr(3);
		console.log(i);
	    $(".modal").attr("style", "display:block");
    	$("#popup"+i).attr("style", "display:block");
	}
	
	
    //버튼 클릭 시 팝업창 열기
//     for(var i=1;i<=$("#size").val();i++){
//     $("#pop"+i).click(function(){
    
//  		 });
//     }
    //[기본] X 버튼 클릭 시 팝업창 닫기
     $(".close_btn").click(function(){
        $(".modal").attr("style", "display:none");
        $(".popup").attr("style", "display:none");
    });
	
	</script>
</body>
</html>