<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_admin.css">
<link rel="stylesheet" href="/bangterior/css/fakenoticelist.css">
<style>
#nav {
    /* height: 1100px; */
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
            
            
            
            
            
                   <div id="main_title">허위 매물 신고 내역 </div>

                
                <div id="sub_title">
                <div id="txt2">상태 선택</div>
                
                <form method="GET" action="/bangterior/fakenoticelist.do">
	                <select id="sel1" name="sel1" onchange="location.href='/bangterior/fakenoticelist.do?sel1=' + this.value;">
	                	<option value="0">전체</option>
	                    <option value="1">대기</option>
	                    <option value="2">허위매물</option>
	                </select>
                </form>
                
                </div>


                <div id="content">
        
                    <table class="tbl">
                        <thead>
                        
                        
                            <tr>
                                <th>No.</th>
                                <th>매물번호</th>
                                <th>매물</th>
                                <th>신고자</th>
                                <th>신고일</th>
                                <th>상태</th>
                            </tr>
                         
                        </thead>
                        <tbody>
                        
                            
                        <c:forEach items="${list}" var="dto">
                            <tr>	
                                <td>${dto.rnum}</td>
                                <td>${dto.hbseq}</td>
                                <td class="report" data-no="${dto.hpseq}">
                                	${dto.subject}		
                                </td>
                                <td>${dto.id}</td>
                                <td>${dto.regdate}</td>
                                
                                <c:if test="${dto.state == '대기'}">
                                <td><div>대기</div></td>
                                </c:if>
                                
                                <c:if test="${dto.state == '처리'}">
                                <td><div>허위매물</div></td>
                                </c:if>
                            </tr>
                            
						</c:forEach>
						<%-- </c:if> --%>
                        </tbody>
                    </table>
                    
                    
                    <!-- 페이징 -->
                    ${pagebar}
                    

        
        			<!-- 검색 -->
        			<form method="GET" action="/bangterior/fakenoticelist.do">
	                    <div class="search_area">
	                        <select id="search_select" name="search_select">
	                            <option value="0">제목</option>
	                            <option value="1">내용</option>
	                            <option value="2">제목+내용</option>
	                        </select>
	                        <input type="text" id="search_word" name="search_word" placeholder="검색어를 입력하세요.">
	                        <input type="submit" id="search_btn" value="검색">
	                        
	                        <input type="hidden" name="page" value="${page}">
	                        <input type="hidden" name="sel1" value="${sel1}">
	                    </div>
     			   </form>
     			   
                    </div> 
            
            
            
            
            
            
            <!-- box 끝 -->
            </div>
            
            <div style="clear:both;"></div>
        </div>

        <div style="clear:both;"></div>
        
        
        
        
        
        
        <!-- 팝업창 -->
                <div class="modal"></div>
                <div class="popup write_popup login_popup">

					<!-- forEach X  -->

                    <div id="main">
                        <div id="num"></div>
                        <div id="title"></div>
                        <hr>
                
                        <div id="box1">
                        <img src="/bangterior/pic/nopic.png" id="img1">
                        </div>
                        <div id="box2">
                            <div id="box2_1"> 
                            <input type="button" value="매물 자세히 보기" id="detail_btn" data-seq="${dto.hpseq}">
                          
                            </div>
                            <div id="box2_2"></div>
                            <div id="box2_3"></div>
                            <div id="box2_4"></div>
                            <div id="box2_5"></div>
                        </div>
                        </div>
                        <div id="box3">
                            <div id="box3_1"></div>
                            <div id="box3_2">
                                <input type="checkbox" id="cb1" name="cb1"><label for="cb1"> 무등록 불법 중개행위</label>
                            </div>
                            <div id="box3_3">
                                <input type="checkbox" id="cb2" name="cb2"><label for="cb2"> 존재하지 않는 매물</label>
                            </div>
                            <div id="box3_4">
                                <input type="checkbox" id="cb4" name="cb4"><label for="cb4"> 표시된 정보와 상이</label>
                            </div>
                            
                        </div>
                        
                        

                    <!-- modal 내 버튼들 -->
                    <!-- 업데이트 처리할 게시물 seq 넘겨줌 -->
                    <div id="btns">
	                    <div class="ok_btn" id="call_btn">집주인 연락</div>
	                    <div class="ok_btn" id="regular_btn">정상 매물</div>
	                    <div class="ok_btn" id="fake_btn">허위 매물</div>
	                    <div class="ok_btn" id="cancel_btn">취소</div>
	                    <div class="ok_btn" id="close_btn">닫기</div>
		            </div> 
                    
                    
                    <!-- 버튼에 따른 modal 처리 -->
                    <!-- 1.집주인 연락  -->
                    <div class="call_modal"></div>
                    <div class="call_popup">
                    	<p>정상적으로 처리 되었습니다.</p> 
                    	<div class="m_ok_btn">확인</div>
                    </div>
                    
                    

                
                </div>
        
      
    
    <script>
    
    
    
    
    
    	//select box값 유지
    	$("#sel1").val(${sel1});
    	
    	
    	
    	/* 게시물 제목 클릭시 팝업 실행 */
    	$(".report").click(function() {
    		//해당 seq 가져옴 
    		//클릭한 제목에 해당하는 게시물 seq > regular_btn data-no 속성값으로 저장 
    		$("#regular_btn").data("no", $(this).data('no'));
    		
    		alert($(this).data('no'));
    		
    		
    		
    		$.ajax({
    			type: "POST",
    			url: "/bangterior/admin/fakenoticelistok.do",
    			async: true,
    			data:"hpseq=" + $(this).data('no'),
    			dataType:"json",
    			success: function(result) {
    				//alert(result);
    				//alert(result.hbseq);
    				
    				$(result).each(function(index, item) {
    					//각 위치에 맞는 곳에 값 넣어주기 
    					
    					$("#num").text('매물번호 '+item.hbseq);
    					$("#box2_2").text('매물번호 '+item.hbseq);
    					$("#box2_3").text(item.sttype);
    					
    					
    					//가격 출력 
    					//가격이 1억 이상 일 때
    					if(item.cost >= 100000000) {
    						
    						var first_cost = parseInt(item.cost / 100000000) ;			//억 단위 
    						var last_cost = ( item.cost % 100000000 ) / 10000;	//천단위

	    					//조건 필요 
	    					//depcost == 0 인 경우 월세 X (전세 or 매매)
	    					if(item.depcost == '0') {
	    						//alert("월세 X");
	    						//"가격 / 관리비"  						
	    						$("#box2_4").text(first_cost + '억 ' + last_cost + ' / ' + item.maincost + ' (관리비)');    						
	    					} else {
	    						//월세 
	    						//"보증금 / 월세"
	    						//alert("월세 O");
	    						$("#box2_4").text(item.cost + ' / ' + item.depcost);    						    						
	    					}
    						
    					} else {
    						//가격이 1억 미만일 때
	    						//alert("월세 X");
    						if(item.depcost == '0') {
	    						//"가격 / 관리비"
	    						$("#box2_4").text(item.cost + ' / ' + item.maincost + ' (관리비)');    	
    						} else {
	    						//월세 
	    						//"보증금 / 월세"
	    						//alert("월세 O");
	    						$("#box2_4").text(item.cost + ' / ' + item.depcost);    						    						
	    					}

    					}
    					
    					//조건 필요 
    					//체크박스 체크 
    					if(item.reportreason.substring(0,1) == '무') {
    						$("#cb1").attr("checked" , true);
    					} else if (item.reportreason.substring(0,1) == '존') {
    						$("#cb2").attr("checked" , true);
    					} else if (item.reportreason.substring(0,1) == '표') {
    						$("#cb3").attr("checked" , true);    						
    					}
    					
    					
    					$("#box2_5").text(item.address);
    					$("#img1").attr("src",'/bangterior/pic/'+item.filename);
    					
    					
   	                    
    					//버튼 출력 조건 
    					$("#btns > div").hide();
    					
    					console.log($("#btns > div"));
    					
    					if(item.state == '대기') {
    						
    						$("#call_btn").show();
    						//정상매물 , 허위매물 버튼 > 집주인 연락 버튼 누를시에만 활성화 
    						$("#regular_btn").show();
    						$("#fake_btn").show();
    						$("#cancel_btn").show();
    						
    					} else if (item.state =='처리') {
    						
    						$("#close_btn").show();
    						
    					}
    					
    				});
    			},
    			error: function(a,b,c) {
    				console.log(a,b,c);
    			}
    		});
    		
    		
    		//modal 띄우기
    		$(".modal").css("display","block");
    		$(".write_popup").css("display","block");
    	});
    	
    	
    	
    	
    	
    	
    	$("#call_btn").click(function() {
    		//집주인 연락 버튼 
    		$(".call_modal").css("display","block");
    		$(".call_popup").css("display","block");
    	});
    	
    	
    	$(".m_ok_btn").click(function() {
    		//집주인 연락 버튼 > 확인 > 닫기
 		   $(".call_modal").attr("style", "display:none");
		   $(".call_popup").attr("style", "display:none");

			$("#regular_btn").attr("style","background-color:#7674E2");
			$("#fake_btn").attr("style","background-color:#7674E2");
		   
    	});
    	
    	
    	
    	$("#cancel_btn").click(function() {
    		//취소 (닫기) 버튼 
   		   $(".modal").attr("style", "display:none");
   		   $(".popup").attr("style", "display:none");
    	});
    	
    	
    	$("#close_btn").click(function() {
    		//닫기 버튼 
   		   $(".modal").attr("style", "display:none");
    	   $(".popup").attr("style", "display:none");
    	});
    	
    	
    	$("#regular_btn").click(function() {
    		//정상매물 버튼
    		$(".call_modal").css("display","block");
    		$(".call_popup").css("display","block");
    		
    		
    		$.ajax({
    			
    			type:"GET",
    			url:"/bangterior/admin/fakeok.do",
    			
    			//report 클릭이벤트 발생시 data-no에 저장된 값 불러옴 
    			data:"hpseq=" + $(this).data('no') + "&num=0",
    			dataType: "json",
    			success: function() {
    				
    			},
    			error: function(a,b,c) {
    				console.log(a,b,c);
    			}
    			
    		});//ajax
    		
    	});
    	
    	
    	
    	
    	
    	$("#fake_btn").click(function() {
    		//허위매물 버튼
    		$(".call_modal").css("display","block");
    		$(".call_popup").css("display","block");
    		
    		$.ajax({
    			
    			type:"GET",
    			url:"/bangterior/admin/fakeok.do",
    			data:"hpseq=" + $(this).data('no') + "&num=1",
    			dataType: "json",
    			success: function() {
    				
    			},
    			error: function(a,b,c) {
    				console.log(a,b,c);
    			}
    			
    		});//ajax
    	});
    	
    	
  
     	$("#detail_btn").click(function() {
    		//매물 자세히 보기 버튼 클릭시 > 해당 매물의  상세 보기 페이지 팝업
    		
    		$("#detail_btn").data("seq", $(this).data('seq'));
    		
    		 alert($(this).data('seq'));
    		 
    		 window.open("house/HouseSearchDetail.do?seq=" + $(this).data("seq"), "_blank","width=1800, height=900 , left=530, top=200");
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

</body>
</html>