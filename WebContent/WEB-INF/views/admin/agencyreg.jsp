<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/bangterior/css/main_admin.css">
<link rel="stylesheet" href="/bangterior/css/agencyreg.css">


<script src="../js/highcharts.js"></script>
<style>
#nav {
	/* height: 1100px; */
	
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
/* 현재 선택된 페이지 스타일 주세요 */
#color{
	/* color: red; */
}
/* 게시물 없을 때 */
#notthing{
	color: red;
}

</style>
</head>
<body>
	<!-- index.jsp (admin)  -->


	<!-- 전체 -->
	<div id="wrap">

		<!-- header -->
		<%@ include file="/WEB-INF/views/inc/admin/header.jsp"%>


		<!-- nav -->
		<%@ include file="/WEB-INF/views/inc/admin/nav.jsp"%>


		<div id="container">
			<div class="top_box"></div>
			<div class="box">
				<!-- 작업 공간 -->




				<div id="title">중개자 승인</div>


				<!-- 차트 -->
				<div id="cha">
					<div id="cha1">
						<div id="chart"></div>
						<div class="chart_title">최근 중개인 등록 횟수</div>
					</div>

					<div id="cha2">
						<div id="chart1"></div>
						<div class="chart_title">최근 중개인 등록 비율</div>
					</div>
				</div>



				<!-- 셀렉트 -->
				<div id="sel">
					<div id="sel_txt">상태</div>
					<select id="sel1">
						<c:if test="${sort eq 0 }">
						<option value="3">전체</option>
						<option value="0" selected="selected">대기</option>
						<option value="1">승인</option>
						<option value="2">거부</option>
						</c:if>
						<c:if test="${sort eq 1 }">
						<option value="3">전체</option>
						<option value="0">대기</option>
						<option value="1" selected="selected">승인</option>
						<option value="2">거부</option>
						</c:if>
						<c:if test="${sort eq 2}">
						<option value="3">전체</option>
						<option value="0">대기</option>
						<option value="1" >승인</option>
						<option value="2" selected="selected">거부</option>
						</c:if>
						<c:if test="${sort eq 3}">
						<option value="3" selected="selected">전체</option>
						<option value="0">대기</option>
						<option value="1">승인</option>
						<option value="2">거부</option>
						</c:if>
					</select>
				</div>





				<table class="tbl">
					<thead>
						<tr>
							<th>No.</th>
							<th>아이디</th>
							<th>이름</th>
							<th>파일</th>
							<th>상태</th>
						</tr>




					</thead>
					<tbody>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.rownum}</td>
								<td><a href="agencyregview.do?seq=${dto.seq}&confirm=${dto.confirm}">${dto.id}</a></td>
								<td>${dto.name}</td>
								<td>${dto.filename}</td>
								<td>${dto.confirm}</td>
							</tr>
						</c:forEach>
						<c:if test="${totalCount eq 0}">
						<tr>
							<td colspan="5" id="notthing">게시물이 없습니다.</td>
						</tr>
						</c:if>

					</tbody>
				</table>

				${pagebar}

				<div class="search_area">
					<select id="search_select">
						<c:if test="${sel eq 0 }">
							<option value="0" selected="selected">아이디</option>
							<option value="1">이름</option>
							<option value="2">아이디 + 이름</option>
						</c:if>
						<c:if test="${sel eq 1 }">
							<option value="0">아이디</option>
							<option value="1" selected="selected">이름</option>
							<option value="2">아이디 + 이름</option>
						</c:if>
						<c:if test="${sel eq 2 }">
							<option value="0">아이디</option>
							<option value="1">이름</option>
							<option value="2" selected="selected">아이디 + 이름</option>
						</c:if>
					
					</select> <input type="text" id="search_word" placeholder="검색어를 입력하세요."
						value="${search }"> <input type="button" id="search_btn"
						value="검색">
				</div>

			</div>


		</div>










		<!-- 작업 공간 끝 box -->
	</div>

	<div style="clear: both;"></div>
	</div>

	<div style="clear: both;"></div>

	<script type="text/javascript">
	var pricelist= [];
	var pricelist2= [];
	var pricelist3= [];
	var pricelist4= [];
	$.ajax({
		type : "POST",
		url : "/bangterior/admin/AdminGraph.do",
		data : "",
		dataType : "json",
		success : function(result) {
			
		 
		
		 $(result).each(function(index, item) {
			 pricelist.push(Number(item.list)); 
			 pricelist2.push(Number(item.list2)); 
		 });
		
			Highcharts.chart('chart', options);
		},
		error : function(a, b, c) {
			console.log(a, b, c);
			alert("실패");
			
		}
	});
	
	
	$.ajax({
		type : "POST",
		url : "/bangterior/admin/AdminCircleGraph.do",
		data : "",
		dataType : "json",
		success : function(result) {
			
		 
		
		 $(result).each(function(index, item) {
			 pricelist3.push(Number(item.data));
			 
		 });
			/* alert(pricelist3);  */
			console.log(pricelist3[0])
			Highcharts.chart('chart1', options2);
		},
		error : function(a, b, c) {
			console.log(a, b, c);
			alert("실패");
			
		}
	});
	</script>

	<!-- 준표  -->
	<script type="text/javascript">
		/* 전역변수 선언 및 초기화 */
		var selbottom = ${sel};
		var seltop = ${sort};
		//버튼 클릭시
		$("#search_btn").click(function() {
			location.href = "/bangterior/admin/agencyreg.do?" + "search=" + $("#search_word").val() + "&sel=" + selbottom;
			
		});
		//엔터 처리
		$("#search_word").keydown(function(key) {
			if (key.keyCode == 13) {
			location.href = "/bangterior/admin/agencyreg.do?" + "search=" + $("#search_word").val() + "&sel=" + selbottom;	
			}
		});
		//밑에 셀렉트 박스
		$("#search_select").change(function() {
			selbottom = this.value;
		});
		//오른쪽 위 셀렉트 박스
		$("#sel1").change(function() {
			seltop = this.value;
			location.href = "/bangterior/admin/agencyreg.do?" + "search=" + $("#search_word").val() + "&sel=" + selbottom + "&sort=" + seltop;
		});
	</script>







	<!-- 차트 -->

	<script type="text/javascript">
		var options ={
			colors : [ "#2E364A", "#EE5656", "#EE5656"

			],
			chart : {
				zoomType : 'xy'
			},
			title : {
				text : ' '
			},
			subtitle : {
				text : ' '
			},
			xAxis : [ {
				categories : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
				crosshair : true
			} ],
			yAxis : [ { // Secondary yAxis
				labels : {
					format : '{value} %',
					style : {
						color : Highcharts.getOptions().colors[0]
					}
				},
				title : {
					min:0,
					max:100,
					text : '',
					style : {
						color : Highcharts.getOptions().colors[0]
					}
				},
				opposite : true 
			} ,{ // Primary yAxis
				labels : {
					format : '{value} 명',
					style : {
						color : Highcharts.getOptions().colors[1]
					}
				},
				title : {
					text : '',
					style : {
						color : Highcharts.getOptions().colors[1]
					}
				}
			}, { // Secondary yAxis
				labels : {
					format : '{value} 명',
					style : {
						color : Highcharts.getOptions().colors[0]
					}
				},
				title : {
					min:0,
					max:100,
					text : '',
					style : {
						color : Highcharts.getOptions().colors[0]
					}
				},
				opposite : true 
			} ],
			tooltip : {
				shared : true
			},
			legend : {
				layout : 'vertical',
				align : 'left',
				x : 80,
				verticalAlign : 'top',
				y : 30,
				floating : true,
				backgroundColor : Highcharts.defaultOptions.legend.backgroundColor || // theme
				'rgba(255,255,255,0.25)'
			},
			series : [ {
				name : '승인된 중개사 수 ',
				type : 'column',
				data : pricelist,
				tooltip : {
					valueSuffix : ' 명'
				},
				yAxis :1
			
			}, {
				name : '증가율',
				type : 'spline',
				data : pricelist2,
				tooltip : {
					valueSuffix : ' %'
				}
			} ]
		};
		Highcharts.chart('chart', options);
		// Build the chart
		var options2 = {
			colors : [ "#2E364A", "#C6C6F3", "#EE5656"

			],
			chart : {
				plotBackgroundColor : null,
				plotBorderWidth : null,
				plotShadow : false,
				type : 'pie'
			},
			title : {
				text : ' '
			},
			tooltip : {
				pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
			},
			accessibility : {
				point : {
					valueSuffix : '%'
				}
			},
			plotOptions : {
				pie : {
					allowPointSelect : true,
					cursor : 'pointer',
					dataLabels : {
						enabled : false
					},
					showInLegend : true
				}
			},
			series : [ {
				name : 'Brands',
				colorByPoint : true,
				data : [ {
					name : '개인 사업자',
					y : 50,
					sliced : true,
					selected : true
				}, {
					name : '업체',
					y : 50
				} ]
			} ]
		};
		Highcharts.chart('chart1', options2);
	</script>





</body>


</html>