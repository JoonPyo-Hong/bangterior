<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/bangterior/css/main_member.css">
<link rel="stylesheet" href="/bangterior/css/company_addproduct.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<!-- 전체 -->
	<div id="wrap">

		<!-- header -->
		<%@include file="/WEB-INF/views/inc/member/header.jsp"%>



		<!-- container -->
		<div id="container">
			<p>상품 추가</p>
			<!-- 인테리어 이미지/설명 -->
			<form method="post" action="/bangterior/company/addproductok.do"
				enctype="multipart/form-data" id="addproduct">
				<div id="interior_thumb">
					<div>
						<label for="thumb_file"><span>대표 이미지 등록</span></label> <input
							type="file" id="thumb_file" name="thumb_img" accept="image/*">
					</div>
					<div>
						<input type=text id="thumb_title" name="thumb_title"
							placeholder="게시글 제목을 입력해주세요">
					</div>
					<div id="interior_info">
						<table>
							<tr>
								<td><img src="../images/home.png"><br>금액</td>
								<td><img src="../images/home.png"><br>범위</td>
								<td><img src="../images/home.png"><br>테마</td>
								<td><img src="../images/home.png"><br>색상</td>
							</tr>
							<tr>
								<td><input type=text placeholder="금액" id="pcost"
									name="pcost"></td>
								<td>
									<div id="ser_list" class="addlist">범위 선택하기 ▼</div>
								</td>
								<td>
									<div id="theme_list" class="addlist">테마 선택하기 ▼</div>

								</td>
								<td>
									<div id="color_list" class="addlist">색상 선택하기 ▼</div>
								</td>
							</tr>
						</table>
						<div id="ser_list_check" class="list_check">
							<c:forEach items="${pslist}" var="pslist">
								<input type="radio" value="${pslist.serseq}" name="psra"
									id="psra${pslist.serseq}">
								<label for="psra${pslist.serseq}"> ${pslist.sername}<br></label>
							</c:forEach>
						</div>
						<div id="theme_list_check" class="list_check">
							<c:forEach items="${tlist}" var="tlist">
								<input type="checkbox" value="${tlist.seq}" name="tch"
									id="tch${tlist.seq}">
								<label for="tch${tlist.seq}"> ${tlist.name}<br></label>
							</c:forEach>
						</div>
						<div id="color_list_check" class="list_check">
							<c:forEach items="${clist}" var="clist">
								<input type="checkbox" value="${clist.seq}" name="cch"
									id="cch${clist.seq}">
								<label for="cch${clist.seq}"> ${clist.color}<br></label>
							</c:forEach>
						</div>
					</div>
				</div>

				<!-- 인테리어 견적/업체 -->
				<div id="interior_esti">
					<div id="like_apply_esti" class="apply_esti">내가 찜한방으로 견적 상담하기
					</div>
					<div id="nor_apply_esti" class="apply_esti">일반 견적 상담하기</div>
					<div id="interior_company"></div>
				</div>
				<!-- 인테리어 상세이미지 -->
				<div id="interior_details">
					<p>상품 정보</p>
					<label for="detail_file"><span>상품 상세 이미지 등록</span></label> <input
						type="file" id="detail_file" name="detail_img" accept="image/*">
					<div id="detail_img"></div>


				</div>
			</form>
			<!-- 수정때 있어야해용. -->
			<%-- <c:if test=${cseq==cdto.seq}>
			<div id="revise" class="item_button">수정</div>
			<div id="delete" class="item_button">삭제</div>
			</c:if> --%>
			<div id="add" class="item_button"
				onclick="document.forms['addproduct'].submit();">등록</div>
		</div>

		<!-- footer -->
		<%@include file="/WEB-INF/views/inc/member/footer.jsp"%>
	</div>
	<script>
		/* 메인이미지 미리보기 */
		function upload(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {

					$("#interior_thumb>div:nth-child(1) label").css(
							"background-image", "url(" + reader.result + ")");
				}

				reader.readAsDataURL(input.files[0]);
			}
		}//readURL

		function upload2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {

					$("#interior_details label").css("background-image",
							"url(" + reader.result + ")");
				}

				reader.readAsDataURL(input.files[0]);
			}
		}//readURL
		$("#thumb_file").change(function() {
			upload(this);
			$("#interior_thumb>div:nth-child(1) label").css("opacity", "1");
			$("#interior_thumb>div:nth-child(1) label>span").remove();
		});

		$("#detail_file").change(function() {
			upload2(this);
			$("#interior_details label").css("opacity", "1");
			$("#interior_details label").css("background-repeat", "no-repeat")
			$("#interior_details label").css("background-size", "cover");
			$("#interior_details").css("height",upload2)
			$("#interior_details label>span").remove();
		});

		/* 테마, 색상 선택  */

		var psflag = 0;
		var tflag = 0;
		var cflag = 0;

		$("#ser_list").mouseover(function() {
			if (psflag == 0) {
				$("#interior_thumb").css("overflow", "visible");
				$("#ser_list_check").css("display", "block");
				psflag++;
			} else {

				if (tflag == 0 && cflag == 0) {
					$("#interior_thumb").css("overflow", "hidden");
					$("#ser_list_check").css("display", "none");
					psflag--;
				} else {
					$("#ser_list_check").css("display", "none");
					psflag--;
				}
			}
		});
		$("#theme_list").mouseover(function() {
			if (tflag == 0) {
				$("#interior_thumb").css("overflow", "visible");
				$("#theme_list_check").css("display", "block");
				tflag++;
			} else {

				if (psflag == 0 && cflag == 0) {
					$("#interior_thumb").css("overflow", "hidden");
					$("#theme_list_check").css("display", "none");
					tflag--;
				} else {
					$("#theme_list_check").css("display", "none");
					tflag--;
				}
			}
		});

		$("#color_list").mouseover(function() {
			if (cflag == 0) {
				$("#interior_thumb").css("overflow", "visible");
				$("#color_list_check").css("display", "block");
				cflag++;
			} else {
				if (psflag == 0 && tflag == 0) {
					$("#interior_thumb").css("overflow", "hidden");
					$("#color_list_check").css("display", "none");
					cflag--;
				} else {
					$("#color_list_check").css("display", "none");
					cflag--;
				}
			}
		});

		/* 입력데이터 유효성 */
		/* var formVaildflag = 0;
		
		function formVaild() {
			if($("#thumb_file").val() == null) {
				formVaildflag = 0;
				alert("대표 이미지를 넣어 주세요.");
			} else if($("#thumb_title").val() == null) {
				formVaildflag = 0;
				alert("게시글 제목을 입력해 주세요.");
			} else if($("#ser_list").val() == null) {
				formVaildflag = 0;
				alert("범위를 선택해 주세요.");
			} else if($("#theme_list").val() == null) {
				formVaildflag = 0;
				alert("테마를 선택해 주세요.");
			} else if($("#color_list").val() == null) {
				formVaildflag = 0;
				alert("적용 가능한 색상을 선택해 주세요.");
			} else if($("#_list").val() == null) {
				formVaildflag = 0;
				alert("범위를 선택해 주세요.");
			} else if($("#deatil_file").val() == null) {
					formVaildflag = 0;
					alert("상세 이미지를 넣어 주세요.");
			}  
			
		} */
	</script>
</body>
</html>