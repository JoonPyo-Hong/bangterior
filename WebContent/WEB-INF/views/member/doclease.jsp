<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
   
<style>

   #container{
      padding-top: 20px;
   }
   
   input{
      text-align: right;
      font-size: 1.1em;
   }
   
   #loc{
      text-align: left;
   }
   
   
    #container:after {
        content: "";
        display: block;
        clear: both;
      }
      /* 서브메뉴 */
      #submenu {
        /* background-color:skyblue; */
        width: 900px;
        height: 100px;
        margin: 0 auto;
        border-bottom: 3px solid #e8e8e8;
        margin-bottom: 20px;
      }

      #submenu #subtitle {
        color: #444;
        font-size: 2.5em;
        display: block;
        font-weight: bold;
        text-align: center;
        /* margin-top: 20px; */
        margin-bottom: 30px;
      }
      #submenu input[type="text"] {
        /* margin-left:0px; */
        width: 300px;
        text-align: center;
        font-size: 1.1em;
        cursor: pointer;
        border: 0px;
        padding: 3px;
      }
      #submenu a {
        font-size: 16px;
        margin-left: 100px;
      }
      #submenu a input:hover {
        text-decoration: underline;
      }
      #container #submenu .click {
        text-decoration: underline;
        font-weight: bold;
      }

      .paper {
        width: 1200px;
        margin: 70px auto;
      }

      /* 서류폼 */
      #td3,
      #td18,
      #secondtd2,
      #secondtd5,
      #secondtd11,
      #secondtd19,
      #secondtd22,
      #secondtd28 {
        background-color: #fcbd2e;
      }

      #td5,
      #td7,
      #td10,
      #td12,
      #td16,
      #secondtd7,
      #secondtd9,
      #secondtd14,
      #secondtd16,
      #secondtd24,
      #secondtd26,
      #secondtd31,
      #secondtd33 {
        background-color: #e8e8e8;
      }


      .tbl {
        width: 1200px;
        border-collapse: collapse;
        font-size: 1.1em;
      }

      #title {
        font-size: 1.4em;
        font-weight: bold;
        display: inline-block;
        margin-left: 330px;
        margin-right: 300px;
      }

      #tbl1 .tr:first-child .td:first-child {}
        font-weight: bold;
      }

      #monthmoney {
        margin-left: 30px;
      }

      #td3 span {
        font-weight: bold;
        /* font-size: 13px; */
        margin-right: 350px;
      }

      #tbl1 .td,
      #tbl3 .td {
        text-align: center;
        border: 1px solid black;
      }

      input {
        border: 0px;
        outline: none;
      }

      #tbl1 #td2,
      #tbl1 #td3,
      #tbl1 #td18 {
        text-align: left;
        padding-left: 15px;
      }

      #loc {
        width: 1000px;
      }

      .areatext,
      .purposetext {
        width: 400px;
      }

      #parttext {
        width: 550px;
      }

      #td18 span {
        font-weight: bold;
      }

      .inputmoney {
        width: 540px;
      }

      #money6,
      #money8,
      #money10 {
        width: 400px;
      }

      #money2 {
        width: 250px;
      }

      #money1 {
        width: 740px;
      }

      #money4 {
        width: 100px;
      }

      #money3 {
        width: 630px;
      }

      #money9 {
        width: 625px;
      }

      #money5{
          width: 520px;
      }

      #money7{
          width: 515px;
      }

      #tbl1 {
        margin-bottom: 30px;
      }

      #tbl2 td {
        padding-bottom: 10px;
      }

      #tbl2 span {
        font-weight: bold;
      }

      .smalldate {
        width: 100px;
        border-bottom: 1px solid black;
      }

      .smallyear {
        width: 150px;
      }

      #tbl2 p {
        display: inline;
      }

      .inputrule {
        width: 1100px;
        margin-left: 79px;
        border-bottom: dashed 1px black;
      }

      #rule1 {
        margin-left: 2px;
      }

      #tbl3 #address2,
      #tbl3 #address3 {
        width: 1050px;
      }

      #tbl3 .inputtext {
        width: 260px;
      }

      #secondtd1,
      #secondtd18 {
        width: 20px;
      }

      #tbl3 #inform1,
      #tbl3 #inform7 {
        width: 350px;
      }

      #tbl1 {
        height: 550px;
      }

      #tbl3 {
        height: 300px;
      }

      .rb {
        outline: none;
        margin-left: 18px;
      }

      #tbl2 {
        margin-bottom: 50px;
      }

      .btn {
        width: 200px;
        font-size: 1.4em;
        border: 0px solid black;
        background-color: #e8e8e8;
        float: left;
        text-align: center;
        margin-left: 20px;
        margin-bottom: 150px;
        cursor: pointer;
        border-radius: 5px;
      }

      .btns {
        width: 500px;
        margin: 0px auto;
      }

      #fmoney, #smoney{
          margin-left: 0px;
      }


      /* 담을 상자 */
      #imgUrl{
         display : none;
      }

</style>
</head>
<body>
        <!-- container -->
        <div id="container">
         
      <div>
          <!-- 서브메뉴 -->
        <div id="submenu">
          <span id="subtitle">매매 계약서</span>
        </div>
        <!-- submenu -->
        <div class="paper">
          <table id="tbl1" class="tbl">
            <tr class="tr" id="tr1">
              <td class="td" id="td1" colspan="5">
                <p id="title">부동산매매계약서</p>
              </td>
            </tr>
            <tr class="tr" id="tr3">
              <td class="td" id="td3" colspan="5">
                <span>1. 부동산의 표시</span> 매도인과 매수인 쌍방은 아래 표시
                부동산에 관하여 다음 계약 내용과 같이 매매계약을 체결한다.
              </td>
            </tr>
            <tr class="tr" id="tr4">
              <td class="td" id="td4"><pre>소  재  지</pre></td>
              <td class="td" id="td500" colspan="4">
                <input
                  type="text"
                  id="loc"
                  class="inputtext"
                  placeholder="                              
                                                                                                                            서울특별시 oo구 oo동 oooooo 아파트 (도로명 주소)서울 특별시oo구 oooo"
                />
              </td>
            </tr>
            <tr class="tr" id="tr5">
              <td class="td" id="td4"><pre>토     지</pre></td>
              <td class="td" id="td5"><pre>지   목</pre></td>
              <td class="td" id="td6">
                <input
                  type="text"
                  id="purpose1"
                  class="inputtext purposetext"
                  value="사"
                />
              </td>
              <td class="td" id="td7"><pre>면   적</pre></td>
              <td class="td" id="td8">
                <input
                  type="text"
                  id="area1"
                  class="areatext inputtext"
                  value="${area}"
                />㎡
              </td>
            </tr>
            <tr class="tr" id="tr6">
              <td class="td" id="td9"><pre>건     물</pre></td>
              <td class="td" id="td10"><pre>구조ㆍ용도</pre></td>
              <td class="td" id="td11">
                <input
                  type="text"
                  id="purpose2"
                  class="inputtext purposetext"
                />
              </td>
              <td class="td" id="td12"><pre>면    적</pre></td>
              <td class="td" id="td13">
                <input
                  type="text"
                  id="area2"
                  class="areatext inputtext"
                  value="${area}"
                />㎡
              </td>
            </tr>

            <tr class="tr" id="tr8">
              <td class="td" id="td18" colspan="5">
                <span>2. 계약내용</span>
                <pre>
제 1 조 (목적) 위 부동산의 매매에 대하여 매도인과 매수인은 합의에 의하여 매매대금을 아래와 같이 지불하기로 한다.</pre
                >
              </td>
            </tr>
            <tr class="tr" id="tr9">
              <td class="td" id="td19"><pre>매  매  대  금</pre></td>
              <td class="td" id="td20" colspan="4">
                금
                <input type="text" class="inputmoney" id="money1" value="${cost} " />
                원      정 (￦
                <input type="text" class="inputmoney" id="money2" value="${cost} "/>
                )
              </td>
            </tr>
            <tr class="tr" id="tr10">
              <td class="td" id="td21"><pre>계  약  금</pre></td>
              <td class="td" id="td22" colspan="4">
                금
                <input type="text" class="inputmoney" id="money3" value="" />
                원정은 계약시에 지불하고 영수함. 영수자(
                <input type="text" class="inputmoney" id="money4" />
                인 )
              </td>
            </tr>
            <tr class="tr" id="tr11">
              <td class="td" id="td23"><pre>중  도  금</pre></td>
              <td class="td" id="td24" colspan="4">
                금
                <input type="text" class="inputmoney" id="money5" value="" />
                원정은
                <input type="text" class="smalldate smallyear" />년
                <input type="text" class="smalldate" />월
                <input type="text" class="smalldate" />일 에 지불하며
              </td>
            </tr>
            <tr class="tr" id="tr12">
              <td class="td" id="td25"><pre>잔   금</pre></td>
              <td class="td" id="td26" colspan="4">
                금
                <input type="text" class="inputmoney" id="money7" />
                원정은
                <input type="text" class="smalldate smallyear" />년
                <input type="text" class="smalldate" />월
                <input type="text" class="smalldate" />일 에 지불한다.
              </td>
            </tr>
            <tr class="tr" id="tr13">
              <td class="td" id="td27"><pre>차   임</pre></td>
              <td class="td" id="td28" colspan="4">
                금
                <input type="text" class="inputmoney" id="money9" />
                원정은 (<input
                  type="radio"
                  name="rb2"
                  id="fmoney"
                  class="rb"
                />선불로
                <input type="radio" name="rb2" id="smoney" class="rb" />후불로)
                매월 <input type="text" class="smalldate" />일 에 지불한다.
              </td>
            </tr>
          </table>
          <table id="tbl2" class="tbl">
            <tr class="tr" id="tr14">
              <td class="td" id="td29" colspan="5">
                제 2 조 <span>(소유권 이전 등)</span> 매도인은 매매대금의 잔금
                수령과 동시에 매수인에게 소유권이전등기에 필요한 모든 서류를
                교부하고 등기절차에 협력하며, 위 부동산의 인도일은
                <input type="text" class="smalldate smallyear" /> 년
                <input type="text" class="smalldate" /> 월
                <input type="text" class="smalldate" /> 일 로 한다.
              </td>
            </tr>
            <tr class="tr" id="tr15">
              <td class="td" id="td30" colspan="5">
                제 3 조 <span>(제한물권 등의 소멸)</span> 매도인은 위의 부동산에
                설정된 저당권, 지상권, 임차권 등 소유권의 행사를 제한하는 사유가
                있거나,제세공과 기타 부담금의 미납금 등이 있을 때에는 잔금
                수수일까지 그 권리의 하자 및 부담 등을 제거하여 완전한 소유권을
                매수인에게 이전한다. 다만, 승계하기로 합의하는 권리 및 금액은
                그러하지 아니하다.
              </td>
            </tr>
            <tr class="tr" id="tr16">
              <td class="td" id="td31" colspan="5">
                제 4 조 <span>(지방세 등)</span> 위 부동산에 관하여 발생한
                수익의 귀속과 제세공과금 등의 부담은 위 부동산의 인도일을
                기준으로 하되, 지방세의 납부의무 및 납부책임은 지방세법의 규정에
                의한다.
              </td>
            </tr>
            <tr class="tr" id="tr17">
              <td class="td" id="td32" colspan="5">
                제 5 조 <span>(계약의 해제)</span> 매수인이 매도인에게
                중도금(중도금이 없을때에는 잔금)을 지불하기 전까지 매도인은
                계약금의 배액을 상환하고, 매수인은 계약금을 포기하고 본 계약을
                해제할 수 있다.
              </td>
            </tr>
            <tr class="tr" id="tr18">
              <td class="td" id="td33" colspan="5">
                제 6 조 <span>(채무불이행과 손해배상)</span> 매도인 또는
                매수인이 본 계약상의 내용에 대하여 불이행이 있을 경우 그
                상대방은 불이행한자에 대하여 서면으로 최고하고 계약을 해제할 수
                있다. 그리고 계약당사자는 계약해제에 따른 손해배상을 각각
                상대방에게 청구할 수 있으며, 손해배상에 대하여 별도의 약정이
                없는 한 계약금을 손해배상의 기준으로 본다.
              </td>
            </tr>

            <tr class="tr" id="tr20">
              <td class="td" id="td34" colspan="5">
                <p>특약사항 :</p>
                <input type="text" id="rule1" class="inputrule" />
              </td>
            </tr>
            <tr class="tr" id="tr21">
              <td class="td" id="td35" colspan="5">
                <input type="text" id="rule2" class="inputrule" />
              </td>
            </tr>
            <tr class="tr" id="tr22">
              <td class="td" id="td36" colspan="5">
                <input type="text" id="rule3" class="inputrule" />
              </td>
            </tr>
            <tr class="tr" id="tr23">
              <td class="td" id="td37" colspan="5">
                <input type="text" id="rule4" class="inputrule" />
              </td>
            </tr>
            <tr class="tr" id="tr24">
              <td class="td" id="td38" colspan="5">
                <input type="text" id="rule5" class="inputrule" />
              </td>
            </tr>
            <tr class="tr" id="tr25">
              <td class="td" id="td39" colspan="5">
                <input type="text" id="rule6" class="inputrule" />
              </td>
            </tr>
            <tr class="tr" id="tr26">
              <td class="td" id="td40" colspan="5">
                <input type="text" id="rule7" class="inputrule" />
              </td>
            </tr>
            <tr class="tr" id="tr27">
              <td class="td" id="td41" colspan="5">
                <pre>본 계약을 증명하기 위하여 계약 당사자가 이의 없음을 확인하고 각자 서명, 날인 한다. 
                                                                                                                           <input type="text" class="smalldate smallyear" >년 <input type="text" class="smalldate" >월 <input type="text" class="smalldate" >일</pre>
              </td>
            </tr>
          </table>

          <table id="tbl3" class="tbl">
            <tr class="tr" id="secondtr1">
              <td class="td" id="secondtd1" rowspan="2">매 도 인</td>
              <td class="td" id="secondtd2"><pre>주    소</pre></td>
              <td class="td" id="secondtd3" colspan="6">
                <input type="text" class="inputtext" id="address2" />
              </td>
              <td class="td" id="secondtd4" rowspan="2">인</td>
            </tr>
            <tr class="tr" id="secondtr2">
              <td class="td" id="secondtd5">주민등록번호</td>
              <td class="td" id="secondtd6" colspan="2">
                <input type="text" class="inputtext" id="inform1" />
              </td>
              <td class="td" id="secondtd7"><pre>전    화</pre></td>
              <td class="td" id="secondtd8">
                <input type="text" class="inputtext" id="inform2" />
              </td>
              <td class="td" id="secondtd9"><pre>성    명</pre></td>
              <td class="td" id="secondtd10">
                <input type="text" class="inputtext" id="inform3" />
              </td>
            </tr>

            <tr class="tr" id="secondtr4">
              <td class="td" id="secondtd18" rowspan="2">매 수 인</td>
              <td class="td" id="secondtd19"><pre>주    소</pre></td>
              <td class="td" id="secondtd20" colspan="6">
                <input type="text" class="inputtext" id="address3" />
              </td>
              <td class="td" id="secondtd21" rowspan="2">인</td>
            </tr>
            <tr class="tr" id="secondtr5">
              <td class="td" id="secondtd22">주민등록번호</td>
              <td class="td" id="secondtd23" colspan="2">
                <input type="text" class="inputtext" id="inform7" />
              </td>
              <td class="td" id="secondtd24"><pre>전    화</pre></td>
              <td class="td" id="secondtd25">
                <input type="text" class="inputtext" id="inform8" />
              </td>
              <td class="td" id="secondtd26"><pre>성    명</pre></td>
              <td class="td" id="secondtd27">
                <input type="text" class="inputtext" id="inform9" />
              </td>
            </tr>
          </table>
        </div>
        </div>
        </div>
        <!--paper-->

        <div class="btns" data-html2canvas-ignore="true">
          <div id="complete" class="btn">서류 제출</div>
          <div id="cancel" class="btn">취소</div>
        </div>



   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
    <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>



    
   <script>
   
   
   
   $("#complete").click(function(){
      
      
      if($("#purpose1").val() == "" || $("purpose2").val() == "" || $("#area1").val() == "" 
         ||$("#money3").val() == "" || $("#money4").val() == "" ||$("#money5").val() == ""
         || $("#money7").val() == "" || $("#money9").val() == "" || $(".smalldate:eq(0)").val() == ""|| $(".smalldate:eq(1)").val() == ""
         || $(".smalldate:eq(2)").val() =="" || $(".smalldate:eq(3)").val() =="" || $(".smalldate:eq(4)").val() ==""
            || $(".smalldate:eq(5)").val() =="" || $(".smalldate:eq(6)").val() =="" || $(".smalldate:eq(7)").val() ==""
               || $(".smalldate:eq(8)").val() =="" || $(".smalldate:eq(9)").val() =="" || $(".smalldate:eq(10)").val() ==""
                  || $(".smalldate:eq(11)").val() =="" || $(".smalldate:eq(12)").val() =="" || $(".smalldate:eq(13)").val() ==""
                     || $(".smalldate:eq(14)").val() =="" || $(".smalldate:eq(15)").val() =="" || $("#inform1").val() =="" || $("#inform7").val() == ""    
            ){
      //모든 칸 입력 완료 x
      alert("필수 칸을 입력해주세요!");
      
   } else {
      //모든 칸 입력 완료
       html2canvas(document.body).then(function(canvas) {
            var imgData = canvas.toDataURL('image/png');
            var imgWidth = 210;
            var pageHeight = imgWidth * 1.414;
            var imgHeight = canvas.height * imgWidth / canvas.width;

            var doc = new jsPDF({
              'orientation': 'p',
              'unit': 'mm',
              'format': 'a4',
            });

            doc.addImage(imgData, 'PNG', 0, 0, imgWidth, imgHeight);
            doc.save('lease${mname}.pdf');
          });
        
      }
   }); 

      
      
      
      
      //취소 버튼 누를시 팝업 닫힘
      $("#cancel").click(function(){
         window.close();
      });
      
      
      
      
      //값 넣어주기
      $("#loc").val("${address}".replace(/#/gi, " "));
        $("#address2").val("${agaddress}".replace(/#/gi, " "));
        $("#inform3").val("${aname}");
        $("#inform2").val("${atel}".replace(/#/gi, "-"));
       
        $("#address3").val("${maddress}");
        $("#inform8").val("${mtel}");
        $("#inform9").val("${mname}");
      
        
        //++
        $(".smallyear").val("2020");
        $(".smalldate:eq(8)").val("08");
        $(".smalldate:eq(9)").val("28");
        $(".smalldate:eq(11)").val("08");
        $(".smalldate:eq(12)").val("28");
        
   
   
   </script>
</body>
</html>