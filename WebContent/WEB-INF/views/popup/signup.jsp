<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/bangterior/css/signup.css">



			
			<!-- <div id="main_signup_popup"> -->
<div class="modalSignup"></div>
            <div id="signup_popup">
                <div class="close_btn"><img src="../images/close.png"></div>
                <p>개인 회원가입</p>
                <div class="sign_num_box">
                    <ul>
                        <li><img src="../images/num1.png"></li>
                        <li class="line"><img src="../images/line2.png" style="width: 12px;"></li>
                        <li class="line"><img src="../images/line2.png" style="width: 12px;"></li>
                        <li class="line"><img src="../images/line2.png" style="width: 12px;"></li>
                        <li class="line"><img src="../images/line2.png" style="width: 12px;"></li>
                        <li><img src="../images/num2_gray.png"></li>
                    </ul>
                </div>
                <div class="sign_list">
                    <p>아이디</p>                 
                    <input type="text" id="id_input"class="id_input sign_input">
                    <!-- <div id="check_overlapId">중복 확인</div> -->
                    <div id="checkIdResult" style="color : #aaa; font-size : 0.8em; margin-left : 25px;">아이디는 5자이상 소문자,숫자의 조합으로 생성해주세요.</div>
                </div>
                <div class="sign_list">
                    <p>비밀번호</p>                 
                    <input type="password" class="password_input sign_input pw">
                    <div id="checkIdResult" style="color : #aaa; font-size : 0.8em; margin-left : 25px;">아이디는 5자이상 소문자,숫자의 조합으로 생성해주세요.</div>
                </div>
                <div class="sign_list">
                    <p>비밀번호 확인</p>                 
                    <input type="password" class="password_input sign_input password_check pw">
                </div>
                <div class="sign_list">
                    <p>이름</p>                 
                    <input type="text" class="name_input sign_input">
                </div>
                <div class="sign_list">
                    <p>주민등록번호</p>                 
                    <input type="text" class="ssn_input sign_input" style="width:100px"> -
                    <input type="text" class="ssn_input sign_input" style="width:30px">
                </div>
                <div class="sign_list">
                    <p>우편번호 :</p>                 
                    <input type="text" name="zip" class="sign_input" style="width:100px">
                     <button type="button" class="address_btn" onclick="openZipSearch()">검색</button><br>
                    <p>주소 :</p><input type="text" name="addr1" class="sign_input" readonly /><br>
                    <p>상세주소 :</p><input type="text" name="addr2" class="sign_input" />
                </div>
                <div class="sign_list">
                    <p>연락처</p>                 
                    <input type="text" class="ssn_input sign_input" style="width:96px"> -
                    <input type="text" class="ssn_input sign_input" style="width:96px"> -
                    <input type="text" class="ssn_input sign_input" style="width:96px">
                </div>
                <div class="sign_list">
                    <p>이메일</p>                 
                    <input type="text" class="ssn_input sign_input" style="width:90px"> @
                    <input type="text" class="ssn_input sign_input" style="width:100px" name="str_email02" id="str_email02" disabled value="naver.com">
                    <select name="selectEmail" id="selectEmail"> 
                        <option value="naver.com" selected>naver.com</option>
                        <option value="hanmail.net">daum.net</option>
                        <option value="kakao.com">kakao.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="1">직접입력</option> 
                    </select>
                </div>
                <div class="ok_btn" >다음</div>
            </div>
<!-- 	</div> -->







           <!--  <div class="popup write_popup signUp_popup">
                <div class="close_btn"><img src="../images/close.png"></div>
                <p>개인 회원가입</p>
                <div class="sign_num_box">
                    <ul>
                        <li><img src="../images/num1_gray.png"></li>
                        <li class="line"><img src="../images/line2.png" style="width: 12px;"></li>
                        <li class="line"><img src="../images/line2.png" style="width: 12px;"></li>
                        <li class="line"><img src="../images/line2.png" style="width: 12px;"></li>
                        <li class="line"><img src="../images/line2.png" style="width: 12px;"></li>
                        <li><img src="../images/num2.png"></li>
                    </ul>
                </div>
                <div class="sign_list">
                    <p>결혼 여부</p>                 
                    <input type="text" class="id_input sign_input">
                    <div class="radio_list"> 
                        <input type="radio" id="r1" name="rr" class="radio_btn">
                        <label for="r1"><span></span>기혼</label>
                        <input type="radio" id="r2" name="rr" class="radio_btn"/>
                        <label for="r2"><span></span>미혼</label>
                    </div>
                </div>
                <div class="sign_list">
                    <p>선호도 체크</p>
                    <div class="checkbox_list">          
                        <input type="checkbox" class="sign_chcek" id="cb1">
                        <label for="cb1">반려동물</label>
                        <input type="checkbox" class="sign_chcek" id="cb2">
                        <label for="cb2">엘리베이터</label>
                        <input type="checkbox" class="sign_chcek" id="cb3">
                        <label for="cb3">신설건물</label>
                        <input type="checkbox" class="sign_chcek" id="cb4">
                        <label for="cb4">베란다/발코니</label>
                        <input type="checkbox" class="sign_chcek" id="cb5">
                        <label for="cb5">보안</label>
                        <input type="checkbox" class="sign_chcek" id="cb6">
                        <label for="cb6">주차가능</label>
                        <input type="checkbox" class="sign_chcek" id="cb7">
                        <label for="cb7">역세권</label>
                        <input type="checkbox" class="sign_chcek" id="cb8">
                        <label for="cb8">360'VR</label>
                    </div>  
                </div>
                <div class="ok_btn">완료</div>
            </div>
 -->
 <script>

 	$("#id_input").blur(function(){
 			var id_input = $("#id_input").val();
 			if(id_input !=null){
 			$.ajax({
 				
 				url:"/bangterior/common/checkid.do",
 				type : 'post',
 				data : {id : id_input},
 				success : function(result){
 					if(result==0){ 
 						$('#checkIdResult').text('사용가능한 아이디입니다.').css('color','blue').css("margin-left","135px").css("margin-bottom","-20px");
 					} else { 
 						$('#checkIdResult').text('사용 불가능한 아이디입니다.').css('color','red');
 					}
 				},
 				error : function(a,b,c){
 					console.log(a,b,c);
 				}
 			})
 			} else {
 				
 			}
 	});
 </script>