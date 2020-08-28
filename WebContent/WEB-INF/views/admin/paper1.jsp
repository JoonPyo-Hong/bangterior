<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
 		*{
 		outline:none;
 		}
        #container:after{
            content:"";
            display:block;
            clear:both;
        }
       /* 서브메뉴 */
      #submenu{
            /* background-color:skyblue; */
            width:900px;
            height:150px;
            margin:0 auto;
            border-bottom:3px solid #e8e8e8;
            margin-bottom:40px;
        }
      
        #submenu #subtitle{
            color:#444;
            font-size:2.5em;
            display:block;
            font-weight: bold;
            text-align: center;
            margin-top:60px;
            margin-bottom: 50px;
        }
        #submenu input[type="text"]{
            /* margin-left:0px; */
            width: 300px;
            text-align: center;
            font-size:1.1em;
            cursor:pointer;
            border:0px;
            padding:3px;
        }
        #submenu a{
            font-size:16px;
            margin-left:100px;
        }
        #submenu a input:hover{
            text-decoration: underline;
        }
        #container #submenu .click{
            text-decoration: underline;
            font-weight: bold;
        }

        /* 서류폼 */

        #content{
            border:1px solid black;
            /* background-color:orange; */
            height:1600px;
            width:1100px;
            margin:20px auto;
        }
        #document{
            text-align:center;
            width:800px;
            margin:0 auto;
            font-size:1.5em;
            font-weight:bold;
        }
        .inputreg{
            border:0px;
            background-color:transparent;
            width:460px;
            font-size:1.8em;
        }
        #regist{
            /* border:1px solid black; */
            height:68px;
            width:1000px;
            margin:0 auto;
        }
        .regist{
            width:497.5px;
            height:70px;
            float:left;
            background-color:#AAB0B7;
            border:1px solid black;
            margin:0 auto;
        }
        .regist:after{
            content:"";
            display:block;
            clear:both;
        }
        /* tbl */
        .tbl{
            width:1000px;
            margin:0 auto;
            border-collapse:collapse;
        }
        .tbl td{
            border:1px solid black;
        }
        .tbl td:first-child{
            width:100px;
            text-align:center;
        }
       .tbl td:nth-child(2){
            /* background-color:red; */
             width:100px;
            text-align:center;
            }
       .tbl td:nth-child(3){
            /* background-color:yellow; */
             width:200px;
            }
       .tbl td:nth-child(4){
            /* background-color:green; */
             width:200px;
            }
       .tbl td:nth-child(5){
            /* background-color:blue; */
             width:85px;
              text-align: center;
            }
       .tbl td:nth-child(6){
            /* background-color:purple; */
             width:115px;
            }

        td input{
            width:80px;
            background-color:transparent;
            border:0px;
            font-size:2em;
        }
        .tbl .address{
            width:100%;
            /* background-color: white; */
        }
        .tbl .input1,.tbl .input2{
            width:200px;
        }

        /* tbl2 */
        .tbl2{
            width:1000px;
            margin:0 auto;
            border-collapse:collapse;
        }
        .tbl2 td{
            border:1px solid black;
        }
        .tbl2 td:first-child{
            width:100px;
            text-align:center;
        }
       .tbl2 td:nth-child(2){
            /* background-color:red; */
             width:100px;
            text-align:center;
            }
       .tbl2 td:nth-child(3){
            /* background-color:yellow; */
             width:200px;
             text-align:center;
            }
       .tbl2 td:nth-child(4){
            /* background-color:green; */
             width:100px;
             text-align:center;
            }
       .tbl2 td:nth-child(5){
            /* background-color:blue; */
             width:100px;
              text-align: center;
            }
       .tbl2 td:nth-child(6){
            /* background-color:purple; */
             width:200px;
             text-align:center;
            }

        td input{
            width:80px;
            background-color:transparent;
            border:0px;
            font-size:2em;
        }
        .tbl2 tr:nth-child(5){
            /* background-color:purple; */
             border-bottom: 3px solid black;
        }
        .input3{
            width:50px;
            font-size:.7em;
            border:0px;
            background-color: transparent;
        }

        /* tbl3 */
        .tbl3{
            width:1000px;
            margin:0 auto;
            border-collapse:collapse;
            border:1px solid black;
        }
        .tbl3 td{
            border:1px solid black;
        }
        .tbl3 td:first-child{
            width:100px;
            text-align:center;
        }
        /* tbl4 */
        .tbl4{
            width:1000px;
            margin:0 auto;
            border-collapse:collapse;
            border:1px solid black;
        }
        .tbl4 td{
            border:1px solid black;
        }


        .entrust{
            margin: 0 auto;
            width:1000px;
            background-color:#AAB0B7;
            border-top:2px solid black;
            border-bottom:2px solid black;
            text-align: center;
        }
    
    </style>
</head>
<body>
 <div id="container">
            <!-- 서브메뉴 -->
            <div id="submenu">
               
                <span id="subtitle">전입 신고서</span>
                <a href="/bangterior/member/paper2.do"><input readonly  type="text" value="세대 모두 이동"></a>
                <a href="/bangterior/member/paper1.do"><input readonly  type="text" value="내가 등록한 방"></a>
                </div> <!-- submenu -->
                <div id="content">
                    <div id="paper">
                <div>■ 주민등록법 시행령 [별지 제15호의 2서식]<span><개정 2017. 11. 28></span></div>
                <div id="document">[<span>&nbsp;&nbsp;&nbsp;</span>]전입  (세대 일부 이동, 편입, 합가, 위임용) [<span>&nbsp;&nbsp;&nbsp;</span>] 재등록 신고서</div>
                <div id="regist">
                    <div class="regist">
                        접수 번호<br>
                        <input type="text" class="inputreg" value="BTH033">
                    </div>
                    <div class="regist">
                        신고일<br>
                        <input type="text" class="inputreg" value="2020-08-28">
                    </div>
                </div>
                <table class="tbl">
                
                    <tr>
                        <td rowspan="3">전에<br>살던 곳</td>
                        <td>구&nbsp;&nbsp;&nbsp;&nbsp;분</td>
                        <td colspan="4">[<span>&nbsp;&nbsp;&nbsp;</span>]&nbsp;&nbsp;세대 모두 이동,
                        [<span>&nbsp;&nbsp;&nbsp;</span>]&nbsp;&nbsp;세대주 포함 일부 이동, [<span>&nbsp;&nbsp;&nbsp;</span>]&nbsp;&nbsp;세대주 미포함 일부 이동</td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                    </tr>
                    <tr>
                        <td style="display:none"></td>
                        <td>세대주</td>
                        <td>
                            성명<br>
                            <input type="text" class="input1">
                        </td>
                        <td>
                            주민등록번호
                            <input type="text" class="input2">
                        </td>
                        <td>
                            &nbsp;&nbsp;남은&nbsp;세대의 &nbsp;&nbsp; 세대주 성명<br>(연락처)
                        </td>
                        <td>
                            <input type="text" class="input3">
                        </td>
                    </tr>
                    <tr>
                        <!-- <td></td> -->
                        <td style="display:none"></td>
                        <td>
                            주&nbsp;&nbsp;&nbsp;&nbsp;소<br>
                            (행정상<br>
                            관리주소)
                        <td colspan="4">
                            <input type="input" class="address"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                    </tr>
                    <!-- 전에 살던곳 끝 -->
                    <tr>
                        <td rowspan="4">현재<br>사는 곳<br>(이사한 곳)</td>
                        <td>구&nbsp;&nbsp;&nbsp;&nbsp;분</td>
                        <td colspan="4">
                            [<span>&nbsp;&nbsp;&nbsp;</span>]&nbsp;&nbsp;세대 구성,
                        [<span>&nbsp;&nbsp;&nbsp;</span>]&nbsp;&nbsp;다른 세대로 편입,
                        [<span>&nbsp;&nbsp;&nbsp;</span>]&nbsp;&nbsp;세대 합가(두 세대주가 하나의 세대 구성)
                        </td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                    </tr>
                    <tr>
                        <td style="display:none"></td>
                        <td>세대주</td>
                        <td colspan="2">
                            성명<br>
                            <input type="text" class="input1">
                        </td>
                        <td colspan="2">
                            연락처<br>
                            <input type="text" class="input2">
                        </td>
                    </tr>
                    <tr>
                        <td style="display:none"></td>
                        <td>주소</td>
                        <td colspan="2">
                            성명<br>
                            <input type="text" class="input1">
                        </td>
                        <td colspan="2">
                            연락처<br>
                            <input type="text" class="input2">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align:left; vertical-align: top;">다가구주택 명칭</td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                        <td colspan="2">※구분 등기가 되어 있지 않은 다가구주택인 경우 작성<br>(예: 무궁화빌라, 1동 1층 2호)</td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                    </tr>
                </table>  <!-- tbl-->
               

                <div style="margin:0 100px">＊신고 대상자 (총&nbsp;&nbsp;&nbsp;명)</div>

                <table class="tbl2">
                    <tr>
                        <td>
                            전입자<br>
                            (재등록자)
                        </td>
                        <td>
                            세대주와의<br>
                            관&nbsp;&nbsp;&nbsp;계
                        </td>
                        <td>
                            성명
                        </td>
                        <td>
                            전입자<br>
                            (재등록자)
                        </td>
                        <td>
                            세대주와의<br>
                            관&nbsp;&nbsp;&nbsp;계
                        </td>
                        <td>
                            성명
                        </td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td>5</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                       
                    </tr>
                    <tr>                    
                        <td>2</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td>6</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                       
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td>7</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                       
                    </tr>
                    <tr>
                        <td>4</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td>8</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td rowspan="4">전입자,<br>전세대주<br>확인</td>
                        <td colspan="5">
                            ※ 전입자가 아닌 사람이 신고하는 경우에만 작성합니다.
                        </td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                    </tr>
                    <tr>
                        <td style="display:none"></td>
                        <td>전입자(대표자)</td>
                        <td colspan="4">성명<input type="text"><span style="vertical-align: bottom;">(서명 또는 인)</span>&nbsp;&nbsp;주민등록번호<input type="text"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                    </tr>
                    <tr>
                        <td style="display:none"></td>
                        <td colspan="5">
                            ※ 세대주가 변경되는  경우 또는 미성년자를 전입신고 하는 경우에만 작성합니다.
                        </td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                    </tr>
                    <tr>
                        <td style="display:none"></td>
                        <td>전(前) 세대주</td>
                            <td colspan="4">성명<input type="text"><span style="vertical-align: bottom;">(서명 또는 인)</span>
                        </td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                    </tr>
                    <tr>
                        <td>전입 사유<br>(※주된1가지)</td>
                        <td colspan="5" style="text-align: justify;">
                        [<span>&nbsp;&nbsp;&nbsp;</span>]직업(취업, 사업, 직장 이전 등)&nbsp;&nbsp;&nbsp;[<span>&nbsp;&nbsp;&nbsp;</span>]교육(진학, 학업, 자녀 교육 등)<br>
                        [<span>&nbsp;&nbsp;&nbsp;</span>]가족(가족과 함께 거주, 결혼, 분가 등))&nbsp;&nbsp;&nbsp;[<span>&nbsp;&nbsp;&nbsp;</span>]주거 환경(교통, 문화 · 편의 시설 등))<br>
                        [<span>&nbsp;&nbsp;&nbsp;</span>]주택(주택 구입, 계약 만료, 집세,재개발 등))&nbsp;&nbsp;&nbsp;[<span>&nbsp;&nbsp;&nbsp;</span>]자연 환경 (건강, 공해, 전원생활 등)<br>
                        [<span>&nbsp;&nbsp;&nbsp;</span>]그 밖의 사유(<input style="font-size:.7em; width:500px" type="text">)</td>
                        </td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                        <td style="display:none"></td>
                    </tr>
                </table> <!--tbl2-->
                <div style="margin:0 100px">「주민등록법」제6조제1항, 제16조제1항과 같은 법 시행령 제23조제1항 및 제32조제의2제1항에 따라
                ([<span>&nbsp;&nbsp;&nbsp;</span>]전입,[<span>&nbsp;&nbsp;&nbsp;</span>]재등록) 신고를 합니다. </div><br>
                <div style="width:1050px; text-align: right;"><input type="text" class="input3">년<input type="text" class="input3">월<input type="text" class="input3">일</div>
                <table class="tbl3">
                        <tr>
                            <td rowspan="2">신고인</td>
                            <td>
                                성명<br>
                                <input type="text" class="input1">
                            </td>
                            <td>
                                주민등록번호<br>
                                <input type="text" class="input1">
                            </td>
                        </tr>
                        <tr>
                            <td style="display:none"></td>
                            <td>
                                연락처<br>
                                <input type="text" class="input1">
                            </td>
                            <td>
                                세대주와의 관계<br>
                                <input type="text" class="input1">
                            </td>
                        </tr>
                </table>    <!-- tbl3-->

                <div style="margin:0 100px">※ 위임장은 위임하여 신고하는 경우에만 작성합니다.</div>
                <div class="entrust">위임장</div>
                <div style="margin:0 100px">「주민등록법」제11조제1항 단서에 따라 전입 신고를 위 신고인에게 위임합니다.</div><br>
                <div style="width:1050px; text-align: right;";><input type="text" class="input3">년<input type="text" class="input3">월<input type="text" class="input3">일</div>

                <table class="tbl4">
                    <tr>
                        <td>
                            위임한 사람<br>
                            (현재 사는 곳 세대 주)
                        </td>
                        <td>
                            성명<br>
                            <input type="text" style="font-size:2em;width:500px">(성명 또는 인)
                        </td>
                        <td>
                            주민등록번호<br>
                            <input type="text" style="font-size:2em;width:400px">
                        </td>
                    </tr>
                </table>    <!--tbl4-->

                <div style="margin:30px 100px; border-bottom:3px solid black;">읍·면·동장 및 출장소장(귀하)</div>
                </div> <!-- paper-->
            </div>  <!-- content -->
    </div> <!-- container -->
        <script>
        $("input[type=text]").attr("autocomplete","none");
        </script>
</body>
</html>