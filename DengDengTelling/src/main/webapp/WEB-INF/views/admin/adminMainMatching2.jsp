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
			<h3>매칭 관리</h3>
		</div>
		<div class="serch">
			<ul>
				<li><a href="adminMatchListGo?isSearch=취소">취소</a></li>
				<li><a href="adminMatchListGo?isSearch=진행완료">진행 완료</a>&nbsp;|</li>
				<li><a href="adminMatchListGo?isSearch=후기작성">후기 작성</a>&nbsp;|&nbsp;</li>
				<li><a href="adminMatchListGo?isSearch=진행중">진행 중</a>&nbsp;|&nbsp;</li>
				<li><a href="adminMatchListGo?isSearch=결제대기">결제 대기</a>&nbsp;|&nbsp;</li>
				<li><a href="adminMatchListGo?isSearch=예약대기">예약 대기</a>&nbsp;|&nbsp;</li>
			</ul>
		</div>
	</div>
	<div class="table">
		<form>
			<table style="width: 100%">
				<tr>
					<th scope="row" style="width: 6%;">번호</th>
					<th style="width: 14%;">지역</th>
					<th style="width: 7%;">펫시터</th>
					<th style="width: 5%;">등급</th>
					<th style="width: 7%;">회원</th>
					<th style="width: 31%;">일정</th>
					<th style="width: 11%;">반려견 ID</th>
					<th style="width: 7%;">금액</th>
					<th style="width: 10%;">진행 단계</th>
				</tr>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(adminMatchList) > 0}">
							<c:forEach items="${adminMatchList }" var="row" begin="0" step="1" varStatus="status">
								<tr class="t_col" style="cursor: pointer;" onclick="window.open('matchingListDetailGo?pnum=${row.PROGRESS_NO}', 'window', 'width=1320px, height=600px, scrollbars=yes')">
									<td>${row.NUM}</td>
									<td>${row.P_ADD1}</td>
									<td>${row.P_NAME}</td>
									<td>${row.P_CLASS}</td>
									<td>${row.M_NAME}</td>
									<td>${row.PETSITTING_DAYS}</td>
									<td>${row.PET_ID}</td>
									<td>${row.PRICE}</td>
									<td>
										<c:choose>
											<c:when test="${row.DEL_GB == 'Y'}">
												취소
											</c:when>
											<c:otherwise>
												<c:if test="${row.PROGRESS_STEPS == 1}">
													예약 대기
												</c:if>
												<c:if test="${row.PROGRESS_STEPS == 2}">
													결제 대기
												</c:if>
												<c:if test="${row.PROGRESS_STEPS == 3}">
													진행 중
												</c:if>
												<c:if test="${row.PROGRESS_STEPS == 4}">
													후기 작성
												</c:if>
												<c:if test="${row.PROGRESS_STEPS == 5}">
													진행 완료
												</c:if>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
							<tr align="center">
								<td colspan="9">
									<div class="paging">${pagingHtml}</div>
								</td>
							</tr>
							<tr>
								<td colspan="3" align="right">
									<select id="type" name="searchNum" style="width: 80%">
										<option value="0">펫시터 이름</option>
										<option value="1">회원 이름</option>
									</select>
								</td>
								<td colspan="4" align="center">
									<input type="text" name="isSearch">
								</td>
								<td colspan="2" align="left">
									<input type="submit"
										style="width: 8em; font-size: 1em; line-height: 2em; border-radius: 1em;"
										value="검색">
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="9">조회된 결과가 없습니다.</td>
							</tr>
							<tr>
								<td colspan="3" align="right">
									<select id="type" name="searchNum" style="width: 80%">
										<option value="0">펫시터 이름</option>
										<option value="1">회원 이름</option>
									</select>
								</td>
								<td colspan="4" align="center">
									<input type="text" name="isSearch">
								</td>
								<td colspan="2" align="left">
									<input type="submit"
										style="width: 8em; font-size: 1em; line-height: 2em; border-radius: 1em;"
										value="검색">
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</form>
	</div>

	<%@ include file="/WEB-INF/views/include/include-body.jspf"%>

</body>

</html>
