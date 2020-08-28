<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원_4</title>
<link rel="stylesheet" type="text/css" href="../css/main_member.css" />
<!-- 구글웹폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet" />
<!-- 제이쿼리 ui -->
<link rel="stylesheet" href="/bangterior/css/jquery-ui.css" />
<script src="/bangterior/js/jquery-1.12.4.js"></script>
<script src="/bangterior/js/jquery-ui.js"></script>
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous" />
<link rel="stylesheet" href="/bangterior/css/회원4.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!-- 슬라이드 바 -->
<script src="/bangterior/js/range.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b5d421e6999a6826353708868a05bde7"></script>

</head>
<style>
.img {
	width: 230px;
	height: 170px;
	background-image: url(/bangterior/images/background.jpg);
	background-size: 270px 170px;
	background-repeat: no-repeat;
	text-align: right;
}

.text2 {
	width: 230px;
	height: 50px;
}

:
 
0
10
px
;


}
.view_page a {
	/* #paging ul li a{ */
	font-weight: bold;
	color: #333;
	text-decoration: underline;
}

#paging .btn {
	font-size: 14x;
	cursor: pointer;
	display: inline-block;
	padding: 7px 10px;
	border: 1px solid #888;
	margin: 0 10px;
}

ul .view_page a {
	/* #paging ul li a{ */
	font-weight: bold;
	color: #333;
	text-decoration: underline;
}

.slider {
	width: 200px;
	margin: 20px;
}
</style>
<script type="text/javascript">
var a = 0;
var b = 0; 
</script>
<body>

	<!-- 전체 -->
	<div id="wrap">
		<!-- header -->
		<!-- header -->
		<%@include file="/WEB-INF/views/inc/member/headerhouse.jsp"%>

		<!-- container -->
		<!-- 해당 페이지 HTML 작업 -->
		<div id="container">
			<!-- 왼쪽 부분 -->
			<!-- 필터 페이지 -->
			<!-- 중간(지도) 부분 -->
			<div id="left_box">
				<!-- 맵 -->
				<div id="search_box">
					<span></span>

					<form action="HouseSearch.do" method="get">
						<input id="searchtext"  autocomplete="off" name="searchtext"
							type="text" value="${searchtext}" onclick="this.value='';"
							placeholder="검색">
						<button type="submit" id="searchbtn1">
							<img src="../images/search.png">
						</button>
						<button type="button" id="searchbtn2">
							<img src="../images/filter.png" alt=""> <span>필터</span>
						</button>
					</form>

				</div>
				<div style="display: none;" id="filter_box">
					<div class="filter_list">
						<p class="list_title">매물종류</p>
					</div>
					<div>
						<table id="tbl1" cellspacing="5">
							<tr>
								<td class=""><button class="check_btn ajax1" value="1">아파트</button></td>
								<td><button value="4" class="ajax1">원룸/투룸</button></td>
							</tr>
							<tr>
								<td><button value="3" class="ajax1">주택</button></td>
								<td><button value="2" class="ajax1">오피스텔</button></td>
							</tr>
						</table>
					</div>

					<div class="filter_list">
						<p class="list_title">거래유형</p>
					</div>
					<div>
						<table id="tbl2" cellspacing="5">
							<tr>
								<td><button value="1" class="check_btn">매매</button></td>
								<td><button value="2">전/월세</button></td>
							</tr>
						</table>
					</div>
					<div class="filter_list">
						<p class="list_title">면적</p>
					</div>
					<div>
						<table id="tbl3" cellspacing="5">
							<tr>
								<td><button value="1" class="check_btn">전체</button></td>
								<td><button value="2">10평 이하</button></td>
								<td><button value="3">10평대</button></td>
								<td><button value="4">20평대</button></td>
							</tr>
							<tr>
								<td><button value="5">30평대</button></td>
								<td><button value="6">40평대</button></td>
								<td><button value="7">50평대</button></td>
								<td><button value="8">60평 이상</button></td>
							</tr>
						</table>
					</div>
					<div class="filter_list">
						<p class="list_title">가격</p>
					</div>


					<div>
						<p id="slider">
							<label for="amount">매매 : </label> <input type="text" id="amount"
								readonly style="border: 0; color: #f6931f; font-weight: bold;">
						</p>

						<div id="slider-range"></div>
					</div>
					<!--  <div class="list_text2">월세</div>
                        <div id="exapmle_box" >
                        <input type="text" id="example2" value="5" max="100" min="0" step="1"">
                        </div> -->
					<div class="filter_list">
						<p class="list_title">찬방 필터</p>
					</div>


					<!-- 찬방 필터 시작 -->
					<div id="filter_top" class="connectedSortable">
						<div class="drag">
							<img class="imgsize" src="../images/car.png" data-no="1" alt=""><br>주차
						</div>
						<div class="drag">
							<img class="imgsize" src="../images/money.png" data-no="2" alt=""><br>대출
						</div>
						<div class="drag">
							<img class="imgsize" src="../images/paw.png" data-no="3" alt=""><br>반려동물
						</div>
						<div class="drag">
							<img class="imgsize" src="../images/floor_low.png" data-no="10"
								alt=""><br>저층
						</div>
						<div class="drag">
							<img class="imgsize" src="../images/handrail.png" data-no="5"
								alt=""><br>발코니
						</div>
						<div class="drag">
							<img class="imgsize" src="../images/sofa.png" data-no="6" alt=""><br>풀옵션
						</div>
						<div class="drag">
							<img class="imgsize" src="../images/duplex.png" data-no="4"
								alt=""><br>복층
						</div>
						<div class="drag">
							<img class="imgsize" src="../images/floor_high.png" data-no="11"
								alt=""><br>고층
						</div>
						<div class="drag">
							<img class="imgsize" src="../images/cctv.png" data-no="9" alt=""><br>CCTV
						</div>
						<div class="drag">
							<img class="imgsize" src="../images/weather.png" data-no="8"
								alt=""><br>청결
						</div>
						<div class="drag">
							<td><img class="imgsize" src="../images/elevator.png"
								data-no="7" alt=""><br>엘리베이터
						</div>
						<div style="clear: both;"></div>
					</div>
					<!-- <hr> -->
					<div id="filter_bottom" class="connectedSortable"></div>


					<!-- 찬방 필터 끝 -->
				</div>
				<!-- 필터 끝 -->
				<div id="map"></div>

			</div>

			<!-- 오른쪽 부분 -->
			<div id="right_box">

				<div id="btn1">
					<button>
						<img id="imgbtn" src="../images/arrow_btn_left.png"
							style="width: 12px" alt="">
					</button>
				</div>

				<div id="title1">
					<span>전체 방</span> <span style="color: #7674e2;" id="bang"></span> <span>개</span>
					<span><select style="position: absolute; right: 55px;"
						id="sel" name="sel">

							<option value="1">가나다순</option>
							<option value="2">낮은 가격순</option>
							<option value="3">높은 가격순</option>

					</select></span>
				</div>
				<div id="scroll">

					<div id="shide">
<div class="list"><div class="img" style="background-image: url(/bangterior/pic/apt_10_main.jpg);">
<c:if test="${hot1 eq 0 }">
<img class="heart" id= "h10" src="../images/heart.png">
</c:if>
<c:if test="${hot1 ne 0 }">
<img class="heart" id= "h10" src="../images/heart_red.png">
</c:if>
</div><a href="/bangterior/house/HouseSearchDetail.do?seq=10"><div class="text1">4,457만원<span class="hot">인기 매물</span></div><div class="text2">16층,148.76㎡<br>역세권 마래푸 25평 월세</div></a></div>

<div class="list"><div class="img" style="background-image: url(/bangterior/pic/apt_15_main.jpg);">
<c:if test="${hot2 eq 0 }">
<img class="heart" id= "h15" src="../images/heart.png">
</c:if>
<c:if test="${hot2 ne 0 }">
<img class="heart" id= "h15" src="../images/heart_red.png">
</c:if>
</div><a href="/bangterior/house/HouseSearchDetail.do?seq=15"><div class="text1">22만원 / 23만원<span class="hot">인기 매물</span></div><div class="text2">13층,198.34㎡, 관리비12만<br>현대아파트 남향 28평</div></a></div>

<div class="list"><div class="img" style="background-image: url(/bangterior/pic/op_28_main.jpg);">
<c:if test="${hot3 eq 0 }">
<img class="heart" id= "h78" src="../images/heart.png">
</c:if>
<c:if test="${hot3 ne 0 }">
<img class="heart" id= "h78" src="../images/heart_red.png">
</c:if>
</div><a href="/bangterior/house/HouseSearchDetail.do?seq=78"><div class="text1">454,280만원<span class="hot">인기 매물</span></div><div class="text2">5층,52.89㎡, 관리비8만<br>신축 오피스텔</div></a></div>

<div class="list"><div class="img" style="background-image: url(/bangterior/pic/vi_43_main.jpg);">
<c:if test="${hot4 eq 0 }">
<img class="heart" id= "h143" src="../images/heart.png">
</c:if>
<c:if test="${hot4 ne 0 }">
<img class="heart" id= "h143" src="../images/heart_red.png">
</c:if>
</div><a href="/bangterior/house/HouseSearchDetail.do?seq=143"><div class="text1">1,870,340만원<span class="hot">인기 매물</span></div><div class="text2">1층,76.03㎡<br>인테리어최강~초역세권~여성선호1위오피스텔~내부상태최고</div></a></div>
					</div>
					<div id="x"
						style="width: 100%; text-align: center; margin-top: 340px; font-size: 2em; color: tomato;">

						'${searchtext}'의 검색결과가 없습니다.</div>



					<div id="house"></div>


					<div id="paging">
						<div class="left_btn btn">이전</div>
						<ul id="p">
							<li style="color: red"></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>

						</ul>
						<div class="right_btn btn">다음</div>
					</div>

					<!-- 스크롤 끝 -->
				</div>
			</div>


		</div>
	</div>
	<div style="clear: both;"></div>

	
	<!--전체 끝-->

	
	<script>
	var memseq = ${memseq};


	
		
	if(memseq != 0){
		$(".heart").show();
	}else{
		$(".heart").hide();
	}
	
	setInterval(function() {  
		if(memseq != 0){
			$(".heart").show();
		}else{
			$(".heart").hide();
		}
	
	}, 100);
	
	
	/* alert($("#gnb li:nth-child(1)").text()); */
	/* alert($("#gnb li:nth-child(3)").text()); */
	</script>
	<!-- 하트 작업 -->
	<script>
	var heartdel = 0;
        $(document).on('click', '.heart', function(){
           
                if($(this).attr("src")=="../images/heart.png"){

                $(this).attr("src","../images/heart_red.png");
                /* alert($(this).attr('id')); */
                heartdel = $(this).attr('id').replace('h','');
                
                $.ajax({
					type : "POST",
					url : "/bangterior/house/HeartAdd.do",
					data : "memseq=" + memseq + "&heartdel=" + heartdel,
					dataType : "json",
					success : function(result) {
						
					 console.log(result); 
					
				
					},
					error : function(a, b, c) {
						console.log(a, b, c);
						/* alert("실패"); */
						
					}
				});
                
                
                
                }else if($(this).attr("src")!="../images/heart.png"){
                    $(this).attr("src","../images/heart.png");
                    heartdel = $(this).attr('id').replace('h','');
                    
                    $.ajax({
						type : "POST",
						url : "/bangterior/house/HeartDel.do",
						data : "memseq=" + memseq + "&heartdel=" + heartdel,
						dataType : "json",
						success : function(result) {
							
						 console.log(result); 
						
					
						},
						error : function(a, b, c) {
							console.log(a, b, c);
							/* alert("실패"); */
							
						}
					});
                }
                
            });             
            
            
            
            
        </script>

	<!-- 맵 기능 구현 -->
	<script>
			
			var mapseq = 0;
			
			var positions = [];
			//맵 ajax
			window.onload = function(){
				var marker = "";
			$.ajax({
			type: "POST",
			url: "/bangterior/house/HouseMap.do",
			data: "",
			dataType: "json",
			success: function (result) {
				
				for(var i=0;i<result.length;i++){
					var temp = {
							"title" : result[i].title,
							"latlng" : new kakao.maps.LatLng(result[i].lat, result[i].lng)
					};
					positions.push(temp);
				}
				
				for (var i = 0; i < positions.length; i ++) {
				    
				    // 마커를 생성합니다
				     marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				    });
				    
			kakao.maps.event.addListener(marker, 'click', function() { 
				
	     		mapseq = this.getTitle();
		        house();
				
		        
		  });
	
			          
				   
				};
				    /* kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {  */
			},
			error: function (a,b,c) {
				console.log(a,b,c);
			}
		}); //ajax 끝
	}
			
				        // 마커 위에 인포윈도우를 표시합니다
//					        infowindow.open(map, marker);
			
				  
			
			
			
			
            var container = document.getElementById("map"); //지도를 담을 영역의 DOM 레퍼런스
           
            var options = {
                //지도를 생성할 때 필요한 기본 옵션
                center: new kakao.maps.LatLng(37.524289, 127.044972), //지도의 중심좌표.
                level: 3, //지도의 레벨(확대, 축소 정도)
            };

            var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
            
            //마커 위치
			// 마커를 표시할 위치와 title 객체 배열입니다 
			
			
// 			var positions = [
// 			    {
// 			        "title": '카카오', 
// 			        "latlng": new kakao.maps.LatLng(37.5163794, 127.052171)
// 			    },
// 			    {
// 			        "title": '생태연못', 
// 			        "latlng": new kakao.maps.LatLng(37.5143324, 127.052171)
// 			    }
// 			];
			
            
// 			// 마커를 생성합니다
// 			for (var i = 0; i < positions.length; i ++) {
		    
// 		    // 마커를 생성합니다
// 		    var marker = new kakao.maps.Marker({
// 		        map: map, // 마커를 표시할 지도
// 		        position: positions[i].latlng, // 마커를 표시할 위치
// 		        title : positions[i].title // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
// 		    });
// 		}
            
            </script>


	<script>
		
		var begin = ${map.begin };
		var end = ${map.end };
		var searchtext = "";
		searchtext = "${searchtext}";
		var sort = 1;
		
		
		var n = 0;
		var nowpage = 1;
		var totalnum = ${totalnum};
		var page = Math.ceil(totalnum / 12);
		
		var sel = $("#sel").val();
		var sae = 1;
		var area = 1;
		var money = "0 억 100 억 ";
		var f = "";
		var heartlist = [];
           house();
		
		  $(".drag").mouseout(function(){
			  f = "";
			  mapseq = 0;
          
           for(var i = 1; i <= $("#filter_bottom .drag img").size(); i++){
                /* alert($("#filter_bottom div:nth-child("+ i +") img").data("no")); */ 
                f+=  (",") + $("#filter_bottom div:nth-child("+ i +") img").data("no") + ("q")  ;
           }
              
               /*  alert(f);  */
            		begin = ${map.begin };
			end = ${map.end };
			sel = 1;
			$('#sel').val(1).prop("selected",true);
			n = 0;
			nowpage = 1;
			house();		
              
       });
		
	/* 	window.onload = function(){
		} */
		
		
		 $( function() {
			    $( "#slider-range" ).slider({
			      range: true,
			      min: 0,
			      max: 200,
			      values: [ 0, 200 ],
			      slide: function( event, ui ) {
			        $( "#amount" ).val(  ui.values[ 0 ] + " 억 "   + ui.values[ 1 ]  +" 억 ");
			         money = $( "#amount" ).val(); 
			 		begin = ${map.begin };
					end = ${map.end };
					sel = 1;
					$('#sel').val(1).prop("selected",true);
					n = 0;
					nowpage = 1;
					mapseq = 0;
			         house();
			      }
			    });
			    $( "#amount" ).val(  $( "#slider-range" ).slider( "values", 0 )+ " 억 " +
			      $( "#slider-range" ).slider( "values", 1 )  + " 억 ");
			    
			   
			  } );
		
		$("#tbl2 button").on('click',function(){
			
			
			  
			mapseq = 0;
			sae = $(this).val();
			$("label[for = 'amount' ]").text($(this).text() + " : ");
			begin = ${map.begin };
			end = ${map.end };
			sel = 1;
			$('#sel').val(1).prop("selected",true);
			n = 0;
			nowpage = 1;
			
			house();
		});
		
		$("#tbl3 button").on('click',function(){
			/* alert($(this).val()); */
			area = $(this).val();
			mapseq = 0;
			begin = ${map.begin };
			end = ${map.end };
			sel = 1;
			$('#sel').val(1).prop("selected",true);
			n = 0;
			nowpage = 1;
			
			house(); 
		});
		
		
		$("#tbl1 button").on('click',function(){
			sort = $(this).val();
			begin = ${map.begin };
			end = ${map.end };
			sel = 1;
			$('#sel').val(1).prop("selected",true);
			n = 0;
			nowpage = 1;
			mapseq = 0;
			house();
		});
		
		
		
		$("#sel").change(function() {
			sel = $("#sel").val();
			
			house();
			
		})
		
		$(".right_btn.btn").on('click',function(){
			
			
			for (var j=0; j<5; j++){
				if(n<page){
				n +=1;
					
				}
			}
			
		
			begin += (1 + n -nowpage )*12;
			end += (1 + n -nowpage )*12;
			nowpage =1 +n ;
		
		
			for (var i =1; i<=5; i++){		
				
				
				if(n+i<=page){
				$('#p').children('li:nth-child('+ i +')').text(n+i);
			
				}else{
					$('#p').children('li:nth-child('+ i +')').text("");	
					$(".right_btn.btn").hide();
				}
				
			};
			house();
			
			
			
			
		});
		$(".left_btn.btn").on('click',function(){
			$(".right_btn.btn").show();
			
			n -=5;
			begin += (1 + n -nowpage)*12;
			end += (1 + n -nowpage)*12;
			nowpage =1 +n;
			for (var i =1; i<=5; i++){		
				$('#p').children('li:nth-child('+ i +')').text(n+i);
		
			};
			house();
			
			
		});
		
		
	
		
		for (var i =1; i<=5; i++){
			
			$('#p').children('li:nth-child('+ i +')').on('click',function () {
				begin += ($(this).text()-nowpage)*12;
				end += ($(this).text()-nowpage)*12;
				
				nowpage = $(this).text();
				house();
			});
		};
		
		
		function house() {
			
		
			$.ajax({
				type: "POST",
				url: "/bangterior/house/HouseCount.do",
				data: "sel=" + sel + "&searchtext=" + searchtext +"&sort=" +sort +"&sae=" + sae + "&area=" + area +"&money=" + money +"&f=" + f + "&mapseq=" + mapseq, 
				dataType: "json",
				success: function(result) {
				
				$(result).each(function(index, item) {
					totalnum = item.totalnum;
					$("#bang").text(totalnum);
					page = Math.ceil(totalnum / 12);
					
					if(page>5){
						$(".right_btn.btn").show();	
					}
					
					for (var i =1; i<=5; i++){
						$('#p').children('li:nth-child('+ i +')').text("");
						
					};	
					
					for (var i =1; i<=5 && i <= page; i++){
						$('#p').children('li:nth-child('+ i +')').text(n+i);
						
					};	
					
				for (var i =1; i<=5; i++){		
						
						if($('#p').children('li:nth-child('+ i +')').text()==nowpage){
							$('#p').children('li').attr("style","color : black");
						
							$('#p').children('li:nth-child('+ i +')').attr("style","color : red");
						
						}
							
					};		
			
					if(page<=5){
						$(".right_btn.btn").hide();	
					}
					if(page == 0){
						$(".right_btn.btn").hide();
					}
					
					
					
					
					
					if(nowpage <=5){
						$(".left_btn.btn").hide();
					}else{
						$(".left_btn.btn").show();
						
					}
				
					
					for (var i =1; i<=5; i++){		
						
						
						if(n+i<=page){
						$('#p').children('li:nth-child('+ i +')').text(n+i);
					
						}else{
							$('#p').children('li:nth-child('+ i +')').text("");	
							$(".right_btn.btn").hide();
						}
						
					};
					
					/* page = Math.ceil(totalnum / 12); */
					
					if(totalnum==0){
						$("#shide").hide();
						$("#x").show();
						$("#house").empty();
					}else{
						$("#x").hide();
						$("#shide").show();
					}
					
				});
				 /* alert(totalnum); */ 
				},
				error: function(a,b,c) {
					console.log(a,b,c);
					/* alert("실패"); */
					
				}
			});
			
			$.ajax({
				type: "POST",
				url: "/bangterior/house/HouseHeart.do",
				data: "memseq=" + memseq, 
				dataType: "json",
				success: function(result) {
			
					$(result).each(function(index, item) {
						heartlist.push((item.index));
				});
					
			$.ajax({
				type: "POST",
				url: "/bangterior/house/HouseSearchOk.do",
				data: "begin=" + begin + "&end=" + end + "&sel=" + sel + "&searchtext=" + searchtext +"&sort=" +sort +"&sae=" +sae +"&area=" + area +"&money=" + money +"&f=" + f + "&mapseq=" + mapseq,
				dataType: "json",
				success: function(result) {
					
					if (result.length == 0) {
						alert("더 이상 가져올 게시물이 없습니다.");
					/* 	$(".right_btn.btn").attr("disabled", true); */
						return;
					}
					$("#house").empty();
					
					$(result).each(function(index, item) {
						//게시물 1개
						var heartcount = 0;	
						

						var temp = "";
						temp += "<div class=\"list\">";
						temp += "<div class=\"img\" style=\"background-image: url(/bangterior/pic/";
						temp += item.filename;
						temp += ");\">";
						if(heartlist.length !=0){
						for(var i=0; i<heartlist.length; i++){
							
							
						 if(heartlist[i] == item.seq){
							heartcount = 1;
						 }
						 
						};
							
						}
						if(heartcount == 1){
							temp += "<img class=\"heart\" id= \"h" + item.seq + "\" src=\"../images/heart_red.png\">";	
						}else{
							
						temp += "<img class=\"heart\" id= \"h" + item.seq + "\" src=\"../images/heart.png\">";
						}
						
						temp += "</div>";
						temp += "<a href=\"/bangterior/house/HouseSearchDetail.do?seq=";
						temp += item.seq;
						temp += "\">";
						temp += "<div class=\"text1\">";
						 temp += item.cost
						temp += "만원";
						if(item.depcost != "0"){
						temp += " / ";
						temp += item.depcost;
						temp += "만원";
						}
						
						temp += "</div>";
						temp += "<div class=\"text2\">";
						temp += item.floor + "층,";
						temp += item.area + "㎡";
						
						if(item.maincost != "0"){
						temp += ", 관리비";
						temp += item.maincost + "만";
						}
							
						temp += "<br>";
						temp += item.subject;
						temp += "</div>";
						temp += "</a>"; 
						temp += "</div>";
					 	 /* alert(temp);  */
						
						$("#house").append(temp);
						
						
					
								

						
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
					
				}
				
				
			}); //ajax

				},
				error: function(a,b,c) {
					console.log(a,b,c);
					/* alert("실패"); */
					
				}
			});
			
		}
			
			
			
		

	</script>




	<!-- 스크립트 부분 -->
	<!-- 왼쪽 필터 부분 버튼들 -->
	<script>
            //  background-color: #545655;
            // color:white;
            //    btn.attr("style","background-color : white color:black")
            btn1 = $("#tbl1 td button");
            btn1.click(function(){
            btn1.css("color", "black");
            btn1.css("background-color", "white");
            
                $(this).css("color"," white");
                $(this).css("background-color"," #545655");
            })
               btn2 = $("#tbl2 td button");
            btn2.click(function(){
            btn2.css("color", "black");
            btn2.css("background-color", "white");
            
                $(this).css("color"," white");
                $(this).css("background-color"," #545655");
            })
               btn3 = $("#tbl3 td button");
            btn3.click(function(){
            btn3.css("color", "black");
            btn3.css("background-color", "white");
            
                $(this).css("color"," white");
                $(this).css("background-color"," #545655");
            })
        </script>
	<!-- 오른쪽 밑에 목록 버튼 -->
	<script>
            // font-weight: bold;
            // color:#333;
            // text-decoration:underline;
/*             var paging =$("#paging li");
            paging.click(function(){
                paging.attr("style","color : black")
                $(this).attr("style","color : red");
            }) */
        </script>
	<!-- 하트 -->

	<!-- 드래그 -423->
        <script>
  /*           var filter_top = document.getElementById("filter_top") ;
            var h = $("#filter_top").width();
            var h2 = $("#filter_top").height();
            
                //  console.log(($("#filter_top").height()));
            
                $("#filter_bottom").mousedown(function(){
            var top = document.getElementById("filter_top");
            console.log(top.children.length)
             if(1 ==top.children.length){
                filter_top.style.height = "100px"
                
            }
            if(5 ==top.children.length){
                filter_top.style.height = "200px"
                // filter_top.remove( 'height' );
                
            }if(6 ==top.children.length){
                filter_top.style.height = "auto"
                
            }
        })
             */          
        //드래그
        </script>
        <script>
        $("#filter_top, #filter_bottom").sortable({
            connectWith: ".connectedSortable",
        });
    </script>
    <!-- 필터 숨기기 -->
	<script>
        var searchbtn2 = document.getElementById("searchbtn2");
        var yyy = 0;
        searchbtn2.onclick = function(){
            yyy+=1;
            if(yyy%2==1){
                $("#filter_box").attr("style", "display : ");
            }else{
                $("#filter_box").attr("style", "display:none");
            }
            
        }
    </script>

	<!-- 찬방필터 -->
	<script>
        $("#filter_top, #filter_bottom").sortable({
            connectWith: ".connectedSortable",
        });
    </script>





	<!-- 스크립트 영역 -->
	<!-- 제이쿼리 ui -->
	<script>
            $("#hidebody, #hide2").sortable({
                connectWith: ".connectedSortable",
                
            });
        </script>

	<!-- 슬라이더 바 -->
	<script>
            const el = document.getElementById( 'example1' );
rangejs( el, {
  css: true,
//   buttons: true
});
    
            const el2 = document.getElementById( 'example2' );
rangejs( el2, {
  css: true,
//   buttons: true
});
        </script>


	<!-- 스크립트 버튼 -->
	<script>
            var control = 0;
            $("#btn1").click(function(){
                control+=1;
            if(control%2==1){
                // $("#imgbtn")
                  $("#left_box").attr("style", "width:700px");
            $("#right_box").attr("style", "width:calc(100% - 700px)");
            $("#imgbtn").attr("src", "../images/arrow_btn_right.png");
            


            }else{
                  $("#left_box").attr("style", "width:1250px");
            $("#right_box").attr("style", "width:calc(100% - 1250px)");
            $("#imgbtn").attr("src", "../images/arrow_btn_left.png");
            }
          
                // 지도 새로고침
            setInterval(function(){map.relayout();},1);
             
        });
        </script>














</body>
</html>
