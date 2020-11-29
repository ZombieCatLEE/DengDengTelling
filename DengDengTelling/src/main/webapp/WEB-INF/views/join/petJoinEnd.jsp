<!-- 지연 수정 2020.03.11-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<head>
<script type="text/javascript">
$(document).ready(function(){
	alert("모든 가입이 완료되었습니다!\n\n펫 추가 등록은\n마이페이지에서 하실 수 있습니다.\n\n메인으로 이동합니다.");
	location.href = "<c:url value='/main'/>";
});
</script>
</head>
