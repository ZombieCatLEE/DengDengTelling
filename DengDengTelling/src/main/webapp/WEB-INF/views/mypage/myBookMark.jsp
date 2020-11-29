<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>
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

</head>

<body>
<div class="tab-box">
	<ul>
		<li onclick="location.href = '/MyInfodetail'">회원 정보</li>
		<li onclick="location.href = '/myPetList'">마이 펫</li>
		<li onclick="location.href = '/memMatchList'">매칭 내역</li>
		<li class="selected" onclick="location.href = '/myBookMark'">찜</li>
		<li onclick="location.href = '/warning'">이용 후기</li>
	</ul>
</div>

<form id="myBookmark" name="myBookMark">
	<div style="border-top: solid; position: relative; min-height: 600px" align="center" >
		<div style="text-align: center; margin-top: 4em; margin-bottom: 5em;">
			<span style="font-weight: bold; font-size: 2em;">내가 찜한 매칭</span>
		</div>

		<div align="center" style="width: 80em; position: relative; text-align: center;">
			<c:forEach var="list" items="${addList}">
				<div style="position: relative; height: 13.5em; border: solid; border-radius: 2em; margin-bottom: 2em;">
					<div class="post_column col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<div class="ttr_Training_html_column10">
							<div style="overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
							<div class="html_content" style="position: relative; margin-top: 0.5em; margin-bottom: 0.5em;">
								<p>
									<span style="text-align: center; cursor: pointer; bottom: 50em"
										onclick="window.open('bookmarkDetailGo?seq=${list.MATCH_NO}&&ID=${list.ID}', 'window', 'width=1320px, height=600px, scrollbars=yes')">
										<img
											src="resources/downimage/<c:out value='${list.IMAGE}'/>"
											style="width: 250; height: 150px; position: relative; object-fit: cover; border-radius: 2em;" />
									</span>
								</p>
							</div>
							<div
								style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
							<div style="clear: both;"></div>
						</div>
					</div>

					<div class="post_column col-lg-8 col-md-8 col-sm-8 col-xs-12">
						<div class="ttr_Training_html_column11">
							<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
							<div class="html_content" style="position: relative; right: 5em; margin-top: 15px;">
								<div style="position: relative; align-items: center; text-align: center; vertical-align: middle; width: 30em; margin-left: 1em;">
									<p>
										<span style="font-family: 'Arial'; font-weight: 700; font-size: 1.143em; color: #6E6E6E; position: relative; margin-">
											<c:out value="${list.ADDRESS}" />
										</span>
									</p>
									<p style="margin: 1em 0em 1em 0em;">
										<span style="font-family: 'Arial'; font-weight: bold; font-size: 2em; color: #2E2E2E; cursor: pointer;"
											onclick="window.open('bookmarkDetailGo?seq=${list.MATCH_NO}&&ID=${list.ID}', 'window', 'width=1320px, height=900px, scrollbars=yes')">
											<c:out value="${list.SUBJECT}" />
										</span>
									</p>
									<p style="margin: 0.71em 0em 0.36em 0em;">
										<span style="font-family: 'Arial'; font-weight: bold; font-size: 1.5em; color: #2E2E2E;">
											<c:out value="${list.CLASS}" />&nbsp;펫시터&nbsp;<c:out
												value="${list.NAME}" />&nbsp;님
										</span>
									</p>
									<p style="width: 53em; margin-top: 0.5em;">
										<c:forEach var="service" items="<c:out value='${list.SERVICE}'/>" end="6">
											<c:if test="${service == 'service01'}">
												<span style="color: rgba(5, 38, 55, 1);">#현재 반려동물 없음&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service02'}">
												<span style="color: rgba(5, 38, 55, 1);">#집 앞 픽업 가능&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service03'}">
												<span style="color: rgba(5, 38, 55, 1);">#대형견 예약 가능&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service04'}">
												<span style="color: rgba(5, 38, 55, 1);">#뛰어놀 마당 보유&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service05'}">
												<span style="color: rgba(5, 38, 55, 1);">#노견 집중 케어 가능&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service06'}">
												<span style="color: rgba(5, 38, 55, 1);">#14일 이상 돌봄 가능&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service07'}">
												<span style="color: rgba(5, 38, 55, 1);">#편한 실내 놀이 가능&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service08'}">
												<span style="color: rgba(5, 38, 55, 1);">#매일 근처 산책 가능&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service09'}">
												<span style="color: rgba(5, 38, 55, 1);">#댕댕이 목욕 가능&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service10'}">
												<span style="color: rgba(5, 38, 55, 1);">#약물 먹이기 가능&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service11'}">
												<span style="color: rgba(5, 38, 55, 1);">#어린 댕댕 집중 관리&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service12'}">
												<span style="color: rgba(5, 38, 55, 1);">#아파트 거주 중&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service13'}">
												<span style="color: rgba(5, 38, 55, 1);">#빌라 거주 중&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service14'}">
												<span style="color: rgba(5, 38, 55, 1);">#단독 주택 거주 중&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service15'}">
												<span style="color: rgba(5, 38, 55, 1);">#집중 케어가 가능해요&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service16'}">
												<span style="color: rgba(5, 38, 55, 1);">#집중 케어가 가능해요&nbsp;</span>
											</c:if>
											<c:if test="${service == 'service17'}">
												<span style="color: rgba(5, 38, 55, 1);">#댕댕 등록 대행 가능</span>
											</c:if>
										</c:forEach>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div style="position: relative; bottom: 10.5em; left: 52em; width: 25em; height: 6em;">
						<div style="position: relative; height: auto;">
							<p style="margin-top: 5px; margin-bottom: 3px; text-align: right">
								<b>대형견</b> : &nbsp;
								<span style="font-size: 1.2em; font-weight: bold; color: #084B8A;">
									<c:out value="${list.LARGE_ALL}" /></span>&nbsp;/&nbsp;맡김&nbsp;&nbsp;|&nbsp;&nbsp;
								<span style="font-size: 1.2em; font-weight: bold; color: #084B8A;">
									<c:out value="${list.LARGE_HALF}" /></span>&nbsp;/&nbsp;돌봄
							</p>
							<p style="margin-top: 5px; margin-bottom: 3px; text-align: right">
								<b>중형견</b> : &nbsp;
								<span style="font-size: 1.2em; font-weight: bold; color: #084B8A;">
									<c:out value="${list.MEDIUM_ALL}" /></span>&nbsp;/&nbsp;맡김&nbsp;&nbsp;|&nbsp;&nbsp;
								<span style="font-size: 1.2em; font-weight: bold; color: #084B8A;">
									<c:out value="${list.MEDIUM_ALL}" /></span>&nbsp;/&nbsp;돌봄
							</p>
							<p style="margin-top: 5px; margin-bottom: 3px; text-align: right">
								<b>소형견</b> : &nbsp;
								<span style="font-size: 1.2em; font-weight: bold; color: #084B8A;">
									<c:out value="${list.SMALL_ALL}" /></span>&nbsp;/&nbsp;맡김&nbsp;&nbsp;|&nbsp;&nbsp;
								<span style="font-size: 1.2em; font-weight: bold; color: #084B8A;">
									<c:out value="${list.SMALL_ALL}" /></span>&nbsp;/&nbsp;돌봄
							</p>
						</div>
					</div>
				</div>
			</c:forEach>

			<c:if test="${fn:length(addList) le 0}">
				<!-- noList가 0보다 작거나 같으면 -->
				<div align="center">
					<div style="position: relative;">
						<font style="text-align: center; font-size: 1.3em;"><b>등록된 찜이 없습니다.</b></font>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</form>
</body>

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