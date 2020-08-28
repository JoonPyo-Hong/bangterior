<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_admin.css">
<link rel="stylesheet" href="/bangterior/css/regview.css">
<link rel="stylesheet" href="/bangterior/css/basic_popup.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="js/highcharts.js"></script>
<style>
#nav {
    /* height: 1100px; */
}
.reg_basic_popup , .del_basic_popup {
    display: none;  /* 기본 화면에 숨기기 */
    z-index: 1002;
    position: absolute;
    left:50%; top:50%;
    margin-left: -200px;
    margin-top: -125px;
    width: 400px;
    height: 250px;
    background-color: white;
    border:1px solid #eee;
}

.reg_basic_popup p , .del_basic_popup p{
    text-align: center;
    margin-top: 80px;
    color:#444;
}

.reg_basic_popup .reg_ok_btn , .del_basic_popup .del_ok_btn {
    cursor: pointer;
    text-align: center;
    width: 100px;
    margin: 0 auto;
    margin-top: 40px;
    height: 40px;
    line-height: 40px;
    background-color: #7674E2;
    color:white;
}


.del_basic_popup #popup_btn_area{
    width: 280px;
    margin: 0 auto;
}

.del_basic_popup #popup_btn_area .del_ok_btn {
    display: inline-block;
    margin-left: 20px;
}

.del_basic_popup #popup_btn_area .del_cancel_btn{
    background-color: #bbb;
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
            <div class="top_box"></div>
            <div class="box">
            
            
            
                  <div id="title">매물 등록 허가</div>
                <!-- <div id="sub_title">A중개사 님이 올린 매물입니다.</div> -->

                <div id="sub_box">

                    <!-- 왼쪽 컨텐츠 -->
                    <div id="left">
                    
                    <c:forEach items="${reg_info}" var="dto">
                    
                        <!-- <img src="/bangterior/images/nopic.png" id="img1"> -->
                        <img src="/bangterior/pic/${dto.filename}" id="img1">
                        <div id="info_id">아이디: <input type="text" id="id_text" value="${dto.id}" readonly></div>
                        <!-- <div id="info_id">아이디: <div id="id_text">A중개사</div> -->
                        
                        <!-- 중개사 일때 -->
                        <c:forEach items="${reg_list}" var="list">
                        <c:if test="${list.confirm == '1'}">
                        	<div class="cb"><label for="cb1">공인인증서 등록 여부</label> <input type="checkbox" id="cb1" name="cb1" checked="checked" ></div>
                        </c:if>
                        
                        <!-- 중개사 아닐때 -->
                        <c:if test="${list.confirm == '0'}">
                        	<div class="cb"><label for="cb1">공인인증서 등록 여부</label> <input type="checkbox" id="cb1" name="cb1" disabled></div>
                        </c:if>
                        
                        
                        <!-- 블랙리스트 아닐 때 (신고횟수 0~4회) -->
                        <c:if test="${list.noticnt >= 0 && list.noticnt <= 4}">
                        	<div class="cb"><label for="cb2">블랙리스트 등록 여부</label> <input type="checkbox" id="cb2" name="cb2" disabled></div>
                  		</c:if>
                  		
                  		<!-- 블랙리스트 일때 (신고횟수  5회 이상) -->
                        <c:if test="${list.noticnt >= 5}">
                        	<div class="cb"><label for="cb2">블랙리스트 등록 여부</label> <input type="checkbox" id="cb2" name="cb2" checked="checked" ></div>
                  		</c:if>
                  		
                  		</c:forEach>
                    </c:forEach>
                    
                    </div>
                    
                    

                    <!-- 오른쪽 컨텐츠 -->
                    <div id="right">
					<c:forEach items="${reg_info}" var="dto">
					
                        <div id="sub_right">
					
					<c:forEach items="${reg_image}" var="img">
                            <img src="/bangterior/pic/${img.filename}" id="img2">
                    </c:forEach>
                    
                    	${pagebar}
                        </div>  <!-- 여기까지 sub right -->

                       
                        <!-- 왼쪽 상단 box -->
                        <div id="content">
       					 <form method="GET"> 
                            <div id="address" class="info">
                                <span class="s1">주소  ${dto.hpseq}</span> <input type="text" id="address_txt" value="${dto.address}" readonly>
                                <input type="button" value="지도보기" id="map_btn" name="map">
                            	<input type="hidden" name="hpseq" value="${dto.hpseq}">
                            </div>
                         </form> 
                           <!-- 월세 일때만 출력 -->
                            <c:if test="${dto.sttype == '월세'}"> 
                            <div id="deposit" class="info">
                                <span class="s1">보증금</span> <input type="text" value="${dto.cost}원" readonly>
                                
                                <button id="que_btn"><img src="/bangterior/images/question.png" title="해당 지역의 시세보기" id="que_img"></button>
                                
                            </div>
                            <div id="rent" class="info"><span class="s1">월세</span> <input type="text" value="${dto.depcost} 원" readonly></div>
                            </c:if>
                            
                            
                            <!-- 월세가 아닌경우 -->
                            <c:if test="${dto.sttype != '월세' }">
                            <div id="deposit" class="info">
                            	<span class="s1">가격</span> <input type="text" value="${dto.cost}원" readonly>
                            	<button id="que_btn"><img src="/bangterior/images/question.png" title="해당 지역의 시세보기" id="que_img"></button>
                            </div>
 								<div id="rent" class="info"><span class="s1">거래유형</span> <input type="text" value="${dto.sttype}" id="sttype" readonly></div>
                            </c:if>
                            
                            
                            
                            
                            <div id="structure" class="info"><span class="s1">방구조</span> <input type="text" value="${dto.httype}" readonly></div>
                            <div id="cost" class="info"><span class="s1">관리비</span> <input type="text" value="${dto.maincost} 만원" readonly></div>
                            <div id="room_area" class="info"><span class="s1">방면적</span> <input type="text" value="${dto.area + 3}㎡" readonly></div>
                            <div id="con_area" class="info"><span class="s1">계약 면적</span> <input type="text" value="${dto.area}㎡" readonly></div>
                            <div id="room_option" class="info"><span class="s1">옵션</span>  <input type="text" value="옵션" readonly></div>
                            
                            <c:if test="${dto.optseq == '2'}">
                            <div id="loan" class="info"><span class="s1">전세 대출 유무</span>  <input type="text" value="가능" readonly></div>
                            </c:if>
                            
                            <c:if test="${dto.optseq != '2'}">
                            <div id="loan" class="info"><span class="s1">전세 대출 유무</span>  <input type="text" value="불가능" readonly></div>
                            </c:if>
                            
                            <div id="detail" class="info"><span class="s1" id="detail_title">상세 설명</span>  <div id="detailcontent">${dto.detailcontent}</div></div>

                            

                        </div>

                        <!-- 하단 box -->
                        
                        
                        <div id="sub_content">
                            <div id="add_title">자동 계산된 점수</div>

                            <img src="/bangterior/images/research.png" id="research">
                            <div id="score">
                                <div id="all_score">
                                    <span class="score_title">전체 점수</span>
                                    <span id="all_sub">357 점</span>
                                </div>
                                <div id="avg_score">
                                    <span class="score_title">평균 점수</span>
                                    <span id="avg_sub">89.25 점</span>
                                </div>
                            </div>

                            <div id="all_score_box">
                                <div id="c1" class="c"><span class="s">가격</span><span class="score">${auto_cost} 점</span> </div>
                                <div id="c2" class="c"><span class="s">관리비</span><span class="score">${auto_maincost} 점</span></div>
                                <div id="c3" class="c"><span class="s">편의시설</span><span class="score"> 점</span>  </div>
                                <div id="c4" class="c"><span class="s">보안</span><span class="score">90 점</span></div>
                                <div id="c5" class="c"><span class="s">고도</span><span class="score">${auto_alt} 점</span></div>
                            </div>
                        </div>
                        

                    
					
                        <div id="btns">
                         <form method="GET">
                         	<!-- 게시물 seq -->
                         	<input type="hidden" id="hpseq_ok" name="hpseq_ok" value="${dto.hpseq}"> 
                            <input type="button" value="등록" id="reg_btn" >
                            <input type="button" value="삭제" id="del_btn">
                          </form>
                        </div>

						<!-- </form> -->


					</c:forEach>
					
					
					            
           		<!-- 등록 or 삭제 선택시 modal 팝업  -->
           		<div class="modal" ></div>
           		
           		<!-- 등록 버튼 클릭시 -->
				<div class="reg_basic_popup">
					<p>승인이 정상적으로 완료 되었습니다.</p>
					<div class="reg_ok_btn">확인</div>
				</div>
						
				<!-- 삭제 버튼 클릭시 -->
				<div class="del_basic_popup">
					<p>게시물을 삭제 하시겠습니까?</p>
					
					<div id="popup_btn_area">
						<div class="del_ok_btn">취소</div>
						<div class="cancel_btn del_ok_btn">삭제</div>
					</div>
				</div>
				
					
					
					
					
					
					
					
					
					
					
					
					

			<!-- 시세보기 차트 -->
            <!-- 주소창 입력 요구 팝업창 -->
            <div id="regview_finpopup" class="popup demandpopup finpopup basic_popup">
            
            
                <div class="close_btn"><img src="../images/close.png"></div>
                <p>시세 보기 팝업<br>해당 메뉴는 주소 입력 후에 <br>이용 가능합니다.</p>
                <div class="ok_btn">확인</div>
            </div>
            
            <!-- 해당 주소 데이터 없음 팝업창 -->
            <div id="nodatapopup" class="popup nodatapopup finpopup basic_popup">
            
            
                <div class="close_btn"><img src="/bangterior/images/close.png"></div>
                <p>시세 보기 팝업<br>해당 주소는 등록된 데이터가 없습니다.</p>
                <div class="ok_btn">확인</div>
            </div>
            
            
            <!-- 시세보기 팝업  -->
    		<div id="regview_modal" class="modal"></div>
            <div id="seefin" class="popup write_popup seefin basic_popup_chart finpopup basic_popup">
            
            <p>해당 지역 시세 보기</p>
     
            <main>
        		<div id="chart"></div>
      		</main>
            <div class="ok_btn">닫기</div>
          
            </div>





                    </div>


                </div>
          
            <!-- 박스 -->
            </div>
            
            
            
            
            

					
					

            
            <div style="clear:both;"></div>
        </div>

        <div style="clear:both;"></div>
    
    </div>

</body>


<script>



//지도 팝업 
var map = document.all.map_btn;

map.onclick = function() {

	
    console.log($(window).outerWidth());
    console.log($(window).outerHeight());
    
    
    
    
    var width_size = ($(window).outerWidth() / 2) - 290 ;
    var height_size = ($(window).outerHeight() / 2) - 205 ;

    console.log("width_size", width_size);
    child = window.open("mappop.do?hpseq=" + this.form["hpseq"].value, "_blank","width=580, height=410 , left=530, top=200");
   
}
	
	
	
	
	

//시세보기 팝업 등장
$("#que_img").click(function(){
   
   
   //해당 지역 월세 or 전세 or 매매 값 저장 >Seq
  
   /*
    1	매매
	2	월세
	3	전세
   */
  

   var saletype ;
   
   if ($("#sttype").val() == '매매') {
	   saletype = 1;
   } else if ($("#sttype").val() == '월세') {
	   saletype = 2;
   } else if ($("#sttype").val()  == '전세') {
	   saletype = 3;
   }  
   
   
   
   
   
   
   
   
   //지역 값이 있을 경우  > 주소 (ex) 서울특별시 강남구 개포동 ,, )
   if($("#address_txt").val() != ""){
      //지역값 저장 -> db 다녀오기
      //ajax 처리
       $.ajax({
         type: "POST",
         url: "http://localhost:8090/bangterior/admin/seemarketprice.do",
         data: "saletype=" + saletype +"&address=" + $("#address_txt").val(), //지번 주소만 갈것
          dataType: "json",
         success: function(result){
            
            
            //성공시 해당 팝업 등장
            options.series = result;
            
            options.title.text = '2020년 ' + result[2].name + ' 시세보기';
               

/*                           title: {
                       text: '2020년 oo동 시세 보기'
                   },
*/
            Highcharts.chart('chart', options);
           
            $("#regview_modal").css("display", "block");
            $("#seefin").css("display", "block");
            
         },
         error: function(a,b,c){
            
            //빈값 팝업
            $("#regview_modal").css("display", "block");
            $("#nodatapopup").css("display", "block");
            
            console.log(a,b,c);
         }
         
         
      });//ajax
      
      
      
      

       
      
   } else {
      //지역값 입력 요구 팝업
      $("#regview_modal").css("display", "block");
        $("#regview_finpopup").css("display", "block");
   }


}); //버튼 이벤트







var options = {
           credits: {
               enabled: false,
             },

            colors: [
               "#FCBD2E",
               "#3CBA99",
               "#EE5656"
            ],
            
            title : {
               text : ''
            },


         yAxis: {
             title: {
                 text: '단위(만원)',
                 
             }
         },

         xAxis: {
             accessibility: {
                 rangeDescription: 'Range: 01 to 12',
                 lineWidth : 1
                 
             }
         },

         legend: {
             layout: 'horizontal',
             align: 'center',
             verticalAlign: 'bottom'
         },

         plotOptions: {
             series: {
                 label: {
                     connectorAllowed: false
                 },
                 pointStart: 01,
                
             }
         },

         series: [
            
         ],

         responsive: {
             rules: [{
                 condition: {
                     maxWidth: 600
                 },
                 chartOptions: {
                     legend: {
                         layout: 'horizontal',
                         align: 'center',
                         verticalAlign: 'bottom'
                     }
                 }
             }]
         },};
 
 
 
 
  //   하이차트
Highcharts.chart('chart', options);

  
  
  
  
  
//버튼 클릭 시 팝업창 닫기
$(".ok_btn").click(function(){
	$("#regview_modal").attr("style", "display:none");
	   $(".basic_popup_chart").attr("style", "display:none");
		
	 $(".modal").attr("style", "display:none");
	  $(".basic_popup").attr("style", "display:none");
		
	   
});


//[기본] X 버튼 클릭 시 팝업창 닫기
$(".close_btn").click(function(){
   $("#regview_modal").attr("style", "display:none");
   $(".basic_popup").attr("style", "display:none");
});








		//승인 버튼 
    	$("#reg_btn").click(function() {
   			$(".modal").css("display", "block");
   		   $(".reg_basic_popup").css("display", "block");
    	});
    	
		
		//삭제 버튼 
    	$("#del_btn").click(function() {
   			$(".modal").css("display", "block");
   		   $(".del_basic_popup").css("display", "block");
    	});


		<c:forEach items="${reg_info}" var = "info">

    	//승인 버튼 클릭 시 팝업창 닫기 + state update + 대기 게시물 목록으로 이동
    	$(".reg_ok_btn").click(function(){
    	   $(".modal").attr("style", "display:none");
    	   $(".reg_basic_popup").attr("style", "display:none");
    	   //location.href='/bangterior/regwaitboard.do';
    	   location.href='/bangterior/regviewok.do?hpseq_ok='+${info.hpseq};
    	});
    	
    	
    	//삭제 > 취소 버튼 클릭시 보고있던 화면에 남기
    	$(".del_ok_btn").click(function(){
     	   $(".modal").attr("style", "display:none");
     	   $(".del_basic_popup").attr("style", "display:none");
     	   //location.href='/bangterior/regwaitboard.do';
     	});
    	
    	
    	//삭제 > 삭제 버튼 클릭시 팝업창 닫기 + state update + 대기 게시물 목록으로 이동
    	$(".cancel_btn").click(function(){
      	   $(".modal").attr("style", "display:none");
      	   $(".del_basic_popup").attr("style", "display:none");
      	   //location.href='/bangterior/regwaitboard.do';
      	   location.href='/bangterior/regviewok.do?hpseq_ok='+${info.hpseq};
      	});

    	</c:forEach>
    	
    	
    	
    	
    	
    	
      
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