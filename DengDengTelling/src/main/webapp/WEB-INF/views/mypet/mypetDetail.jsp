

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-add.jspf"%>


<div class="tab-box">
	<ul>
		<li onclick="location.href = '/noticeList'">공지사항</li>
		<li onclick="location.href = '/qnaList'">Q&A</li>
		<li onclick="location.href = '/reportList'">신고하기</li>
		<li class="selected" onclick="location.href = '/mypetList'">댕댕이 자랑</li>
	</ul>
</div>
</div>
</nav>

<div style="height: auto; min-height: 600px; border-top: solid;">
	<div style="height: auto; padding-bottom: 5em;">
		<div align="center" class="container">
			<div align="left" style="height: auto; width: 100%; border: 1px solid #cccccc; margin-top: 20px; padding-bottom: 5em; margin-bottom: 1em; background-color: #ffffff">

				<!-- 게시판 헤드 -->
				<!-- 글제목 부분 -->
				<div style="text-align: center; background-color: #649EE1; width: 100%; height: 5em;">
					<span style="font-weight: 900; color: white; font-size: 2em; position: relative; top: 0.5em;">${map.MYPET_SUBJECT }</span>
				</div>

				<div style="text-align: right; margin-top: 2em; padding-right: 1em;">
					<label style="position: relative; font-weight: bold; width: a50px">글번호&nbsp;&nbsp;</label>${map.BOARD_NO }
						<span style="position: relative; color: #7C7C7C; margin-left: 1em; font-size: 0.5em; bottom: 0.3em;">|</span>
					<label style="position: relative; font-weight: bold; width: 50px">작성자&nbsp;&nbsp;</label>${map.MYPET_WRITER }
						<span style="position: relative; color: #7C7C7C; margin-left: 1em; font-size: 0.5em; bottom: 0.3em;">|</span>
					<label style="width: 60px; position: relative;">조회수&nbsp;&nbsp;</label>${map.MYPET_COUNT }
						<span style="position: relative; color: #7C7C7C; margin-left: 1em; font-size: 0.5em; bottom: 0.3em;">|</span>
					<label style="position: relative; font-weight: bold; width: 50px">등록일&nbsp;&nbsp;</label>${map.MYPET_DATE }
				</div>
				
				<div align="center">
					<div style="display: flex; border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;height: auto; padding: 10px; display: block; width: 100%; margin-bottom: 10px;">
						<div align="center" style="display: block;">
							<c:forEach var="imgs" items="${list}">
								<img width="60%" height="auto" style="margin: 1em;" src="<%=cp%>/resources/images/board/${imgs.BOARD_STORED_FILE_NAME}" />
							</c:forEach>
						</div>
						<div style="width: 80%; margin-top: 3em; margin-bottom: 3em; min-height: 230px; height: auto; font-size: 1.1em;" align="left">${map.MYPET_CONTENT }</div>
					</div>
				</div>
				<table style="width: 70%">
					<c:forEach var="row" items="${list}">
						<tr>
							<td style="padding-left: 1.5em;">
								<img src="resources/images/fileUpload.png" style="width: 2.5em;">
								<a href="#this" id="${row.BOARD_FILE_NO}" name="file">${row.BOARD_ORIGINAL_FILE_NAME}
									(${row.BOARD_FILE_SIZE }kb)&nbsp;</a> 
								<input type="hidden" id="BOARD_TYPE" name="BOARD_TYPE" value="${row.BOARD_TYPE}">
								<input type="hidden" id="BOARD_FILE_NO" name="BOARD_FILE_NO" value="${row.BOARD_FILE_NO}">
								<input type="hidden" id="BOARD_NO" value="${row.BOARD_NO }">
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div align="center">
				<a href="#this" class="btn_style" id="list"
					style="margin-left: 2em;">목록</a>
				<c:if test="${ID == map.ID || ADMIN_ID != null}">
					<a href="#this" class="btn_style" id="update"
						style="margin-left: 2em;">수정</a>
				</c:if>
			</div>

			<form id="frm">
				<div align="center" style="display: block; margin-top: 3em;">
					<div style="display: inline-block; width: 90%">
						<textarea title="MYPET_COMMENT_CONTENT" id="MYPET_COMMENT_CONTENT" placeholder="의견을 작성해주세요"
							style="resize: none; height: 7em; font-size: 1.1em; " name="MYPET_COMMENT_CONTENT" cols="100" rows="2"></textarea>
					</div>
					<div style="display: inline-block; width: 9%; vertical-align: top;">
						<a href="#this" id="comment" class="btn_style" style="position: relative;"><strong>댓글쓰기</strong></a>
					</div>
				</div>

				<div align="center">
					<div style="width: 90%; height: auto; border: 1px solid #cccccc; border-radius: 1em; margin-top: 2em; background-color: #A9D0F5;">
						<div style="display: block; width: 100%; padding-top: 1em; padding-right: 1em; padding-left: 1em;" align="center">
							<div style="display: inline-block; width: 10%; font-size: 1.1em; font-weight: bold; font-family: sans-serif;">
								작성자
							</div>
							<div style="display: inline-block; width: 20%; font-size: 1.1em; font-weight: bold; font-family: sans-serif;">
								작성일시
							</div>
							<div style="display: inline-block; width: 55%; font-size: 1.1em; font-weight: bold; font-family: sans-serif;">
								내용
							</div>
							<div style="display: inline-block; width: 13%; font-size: 1.1em; font-weight: bold; font-family: sans-serif;">
								비고
							</div>
						</div>
						<input type="hidden" name="ID" id="ID" value="${ID}" />
						<input type="hidden" name="MAIN_IMG" id="MAIN_IMG" value="${MAIN_IMG}" />
						<c:choose>
							<c:when test="${fn:length(cmtList) > 0}">
								<c:forEach items="${cmtList }" var="rows">
									<div style="display: block; width: auto; height: 5em; border: 1px solid; border-radius: 1em; margin: 1em; background-color: #FFFFFF;" align="center">
										<div style="display: inline-block; width: 10%; text-align: center; font-size: 1.1em; position: relative; top: -1.5em;">
											${rows.NAME}
										</div>
										<div style="display: inline-block; width: 20%; text-align: center; position: relative; top: -1.5em;">
											${rows.MYPET_COMMENT_DATE}
										</div>
										<div style="display: inline-block; width: 55%; padding: 0.5em;">
											<textarea style="resize: none; font-size: 1em; border-radius: 1em;" readonly="readonly">${rows.MYPET_COMMENT_CONTENT }</textarea>
										</div>
										<div style="display: inline-block; width: 13%; text-align: center; position: relative; top: -1.5em;">
											<c:choose>
												<c:when test="${ID == rows.ID || ADMIN_ID != null}">
													<a href="mypetCommentDelete?seq=${rows.MYPET_COMMENT_NO}&&sed=${map.BOARD_NO}"
														id="deleteComment" name="deleteComment" id="deleteComment"><b>삭제</b></a>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
											<input type="hidden" id="MYPET_COMMENT_NO" value="${rows.MYPET_COMMENT_NO }" />
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div style="display: block; width: auto; height: 5em; border: 1px solid; border-radius: 1em; margin: 1em; font-size: 1.2em; font-weight: bold; background-color: #FFFFFF; padding-top: 1.7em;" align="center">
										댓글이 없습니다.
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
			

<style>
.btn_style {
	text-align: center;
	position: relative;
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

.border_table {
	border-top: solid;
	border-bottom: solid;
	border-color: #91BBEA;
	padding-left: 1em;
	padding-right: 1em;
}

.border_td {
	border-bottom: solid;
	border-color: #EEEEEE;
	border-width: 1px;
}
</style>

<%@ include file="/WEB-INF/views/include/include-body.jspf"%>

<script type="text/javascript">
	$(document).ready(function(e) {
		$("#list").on("click", function(e) { //목록으로 게시판 리스트로 가기
			e.preventDefault();
			fn_openBoardList();

		});

		$("#update").on("click", function(e) { //수정하기
			e.preventDefault();
			fn_openBoardUpdate();
		});

		$("#comment").on("click", function(e) { // 댓글쓰기
			e.preventDefault();
			fn_insertComment();
		});
		/* $("a[name='deleteComment']").on("click", function(e){   //댓글 삭제
			e.preventDefault();
			fn_deleteComment($(this));
		}); */

		$("a[name='file']").on("click", function(e) { //파일 다운로드
			e.preventDefault();
			fn_downloadFile($(this).attr('id'));
		});
	});

	function fn_openBoardList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/mypetList' />");
		comSubmit.submit();
	}

	function fn_openBoardUpdate() {
		var idx = "${map.BOARD_NO}";
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/mypetUpdateForm' />");
		comSubmit.addParam("BOARD_NO", idx);
		comSubmit.submit();
	}

	function fn_insertComment() {
		var BOARD_NO = "${map.BOARD_NO}";
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/mypetInsert'/>");
		comSubmit.addParam("MYPET_COMMENT_WRITER", '${ID==ID}');
		comSubmit.addParam("BOARD_NO", BOARD_NO);
		comSubmit.submit();
	}

	/* function fn_deleteComment(){
	var BOARD_NO = "${map.BOARD_NO}";
	var comSubmit = new ComSubmit("frm");
	   comSubmit.setUrl("<c:url value='/mypetCommentDelete'/>");
	   comSubmit.addParam("MYPET_COMMENT_NO",$("#MYPET_COMMENT_NO").val()); 
	   
	   comSubmit.addParam("BOARD_NO", BOARD_NO); 
	    
	   comSubmit.submit();
	} */

	/* function fn_deleteComment(){
		var MYPET_COMMENT_NO = "${rows.MYPET_COMMENT_NO}";
		var comSubmit = new ComSubmit("frm");
	    comSubmit.setUrl("<c:url value='/mypetCommentDelete'/>");
	    comSubmit.addParam("MYPET_COMMENT_NO",$("#MYPET_COMMENT_NO").val()); 
	    comSubmit.addParam("MYPET_COMMENT_NO", MYPET_COMMENT_NO);
	    //comSubmit.addParam("BOARD_NO", BOARD_NO); 
	     
	    comSubmit.submit();
	 } */

	function fn_downloadFile(obj) {
		var idx = obj;
		var comSubmit = new ComSubmit();
		$("#commonForm").children().remove();
		comSubmit.setUrl("<c:url value='/mypet/downloadFile' />");
		comSubmit.addParam("BOARD_FILE_NO", idx);
		comSubmit.submit();
	}
</script>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>