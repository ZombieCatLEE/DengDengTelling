<!-- 20.02.12 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>


<div class="tab-box">
	<ul>
		<li onclick="location.href = '/noticeList'">공지사항</li>
		<li onclick="location.href = '/qnaList'">Q&A</li>
		<li class="selected" onclick="location.href = '/reportList'">신고하기</li>
		<li onclick="location.href = '/mypetList'">댕댕이 자랑</li>
	</ul>
</div>

<form id="frm" name="frm" enctype="multipart/form-data">
	<div style="height: auto; min-height: 600px; border-top: solid;">
		<div style="height: auto; padding-bottom: 5em;">
			<div align="center" class="container">
				<div align="left"
					style="width: auto; border: 1px solid #cccccc; padding: 2em 5em; margin-top: 20px; padding-bottom: 5em; margin-bottom: 1em; background-color: #ffffff">
					<span style="font-weight: bold; font-size: 1.3em;">신고하기 답변 수정</span>
					<hr />
					<div class="form-inline" style="margin-bottom: 1em">
						<label style="margin-right: 100px;">말머리</label> <span
							style="position: relative; left: -5em">${map.REPORT_HEADER }</span>
						<input type="hidden" name="REPORT_HEADER" id="REPORT_HEADER"
							value="${map.REPORT_HEADER }"></input> <label
							style="width: 90px; position: relative; left: 1em">글제목</label>
						<span style="position: relative; left: -0.7em; color: #649EE1;">[답변]
							${map.REPORT_SUBJECT }</span> <input type="hidden" id="REPORT_SUBJECT"
							name="REPORT_SUBJECT" value="${map.REPORT_SUBJECT }"></input>
					</div>
					<div class="form-inline" style="margin-bottom: 1em">
						<label style="font-weight: bold; width: 90px">작성자</label> 
						<span style="position: relative; left: -1.3em;">관리자</span> 
						<label style="width: 90px; position: relative; left: 1.5em">조회수</label>
						<span style="position: relative; left: 0em">${map.REPORT_COUNT }</span>
						<label style="width: 90px; position: relative; left: 3em">등록일</label>
						<span style="position: relative; left: 2em">${map.REPORT_DATE }</span>
					</div>
					<div>
						<textarea rows="20" cols="100" title="내용" id="REPORT_CONTENT" style="resize: none;"
							name="REPORT_CONTENT" placeholder="질문의 답변을 입력하세요.">${map.REPORT_CONTENT}</textarea>
					</div>

					<div class="table file">
						<h1 style="font-size: 1.1em; font-weight: bold; margin-top: 5px">
							<img src="resources/images/fileUpload.png" style="width: 2.5em;">첨부
							파일
						</h1>
						<div class="message" style="margin-top: -10px">
							<p>- 사진은 가로로 찍은 사진을 권장합니다. (가로 사이즈 최소 800px)</p>
							<p>- 사진 용량은 사진 한 장당 10MB까지 등록이 가능합니다.</p>
							<p>- 사진은 최소 1장 이상 등록해야 하며, 최대 5장까지 권장합니다. 그 이상 등록할 경우 업로드 시간이
								다소 지연될 수 있습니다.</p>
						</div>
						<div id="fileDiv" class="fileDiv">
							<c:forEach var="row" items="${list }" varStatus="var">
								<div class="div">
									<input type="hidden" id="BOARD_FILE_NO"
										name="BOARD_FILE_NO_${var.index }"
										value="${row.BOARD_FILE_NO }"></input>
									<p>
										<a href="#this" id="BOARD_ORIGINAL_FILE_NAME_${var.index }"
											name="BOARD_ORIGINAL_FILE_NAME_${var.index }">
											${row.BOARD_ORIGINAL_FILE_NAME } (${row.BOARD_FILE_SIZE }kb)</a>
									</p>
									<input type="file" id="file_${var.index }"
										name="file_${var.index }" style="width: 200px; float: left;"></input>
									<a href="#this" class="btn" id="delete_${var.index }"
										name="delete_${var.index }">삭제</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<br />
				<br />
				<div style="position: relative; top: -5em;">
					<div style="float: left; position: relative; margin-left: -1.4em;">
						<a href="#this" class="btn_style" id="addFile">파일추가</a>
					</div>
					<div style="float: right; position: relative; margin-right: 3em;">
						<a href="#this" class="btn_style" id="list" style="margin-right: 0.3em;">목록</a> 
						<a href="#this" class="btn_style" id="update">수정</a> 
						<a href="#this" class="btn_style" id="delete">삭제</a>
					</div>
				</div>
			</div>
			<input type="hidden" name="BOARD_NO" id="BOARD_NO"
				value="${map.BOARD_NO }"></input> <input type="hidden"
				name="REPORT_WRITER" id="REPORT_WRITER" value="관리자"></input> <input
				type="hidden" name="ID" id="ID" value="${map.ID }"></input> <input
				type="hidden" name="ADMIN_ID" id="ADMIN_ID" value="${ADMIN_ID }"></input>
			<input type="hidden" name="BOARD_CREA_ID" id="BOARD_CREA_ID"
				value="${mem.ADMIN_ID }"></input>
		</div>
	</div>
</form>

<%@ include file="/WEB-INF/views/include/include-body.jspf"%>
<script type="text/javascript">
	var gfv_count = '${fn:length(list)+1}';

	$(document).ready(function(e) {
		$("#list").on("click", function(e) { //목록으로 게시판 리스트로 가기
			e.preventDefault();
			fn_openBoardList();
		});

		$("#update").on("click", function(e) { //수정하기
			e.preventDefault();
			fn_openBoardUpdate();
		});

		$("#delete").on("click", function(e) { //삭제
			e.preventDefault();
			fn_openBoardDelete();
		});

		$("#addFile").on("click", function(e) { //파일추가
			e.preventDefault();
			fn_addFile();
		});

		$("a[name^='delete']").on("click", function(e) { //파일삭제
			e.preventDefault();
			fn_deleteFile($(this));
		});
	});

	function fn_openBoardList() {
		var comSubmit = new ComSubmit();
		if (confirm("취소 하시겠습니까?") == true) {
			comSubmit.setUrl("<c:url value='/reportList' />");
			comSubmit.submit();
		} else {
			return;
		}
	}

	function fn_openBoardUpdate() {
		var comSubmit = new ComSubmit("frm");
		if (confirm("수정 하시겠습니까?") == true) {
			comSubmit.setUrl("<c:url value='/reportUpdate' />");
			comSubmit.submit();
		} else {
			return;
		}
	}

	function fn_openBoardDelete() {
		var comSubmit = new ComSubmit();
		if (confirm("삭제 하시겠습니까?") == true) {
			comSubmit.setUrl("<c:url value='/reportDelete' />");
			comSubmit.addParam("BOARD_NO", $("#BOARD_NO").val());
			comSubmit.submit();
		} else {
			return;
		}
	}

	function fn_addFile() {
		var str = "<div class='div'>"
				+ "<input type='file' id='file_"
				+ (gfv_count)
				+ "' name='file_"
				+ (gfv_count)
				+ "' style='width: 200px; float:left;'> <a href='#this' class='btn' id='delete_"
				+ (gfv_count) + "' name='delete_" + (gfv_count) + "'>삭제</a>"
				+ "</div>";
		$("#fileDiv").append(str);
		$("#delete_" + (gfv_count++)).on("click", function(e) { //삭제 버튼 
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}

	function fn_deleteFile(obj) {
		obj.parent().remove();
	}
</script>

<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>
<style>
.btn_style {
	text-align: center;
	position: absolute;
	bottom: 35px;
	background-color: #649EE1;
	color: white !important;
	width: 5em;
	height: 2.5em;
	text-decoration: none !important;
	line-height: 2.5em;
	border-radius: 5px;
	display: inline-block;
	transition: all 0.1s;
	font-weight: bold;
}

#addFile {
	left: 90px;
}

#update {
	right: 110px;
}

#list {
	right: 186px;
}

#delete {
	right: 30px;
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

.div {
	margin: 8px 0;
}
/* .fileDiv{
height: 30px;
} */
.fileDiv .file {
	width: 200px;
	float: left;
}

p {
	margin-bottom: 0px;
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