<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="/bangterior/css/main_admin.css">
    <!-- 구글웹폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <!-- 스크립트 -->
    <script src="../js/jquery-1.12.4.js"></script>
    <!-- highcharts 스크립트 -->
    <script src="../js/highcharts.js"></script>
</head>
<body>

    <!-- 전체 -->
    <div id="wrap">
        
        <!-- header -->
    <%@include file='/WEB-INF/views/inc/admin/header.jsp' %>

        
        <!-- nav -->
    <%@include file='/WEB-INF/views/inc/admin/nav.jsp' %>


        <div id="container">
            <div class="top_box">
                <ul>
                    <li><img src="../images/admin_icon1.png"></li>
                    <li><img src="../images/admin_icon2.png"></li>
                    <li><img src="../images/admin_icon3.png"></li>
                </ul>
            </div>
            <!-- 메인 박스 -->
            <div class="box">

                <div class="infobox info1">
                    <img src="../images/info1.png">
                    <p class="infotext">5,397<br>
                    <span class="title"> 총 방문자 수</span>
                    </p>
                </div>
                <div class="infobox info2">
                    <img src="../images/info2.png">
                    <p class="infotext">1,019<br>
                        <span class="title">고객게시판 업데이트 </span>
                </div>
                <div class="infobox info3">
                    <img src="../images/info3.png">
                    <p class="infotext">103<br>
                        <span class="title">최근 계약 완료 매물 수</span>
                </div>
                <div class="infobox info4">
                    <img src="../images/info4.png">
                    <p class="infotext">560<br>
                    <span class="title">오늘 업데이트 매물</span>
                </div>

                <div style="clear: both;"></div>

                <div class="chartbox chartbox1">
                    <h1>홈페이지 방문자 수</h1>
                    <div id="chart1"></div>
                </div>
                
                <div class="chartbox chartbox2">
                    <h1>고객서비스 게시판</h1>
                    <div id="chart2"></div>
                </div>


                
            </div>
            <div style="clear:both;"></div>
        </div>

        <div style="clear:both;"></div>


    </div>

    <!-- <script>
        $("#nav").height($(document).getOuterHeight());
    </script> -->


    <script type="text/javascript">



        /* 차트 1번  방테리어 방문자 */
        Highcharts.chart('chart1', {
        
            title: {
                text: ''
            },
        
            subtitle: {
                text: ''
            },
        
            yAxis: {
                title: {
                    text: '방문자 수'
                }
            },
        
            xAxis: {
                accessibility: {
                    rangeDescription: 'Range: 2010 to 2017'
                }
            },
        
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },
        
            plotOptions: {
                series: {
                    label: {
                        connectorAllowed: false
                    },
                    pointStart: 1
                }
            },
        
            series: [{
                name: '연간 평균 방문자 수',
                data: [70, 69, 71, 73, 75, 78, 82, 78, 75, 73, 70, 68]
            },
            {    name: '2020 올해 방문자 수',
                    data: [70, 72, 70, 58, 60, 65, 70, 75, 80, 78, 74, 72]
            }
            ],
        
            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }
        
        });


        /* 차트 2번  게시판 현황 */

// Build the chart
Highcharts.chart('chart2', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: '답변 대기 현황'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    accessibility: {
        point: {
            valueSuffix: '%'
        }
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: false
            },
            showInLegend: true
        }
    },
    series: [{
        name: 'Brands',
        colorByPoint: true,
        data: [{
            name: '불편사항',
            y: 30,
            sliced: true,
            selected: true
        },{
            name: '문의사항',
            y: 70
        }]
    }]
});

    </script>
    
</body>
</html>