<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-mypage-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-add.jspf"%><!-- 이건 일단 내비둠 script작동 -->

<script type="text/javascript" src="resources/js/common.js"></script>
<style>
li {
	float: left;
}

li {
	list-style: none;
}
</style>

<div class="tab-box">
	<ul>
		<li onclick="location.href = '/MyInfodetail'">회원 정보</li>
		<li onclick="location.href = '/myPetList'">마이 펫</li>
		<li onclick="location.href = '/memMatchList'">매칭 내역</li>
		<li class="selected" onclick="location.href = '/cashList'">거래 내역</li>
		<li onclick="location.href = '/warning'">이용 후기</li>
	</ul>
</div>

<div style="height: auto; border-top: solid; min-height: 600px">
	<div style="height: auto;">
		<div class="wrapper">
			<div style="text-align: center; margin-top: 5em">
				<span style="font-weight: bold; font-size: 2em;">거래 내역</span>
			</div>
			<div align="center">
				<div>
					<div align="right" style="width: 80%;">
						<span style="padding-right: 1em;"><b>전체&nbsp;&nbsp;${count}&nbsp;건</b></span>
					</div>

					<table class="NoticeTable" style="margin-top: 1em; width: 80%">
						<thead>
							<tr class="table_head">
								<th style="width: 10%">번호</th>
								<th style="width: 15%">이용 회원</th>
								<th style="width: 15%">금액</th>
								<th style="width: 15%">거래 단계</th>
								<th style="width: 15%">신청 날짜</th>
								<th style="width: 15%">출금 신청</th>
								<th style="width: 15%">출금 여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${map}" varStatus="var">
								<tr>
									<td style="text-align: center;">
										${row.PROGRESS_NO}</td>
									<td style="text-align: center; cursor: pointer;" onclick="window.open('matchingListDetailGo?pnum=${row.PROGRESS_NO}', 'window', 'width=1320px, height=600px, scrollbars=yes')">
										<b>${row.M_NAME}</b></td>
									<td style="text-align: center;">
										${row.PRICE}</td>
									<td style="text-align: center;">
										${row.CASH_CARE_SELECT}</td>
									<td style="text-align: center;">
										<c:if test="${row.WITHDRAW_DATE == null}">
											-
										</c:if>
										<c:if test="${row.WITHDRAW_DATE != null}">
											${row.WITHDRAW_DATE}
										</c:if>
									</td>
									<td style="text-align: center; cursor: pointer;">
										<c:if test="${row.WITHDRAW_DATE == null && row.CASH_CARE_SELECT == '출금 가능'}">
											<button type="button" onclick="location.href='withdrawReserve?cn=${row.CASH_CARE_NO}&&pnum=${row.PROGRESS_NO}'"
												style="line-height: 1.9em; font-size: 0.9em; width: 5em; vertical-align: top; border-radius: 0.5em;">신청</button>
										</c:if>
										<c:if test="${row.WITHDRAW_DATE == null && row.CASH_CARE_SELECT != '출금 가능'}">
											불가
										</c:if>
										<c:if test="${row.WITHDRAW_DATE != null}">
											완료
										</c:if>
									</td>
									<td style="text-align: center;">
										${row.CASH_CARE_CHECK}</td>
								</tr>
							</c:forEach>

							<!--  등록된 게시글이 없을때 -->
							<c:if test="${fn:length(map) le 0}">
								<!-- noList가 0보다 작거나 같으면 -->
								<tr>
									<td colspan="11" style="text-align: center;">거래 내역이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>

					<!-- 검색 -->
					<%-- <form>
					 	<div class="navBar">
							<div class="total" style="width: 990px;">
								<select id="type" name="searchNum" style="width: 6.3em; position: relative; right: 32em;" >
									<option value="0">제목</option>
									<option value="1">내용</option>
								</select>
								<div></div>
								<input type="text" name="isSearch" style="width: 20em; position: relative; right: 13.5em; bottom: 2.5em;">
								<input type="submit" value="검색" class="keyword" style="border: 0; right: 12.5em;">
								
								<c:if test="${ADMIN_ID != null}">
									<a href="#this" class="write" id="write">글작성</a>
								</c:if>
							</div>
						</div>
						<br />
					</form> --%>
				</div>
				<div class="paging">${pagingHtml}</div>
				<form id="commonForm" name="common"></form>
			</div>
		</div>
	</div>
</div>

<style>
.paging {
	display: inline-block;
	margin-bottom: 50px;
}

.NoticeTable {
	border-color: #F1F1F3;
}

.table_head {
	background-color: #F4F4F4;
	text-align: center;
}

th {
	text-align: center;
}

th, td {
	border-bottom: 1px solid #F1F1F3;
	padding: 10px;
}

.keyword {
	position: relative;
	bottom: 2.5em;
	right: 17em;
	width: 3.5em;
	height: 2.5em;
	background-color: #649EE1;
	color: white;
	text-decoration: none !important;
	line-height: 2.5em;
	display: inline-block;
	transition: all 0.1s;
	border-radius: 5px;
}

.write {
	position: relative;
	bottom: 2.4em;
	left: 30%;
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
}

.write:hover {
	background-color: #205EA2;
}

.write:active {
	transform: translateY(1px);
}

.cntBoard {
	position: relative;
	font-size: 1em;
	font-weight: bold;
}

.board {
	max-width: 990px;
	text-align: left;
	height: 20px;
}

.type {
	right: 20%;
}

div.navBar {
	padding-left: 0;
}

.tab-box {
	padding-bottom: 20px;
}
</style>

	<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>
	
</html>