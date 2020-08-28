<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
        margin-bottom: 40px;
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
        margin-left: 500px;
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
        margin-right: 320px;
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
        width: 755px;
      }

      #money4 {
        width: 100px;
      }

      #money3 {
        width: 642px;
      }

      #money9 {
        width: 640px;
      }

      #money5{
          width: 530px;
      }

      #money7{
          width: 530px;
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

</style>
</head>
<body>
	

        <!-- container -->
        <div id="container">
			<div>
			 <div id="submenu">
          <span id="subtitle">임대차 계약서</span>
        </div>
        <!-- submenu -->
        <div class="paper">
          <table id="tbl1" class="tbl">
            <tr class="tr" id="tr1">
              <td class="td" id="td1" colspan="5">
                <p id="title">부동산임대차계약서</p>
                <input
                  type="radio"
                  class="rb"
                  name="rb"
                  id="yearmoney"
                />전세<input
                  type="radio"
                  name="rb"
                  id="monthmoney"
                  class="rb"
                />월세
              </td>
            </tr>
            <tr class="tr" id="tr3">
              <td class="td" id="td3" colspan="5">
                <span>1. 부동산의 표시</span> 임대인과 임차인 쌍방은 아래 표시
                부동산에 관하여 다음 계약내용과 같이 임대차계약을 체결한다.
              </td>
            </tr>
            <tr class="tr" id="tr4">
              <td class="td" id="td4"><pre>소  재  지</pre></td>
              <td class="td" id="td500" colspan="4">
                <input
                  type="text"
                  id="loc"
                  class="inputtext"
                  placeholder="                                                                                                                       서울특별시 oo구 oo동 oooooo 아파트 (도로명 주소)서울 특별시oo구 oooo"
                />
              </td>
            </tr>
            <tr class="tr" id="tr5">
              <td class="td" id="td4"><pre>토     지</pre></td>
              <td class="td" id="td5"><pre>지   목</pre></td>
              <td class="td" id="td6">
                <input
                  type="text"
                  id="purpose2"
                  class="inputtext purposetext"
                />
              </td>
              <td class="td" id="td7"><pre>면   적</pre></td>
              <td class="td" id="td8">
                <input
                  type="text"
                  id="area1"
                  class="areatext inputtext"
                  value="                                                                                            "
                />㎡
              </td>
            </tr>
            <tr class="tr" id="tr6">
              <td class="td" id="td9"><pre>건     물</pre></td>
              <td class="td" id="td10"><pre>구조ㆍ용도</pre></td>
              <td class="td" id="td11">
                <input
                  type="text"
                  id="purpose1"
                  class="inputtext purposetext"
                />
              </td>
              <td class="td" id="td12"><pre>면    적</pre></td>
              <td class="td" id="td13">
                <input
                  type="text"
                  id="area2"
                  class="areatext inputtext"
                  value="                                                                                            "
                />㎡
              </td>
            </tr>
            <tr class="tr" id="tr7">
              <td class="td" id="td14">임대할부분</td>
              <td class="td" id="td15" colspan="2">
                <input type="text" id="parttext" class="inputtext" />
              </td>
              <td class="td" id="td16"><pre>면    적</pre></td>
              <td class="td" id="td17">
                <input
                  type="text"
                  id="area3"
                  class="areatext inputtext"
                  value="                                                                                            "
                />㎡
              </td>
            </tr>
            <tr class="tr" id="tr8">
              <td class="td" id="td18" colspan="5">
                <span>2. 계약내용</span>
                <pre>
제 1 조 (목적) 위 부동산의 임대차에 대하여 합의에 따라 임차인은 임대인에게 임차보증금 및 차임을 아래와 같이 지급하기로 한다.</pre
                >
              </td>
            </tr>
            <tr class="tr" id="tr9">
              <td class="td" id="td19"><pre>보  증  금</pre></td>
              <td class="td" id="td20" colspan="4">
                금
                <input type="text" class="inputmoney" id="money1" value="" />
                원	정 (￦
                <input type="text" class="inputmoney" id="money2" />
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
                제 2 조 <span>(존속기간)</span> 임대인은 위 부동산을 임대차
                목적대로 사용․수익할 수 있는 상태로
                <input type="text" class="smalldate smallyear" />년
                <input type="text" class="smalldate" />월
                <input type="text" class="smalldate" />일 까지 임차인에게
                인도하며, 임대차 기간은 인도일로부터
                <input type="text" class="smalldate smallyear" />년
                <input type="text" class="smalldate" />월
                <input type="text" class="smalldate" />일 까지로 한다.
              </td>
            </tr>
            <tr class="tr" id="tr15">
              <td class="td" id="td30" colspan="5">
                제 3 조 <span>(용도변경 및 전대 등)</span> 임차인은 임대인의
                동의없이 위 부동산의 용도나 구조를 변경하거나 전대 · 임차권 양도
                또는 담보제공을 하지 못하며 임대차 목적 이외의 용도로 사용할 수
                없다.
              </td>
            </tr>
            <tr class="tr" id="tr16">
              <td class="td" id="td31" colspan="5">
                제 4 조 <span>(계약의 해지)</span> 임차인의 차임연체액이 2기의
                차임액에 달하거나 제3조를 위반하였을 때 임대인은 즉시 본 계약을
                해지 할 수 있다.
              </td>
            </tr>
            <tr class="tr" id="tr17">
              <td class="td" id="td32" colspan="5">
                제 5 조 <span>(계약의 종료)</span> 임대차계약이 종료된 경우에
                임차인은 위 부동산을 원상으로 회복하여 임대인에게 반환한다.
                이러한 경우 임대인은 보증금을 임차인에게 반환하고, 연체 임대료
                또는 손해배상금이 있을 때는 이들을 제하고 그 잔액을 반환한다.
              </td>
            </tr>
            <tr class="tr" id="tr18">
              <td class="td" id="td33" colspan="5">
                제 6 조 <span>(계약의 해제)</span> 임차인이 임대인에게
                중도금(중도금이 없을 때는 잔금)을 지불하기 전까지, 임대인은
                계약금의 배액을 상환하고, 임차인은 계약금을 포기하고 본 계약을
                해제할 수 있다.
              </td>
            </tr>
            <tr class="tr" id="tr19">
              <td class="td" id="td33" colspan="5">
                제 7 조 <span>(채무불이행과 손해배상)</span> 임대인 또는
                임차인이 본 계약상의 내용에 대하여 불이행이 있을 경우 그
                상대방은 불이행한 자에 대하여 서면으로 최고하고 계약을 해제 할
                수 있다. 그리고 계약 당사자는 계약해제에 따른 손해배상을 각각
                상대방에 대하여 청구할 수 있다.
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
                <pre>본 계약을 증명하기 위하여 계약 당사자가 이의 없음을 확인하고 각각 서명․날인 후 임대인, 임차인은 매장마다 간인하여야 하며, 각각 1통씩 보관한다.
                                                                                    							                           <input type="text" class="smalldate smallyear" >년 <input type="text" class="smalldate" >월 <input type="text" class="smalldate" >일</pre>
              </td>
            </tr>
          </table>

          <table id="tbl3" class="tbl">
            <tr class="tr" id="secondtr1">
              <td class="td" id="secondtd1" rowspan="3">임대인</td>
              <td class="td" id="secondtd2"><pre>주    소</pre></td>
              <td class="td" id="secondtd3" colspan="6">
                <input type="text" class="inputtext" id="address2" />
              </td>
              <td class="td" id="secondtd4" rowspan="3">인</td>
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
            <tr class="tr" id="secondtr3">
              <td class="td" id="secondtd11"><pre>대 리 인</pre></td>
              <td class="td" id="secondtd12"><pre>주    소</pre></td>
              <td class="td" id="secondtd13">
                <input type="text" class="inputtext" id="inform4" />
              </td>
              <td class="td" id="secondtd14">주민등록번호</td>
              <td class="td" id="secondtd15">
                <input type="text" class="inputtext" id="inform5" />
              </td>
              <td class="td" id="secondtd16"><pre>성    명</pre></td>
              <td class="td" id="secondtd17">
                <input type="text" class="inputtext" id="inform6" />
              </td>
            </tr>
            <tr class="tr" id="secondtr4">
              <td class="td" id="secondtd18" rowspan="3">임차인</td>
              <td class="td" id="secondtd19"><pre>주    소</pre></td>
              <td class="td" id="secondtd20" colspan="6">
                <input type="text" class="inputtext" id="address3" />
              </td>
              <td class="td" id="secondtd21" rowspan="3">인</td>
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
            <tr class="tr" id="secondtr6">
              <td class="td" id="secondtd28"><pre>대 리 인</pre></td>
              <td class="td" id="secondtd29"><pre>주    소</pre></td>
              <td class="td" id="secondtd30">
                <input type="text" class="inputtext" id="inform10" />
              </td>
              <td class="td" id="secondtd31">주민등록번호</td>
              <td class="td" id="secondtd32">
                <input type="text" class="inputtext" id="inform11" />
              </td>
              <td class="td" id="secondtd33"><pre>성    명</pre></td>
              <td class="td" id="secondtd34">
                <input type="text" class="inputtext" id="inform12" />
              </td>
            </tr>
          </table>
        </div>
        <!--paper-->
        </div>
        </div>

        <div class="btns" data-html2canvas-ignore="true" >
          <div id="complete" class="btn">서류 제출</div>
          <div id="cancel" class="btn">취소</div>
        </div>
  



	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
    <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>



        

	<script>
	
	  $("#complete").click(function(){
		  
		  if($("#purpose1").val() == "" || $("purpose2").val() == "" || $("#area1").val() == "" || $("#area3").val() == ""
				|| $("#parttext").val() == "" ||$("#money3").val() == "" || $("#money4").val() == "" ||$("#money5").val() == ""
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
         doc.save('rent${mname}.pdf');
       });
		}
	
}); 

	
	
	
	
	//취소 버튼 누를시 팝업 닫힘
	$("#cancel").click(function(){
		window.close();
	});
	
	
	
	
	//값 넣어주기
	
	//전세 월세 체크해주기
	if("${docseq}" == "2"){
		//월세
		$("#monthmoney").prop("checked", true);
	} else if ("${docseq}" == "3"){
		//전세
		$("#yearmoney").prop("checked", true);
	}
	
	$("#area2").val("${area}");
	$("#money1").val("${cost}");
	$("#money2").val("${cost}");
	
	$("#loc").val("${address}".replace(/#/gi, " "));
 	$("#address2").val("${agaddress}".replace(/#/gi, " "));
 	$("#inform3").val("${aname}");
 	$("#inform2").val("${atel}".replace(/#/gi, "-"));
	
 	$("#address3").val("${maddress}");
 	$("#inform8").val("${mtel}");
 	$("#inform9").val("${mname}");
	
	
	</script>
</body>
</html>