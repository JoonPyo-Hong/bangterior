<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<style>
      /* #container{
            background-color:#eee;
        } */
      /* 서브메뉴 */
      #container:after {
        content: "";
        display: block;
        clear: both;
      }
      #container {
        /* border: 1px solid red; */
        width: 1200px;
        height: 3200px;
        margin: 0px auto;
      }
      /* 서브메뉴 */
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
        /* end */

        #container #submenu .click{
            text-decoration: underline;
            font-weight: bold;
        }
      /* 정보창 */
      .inputpost {
        width: 1000px;
        /* margin: 0px auto.; */
        margin-left: 100px;
      }

      .inputheader {
        /* border: 1px solid blue; */
        height: 30px;
        font-size: 1.4em;
        border-bottom: 3px solid #c6c6f3;
        padding-top: 40px;
        padding-bottom: 5px;
        color: #7674e2;
      }

      .inputline {
        height: 100px;
        font-size: 1.1em;
        color: #444;
        margin-top: 50px;
        padding-left: 15px;
      }

      .inputbtn {
        border: 0px;
        background-color: #e8e8e8;
        outline: none;
        height: 30px;
        width: 150px;
        cursor: pointer;
      }

      #uploadfile {
        width: 300px;
        background-color: white;
      }

      .sels {
        width: 200px;
        border: 2px solid #e8e8e8;
        outline: none;
        height: 30px;
        border-radius: 5px;
        padding-left: 15px;
      }

      /* 공통 버튼 & 공통 입력창 */

      .inputtext {
        border: 3.5px solid #e8e8e8;
        outline: none;
        width: 285px;
        height: 30px;
        border-radius: 5px;
        margin-right: 40px;
        padding-left: 15px;
        background-color: #e8e8e8;
        /* cursor: not-allowed; */
        /* readonly는 추후 기능 추가 */
      }

      .inputbtn {
        border: 0px;
        background-color: #e8e8e8;
        outline: none;
        height: 30px;
        width: 150px;
        cursor: pointer;
      }

      /* 포스트 */
      #poscode,
      #findposcode {
        margin-bottom: 30px;
      }

      #poscode {
        margin-right: 800px;
      }

      #address {
        width: 400px;
      }

      #extraaddress {
        width: 430px;
      }
      /* 물음표 */
      #img1 {
        width: 15px;
        height: 15px;
        cursor: pointer;
        /* float: right; */
        margin-right: 360px;
        /* margin-bottom: 100px; */
        display: inline-block;
      }

      #questionmark {
        float: right;
        margin-top: 5px;
      }

      /* 보증금 */
      .inputmoney {
        margin-right: 10px;
      }

      .inputmoney + span {
        margin-right: 45px;
      }

      #qspan {
        margin-right: 0px;
      }

      .area,
      .true_area {
        margin-bottom: 30px;
        margin-right: 0px;
      }

      .areatitle,
      .trueareatitle {
        border: 0px;
        outline: none;
        width: 100px;
        height: 30px;
        background-color: #e8e8e8;
        text-align: center;
        display: inline-block;
        margin-right: 15px;
        border-radius: 5px;
      }

      .area + span {
        margin-right: 15px;
      }

      .cb + span,
      .rb + span {
        margin-right: 20px;
      }

      .cb,
      .rb {
        margin-right: 5px;
      }

      #inputline1 {
        margin-bottom: 50px;
      }

      .roomimg {
        width: 250px;
        height: 200px;
        border: 1px solid black;
        float: left;
        margin-right: 20px;
      }

      #inputline2 {
        height: 500px;
      }

      #roomimg4 {
        margin-top: 50px;
      }

      textarea {
        margin: 5px;
        width: 800px;
        height: 300px;
        resize: none;
        margin-right: 150px;
        float: left;
        border: 3.5px solid #e8e8e8;
      }

      #inputcontainer {
        margin-top: 100px;
      }

      .state {
        font-size: 1.4em;
        /* border: 0px solid #e8e8e8; */
        outline: none;
        border-radius: 5px;
        width: 150px;
        height: 40px;
        text-align: center;
        background-color: #3cba99;
        color: white;
        float: right;
        margin-top: 80px;
        margin-right: 100px;
      }
       /* 수정 버튼 */
       .btn {
        background-color: #7674e2;
        outline: none;
        border: 0px;
        width: 180px;
        height: 50px;
        font-size: 1.4em;
        color: white;
        border-radius: 5px;
        float: right;
        margin: 50px 15px;
      }
      .btn:after{
        content:"";
        display:block;
        clear:both;
      }
      #changebtn:hover, #deletebtn:hover{
        cursor:pointer;
      }
      .room_img{
        width:300px;
        height:200px;
      }
      .room_img:nth-last-child(){
        position:relative;
      }


    </style>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
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
        <!-- submenu -->

        <div class="state">
          <p>승인 완료</p>
        </div>

        <div id="inputcontainer" class="inputpost">
          <div id="inputcontent1" class="inputcontent">
            <div id="inputheader1" class="inputheader">
              <p>주소</p>
            </div>
            <div id="inputline1" class="inputline">
              <input type="text" id="poscode" class="inputtext" value="05630" />
              <input
                type="text"
                id="address"
                class="inputtext"
                value="서울시 강남구 역삼동"
              />
              <input
                type="text"
                id="extraaddress"
                class="inputtext"
                value="1234번지 해피빌라 4567동 8965호"
              />
            </div>
          </div>
          <div id="inputcontent2" class="inputcontent">
            <div id="inputheader2" class="inputheader">
              <p>사진</p>
            </div>
            <div id="inputline2" class="inputline">
              <div class="imgbox">
                <a href="../images/room2.jpg" data-title="열심히 한 작업!!" data-lightbox="example-set"><img class="room_img" src="../images/room2.jpg" alt=""></a>
                <a href="../images/room3.jpg" data-title="열심히 한 작업!!" data-lightbox="example-set"><img class="room_img" src="../images/room3.jpg" alt=""></a>
                <a href="../images/room4.jpg" data-title="열심히 한 작업!!" data-lightbox="example-set"><img class="room_img" src="../images/room4.jpg" alt=""></a>
                <a href="../images/room5.jpg" data-title="열심히 한 작업!!" data-lightbox="example-set"><img class="room_img" src="../images/room5.jpg" alt=""></a>
                <a href="../images/room1.jpg" data-title="열심히 한 작업!!" data-lightbox="example-set"><img class="room_img" src="../images/room1.jpg" alt=""></a>
                <a href="../images/room2.jpg" data-title="열심히 한 작업!!" data-lightbox="example-set">
                  <img class="room_img" src="../images/room2.jpg" alt=""></a>
              </div>
            </div>
            <div id="inputcontent3" class="inputcontent">
              <div id="inputheader3" class="inputheader"><p>보증금</p></div>
              <div id="inputline3" class="inputline">
                <input
                  type="text"
                  value="20"
                  class="inputtext inputmoney"
                /><span>만원</span> <span>월세:</span>
                <input
                  type="text"
                  value="30"
                  class="inputtext inputmoney"
                /><span id="qspan">만원</span>
                <div id="questionmark">
                  <img src="../images/questionmark.png" id="img1" alt="" />
                </div>
              </div>
            </div>
            <div id="inputcontent4" class="inputcontent">
              <div id="inputheader4" class="inputheader"><p>방 구조</p></div>
              <div id="inputline4" class="inputline">
                <select id="sel" class="sels">
                  <option value="원룸">원룸</option>
                  <option value="아파트" selected>아파트</option>
                  <option value="빌라">빌라</option>
                  <option value="오피스텔">오피스텔</option>
                </select>
              </div>
            </div>
            <div id="inputcontent5" class="inputcontent">
              <div id="inputheader5" class="inputheader"><p>관리비</p></div>
              <div id="inputline5" class="inputline">
                <input
                  type="text"
                  class="inputtext inputmoney"
                  value="20"
                /><span>만원</span>
                <span>관리비 포함 항목></span>
                <input type="checkbox" class="cb" /><span>전기세</span>
                <input type="checkbox" class="cb" /><span>가스</span>
                <input type="checkbox" class="cb" /><span>수도</span>
                <input type="checkbox" class="cb" /><span>인터넷</span>
                <input type="checkbox" class="cb" /><span>TV</span>
              </div>
            </div>
            <div id="inputcontent6" class="inputcontent">
              <div id="inputheader6" class="inputheader"><p>방 면적</p></div>
              <div id="inputline6" class="inputline">
                <div>
                  <div class="areatitle">방 면적</div>
                  <input
                    type="text"
                    class="area inputtext"
                    id="inputarea"
                    value="25"
                  />
                  <span> m² ▶ </span>
                  <input
                    type="text"
                    class="true_area inputtext"
                    id="inputtruearea"
                  />
                  <span>P</span>
                </div>
                <div>
                  <div class="trueareatitle">계약 면적</div>
                  <input type="text" class="area inputtext" value="20" id="inputarea2"/>
                  <span> m² ▶ </span>
                  <input type="text" class="true_area inputtext" id="true_area2" />
                  <span>P</span>
                </div>
              </div>
            </div>
            <div id="inputcontent7" class="inputcontent">
              <div id="inputheader7" class="inputheader"><p>옵션</p></div>
              <div id="inputline7" class="inputline">
                <div id="cbbox">
                  <input class="cb" type="checkbox" checked /><span
                    >반려동물</span
                  >
                  <input class="cb" type="checkbox" /><span>엘레베이터</span>
                  <input class="cb" type="checkbox" /><span>신설건물</span>
                  <input class="cb" type="checkbox" checked /><span
                    >베란다/발코니</span
                  >
                  <input class="cb" type="checkbox" /><span>보안</span>
                  <input class="cb" type="checkbox" checked /><span
                    >주차 기능</span
                  >
                  <input class="cb" type="checkbox" /><span>역세권</span>
                  <input class="cb" type="checkbox" /><span>360ºVR</span>
                </div>
              </div>
            </div>

            <div id="inputcontent8" class="inputcontent">
              <div id="inputheader8" class="inputheader"><p>전세 대출</p></div>
              <div id="inputline8" class="inputline">
                <input class="rb" type="radio" name="rb" checked /><span
                  >전세 대출 가능</span
                >
                <input class="rb" type="radio" name="rb" /><span
                  >전세 대출 불가</span
                >
                <input class="rb" type="radio" name="rb" /><span>등등</span>
              </div>
            </div>

            <div id="inputcontent9" class="inputcontent">
              <div id="inputheader9" class="inputheader"><p>상세 설명</p></div>
              <div id="inputline9" class="inputline">
                <textarea class="explain"> </textarea>
              </div>
            </div>
                 <!-- 수정, 삭제 버튼-->
           <!-- 수정, 삭제 버튼-->
           <div id="btn">
            <input
              id="changebtn"
              class="btn"
              type="button"
              value="회원 정보 수정"
              data-old="회원 정보 수정"
              data-new="수정 완료"
            />
            <input id="deletebtn" class="btn" type="button" value="게시물 삭제" />
          </div>
          </div>
        </div>
        <!-- container -->
      </div>


        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        

	<script>
	</script>
</body>
</html>