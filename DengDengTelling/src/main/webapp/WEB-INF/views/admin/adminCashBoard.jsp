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
			<h3>입출금 관리</h3>
		</div>
		<form>
			<div class="serch">
				<ul>
					<li><a href="adminCashGo?isSearch=미승인">미승인</a></li>
					<li><a href="adminCashGo?isSearch=승인">승인</a>&nbsp;|</li>
					<li>출금&nbsp;</li>
				</ul>
			</div>
		</form>
	</div>
	<div class="table">
		<form>
			<table style="width: 100%">
				<tr>
					<th scope="row" style="width: 10%;">번호</th>
					<th style="width: 15%;">이용 회원</th>
					<th style="width: 15%;">금액</th>
					<th style="width: 15%;">거래 단계</th>
					<th style="width: 15%;">출금 신청</th>
					<th style="width: 15%;">신청 날짜</th>
					<th style="width: 15%;">승인</th>
				</tr>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(cashList) > 0}">
							<c:forEach var="row" items="${cashList}" varStatus="var">
								<tr>
									<td style="text-align: center;">
										${row.NUM}</td>
									<td style="text-align: center; cursor: pointer;" onclick="window.open('matchingListDetailGo?pnum=${row.PROGRESS_NO}', 'window', 'width=1320px, height=600px, scrollbars=yes')">
										<b>${row.P_NAME}</b></td>
									<td style="text-align: center;">
										${row.PRICE}&nbsp;원</td>
									<td style="text-align: center;">
										${row.CASH_CARE_SELECT}</td>
									<td style="text-align: center; cursor: pointer;">
										<c:if test="${row.WITHDRAW_DATE == null}">
											미신청
										</c:if>
										<c:if test="${row.WITHDRAW_DATE != null}">
											신청
										</c:if>
									</td>
									<td style="text-align: center;">
										<c:if test="${row.WITHDRAW_DATE == null}">
											-
										</c:if>
										<c:if test="${row.WITHDRAW_DATE != null}">
											${row.WITHDRAW_DATE}
										</c:if>
									</td>
									<td style="text-align: center;">
										<c:if test="${row.WITHDRAW_DATE == null}">
											-
										</c:if>
										<c:if test="${row.WITHDRAW_DATE != null && row.CASH_CARE_SELECT == '출금 요청'}">
											<button type="button" style="border: solid; border-radius: 1em; font-weight: bold; cursor: pointer; line-height: 1.5em; width: 6em; background-color: #81BEF7;"
												onclick="location.href='withdrawCashAdmin?cn=${row.CASH_CARE_NO}'">출금 승인</button>
										</c:if>
										<c:if test="${row.WITHDRAW_DATE != null && row.CASH_CARE_SELECT == '출금 완료'}">
											승인 완료
										</c:if>
									</td>
								</tr>
							</c:forEach>
							<tr align="center">
								<td colspan="7">
									<div class="paging">${pagingHtml}</div>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="right">
									<select id="type" name="searchNum" style="width: 80%">
										<option value="0">이용 회원</option>
										<option value="1">거래 단계</option>
									</select>
								</td>
								<td colspan="4" align="center">
									<input type="text" name="isSearch">
								</td>
								<td colspan="1" align="left">
									<input type="submit" style="width: 8em; font-size: 1em; line-height: 2em; border-radius: 1em;" value="검색">
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7">조회된 결과가 없습니다.</td>
							</tr>
							<tr>
								<td colspan="2" align="right">
									<select id="type" name="searchNum" style="width: 80%">
										<option value="0">이용 회원</option>
										<option value="1">거래 단계</option>
									</select>
								</td>
								<td colspan="4" align="center">
									<input type="text" name="isSearch">
								</td>
								<td colspan="1" align="left">
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
		$("#write").on("click", function(e) { //글작성 버튼 누르면 글작성 폼으로 넘어감
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
		comSubmit.setUrl("<c:url value='/noticeWrite' />") //이거 글작성으로 넘어가는거 위에랑 연결된다. 
		comSubmit.submit();
	}

	function fn_openBoardDetail(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/noticeDetail' />");
		comSubmit.addParam("BOARD_NO", obj.parent().find("#BOARD_NO").val());
		comSubmit.addParam("currentPage", "${currentPage}");
		comSubmit.submit();
	}
</script>

</html>