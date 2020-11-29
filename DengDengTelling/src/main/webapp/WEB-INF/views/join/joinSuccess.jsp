<!-- 지연 수정 2020.03.06 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>
<script>
	function insertPetInfo() {
		var form = document.joinSuccess;
		
		form.action = "/petRegisterForm";
		form.submit();
	}
	
	function main() {
		var form = documnet.joinSuccess;
		
		form.action = "/main";
		form.submit();
	}
</script>

<div style="height: 800px; min-height: 600px;">
	<form id="joinSuccess" name="joinSuccess">
	<div style="text-align: center; padding-top: 15em;">
		<span style="font-weight: bold; font-size: 3em">${NAME} 님의 가입을 환영합니다!</span>
		<input type="hidden" name="ID" id="ID" value="${Result_ID}"/>
	</div>
	<div style="text-align: center; margin-top: 3em">
		<!-- <button class="my_button" style="width: 13em; height: 3em; font-size: 1.1em;" onclick="location.href='login'">메인으로</button> -->
		<button class="my_button" style="width: 15em; height: 3em; margin-left:2em; font-size: 1.2em;" onclick="insertPetInfo()">펫 등록 하러가기</button>
	</div>
	</form>
</div> 

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

<style>
.my_button {
	display: inline-block;
	width: 200px;
	text-align: center;
	padding: 10px;
	background-color: #006BCC;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}
</style>
</html>