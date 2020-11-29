<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>

<!-- 게시판 에디터 Summernote-->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- 게시판 에디터 summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<!-- 게시판 에디터 스크립트 -->
<script>
$(document).ready(function() {
	  $('#summernote').summernote();
});
</script>
</head>

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
		<div style="height: auto;">
			<div align="center" class="container">
				<div align="left"
					style="width: 100%; border: 1px solid #cccccc; padding: 2em 5em; padding-bottom: 5em; margin-top: 20px; margin-bottom: 1em; background-color: #ffffff">
					<span style="font-weight: bold; font-size: 1.3em;">신고하기 글쓰기</span>
					<hr />
					<div class="form-inline" style="margin-bottom: 1em">
						<label style="width: 90px">글제목</label> <label> <select
							id="REPORT_HEADER" name="REPORT_HEADER" style="width: 8.5em">
								<option value="">말머리선택</option>
								<option value="펫시터이용">펫시터이용</option>
								<option value="결제관련">결제관련</option>
								<option value="이용취소">이용취소</option>
								<option value="홍보성게시물">홍보성게시물</option>
								<option value="음란성게시물">음란성게시물</option>
								<option value="기타">기타</option>
						</select>
						</label> <input type="text" id="REPORT_SUBJECT" name="REPORT_SUBJECT"
							value="${REPORT_SUBJECT }" class="form-control"
							style="width: 500px" placeholder="글 제목을 입력하세요." />
					</div>
					<div class="form-inline" style="margin-bottom: 1em">
						<label style="width: 90px">작성자</label> <strong>${mem.NAME}</strong>
						<input type="hidden" name="REPORT_WRITER" id="REPORT_WRITER"
							value="${mem.NAME}"></input> <input type="hidden" name="ID"
							id="ID" value="${mem.ID }"></input> <input type="hidden"
							name="BOARD_CREA_ID" id="BOARD_CREA_ID" value="${mem.ID }"></input>
						<input type="hidden" name="adminId" id="adminId"
							value="${mem.ADMIN_ID }"></input>
					</div>
					<div>
						<textarea rows="20" cols="100" title="내용" id="REPORT_CONTENT" style="resize: none;"
							name="REPORT_CONTENT" placeholder="내용을 입력하세요.">${REPORT_CONTENT }</textarea>
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
							<p>
								<input type="file" id="file" class="file" name="file_0" /> <a
									href="#this" class="btn" id="delete" name="delete">삭제</a>
							</p>
						</div>
					</div>
					<div style="top: 1em; display: flex;">
						<div style="position: relative; display: inline-flex;">
							<a href="#this" class="btn_style" id="addFile"
								style="left: 0.1em; top: 0.1em;">파일추가</a>
						</div>
						<div style="position: relative; display: inline-flex;">
							<a href="#this" class="btn_style" id="write"
								style="left: 55em; top: 0.1em;">등록</a> <a href="#this"
								class="btn_style" id="list" style="left: 56em; top: 0.1em;">취소</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<%@ include file="/WEB-INF/views/include/include-body.jspf"%>

<script type="text/javascript">

	var gfv_count = 1;
				
	$(document).ready(function(){
		$("#list").on("click", function(e){		//취소
			e.preventDefault();
			fn_openBoardList();
		});
					
		$("#write").on("click", function(e){	//등록
			e.preventDefault();
			fn_insertBoard();
		});
					
		$("#addFile").on("click", function(e){	//파일추가
			e.preventDefault();
			fn_addFile();
		});
					
		$("a[name='delete']").on("click", function(e){	//파일삭제
			e.preventDefault();
			fn_deleteFile($(this));
		});
					
	});
				
	function fn_openBoardList(){
		var comSubmit = new ComSubmit();
		if(confirm("정말 취소하시겠습니까?") == true) {
			comSubmit.setUrl("<c:url value='/reportList' />");
			comSubmit.submit();
		} else {
			return;
		}
	}
				
	function fn_insertBoard(){
		var comSubmit = new ComSubmit("frm");
		if(!$("#REPORT_SUBJECT").val()) {
			alert("제목을 입력해주세요.");
			$("REPORT_SUBJECT").focus();
			return false;
		} else if(!$("#REPORT_CONTENT").val()) {
			alert("내용을 입력해주세요.");
			$("REPORT_CONTENT").focus();
			return false;
		}
					
		if(confirm("등록 하시겠습니까?") == true) {
			comSubmit.setUrl("<c:url value='/reportWrite' />"); 
			comSubmit.submit();
		} else {
			return;
		}
	}
				
	function fn_addFile(){
		var str = "<p><input type='file' name='file_"
				+ (gfv_count++)
				+ "' style='width: 200px; float:left;'><a href='#this' class='btn' name='delete'>삭제</a><p>";
		$("#fileDiv").append(str);
		$("a[name='delete']").on("click",function(e){
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}
				
	function fn_deleteFile(obj) {
		obj.parent().remove();
	}
				
</script>

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