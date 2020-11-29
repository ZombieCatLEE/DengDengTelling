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
			<h3>회원 관리</h3>
		</div>
		<div class="serch">
			<ul>
				<li><a href="adminMainGo?isSearch=펫시터">펫시터</a></li>
				<li><a href="adminMainGo?isSearch=일반회원">일반 회원</a>&nbsp;|&nbsp;</li>
			</ul>
		</div>
	</div>
	<div class="table">
		<form>
			<table>
				<tr>
					<th scope="row" style="width: 5%;">번호</th>
					<th style="width: 7%;">이름</th>
					<th style="width: 10%;">ID</th>
					<th style="width: 4%;">성별</th>
					<th style="width: 15%;">연락처</th>
					<th style="width: 15%;">이메일</th>
					<th style="width: 6%;">생년월일</th>
					<th style="width: 16%;">주소</th>
					<th style="width: 9%;">반려견 수</th>
					<th style="width: 10%;">회원 구분</th>
				</tr>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(AllMemberList) > 0}">
							<c:forEach items="${AllMemberList }" var="row" begin="0" step="1" varStatus="status">
								<tr class="t_col" style="cursor: pointer;" onclick="window.open('adminMemDetail?type=${row.MEM_TYPE}&&id=${row.ID}', 'popup', 'width=1140, height=700, status=yes, resizable=yes, scrollbars=yes')">
									<td>${row.NUM}</td>
									<td>${row.NAME}</td>
									<td>${row.ID}</td>
									<td>${row.SEX}</td>
									<td>${row.PHONE}</td>
									<td>${row.EMAIL}</td>
									<td>${row.BIRTHDAY}</td>
									<td>${row.ADDRESS1}</td>
									<td>${row.PET_COUNT}</td>
									<td>${row.MEM_TYPE}</td>
								</tr>
							</c:forEach>
							<tr align="center">
								<td colspan="10">
									<div class="paging">${pagingHtml}</div>
								</td>
							</tr>
							<tr>
								<td colspan="3" align="right">
									<select id="type" name="searchNum" style="width: 80%">
										<option value="0">이름</option>
										<option value="1">ID</option>
									</select>
								</td>
								<td colspan="5" align="center">
									<input type="text" name="isSearch"></td>
								<td colspan="2" align="left">
									<input type="submit" 
										style="width: 8em; font-size: 1em; line-height: 2em; border-radius: 1em;"
										value="검색">
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="10">조회된 결과가 없습니다.</td>
							</tr>
							<tr>
								<td colspan="3" align="right">
									<select id="type" name="searchNum" style="width: 80%">
										<option value="0">이름</option>
										<option value="1">ID</option>
									</select>
								</td>
								<td colspan="5" align="center">
									<input type="text" name="isSearch">
								</td>
								<td colspan="2" align="left">
									<input type="submit" style="width: 8em; font-size: 1em; line-height: 2em; border-radius: 1em;" value="검색">
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