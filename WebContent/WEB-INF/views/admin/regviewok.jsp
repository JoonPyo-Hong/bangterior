<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_admin.css">
<link rel="stylesheet" href="/bangterior/css/basic_popup.css">
<style>
#nav {
    /* height: 1100px; */
}

#regok_btn {
	width: 100px;
}


.basic_popup #popup_btn_area .cancel_btn {
/* 	width: 100px; */
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
            <div class="box"></div>
            
            <div style="clear:both;"></div>
        </div>

        <div style="clear:both;"></div>
    
    
    <script>
    	//승인 대기 게시판으로 이동 
		location.href='/bangterior/regwaitboard.do';

    </script>

</body>
</html>