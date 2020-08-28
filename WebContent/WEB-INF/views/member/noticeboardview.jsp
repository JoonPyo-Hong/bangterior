<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
    <style>
        /* 해당 페이지 스타일 작업 영역 */
        #content {
            width: 1400px;
            height:5000px;
            margin: 0 auto;
            /* background-color: #ededed; */
        }

        /* 서브메뉴 타이틀 */
        .title {
            font-size: 36px;
            text-align: center;
            padding: 30px 0;
        }


        /* 게시판 상세 글 조회 시 테이블 */

        .tbl .title {
            font-size: 20px;
            font-weight: bold;
            margin-left: 20px;
        }

        .tbl .writer {
            font-size: 14px;
            margin-left: 20px;
        }
        
        .tbl .file {
            cursor: pointer;
            font-size: 14px;
            margin-left: 20px;
            color:#7674E2;
        }

        .tbl .file:hover{
            text-decoration: underline;
        }

        .tbl .hit{
            font-weight: bold;
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


        .tbl tbody tr:nth-child(1){
            height:50px;
            font-size: 16px;
            color:#444;
            background-color: #eee;
            text-align: left;
            border-top:2px solid rgb(77, 77, 77);
            /* border-bottom:1px solid rgb(77, 77, 77); */
        }




        .tbl tbody tr:nth-child(1) td{
            padding: 30px 0;
        }

        .tbl tbody tr:nth-child(1) td:nth-child(2){
            text-align: center;
        }

        .tbl tbody tr:nth-child(2) td{
            text-align: left;
            padding-top: 50px;
            padding-bottom: 100px;
        }


        .tbl tbody tr:nth-child(2) td p {
            margin-left: 20px;
            color:#444;
        }


        .tbl tbody tr:last-child{
            border-bottom:2px solid rgb(77, 77, 77);
        }

        .tbl tbody tr td:nth-child(1){width: auto;}
        .tbl tbody tr td:nth-child(2){width: 100px;}


        
        /* 목록 조회 버튼 추가 */

        #write_btn {
            text-align: center;
            width: 100px;
            height: 30px;
            border-radius: 1px;
            background-color: #444;
            line-height: 30px;
            color:white;
            font-size: 14px;
            border: none;
            cursor: pointer;
            display: inline-block;
            float: right;
            margin:0;
            margin-right: 100px;
            margin-top: -10px;
        }


        /* 이전글 다음글 목록 테이블  */

        .tbl_list {
            width: 1200px;
            /* height: 400px; */
            margin: 60px auto;
            border-top:2px solid rgb(77, 77, 77);
            border-bottom:2px solid rgb(77, 77, 77);
            border-collapse: collapse;
            text-align: center;
        }

        .tbl_list tr, .tbl td{
            border-bottom: 1px solid #e6e6e6;
            height: 60px;
        }

        .tbl_list tr td:nth-child(1) {
            width: 200px;
            border-right: 1px solid #e6e6e6;
        }

        .tbl_list tr td:nth-child(2) {
            text-align: left;
            text-indent: 50px;
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

            <div id="content">
            <h1 class="title">공지사항</h1>

            <table class="tbl">
                <tbody>
                    <tr>
                        <td><span class="title">${dto.subject}</span><br><span class="writer">관리자 | ${dto.regdate}</span><br><span class="file">${dto.filename}</span></td>
                        <td><span class="hit">조회수</span><br>${dto.readcnt}</td>
                    </tr>
                    <tr>
                        <td colspan="2"><p>${dto.content}</p></td>
                    </tr>
                </tbody>
            </table>

            <!-- 목록 조회 버튼 추가 -->
            <div id="write_btn">
                <div class="write_btn" onclick="location.href='/bangterior/member/noticeboardlist.do?searchfield=${searchfield}&search=${search}';">목록</div>
            </div>
            <div style="clear: both;"></div>
            
            <!-- 이전글 다음글 목록 테이블 -->
            <table class="tbl_list">
                <tbody>
                    <tr>
                        <td>이전글</td>
                        <td>[ 공지 ] 부동산 중개사무소 약관 변경 동의 안내</td>
                    </tr>
                    <tr>
                        <td>다음글</td>
                        <td>[ 공지 ] 위치기반 서비스 이용 동의 안내</td>
                    </tr>
                </tbody>
            </table>

        </div>
        </div>



        <!-- footer -->
 		<%@include file="/WEB-INF/views/inc/member/footer.jsp" %>
        
        </div>

	<script>
	</script>
</body>
</html>