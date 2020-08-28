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
            /* padding-left: 30px; */
            font-size: 2.5em;
            margin: auto 100px;
        }
        #sub_title{
            /* border: 1px solid black; */
            width: 200px;
            height:30px;
            font-size: 1.1em;
            float: right;
            /* margin-bottom: 10px; */
            margin-right: 100px;
        }
        
        #txt2 {
            margin-right: 10px;
            float: left;
            /* margin-right: 10px; */
        }

        #sel1 {
            width: 100px;
            /* margin-right: 10px; */
        }







        

    /* 게시판 테이블 */
    .tbl {
        width: 1200px;
        /* height: 400px; */
        margin: 50px auto;
        margin-top: 40px;
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

    thead tr th:nth-child(1){width: 100px;}
    thead tr th:nth-child(2){width: 100px;}
    thead tr th:nth-child(3){width: 450px; text-align: left;  padding-left: 50px;}
    tbody tr td:nth-child(3){text-align: left; padding-left: 50px;}	
    thead tr th:nth-child(4){width: 100px;}
    thead tr th:nth-child(5){width: 100px;}



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
    


     ul .view_page a{ 
    /* #paging ul li a{ */
         
       font-weight: bold;
       color:#333;
       text-decoration:underline; 
        
    }
    
    ul .view_page a:hover{
    	font-weight : bold;
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
            
            <!-- 실제 컨텐츠 구역  -->
            <div id="title">등록된 매물 리스트</div>


 		<form method="GET" action="/bangterior/reghouseboard.do" >

                <div id="sub_title">
                    <div id="txt2">상태 선택</div>
                 
                   	 <select id="sel1" name="sel1" onchange="location.href='/bangterior/reghouseboard.do?sel1=' + this.value;">
                   
                  		<!-- 대기 = 수정 대기 -->
                  		<option value="4" >전체</option>
                        <option value="0" >대기</option>
                        <option value="1" >신고</option>
                        <option value="2" >정상 매물</option>
                    </select>
                   
                </div>

                <table class="tbl">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>매물번호</th>
                            <th>매물</th>
                            <th>등록일</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <form method="GET">
                    <tbody>
                    	
                    
                 		<c:set var="num" value="${totalCount}" />
                    	<c:forEach items="${list}" var="dto">
                        <tr>
                            <td>${dto.house_rnum}</td>
                            <td>${dto.house_seq}</td> 
                            
                            <td class="subject" data-hseq="${dto.house_seq}">
                            ${dto.post_subject}
                            
                            </td>
                            
                            <td>${dto.house_regdate}</td>
                            
                            <!-- 0 대기 , 1 신고 , 2 정상매물 , 3 허위매물 -->
                            <c:if test="${dto.post_state == 0}">
                            	<td><div>대기</div></td>
                            </c:if>
                            
                            <c:if test="${dto.post_state == 1}">
                            	<td><div>신고</div></td>
                            </c:if>
                            
                            <c:if test="${dto.post_state == 2}">
                            	<td><div>정상매물</div></td>
                            </c:if>                            
                            <c:if test="${dto.post_state == 3}">
                            	<td><div>허위매물</div></td>
                            </c:if>
                            
                        </tr>
                        <c:set var="num" value="${num - 1}" />
                        </c:forEach> 
        	
                    </tbody>
					</form>
                </table>
                
                
                ${pagebar}
                

                
    
                <div class="search_area">
                
                    
                    <!-- sel1 값 같이 보내기 -->
                    
                    <select id="search_select" name="sel2" >
                        <option value="0">제목</option>
                        <option value="1">내용</option>
                        <option value="2">제목+내용</option>
                    </select>
                               
                    <input type="text" id="search_word" name="search_word" placeholder="검색어를 입력하세요." >
                    <input type="submit" id="search_btn" value="검색" >
                    
                   
                    
                    </form>
                    
                </div>
    
                </div>  

            
            
            </div>
            
            <div style="clear:both;"></div>
        </div>

        <div style="clear:both;"></div>
    



</body>


	<script>
	
		
	//선택된 select box 값 유지하기
	$("#sel1").val(${sel1});
	
	
		
	$(".subject").click(function(){
		//제목 클릭했을 때 
		//매물 상세 페이지 새창 팝업 
	    var width_size = ($(window).outerWidth() / 2) - 290 ;
	    var height_size = ($(window).outerHeight() / 2) - 205 ;
	    
	    //데이터
	    //alert($(this).data("hseq"));
	    
	    window.open("house/HouseSearchDetail.do?seq=" + $(this).data("hseq"), "_blank","width=1800, height=900 , left=530, top=200");
	});

	
	
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
	
	
</html>