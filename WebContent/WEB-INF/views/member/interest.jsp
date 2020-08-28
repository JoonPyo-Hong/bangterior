<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        #house_list{
            /* float:left; */
            width:1200px;
            margin:60px auto;
            /* border:1px solid black; */
            margin-bottom:150px;
        }
        #tbl1{
            margin: 50px auto;
            /* border:1px solid black; */
            width:1000px;
        } 
        .list1{
            padding:10px;
            /* border:1px solid black; */
        }
         .list1 .pic{
/*             border:1px solid red;  */
            background-size:cover;
            background-repeat:no-repeat;
            width:250px;
            height:150px;
            margin-bottom:5px; 
/*             margin-left:10px;  */
			cursor:pointer;
        }
        .list1 .option{
            /* border:1px solid blue; */
            background-color:#ccc;
             width:250px; 
             height:100px; 
             cursor:pointer;
        }
        #tbl2{
            margin: 50px auto;
			/* border:1px solid black;  */
            width:1000px;
        } 
        .list2{
            padding:10px;
            /* border:1px solid black; */
        }
        .list2 .pic{
/*             border:1px solid red;  */
            background-size:cover;
            background-repeat:no-repeat;
            width:250px;
            height:150px;
            margin-bottom:5px; 
/*             margin-left:10px;  */
			cursor:pointer;
        }
        .list2 .option{
            /* border:1px solid blue; */
            background-color:#ccc;
             width:250px; 
             height:100px; 
             cursor:pointer;
        }

        .option .price{
            /* border:1px solid red; */
            font-weight:bold;
            font-size:0.9em;
            width:185px;
            height:23px;
            float:left;
            padding-top:10px;
            padding-left: 15px;
        }
        .option .op{
            /* border:1px solid red; */
            padding-left:15px;
            width:190px;
            height:20px;
            float:left;
        }
        .option .heart{
            text-align:left;
            /* border:1px solid black; */
            width:15px;
            height:60px;
            float:left;
            cursor:pointer;
        }
        .type{
        padding-left:15px;
        height:10px;
        color:#888;
        }
        /* 탭 메뉴 */
        #tabmenu{
            /* background-color:cadetblue; */
            position: relative;
            left:500px;
            top:31px;
            display:inline-block;
        }
   
        #tabmenu .tab{
            width:130px;
            height:40px;
            cursor:pointer;
            font-size:.8em;
            text-align: center;
            background-color:#eee;
            border: 1px solid #eee;}
        #recent {
            background-color:#7674E2;
        }
        #recent:hover{
            background-color:#C6C6F3;
        }
        #jjim:hover{
            background-color:#C6C6F3;
        }
        #tbl2{
            display:none;
        }
       .post_block{
/*         border : 1px solid black; */
       	width : 250px;
       	margin : 10px;
       	float:left;
       }
  	   #hidden:after{
  	   content:"";
  	   display:block;
  	   clear:both;
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

  
           <!-- 서브메뉴 -->
          <%@ include file="/WEB-INF/views/member/my_submenu.jsp" %>

            <div id="house_list">
                <!-- 최근에 본 방-->
                    <div id="tabmenu">
                        <input type="text"  class="tab recent" readonly value="최근에 본 방" id="recent">
                        <input type="text" class="tab jjim" readonly value="찜한 방" id="jjim">
                    </div>
                <div id="tbl1">
                        <div class="list1">
                            <c:forEach items="${list}" var="jjim">
                    		<div class="post_block">
                            <div class=pic style= 'background-image:url("../pic/nopick.png")'></div>
                            
                            
                            <div class="option">
                            	<div class="type">${jjim.htype}/${jjim.stype}</div>
                                <div class="price">${jjim.cost/10000}만원/${jjim.area}평</div>
                                <div class="op">${jjim.subject}</div>
                                <div class="heart"><img src="../images/fullheart.png" alt=""></div>
                       		</div>
                       		</div>
                        </c:forEach> 
                       		<div id="hidden"></div>
                </div>
                </div>
                 <!-- 찜한 방-->
                 <div id="tbl2">
                        <div class="list2">
                        <c:forEach items="${list}" var="jjim">
                    		<div class="post_block">
                            <div class=pic style= 'background-image:url("../pic/${jjim.imgname}")'></div>
                            
                            
                            <div class="option">
                            	<div class="type">${jjim.htype}/${jjim.stype}</div>
                                <div class="price">${jjim.cost/10000}만원/${jjim.area}평</div>
                                <div class="op">${jjim.subject}</div>
                                <div class="heart"><img src="../images/fullheart.png" alt=""></div>
                       		</div>
                       		</div>
                        </c:forEach> 
                       		<div id="hidden"></div>
                   </div>
                </div>
           </div>   <!--house_list-->
    </div><!-- container -->
       

        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        
</div>
	  <script>
    $(".jjim").mouseover(function(){
        $(this).css("backgroundColor","C6C6F3");
    });

    $(".jjim").mousedown(function(){
        // $("#tbl1").css("display","none");
        // $("#tbl2").css("display","");
        $("#tbl1").hide();
        $("#tbl2").show();
        $(".jjim")
                .css("backgroundColor","#7674E2")
                .css("color","white");
        $(".recent")
        .css("backgroundColor","#eeeeee")
        .css("color","black");
    });
   

    $(".recent").mousedown(function(){
        // $("#tbl2").css("display","none");
        // $("#tbl1").css("display","inline");
        $("#tbl2").hide();
        $("#tbl1").show();
        $(".recent").css("backgroundColor","#7674E2")
                    .css("color","white");
        $(".jjim")
        .css("backgroundColor","#eeeeee")
        .css("color","black");
    });

    //하트색변경
    $(".heart").mousedown(function(){
        console.log();
    });
    </script>
</body>
</html>