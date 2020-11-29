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
			<h3>서버 관리</h3>
		</div>
	</div>
	<div class="table">
		<table style="width: 100%; margin: 0;">
			<tr>
				<td colspan="3">
					<div style="margin-top: 2em; margin-bottom: 2em; font-size: 2em; font-weight: bold;">
						잠깐!<br><br>정말 서버를 조작하시겠습니까?
					</div>
				</td>
			</tr>
			<tr>
				<td style="width: 20%">
				</td>
				<td style="width: 60%">
					<div style="margin-top: 1em; margin-bottom: 1em;">
						<button style="width: 11em; height: 2.3em; font-size: 1.5em; font-weight: bold; border: solid; border-radius: 1em;">홈페이지 정상 모드</button>
					</div>
				</td>
				<td style="width: 20%">
				</td>
			</tr>
			<tr>
				<td style="width: 20%">
				</td>
				<td style="width: 60%">
					<div style="margin-top: 1em; margin-bottom: 1em;">
						<button style="width: 11em; height: 2.3em; font-size: 1.5em; font-weight: bold; border: solid; border-radius: 1em;">홈페이지 점검 모드</button>
					</div>
				</td>
				<td style="width: 20%">
				</td>
			</tr>
		</table>

	<%@ include file="/WEB-INF/views/include/include-body.jspf"%>
	
</body>
 
</html>
