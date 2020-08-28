<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_admin.css">

<!-- 팝업 -->
<link rel="stylesheet" type="text/css" href="../css/basic_popup.css" />

<style>
#nav {
    /* height: 1100px; */
}

 /* 해당 페이지 스타일 작업 영역 */
      #title {
        margin-top: 15px;
        font-size: 2.5em;
        text-align: center;
      }
      #subtitle h2 {
        font-size: 1.4em;                                                                                                                                                                                                                                                                                                                                     
        margin-top: 15px;
        /* text-align: center; */
      }

      .box {
        padding-left: 15px;
      }

      .menus,
      .opts {
        float: left;
      }

      #theme{
          width: 1300px;
          margin-top: 100px;
          font-size: 1.1em;
          text-align: center;
          margin-left: 40px;
      }

      #theme th {
          border-bottom: 1px solid #F0F0F6;
        height: 70px;

      }

      #theme td{
        margin-top: 50px;
        height: 70px;
      }

      .btn{
          margin-top: 150px;
          width: 200px;
          height: 50px;
          font-size: 1.1em;
          margin-left: 15px;
          float: right;
          cursor: pointer;
          outline: none;
          border: 0px;
          background-color: #F0F0F6;
      }

      .cb{
        margin-right: 5px;
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
               <div id="head">              </div>

            <h1 id="title">매물 추천 테마 등록</h1>
              
                  <div id="opt" class="opts">
                    <table id="theme">
                      <th id="th1" class="th"><input type="checkbox" name="cb" id="allcb" class="cb">No</th>
                      <th id="th2" class="th">선택한 테마</th>
                      <th id="th3" class="th">추천 테마 제목</th>
                      
                      
                      <tr>
                        <td id="td1" class="td"></td>
                        <td id="td2" class="td">회원 추천</td>
                        <td id="td3" class="td">회원 정보를 통한 집 추천</td>
                      </tr>
                      
                     	 <c:forEach items="${list}" var="dto">
                     	 <tr>
                        <td class="td"><input type="checkbox" name="cb" class="cb" id="cb${dto.seq }" value="${dto.seq }">0${dto.seq }</td>
                        <td class="td">${dto.optname }</td>
                        <td class="td">${dto.subject }</td>
                     	 </tr>
                     	 
						</c:forEach>
                      
                    </table>

                    <input type="button" value="삭제" class="btn" id="dlt">
                    <input type="button" value="수정" class="btn" id="edit">
                    <input type="button" value="추가" class="btn" id="add">
                </div>
            </div>

            <!-- 확인 & 삭제 버튼 2개 팝업창 (테마 삭제)-->
            <div class="modal"></div>
            <div class="basic_popup" id="delete_popup">
                <div class="close_btn"><img src="../images/close.png"></div>
                <p>해당 테마를 삭제하시겠습니까?</p>
                <div id="popup_btn_area">
                    <div class="ok_btn">확인</div>
                    <div class="ok_btn cancel_btn">취소</div>
                </div>
            </div>


            <!-- 테마 수정 -->
            <div class="basic_popup" id="edit_popup">
                <div class="close_btn"><img src="../images/close.png"></div>
                <p>해당 테마를 수정하시겠습니까?</p>
                <div id="popup_btn_area">
                    <div class="ok_btn">확인</div>
                    <div class="ok_btn cancel_btn">취소</div>
                </div>
            </div>


            <!-- 테마 추가 (4개이상일시) -->
            <div class="basic_popup" id="add_popup">
                <div class="close_btn"><img src="../images/close.png"></div>
                <p>테마 등록 제한<br>테마는 3개 이상 추가가 불가능합니다.</p>
                <div class="ok_btn">확인</div>
            </div>

          </div>
            
            
            
            
            
            
            </div>
            
            <div style="clear:both;"></div>
      
        
        <div style="clear:both;"></div>
    	
    	<script>
    	
    	
    	
    	
    	 //버튼 클릭 시 팝업창 열기
        $("#dlt").click(function(){
        	
            $(".modal").attr("style", "display:block");
            $("#delete_popup").attr("style", "display:block");
        		
        	
        });


        // 수정 버튼
        $("#edit").click(function(){
        	//체크 박스 없이 누를시
            $(".modal").attr("style", "display:block");
            $("#edit_popup").attr("style", "display:block");
        });

        $("#add").click(function(){
        	var index = 0;
        	<c:forEach items="${list}">
        		index = index+1;
        	</c:forEach>
        	if(index >= 3){
        // 테마가 4개 이상일시 추가를 누르면 -->
            $(".modal").attr("style", "display:block");
            $("#add_popup").attr("style", "display:block");
        	} else {
        		//테마 추가 팝업
        		
        		
        	}
        		
        });

        
        //버튼 클릭 시 팝업창 닫기
         $(".ok_btn").click(function(){
            $(".modal").attr("style", "display:none");
            $(".basic_popup").attr("style", "display:none");
        });


        //[기본] X 버튼 클릭 시 팝업창 닫기
         $(".close_btn").click(function(){
            $(".modal").attr("style", "display:none");
            $(".basic_popup").attr("style", "display:none");
        });

    	
    	
    	</script>

</body>
</html>