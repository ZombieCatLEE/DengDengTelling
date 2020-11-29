<!-- 2020.02.11. PM6:10 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include-head.jspf"%>
<script type="text/javascript" src="resources/js/common.js"></script>

<%
	String id = request.getParameter("PSMEM_ID");
%>

<script type="text/javascript">
	var gfv_count = '${fn:length(certi) + 1}';
	/* function get() {
		document.getElementById("CERTI_NAME").value 
			= opener.document.getElementById("CERTI_NAME").value;
		document.getElementById("CERTI_ORG").value 
			= opener.document.getElementById("CERTI_ORG").value;
		document.getElementById("CERTI_DATE").value 
			= opener.document.getElementById("CERTI_DATE").value;
	} */

	$(document).ready(function() {

		$("#cancel").on("click", function(e) {
			e.preventDefault();
			fn_goHome();
		});

		$("#modify").on("click", function(e) {
			e.preventDefault();
			fn_modifySubmit();
		});

		$("#addFile").on("click", function(e) { //파일 추가 버튼
			e.preventDefault();
			fn_addFile();
		});

		$("a[name^='delete']").on("click", function(e) { //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	});

	function fn_goHome() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/login' />");
		comSubmit.submit();
	}
	
	function fn_modifySubmit() {

		var comSubmit = new ComSubmit("modifyCerti");
		comSubmit.setUrl("<c:url value='/modifyCerti' />");
		comSubmit.submit();
	}

	function Close_Event() {
		opener.parent.location.href = "/MyInfodetail";

		window.opener = self;
		self.close();
	}
	function fn_addFile() {
		var str = "<div style='border: 0.5px; border-style: dashed; border-radius: 2em; padding: 2px; margin-bottom: 1em;'> <p>"
				+ "<div style='text-align: center;'>"
	            + "<font style='margin-right: 5px;'><b>자격증명</b></font>"
	            + "<input type='text' style='width: 10em; margin-left: 1em; margin-right: 3em;' id='CERTI_NAME' name='CERTI_NAME'/>"
				+ "<font style='margin-right: 5px;'><b>발급 기관</b></font>"
				+ "<input type='text' style='width: 10em; margin-left: 1em; margin-right: 3em;' id='CERTI_ORG' name='CERTI_ORG' />"
				+ "<font style='margin-right: 5px;'><b>취득 일자</b></font>"
				+ "<input type='text' style='width: 10em; margin-left: 1em;' id='CERTI_DATE' name='CERTI_DATE' />"
				+ "</div> </p> <br/>"
				+ "<input type='file' id='file_" 
				+ (gfv_count)
				+ "' class='file' style='width: 300px; margin-left: 15em; margin-right: 5em;' name='file_"
				+ (gfv_count)
				+ "' />"
				+ "<a href='#this' style='margin-left: 3em;' class='btn' id='delete_"
				+ (gfv_count)
				+ "' name='delete_"
				+ (gfv_count)
				+ "'>삭제</a> </div>"
		$("#fileDiv").append(str);
		$("a[name^='delete']").on("click", function(e) {
			e.preventDefault();
			fn_deleteFile($(this));
		});
		
		gfv_count = Number(gfv_count) + Number(1);
	}
	
	function fn_deleteFile(obj) {
		obj.parent().remove();
	}
</script>
</head>

<body onunload="Close_Event();">
	<!--  위탁장소 등록-->
	<div style="width: 100%; height: 100%; margin-bottom: 5em">
		<div style="width: 100%; height: auto; margin: 0 auto;">
			<div style="text-align: center; margin-top: 3em">
				<span style="font-size: 2em; font-weight: bold;">자격증 정보 수정</span>
			</div>

			<div style="width: 80%; height: auto; margin: 0 auto;">
				<form id="modifyCerti" name="modifyCerti" enctype="multipart/form-data" method="post">
					<!-- <div
				style="text-align: center; position: relative; right: 21em; bottom: 0.5em;">
				<span style="font-weight: bold;">위탁 장소*</span>
			</div> -->

					<!-- 위탁장소 이미지 파일 추가 -->
					<div style="margin-top: 5em;">
						<h1 style="font-size: 1.1em; font-weight: bold; margin-top: 5px">
							<img src="resources/images/fileUpload.png" style="width: 2.5em;">수정 안내
						</h1>
						<div class="message" style="margin-top: -10px">
							<p>- 사진은 가로로 찍은 사진을 권장합니다. (가로 사이즈 최소 800px)</p>
							<p>- 사진 용량은 사진 한 장당 10MB까지 등록이 가능합니다.</p>
							<p>- 사진은 최소 1장 이상 등록해야 하며, 최대 5장까지 권장합니다. 그 이상 등록할 경우 업로드 시간이
								다소 지연될 수 있습니다.</p>
						</div>

						<div id="fileDiv" class="fileDiv" style="margin-bottom: 1em;">
							<c:forEach var="c" items="${certi}" varStatus="var">
								<div style="border: 0.5px; border-style: dashed; border-radius: 2em; padding: 2px; margin-bottom: 1em;">
									<p>
										<div style="text-align: center;">
											<input type="hidden" id="CERTI_FILE_NO" name="CERTI_FILE_NO_${var.index}" value="${c.CERTI_NO}" /> 
												<a id="PROFILE_ORIGINAL_FILE_NAME_${var.index}" name="PROFILE_ORIGINAL_FILE_NAME_${var.index}"></a> 
												
											<font style="margin-right: 5px;"><b>자격증명</b></font>
											<input type="text" readonly="readonly" style="width: 10em; margin-left: 1em; margin-right: 3em; border: none;" id="CERTI_NAME" name="CERTI_NAME" value="${c.CERTI_NAME}" />
											
											<font style="margin-right: 5px;"><b>발급 기관</b></font> 
											<input type="text" readonly="readonly" style="width: 10em; margin-left: 1em; margin-right: 3em; border: none;" id="CERTI_ORG" name="CERTI_ORG" value="${c.CERTI_ORG}" />
											
											<font style="margin-right: 5px;"><b>취득 일자</b></font>
											<input type="text" readonly="readonly" style="width: 10em; margin-left: 1em; border: none;" id="CERTI_DATE" name="CERTI_DATE" value="${c.CERTI_DATE}" />
										</div>
									</p>
									<br/>${c.PROFILE_ORIGINAL_FILE_NAME} (${c.PROFILE_FILE_SIZE}&nbsp;<b>kb</b>)
									
									<input type="file" id="file_${var.index}" class="file" style="width: 300px; margin-left: 15em; margin-right: 5em;" name="file_${var.index}" /> 
									<a href="#this" style="margin-left: 3em;" class="btn" id="delete_${var.index}" name="delete_${var.index}">삭제</a>
								</div>
							</c:forEach>
						</div>
						

						<div style="position: relative; right: 10em; top: 3em; margin-top: 2em;">
							<a href="#this" class="btn_style" id="addFile">파일추가</a>
						</div>

						<div align="center">
							<div
								style="text-align: center; position: relative; right: 2em; margin-top: 2em; margin-bottom: 2em">
								<button style="width: 13em; height: 3em"
									onclick="window.close()">돌아가기</button>
								<button style="width: 13em; height: 3em; margin-left: 2em;"
									id="modify">완료</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

<style>
.btn_style {
	text-align: center;
	position: relative;
	bottom: 3.9em;
	left: 65em;
	background-color: #649EE1;
	color: white !important;
	width: 5em;
	height: 2.5em;
	text-decoration: none !important;
	line-height: 2.5em;
	border-radius: 5px;
	display: inline-block;
	transition: all 0.1s;
	border-radius: 5px;
	position: relative;
	font-weight: bold;
}

.btn_style:hover {
	background-color: #205EA2;
}

.btn {
	display: inline-block;
	margin: 0;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
	background-image: none;
	border: 1px solid transparent;
	white-space: nowrap;
	padding: 2px;
	font-size: 14px;
	line-height: 1.42;
	border-radius: 0px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.btn:hover {
	color: red;
	display: inline-block;
	margin: 0;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
	background-image: none;
	border: 1px solid transparent;
	white-space: nowrap;
	padding: 2px;
	font-size: 14px;
	line-height: 1.42;
	border-radius: 0px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

p {
	margin: 8px 0;
}
/* .fileDiv{
height: 30px;
} */
.fileDiv .file {
	width: 200px;
	float: left;
}

.tab-box {
	margin: 50px auto 0 auto;
	width: 520px;
	position: relative;
	top: 0;
	right: 17em;
}
</style>
</html>