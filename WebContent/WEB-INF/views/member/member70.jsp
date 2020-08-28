<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
  <style>
      
      
      #submenu {
        /* background-color:skyblue; */
        width: 900px;
        height: 150px;
        margin: 0 auto;
        border-bottom: 3px solid #e8e8e8;
        padding-bottom: 10px;
      }

      #submenu #subtitle {
        color: #444;
        font-size: 2.5em;
        display: block;
        font-weight: bold;
        text-align: center;
        margin-top: 60px;
        margin-bottom: 60px;
      }
      #submenu input[type="text"] {
        /* margin-left:0px; */
        width: 120px;
        text-align: center;
        font-size: 1.1em;
        cursor: pointer;
        border: 0px;
      }
      #submenu a {
        font-size: 16px;
        margin-left: 18px;
      }
      #submenu a input:hover {
        text-decoration: underline;
      }
      #container #submenu .click {
        text-decoration: underline;
        font-weight: bold;
      }
        #regbox{
            margin-top:30px;
            /* border:1px solid blue; */
            width:1300px;
            height:1000px;
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
        thead tr th:nth-child(2){text-align: left;}
        tbody tr td:nth-child(2){text-align: left;}
        /* thead tr th:nth-child(3){width: 20px;} */
        /* tbody tr td:nth-child(3){text-align: center;} */
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

        /* 문의하기 팝업창 */
        .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1001; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4);
            }
            .popup {
                display: none;
                z-index: 1002;
                position: absolute;
                left:50%; top:50%;
                margin-left: -250px;
                margin-top: -400px;
                width: 500px;
                height: 800px;
                background-color: white;
                border:1px solid #eee;
            }

            .popup .close_btn img{
                cursor: pointer;
                position: absolute;
                width: 15px;
                right: 30px;
                top:25px

            }

            .popup p{
                text-align: center;
                margin: 50px 0 20px 0;
                color:#444;
                font-size: 26px;
                font-weight: bold;
                
            }

            .popup .sign_list p {
                display: inline-block;
                width: 100px;
                text-align: left;
                font-size: 14px;
                font-weight: normal;
                line-height: 30px;
                color: #888;
                margin: 0px 0px 10px 30px;
            }

            .popup .sign_input{
                width: 320px;
                height: 30px;
                font-size: 16px;
                margin: 0 auto;
                margin-top: 10px;
                border: 1px solid #ccc;
                text-align: left;
                text-indent: 10px;
            }

            .popup .id_input {
                width: 225px;
            }

            .popup .sign_input:focus{
                border: 1px solid #7674E2;
            }

            .popup .ok_btn {
                cursor: pointer;
                text-align: center;
                width: 400px;
                margin: 0 auto;
                margin-top: 30px;
                height: 60px;
                line-height: 60px;
                font-size: 16px;
                background-color: #7674E2;
                color:white;
            }


            /* 집 판매자 정보 */
            .info_box {
                width: 450px;
                margin: 0 auto;
            }
            .popup  .info_box p {
                font-size: 14px;
                color:#888;
                font-weight: normal;
                text-align: left;
                margin-top: 0px;
                margin-bottom: 0px;
            }
            .popup  .info_box .title {
                font-size: 18px;
                color:#333;
                font-weight: bold;
            }
            .popup  .info_box img {
                width: 100px;
                margin-left: 38%;
                margin-top: 20px;
            }
            .popup .user_info p {
                margin-top: 20px;
                margin-bottom: 20px;
                font-size: 16px;
                color:#333;
                font-weight: bold;
                text-align: center;
            }
            .popup .user_info p span{
                font-size: 14px;
                color:#888;
                font-weight: normal;
            }

            .popup .user_info p .phone{
                color:#7674E2;
                font-size: 22px;
                font-weight: bold;
            }


    </style>
</head>
<body>
	<!-- index.jsp (member)  -->



   <!-- 전체 -->
    <div id="wrap">
        
        <!-- header -->
        <%@include file="/WEB-INF/views/inc/member/header.jsp" %>

            <!-- nav -->template.jsp
            <div id="nav">
                <ul>
                    <li><a href="#">매물 조회</a></li>
                    <li><a href="#">매물 등록</a></li>
                    <li><a href="#">인테리어</a></li>
                    <li><a href="#">고객서비스</a></li>
                </ul>
            </div>
        </div>

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

                            <tr>
                                <td>3</td>
                                <td>강남구 역삼동 해피 빌딩301호</td>
                                <td>홍길동 공인중개소</td>
                                <td>2020-07-10</td>
                                <td><input type="text" value="미완료" disabled></td>
                                <td><input type="text" value="미완료" disabled></td>
                                <td><img src="../images/search_black.png" width="20px" style="cursor: pointer;" class="question_btn"></td>
                            </tr>
     
                        </tbody>
                    </table>
                    
                    <div id="paging">
                        <div class="left_btn btn">이전</div>
                        <ul>
                            <li class="view_page">1</li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
                            <li>5</li>
        
                        </ul>
                        <div class="right_btn btn">다음</div>
                    </div>
        
        
                    <div class="search_area">
                        <select id="search_select">
                            <option>항목</option>
                            <option>제목</option>
                        </select>
                        <input type="text" id="search_word" placeholder="검색어를 입력하세요.">
                        <input type="button" id="search_btn" value="검색">
                    </div>

                    <!--  문의사항 버튼 클릭 시 팝업창 -->
                    <div class="modal"></div>
                    <div class="popup write_popup login_popup">
                        <div class="close_btn"><img src="../images/close.png"></div>
                        <p>문의사항 내역</p>
                        <div class="info_box">
                            <p><span class="title">프로공인중개사사무소</span><br><br>서울특별시 관악구 신림동 1464-42<br>대표명 | 박현호<br>
                            <span>대표번호 | 010-4953-3217</span><br><br>
                            <hr style="width: 450px; margin: 10px auto; border:1px solid #ededed;">
                            </p>
                            <img src="../images/info_people.png">
                            <div class="user_info">
                                <p>담당: 김준우 (중개보조원)<br>
                                <span class="phone">504-3070-0980</span><br>
                                <span>연락 시 찬방에서 보고 연락한다고 말씀하시면<br>
                                    더욱 빠르게 상담 받을 수 있습니다.</span></p>
                            </div>
                        </div>
                        <hr style="width: 450px; margin: 10px auto; border:1px solid #ededed;">
                        <div class="sign_list">
                            <p>이름</p>                 
                            <input type="text" value="김희연" style="background-color:#ededed;" class="name_input sign_input">
                        </div>
                        <div class="sign_list">
                            <p>문의내역</p>                 
                            <input type="text" class="ssn_input sign_input" style="padding-bottom: 80px; background-color: #ededed;" value="해당 방 가격문의 드려요." readonly>
                        </div>
                        <div class="sign_list">
                            <p>연락처</p>                 
                            <input type="text" value="010" class="ssn_input sign_input" style="width:96px; background-color: #ededed;"> -
                            <input type="text" value="1234" class="ssn_input sign_input" style="width:96px; background-color: #ededed;"> -
                            <input type="text" value="5678" class="ssn_input sign_input" style="width:96px; background-color: #ededed;">
                        </div>
                    </div>






        
                </div>   
        
            </div> <!--regbox-->
    </div> <!-- container -->
           



        <!-- footer -->
        <div id="footer">
            <div class="footer_inner">
                <div class="footer_top">

                    <ul>
                        <li>이용약관</li>
                        <li>|</li>
                        <li>매물등록서비스 이용약관</li>
                        <li>|</li>
                        <li>개인정보처리방침</li>
                        <li>|</li>
                        <li>매물관리규정</li>
                        <li>|</li>
                        <li>업체 제휴 등록</li>
                    </ul>
                    <input class="top_btn" type="button" value="top">
                    <input class="bottom_input" type="text">
                    <div class="bottom_search">
                    <input class="bottom_guide" type="text"
                    value="매물번호검색:"
                    disabled>
                    </div>

                </div>



        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp"%>
        

	<script>
	</script>
</body>
</html>