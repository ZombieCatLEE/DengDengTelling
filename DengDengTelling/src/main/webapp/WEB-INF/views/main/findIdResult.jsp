<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기 결과</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>
</head>

<body>
	<div class="result"
		style="height: 400px; margin-top: 12em; margin-bottom: 6em; text-align: center;">
		<c:if test="${id.ID==null || id.ID==''}">
			<span style="font-size: 1.5em; font-weight: bold">조회된 아이디가 없습니다.</span>
		</c:if>
		<c:if test="${id.ID!=null && id.ID!=''}">
			<span style="font-size: 1.5em; font-weight: bold">입력하신 정보로 등록된 아이디는 '${id.ID}'입니다.</span>
		</c:if>
		<br> <a href="#" onclick="javascript:history.go(-1);" class="btn">뒤로가기</a>
		<!-- <a href="#" onclick="javascript:window.close();" class="btn">닫기</a> -->
	</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</body>
</html>