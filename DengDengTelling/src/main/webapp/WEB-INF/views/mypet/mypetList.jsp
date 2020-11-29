<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<li class="selected" onclick="location.href = '/mypetList'">댕댕이
			자랑</li>
	</ul>
</div>


<div style="height: auto; border-top: solid;">
	<div
		style="height: auto; text-align: center; width: 100%; margin: 0 auto;">
		<div style="text-align: center; margin-top: 5em">
			<span style="font-weight: bold; font-size: 2em;">댕댕이 자랑 게시판</span>
		</div>
		<ul
			style="display: inline-block !important; margin: 0 auto; text-align: center; margin-top: 3em; width: 950px">
			<c:choose>
				<c:when test="${fn:length(mypetList) > 0}">
					<c:forEach items="${mypetList}" var="row">
						<li class="item_list" id="qwer">
							<a href="#this" name="subject" class="list"> 
								<img width="260px" height="220px" style="margin-bottom: 0.7em; object-fit: cover;"
									src="<%=cp%>/resources/images/board/${row.MAIN_IMG}" /></a> 
							<input type="hidden" id="MAIN_IMG" value="${row.MAIN_IMG }">
							<input type="hidden" id="BOARD_NO" value="${row.BOARD_NO}">
							<input type="hidden" id="currentPage" value="${currentPage}">
							<div class="explan" style="text-align: left;">
								<p>
									<span style="margin-left: 1em; margin-top: 0.6; font-size: 1.2em; font-weight: bold;">${row.MYPET_SUBJECT}</span>
								</p>
								<p>
									<span style="margin-left: 1em;">${row.MYPET_WRITER}</span>
								</p>
								<div style="background-color: #F4F4F4; width: 260px; height: 40px; position: relative; top: 1.1em;">
									<div style="position: relative; left: 1em; top: 0.5em;">
										<img src="resources/images/eye.PNG" style="width: 1.3em; position: relative; top: 0.1"> 
										<span style="position: relative; top: 0.2em;">${row.MYPET_COUNT}</span>
									</div>
									<div style="position: relative; left: 6em; bottom: 0.8em;">
										<img src="resources/images/time.PNG" style="width: 1.1em; position: relative; bottom: 0.1em;">
										<span>${row.MYPET_DATE}</span>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div style="font-size: 1.2em; font-weight: bold; margin-top: 3em; margin-bottom: 2em;">
						조회된 결과가 없습니다.
					</div>
				</c:otherwise>
			</c:choose>
		</ul>

		<c:if test="${ID != null || ADMIN_ID == row.ADMIN_ID}">
			<div id="asdf" style="padding-bottom: 3em;">
				<a href="#this" class="write" id="write">글쓰기</a>
			</div>
		</c:if>
		
		<c:if test="${fn:length(mypetList) > 0}">
			<div style="margin-top: 4em; margin-bottom: 3em;" class="paging">${pagingHtml}</div>
		</c:if>
		
		<form id="commonForm" name="common"></form>
	</div>
</div>

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
		comSubmit.setUrl("<c:url value='/mypetWriteForm' />") //이거 글작성으로 넘어가는거 위에랑 연결된다. 
		comSubmit.submit();
	}

	function fn_openBoardDetail(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/mypetDetail' />");
		comSubmit.addParam("BOARD_NO", obj.parent().find("#BOARD_NO").val());
		comSubmit.addParam("currentPage", "${currentPage}");
		comSubmit.submit();
	}
</script>


<style>
.item_list {
	border: 1px solid gray;
	height: 350px;
	margin-right: 2em;
	display: inline-block !important;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
	display: table;
	padding: 0;
}

.keyword {
	background-color: #649EE1;
	color: white;
	width: 3.5em;
	border-radius: 5px;
	height: 2.5em;
}

.write {
	position: relative;
	top: 6em;
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

.tab-box {
	top: 0;
}

.item_list {
	margin: 25px;
}

#asdf {
	top: 0;
	margin-bottom: 100px;
}

li {
	float: left;
	list-style: none;
}
</style>


<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>
</html>