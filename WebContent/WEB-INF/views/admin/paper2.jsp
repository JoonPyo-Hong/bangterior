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
            height:1900px;
            width:1100px;
            margin:20px auto;
        }
        #document{
            text-align:center;
            width:800px;
            margin:15px auto;
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
            width:1005px;
            margin:0 auto;
        }
        .regist{
            width:498px;
            height:70px;
            float:left;
            background-color:#ddd;
            border:0.3px solid #333;
            border-bottom:2px solid black;
            margin:0 auto;
        }
        .regist:after{
            content:"";
            display:block;
            clear:both;
        }
        #reg_tbl{
            /* border:1px solid black; */
            width:998px;
            margin:0 auto;
            border-collapse: collapse;
            border:0px;
        }
        #reg_tbl th{
            border:1px solid #ccc;
            border-left: 0px; 
        }
        #reg_tbl td{
            border:1px solid #ccc;
            width:240px;
            height:60px;
            padding: 10px;
        }
        #reg_tbl td:last-child{
            border-right:0px;
        }
        #reg_tbl td:first-child{
            border-left:0px;
        }
        input[type="text"]{
            border:0px;
            border-bottom:1px solid #ddd;
            height:30px;
            width:250px;
            margin:10px;
        }
        .tbl_subtitle{
            width:1000px;
            display:inline-block;
            font-weight: bold;
            text-align:center;
            font-size:1.4em;
            background-color:#ddd;
        }
    
    </style>
</head>
<body>
            <!-- 서브메뉴 -->
            <div id="submenu">
               
                <span id="subtitle">전입 신고서</span>
                <a href="/bangterior/member/paper2.do"><input readonly  type="text" value="세대 모두 이동"></a>
                <a href="/bangterior/member/paper1.do"><input readonly  type="text" value="내가 등록한 방"></a>
                </div> <!-- submenu -->
                <div id="content">
                    <div id="paper">
                <div>■ 주민등록법 시행령 [별지 제15호서식]<span>개정 2016. 12. 30</span></div>
                <div id="document">전입 신고서 (세대 모두 이동)</div>
                <div>※ 이 신고서는 세대가 모두 이동하며, 세대주 변경이없는 경우에만 작성합니다.</div>
                <div id="regist">
                    <div class="regist">
                        접수 번호<br>
                        <input type="text" class="inputreg">
                    </div>
                    <div class="regist">
                        신고일<br>
                        <input type="text" class="inputreg">
                    </div>
                </div>  <!--regist-->
                <table id="reg_tbl">
                    <tr>
                        <th>전입자<br>(신고인)</th>
                        <td colspan="2">성명<input type="text" value="${dto.name }"></td>
                        <td colspan="2">주민등록번호<input type="text" value="${dto.ssn }"></td>
                        <td colspan="2">연락처<input type="text" value="${dto.tel }"></td>
                    </tr>
                    <tr>
                        <th>전에<br>살던 곳</th>
                        <td colspan="2">(시·도)<input type="text"></td>
                        <td colspan="2">(시·군·구)<input type="text"></td>
                        <td colspan="2">※시·도,시·군·구까지만 작성<br>(상세주소는 작성하지 않아도 됩니다.)</td>
                    </tr>
                    <tr>
                        <th rowspan="3">현재<br>사는 곳<br>(이사한 곳)</th>
                        <td colspan="4">세대주 성명(※ 세대주가 신고할 때에는 작성하지 않습니다.)<input type="text"style="width:300px;"></td>
                        <td colspan="2">연락처<input type="text"></td>
                    </tr>
                    <tr>
                        <td colspan="6">주소<input type="text" style="width:900px;"></td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            다가구주택 명칭
                            <input type="text" class="dong">
                            ※ 구분 동기가 되어 있지 않은 다가구주택인 경우 작성<br>
                            (예 : 무궁화 빌라, 1동 1층 2호)
                        </td>
                    </tr>
                    <tr>
                        <th>전입 사유<br>(※주된 1가지)</th>
                        <td colspan="6">
                            <input type="checkbox" class="cb"> "직업(취업,사업,직장 이전 등)"
                            <input type="checkbox" class="cb"> "교육(진학, 학업, 자녀 교육 등)"<br>
                            <input type="checkbox" class="cb"> "주택(주택 구입, 계약 만료, 집세, 재개발 등)"
                            <input type="checkbox" class="cb"> "가족(가족과 함께 거주,결혼, 분가 등)"<br>
                            <input type="checkbox" class="cb"> "주거 환경(교통, 문화 · 편의 시설 등)"
                            <input type="checkbox" class="cb"> "자연 환경(건강, 공해, 전원 생활 등)"<br>
                            <input type="checkbox" class="cb"> "그 밖의 사유"(<input type="text" class="reason">)
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <span class="tbl_title">읍 · 면 · 동장 및 출장소장 귀하</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <span class="tbl_subtitle">유의 사항</span>
                        </td>
                    </tr>
                    <tr>
                       <td colspan="7">
                        1.전입신고는 신거주지에 전입한 날부터 14일 이내에 현 거주지에서 해야 하며, 전입신고 내용의 사실 여부는 통장·이장이 사후<br>
                        에 확인하며, 거짓으로 신고한 것이 확인되면 처벌을 받습니다.<br>
                        - 정당한 사유 없이 14일 이내에 신고를 하지 않으면 5만 원 이하의 과태료를 물게 되며, 거짓으로 신고한 경우에는 3년<br>
                        이하의 징역형 또는 3천만원 이하의 벌금형을 받게 됩니다.(「주민등록법」 제 37조 및 제 40조)<br>
                        2.거짓 전입 및 무단 전출을 하면 신고한 최종 주소지에 '거주불명 등록' 될 수 있고, '거주불명 등록' 후 1년 내에 실제 거주지에<br>
                        재등록하지 않으면 최종 주소지 관할 읍·면 사무소 또는 동 주민센터의 주소를 행정상 관리주소로 하여 거주불명 등록을<br>
                        할 수 있습니다.<br>
                        3.전입 사유 칸은 「통계법」에 따라 인구 이동 통계 작성을 위한 자료로 활용됩니다. 같은 법 제 32조에 따라 성실하게 응답해야<br>
                        할 의무가 있으며, 같은 법 제33조에 따라 비밀이 보호되고, 전입 사유 칸의 내용은 통계 작성의 목적으로만 사용됩니다.
                    
                       </td> 
                    </tr>
                    <tr>
                        <td colspan="7">
                            <span class="tbl_subtitle">작성방법</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <span>※ 우편물 전입지 전송 서비스를 신청하는 사람만 작성합니다.</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <span>우편물 전입지 전송(전입신고 3일 후부터 3개월) 서비스 신청서 및 개인 정보 제공 동의서</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            이 서비스는 전에 살던 주소지로 배달되던 우편물을 전입신고한 주소로 배달하는 서비스로서 세대주 및 세대원의 개인 정보가<br>
                            우체국으로 제공되므로 신청인의 동의가 필요합니다.(전입지 전송 서비스 신청 후 새로운 곳으로 다시 전입신고한 경우 기존<br>
                            에 신청한 건은 자동으로 삭제되며, 직전 주소지에서 새로 전입신고한 주소지로만 서비스가 제공됩니다.)
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            ■ 제공 항목 : 동의하는 세대주 및 세대원 성명 작성 : <input type="text" class="small_text">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            ○ 우편물 전송을 받으려 하는 세대주 및 세대원 성명 작성: <input type="text" class="small_text"><br>
                            ○ 신청인 전화번호☏: <input type="text" class="small_text"><br>
                            <input type="radio" class="rb">위의 사항을 확인하였고 정보 제공에 동의합니다. <br>
                            <span class="sign" style="width:700px;text-align:right;display:inline-block">신청인</span><input type="text">
                        </td>
                    </tr>

                </table>
            </div>  <!-- content -->
    </div> <!-- container -->
       <script>
        $("input[type=text]").attr("autocomplete","off");
        </script>
</body>
</html>