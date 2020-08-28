<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="/bangterior/css/main_admin.css">


            <!-- nav -->
        <div id="nav">

            <div class="logo">
                <p>Bangterior Admin System</p>
            </div>

            <div class="admin_info">
                <p>관리자님<br>환영합니다.</p>
            </div>

            <div class="menu">

                <ul>
                <li>
                    <div class="mainmenu">| 매물 관리 및 등록</a></div>
                    <ul class="sub">
                    <li><a href="/bangterior/regwaitboard.do">· 매물 승인 관리</a></li>
                    <li><a href="/bangterior/reghouseboard.do">· 등록 매물 관리</a></li>
                    <li><a href="/bangterior/fakenoticelist.do">· 신고 매물 관리</a></li>
                    <li><a href="/bangterior/admin/agencyreg.do">· 중개사 및 등본 승인</a></li>
                    </ul>
                </li>
                <li>
                    <div class="mainmenu">| 인테리어 관리</div>
                    <ul class="sub">
                    <li><a href="#">· 인테리어 게시글 관리</a></li>
                    
                    </ul>
                
                </li>
                <li>
                    <div class="mainmenu">| 고객서비스 관리</div>
                    <ul class="sub">
                    <li><a href="#">· 공지사항</a></li>
                    <li><a href="#">· 문의사항</a></li>
                    <li><a href="#">· 자주하는질문</a></li>
                    <li><a href="#">· 불편사항</a></li> 
                    </ul>
                </li>
                <li>
                    <div class="mainmenu">| 업체 및 회원 관리</div>
                    <ul class="sub">
                    <li><a href="#">· 등록 업체 관리</a></li>
                    <li><a href="#">· 회원 관리</a></li>
                    </ul>
                </li> 
                <li>
                    <div class="mainmenu">| 맞춤 추천 서비스 관리</div>
                    <ul class="sub">
                    <li><a href="#">· 매물추천 테마 등록</a></li>
                    <li><a href="#">· 금융 추천 서비스</a></li>
                    
                    </ul>
                
                </li>
                </ul>
            </div>

        </div>
        <script>
     /* 메뉴 효과 스크립트 */
    $(function(){
          $(".sub").hide();
            $(".mainmenu").click(function(){
             var bbb = $(this).next().css("display");
             if(bbb=="none"){
               $(".sub").slideUp();}
             
             $(this).next().slideDown();
            
            });
      });
      </script>