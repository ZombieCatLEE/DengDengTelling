<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>

<div  class="tab-box">
	<ul>
		<li class="selected" onclick="location.href = '/noticeList'">공지사항</li>
		<li onclick="location.href = '/qnaList'">Q&A</li>
		<li onclick="location.href = '/reportList'">신고하기</li>
		<li onclick="location.href = '/mypetList'">댕댕이 자랑</li>
	</ul>
</div>

<div style="height: auto; min-height: 600px; border-top: solid;">
	<div style="height: auto; margin-bottom: 5em;">
		<div align="center" class="container">
			<div align="left"
				style="width: 100%; height: auto; position: relative; border: 1px solid #cccccc; padding: 2em; margin-top: 20px; padding-bottom: 5em; margin-bottom: 3em; background-color: #ffffff">
				<span style="font-weight: bold; font-size: 1.3em;">공지사항</span>
				<hr />
				
				<div class="form-inline" style="margin-bottom: 1em">
					<label style="margin-right:100px;">글번호<span>${map.BOARD_NO}</span></label>
					<label style="margin-right:100px;">글제목<span>${map.NOTICE_SUBJECT}</span></label>
				</div>
				<div class="form-inline" style="margin-bottom: 1em">
					<label>작성자<span>${map.NOTICE_WRITER}</span></label> 
					<label>조회수<span>${map.NOTICE_COUNT}</span></label>  
					<label>등록일<span>${map.NOTICE_DATE}</span></label>
					<input type="hidden" id="BOARD_TYPE" name="BOARD_TYPE" value="${map.BOARD_TYPE}">
					<input type="hidden" id="BOARD_NO" name="BOARD_NO" value="${map.BOARD_NO}">
					<input type="hidden" name="ID" id="ID" value="${map.ADMIN_ID }">
					<input type="hidden" name="writerId" id="writerId" value="${ADMIN_ID }">
					<input type="hidden" name="NOTICE_RE_NO" id="NOTICE_RE_NO" value="${map.BOARD_NO }">
					<input type="hidden" name="BOARD_CREA_ID" id="BOARD_CREA_ID" value="${mem.ADMIN_ID }">
				</div>
				<div align="center">
					<div style="display: flex; border: 1px solid gray; height: auto; padding: 10px; display: block; width: 100%; margin-bottom: 10px;">
						<div align="center" style="display: block;">
							<c:forEach var="imgs" items="${list}">
								<img width="60%" height="auto" style="margin: 1em;" src="<%=cp%>/resources/images/board/${imgs.BOARD_STORED_FILE_NAME}" />
							</c:forEach>
						</div>
						<div style="width: 80%; margin-top: 3em; margin-bottom: 3em; min-height: 230px; height: auto; font-size: 1.1em;" align="left">${map.NOTICE_CONTENT }</div>
					</div>
				</div>
				
				<table style="width: 70%">
					<c:forEach var="row" items="${list}">
						<tr>
							<td>
								<img src="resources/images/fileUpload.png" style="width: 2.5em;">
								<a href="#this" id="${row.BOARD_FILE_NO}" name="file">${row.BOARD_ORIGINAL_FILE_NAME}
									(${row.BOARD_FILE_SIZE }kb)&nbsp;</a> 
								<input type="hidden" id="BOARD_TYPE" name="BOARD_TYPE" value="${row.BOARD_TYPE}">
								<input type="hidden" id="BOARD_FILE_NO" name="BOARD_FILE_NO" value="${row.BOARD_FILE_NO}">
							</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<c:if test="${ADMIN_ID == null }">
						<a href="#this" class="btn_style" id="list" style="right: 3em;">목록</a>
					</c:if>
					<c:if test="${ADMIN_ID != null }">
						<a href="#this" class="btn_style" id="list">목록</a>
						<a href="#this" class="btn_style" id="update" style="margin-left: 1em;">수정</a>
					</c:if>
				</div>
		</div>
	</div>
<div>
</div>
</div>
</div>

<%@ include file="/WEB-INF/views/include/include-body.jspf" %>
			
			<script type="text/javascript">
				$(document).ready(function(e){
					$("#list").on("click", function(e){ //목록으로 게시판 리스트로 가기
						e.preventDefault();
						fn_openBoardList();
					});
					
					$("#update").on("click", function(e){ //수정하기
						e.preventDefault();
						fn_openBoardUpdate();
					});
					
					$("a[name='file']").on("click", function(e){ //파일 다운로드
						e.preventDefault();
						fn_downloadFile($(this).attr('id'));
					});
				});
				
				function fn_openBoardList(){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/noticeList' />");
					comSubmit.submit();
				}
				
				function fn_openBoardUpdate(){
					var idx = "${map.BOARD_NO}";
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/noticeUpdateForm' />");
					comSubmit.addParam("BOARD_NO", idx);
					comSubmit.submit();
				}
				
				function fn_downloadFile(obj){
					var idx = obj;
					var comSubmit = new ComSubmit();
					$("#commonForm").children().remove();
					comSubmit.setUrl("<c:url value='/notice/downloadFile' />");
					comSubmit.addParam("BOARD_FILE_NO", idx);
					comSubmit.submit();
				}
				
			</script>



<style>

.btn_style {
	text-align: center;
	position: absolute;
	bottom: 20px;
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
#list{ right: 110px; }
#update{ right: 35px; }
.btn_style:hover {
	background-color: #205EA2;
}

.form-inline label {
	display:inline-block;
  	font-weight: bold;
	margin: 0 100px 0 0;
}

.form-inline label span {
text-align:center;
position: absolute;
margin: 0 0 0 10px;
font-weight: 300;
}
 
.thfile {
font-weight:bold;
}

.tab-box {
    margin: 50px auto 0 auto;
    width: 520px;
    position: relative;
    top: -2;
    right: 17em;
}

</style>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>