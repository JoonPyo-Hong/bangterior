<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<!-- 팝업 -->
<link rel="stylesheet" type="text/css" href="../css/basic_popup.css" />

<style>

 /* 해당 페이지 스타일 작업 영역 */

      #container {
        width: 1200px;
        height: 2000px;
        margin: 0px auto;
        color: #333;
      }

      #head {
        margin-top: 30px;
        text-align: center;
        margin-bottom: 70px;
      }

      #title {
        font-size: 2.5em;
        color: #444;
        display: inline-block;
      }

      #warning {
        font-size: 0.8em;
        color: #ee5656;
        display: inline-block;
        margin-top: 15px;
        margin-left: 716px;
      }

      .inputpost {
        width: 1000px;
        margin-left: 100px;
      }

      .inputheader {
        /* border: 1px solid blue; */
        height: 50px;
        font-size: 1.4em;
        border-bottom: 3px solid #c6c6f3;
        padding-top: 10px;
        /* padding-bottom: 5px; */
        color: #7674E2;
      }

      .inputheader p {
        margin-top: 10px;
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
        background-color: #7674E2;
        outline: none;
        height: 30px;
        width: 150px;
        cursor: pointer;
      }

      #uploadfile {
        width: 300px;
        background-color: white;
      }

      .sels{
        width: 200px;
         border: 2px solid #e8e8e8;
        outline: none;
        height: 30px;
        border-radius: 5px;
        padding-left: 15px;
      }

      .yes{
          margin-bottom: 15px;
          float: left;
          margin-right: 30px;
      }


      

      


       #uploadbtn {
        width: 130px;
        height: 50px;
        outline: none;
        border: 0px;
        background-color: #7674e2;
        cursor: pointer;
        float: right;
        text-align: center;
        padding-top: 20px;
        margin-top: 150px;
        font-size: 1.1em;
        color: white;
      }

      .basic_popup {
        top: 180%;
      }

      /* ******************************************라이도 버튼 누르고 셀렉트 활성화되는거 다시 해볼 것 ㅠㅠ */
</style>
</head>
<body>
	<!-- index.jsp (member)  -->



   <!-- 전체 -->
    <div id="wrap">
        
        <!-- header -->
        <%@include file="/WEB-INF/views/inc/member/header.jsp" %>

            <!-- nav -->
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
        
        <div id="head">
          <h1 id="title">등본 인증</h1>
          <p id="warning">
            해당 메뉴는 본인이 '세대주'로 입력된 등본만 등록 가능합니다.
          </p>
        </div>
        <div id="inputcontainer" class="inputpost">
      <div id="inputcontent1" class="inputcontent">
        <div id="inputheader1" class="inputheader">
          <p>등본 등록(사진 가능)</p>
        </div>
        <div id="inputline1" class="inputline">
          <input type="file" name="uploadfile" id="uploadfile" class="inputbtn" />
        </div>
      </div>
      <div id="inputcontent2" class="inputcontent">
        <div id="inputheader2" class="inputheader">
          <p>1. 해당 매물에 본인이 '세대주'로 등록되어 있습니까?</p>
        </div>
        <div id="inputline2" class="inputline">
          <div id="yes1" class="yes">
                  네 <input type="radio" name="q1" id="opt1" class="opts opt1" value="1" />
                </div>

                <div id="no1" class="no">
                  아니오
                  <input type="radio" name="q1" id="opt1" class="opts opt1" value="0" />
        </div>
      </div>
      <div id="inputcontent3" class="inputcontent">
        <div id="inputheader3" class="inputheader"><p>2. 동거인이 있습니까?</p></div>
        <div id="inputline3" class="inputline">
          <div id="yes2" class="yes">
                  네 <input type="radio" name="q2" class="opts opt2" value="1" />
                </div>

                <div id="no2" class="no">
                  아니오
                  <input type="radio" name="q2" class="opts opt2"  value="0"/>
                </div>
        </div>
      </div>
      <div id="inputcontent4" class="inputcontent">
        <div id="inputheader4" class="inputheader"><p>3. 동거인이 있다면 동거인과의 관계를 고르시오</p></div>
        <div id="inputline4" class="inputline">
          <select name="" id="sel1" class="sels" disabled>
                  <option value="1">부모</option>
                  <option value="2">부부</option>
                  <option value="3">형제</option>
                  <option value="4">제 3자</option>
                </select>
        </div>
      </div>
      <div id="inputcontent5" class="inputcontent">
        <div id="inputheader5" class="inputheader"><p>4. 해당 매물은 대출 가능한 상태입니까?</p></div>
        <div id="inputline5" class="inputline">
          <div id="yes3" class="yes">
                  네
                  <input type="radio" name="q4" id="opt4" class="opts opt3"  value="1"/>
                </div>

                <div id="no3" class="no">
                  아니오
                  <input type="radio" name="q4" id="opt4" class="opts opt3"  value="0"/>
                </div>
        </div>
      </div>
      <div id="inputcontent6" class="inputcontent">
        <div id="inputheader6" class="inputheader"><p> 5. 해당 매물을 구매한 시기를 고르시오</p></div>
        <div id="inputline6" class="inputline">
           <select name="" id="sel2" class="sels">
                  <option value="20">2020</option>
                  <option value="19">2019</option>
                  <option value="18">2018</option>
                  <option value="17">2017</option>
                  <option value="16">2016</option>
                  <option value="15">2015</option>
                  <option value="14">2014</option>
                  <option value="13">2013</option>
                  <option value="12">2012</option>
                  <option value="11">2011</option>
                  <option value="10">2010</option>
                  <option value="9">2009</option>
                  <option value="8">2008</option>
                  <option value="7">2007</option>
                  <option value="6">2006</option>
                  <option value="5">2005</option>
                  <option value="4">2004</option>
                  <option value="3">2003</option>
                  <option value="2">2002</option>
                  <option value="1">2001</option>
                  <option value="0">2000년대 이전</option>
                </select>
        </div>
      </div>
      <div id="inputcontent7" class="inputcontent">
        <div id="inputheader7" class="inputheader"><p>6. 해당 매물에 저당이 잡혀 있습니까?</p></div>
        <div id="inputline7" class="inputline">
          <div id="yes4" class="yes">
                  네
                  <input type="radio" name="q6" id="opt6" class="opts opt4"  value="1"/>
                </div>

                <div id="no4" class="no">
                  아니오
                  <input type="radio" name="q6" id="opt6" class="opts opt4"  value="0"/>
                </div>
        </div>
      </div>
     
    </div>
          

          
        
        
        
        
      </div>
           <!-- 확인 버튼 1개 완료된 후  -->
          
          <div id="uploadbtn">등록하기</div>


		<!-- 정보 전달 -->
          <div class="modal"></div>
         <div class="basic_popup complete getcom">
          <div class="close_btn" id="comclose"><img src="/bangterior/images/close.png" /></div>
          <p>
            신청 완료<br />신청이 완료되었습니다. <br>서류 심사에는 3~4일 소요될 예정입니다.
          </p>
          <div class="ok_btn"  id="comok">확인</div>
        </div>
        
        
         <!-- 모든 칸 입력 안내 -->
         <div class="basic_popup failtocom getcom" id = "failtocom">
          <div class="close_btn" ><img src="/bangterior/images/close.png" /></div>
          <p>
            신청 실패<br />모든 칸을 다 선택해주세요!
          </p>
          <div class="ok_btn">확인</div>
        </div>
        
        <!-- 등록 실패 -->
          <div class="basic_popup failnoreason getcom">
          <div class="close_btn"><img src="/bangterior/images/close.png" /></div>
          <p>
            신청 실패<br />등록에 실패하였습니다. <br>잠시후에 다시 시도해주세요.
          </p>
          <div class="ok_btn">확인</div>
        </div> 
  

        </div>



        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        

	<script>
	
	
	//팝업 창 스크립트
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
    
    
   //성공 팝업창 
     //버튼 클릭 시 팝업창 닫기
       $("#comclose").click(function () {
         $(".modal").attr("style", "display:none");
         $(".basic_popup").attr("style", "display:none");
       //성공시 바로 전 메뉴로 넘어갈것
     	location.href="/bangterior/member/reghousemenu.do"
 		
       });

       //[기본] X 버튼 클릭 시 팝업창 닫기
       $("#comok").click(function () {
         $(".modal").attr("style", "display:none");
         $(".basic_popup").attr("style", "display:none");
       //성공시 바로 전 메뉴로 넘어갈것
     	location.href="/bangterior/member/reghousemenu.do"
 		
       });

	
	
	
	
	
	//2.질문 예 선택시 3번 질문 활성화 
	 $(".opt2").change(function(){

          if($(".opt2:checked").val() == "1"){
            $("#sel1").attr("disabled", false);
          } else {
        	  $("#sel1").attr("disabled", true);
          }
        });
	
	
	//ajax 보내기용 데이터   
     var formData = new FormData();
	
	//등록하기 버튼 누를 경우 발생하는 이벤트
	 $("#uploadbtn").click(function(){
		 
		 

   	  	 formData.append("uploadfile",$("#uploadfile").val()); 
         formData.append("opt1",$(".opt1:checked").val()); 
         formData.append("opt2",$(".opt2:checked").val()); 
         formData.append("sel1",$("#sel1 option:selected").val() ); 
         formData.append("opt3",$(".opt3:checked").val()); 
         formData.append("sel2",$("#sel2 option:selected").val()); 
         formData.append("opt4",$(".opt4:checked").val()); 

         formData.append("file", $("input[name='uploadfile']")[0].files[0]);
    	  
    	  //모든 창이 입력되지 않은 경우
    	  if($(".opt1:checked").val() == "" || $(".opt2:checked").val() == "" || $(".opt3:checked").val() == "" || 
    			  $(".opt4:checked").val() == "" || $("#uploadfile").val() == "" || $(".opt2:checked").val() == "" ){
    		  
    		 $(".modal").css("display","block");
		   	 $("#failtocom").css("display","block");
    	  } else {
    		  //모든 창 입력 완료 --> 정보 전달 regcertidocok페이지로 넘어가기
    		  
    		//ajax 처리
    			 $.ajax({
    				type: "POST",
    				url: "http://localhost:8090/bangterior/member/regattdocok.do",
    				processData: false, // 필수 
    				contentType: false, // 필수
    				data: formData,
     				dataType: "json",
     				enctype: 'multipart/form-data',
    				success: function(result){
    					if(result.count==1){
    						//성공
    						$(".modal").css("display", "block");
    				    	$(".complete").css("display", "block");
    				    	
    					} else {
    						//실패
    						$(".modal").css("display", "block");
    				    	$(".failnoreason").css("display", "block");
    				    	
    					}
    				},
    				error: function(a,b,c){
    					console.log(a,b,c);
    				}
    				
    				
    			});
    		  
    	  }
    	  
    	   
	 
    	  
      });
      
	
	
	
	</script>
</body>
</html>