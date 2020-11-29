<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>
<script type="text/javascript" src="resources/js/common.js"></script>
 
 <div align="center">
<c:if test="${res==0}">
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${res==1}">
	<div style="width: 80%; height: auto; min-height: 600px; padding-top: 10em; padding-bottom: 10em;">
		<p><span style="font-size: 2em; font-weight: bold;">회원탈퇴가 완료되었습니다.</span></p>
		<p><button type="button" onclick="location.href='main'" style="width: 200px; font-size: 1.2em; text-align: center; padding: 10px; background-color: #006BCC; color: #fff; text-decoration: none; border-radius: 5px; margin-top: 5em;">메인으로</button></p>
	</div>
</c:if>
</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf" %>

</html>