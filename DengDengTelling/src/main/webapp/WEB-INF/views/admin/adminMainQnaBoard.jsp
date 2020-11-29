<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<head>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/admin.css">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/nav.js"></script>
<title>관리자 페이지</title>
</head>
<body>
	<nav>
		<div class="mainNav">
			<h2 class="blind">메뉴</h2>
			<ul>
				<li class="menu"><a href="adminMain">회원 관리</a></li>
				<li class="menu"><a href="adminMatchList">매칭 관리</a></li>
				<li class="menu"><a href="#">게시판 관리</a>
					<ul class="close">
						<li><a href="adminNoticeList">공지사항</a></li>
						<li><a href="adminQnaList">Q&#38;A</a></li>
						<li><a href="adminReportList">신고하기</a></li>
						<li><a href="adminMypetList">댕댕이 자랑</a></li>
					</ul></li>
				<li class="menu"><a href="adminCash">입출금 관리</a>	
				<li class="menu"><a href="adminServer">서버 관리</a></li>
				<li class="menu"><a href="adminMain">메인 페이지</a></li>
				<li class="menu"><a href="/logout">로그아웃</a></li>
			</ul>
		</div>
	</nav>

	<div class="ta">
		<div align="center" style="margin-bottom: 3em;">
			<h3>Q&#38;A</h3>
		</div>
	</div>
	<div class="table">
		<form>
			<table style="width: 100%">
				<tr>
					<th scope="row" style="width: 15%;">번호</th>
					<th style="width: 45%;">제목</th>
					<th style="width: 13%;">작성자</th>
					<th style="width: 13%;">조회수</th>
					<th style="width: 14%;">작성일</th>
				</tr>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(adminQnaList) > 0}">
							<c:forEach items="${adminQnaList }" var="row" begin="0" step="1"
								varStatus="status">
								<tr class="t_col">
									<td>${row.NUM}</td>
									<td style="text-align: left;">
										<c:if test="${row.QNA_PRIVATE_CHECK=='Y'}">
											<img style="width: 1.5em" src="resources/images/secret_icon.png">
										</c:if> 
										<c:if test="${row.QNA_PRIVATE_CHECK=='N'}">
											<span>&nbsp;&nbsp;&nbsp;</span>
										</c:if> 
										<c:if test="${row.QNA_RE_STEP == 0 }">
											<a href="#this" name="subject">${row.QNA_SUBJECT }</a>
										</c:if> 
										<c:if test="${row.QNA_RE_STEP > 0}">
											&nbsp;&nbsp;  <!-- 답변글일 경우 글 제목 앞에 공백을 준다. -->
											<a href="#this" name="subject">&rarrhk;&nbsp;[답변]${row.QNA_SUBJECT }</a>
										</c:if> <!-- &rarrhk HTML화살표 코드 -->
										<input type="hidden" id="BOARD_TYPE" name="BOARD_TYPE" value="${row.BOARD_TYPE }">
										<input type="hidden" id="BOARD_NO" name="BOARD_NO" value="${row.BOARD_NO }">
										<input type="hidden" id="ID" name="ID" value="${row.ID }">
										<input type="hidden" id="ADMIN_ID" name="ADMIN_ID" value="${row.ADMIN_ID }">
										<input type="hidden" id="QNA_PRIVATE_CHECK" name="QNA_PRIVATE_CHECK" value="${row.QNA_PRIVATE_CHECK }">
									</td>
									<td>${row.QNA_WRITER}</td>
									<td>${row.QNA_COUNT}</td>
									<td>${row.QNA_DATE}</td>
								</tr>
							</c:forEach>
							<tr align="center">
								<td colspan="5">
									<div class="paging">${pagingHtml}</div>
								</td>
							</tr>
							<tr>
								<td align="right">
									<select id="type" name="searchNum" style="width: 80%">
										<option value="0">제목</option>
										<option value="1">내용</option>
										<option value="2">작성자</option>
									</select>
								</td>
								<td colspan="2">
									<input type="text" name="isSearch">
								</td>
								<td colspan="2">
									<input type="submit" style="width: 8em; font-size: 1em; line-height: 2em; border-radius: 1em;" value="검색">
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">조회된 결과가 없습니다.</td>
							</tr>
							<tr>
								<td align="right">
									<select id="type" name="searchNum" style="width: 80%">
										<option value="0">제목</option>
										<option value="1">내용</option>
										<option value="2">작성자</option>
									</select>
								</td>
								<td colspan="2">
									<input type="text" name="isSearch">
								</td>
								<td colspan="2">
									<input type="submit" style="width: 8em; font-size: 1em; line-height: 2em; border-radius: 1em;" value="검색">
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</form>
	</div>
</body>

<%@ include file="/WEB-INF/views/include/include-body.jspf"%>

<script type="text/javascript">
	$(document).ready(function(e) {
		$("#write").on("click", function(e) { //글작성 
			e.preventDefault();
			fn_openBoardWrite();
		});

		$("a[name='subject']").on("click", function(e) { //제목 클릭시 상세보기
			e.preventDefault();
			fn_openBoardDetail($(this));
		});
	});

	function fn_openBoardWrite() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/qnaWriteForm' />") //이거 글작성으로 넘어가는거 위에랑 연결된다. 
		comSubmit.submit();
	}

	function fn_openBoardDetail(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/qnaDetail' />")
		comSubmit.addParam("BOARD_NO", obj.parent().find("#BOARD_NO").val());
		comSubmit.submit();
	}
</script>

</html>