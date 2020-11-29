<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title></title>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript"> 
	//새로고침 막는 스크립트
	function noEvent() {
		if (event.keyCode == 116) {
			event.keyCode = 2;
			return false;
		} else if (event.ctrlKey
				&& (event.keyCode == 78 || event.keyCode == 82)) {
			return false;
		}
	}
	document.onkeydown = noEvent;
	
	//엔터키 누를 시 이벤트 막기
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		};
	}, true);
	
	//회원 탈퇴
	function memDelete() {
		var form = document.frm;

		form.action = "/deleteAdmin";
		form.submit();
	}
	
	function refreshParent() {
		opener.parent.location="/adminMain";
		opener.document.location.href="/adminMain";
		opener.parent.location.reload();
		
		window.close();
	}
</script>

</head>

<body onunload="refreshParent();">
	<!-- 회원탈퇴 -->
	<div align="center" style="height: auto; text-align: center margin-top: 0.5em;">
	
		<div style="text-align: center; margin-top: 4em">
			<span style="font-size: 2em; font-weight: bold;">회원 탈퇴</span>
		</div>
	
		<div class="myPageDelete"> 
			<div class="info11">
				<div style="margin-top: 3em;">
					<p style="color: red; font-weight: bold; text-align: center;">*회원탈퇴를 누르시기 전에 아래 사항을 꼭 확인해주세요.*</p>
					<p style="text-align: center;">탈퇴 신청시 즉시 탈퇴 처리됩니다.</p>
					<p style="text-align: center;">탈퇴 전 작성된 게시물이나 댓글 등은 탈퇴 후에도 유지됩니다.</p>
					<p style="text-align: center;">게시물 삭제 등을 원하는 경우 따로 게시글을 찾아 삭제하시길 바랍니다.</p>
					<p style="text-align: center;"><br>정말로 회원을 탈퇴시키시려면  [회원 탈퇴] 버튼을 눌러주세요.</p>
					<br />
				</div>
				<div class="pwd" align="center" style="text-align: center; margin-top:5em; margin-bottom:3em;">
					<form name="frm" id="frm">
						<div align="center">
							<button class="my_button" style="width: 13em; height: 3em; font-size: 1.1em;" onclick="memDelete()">회원 탈퇴</button>
							<input type="hidden" id="id" name="id" value="${id}" />
							<input type="hidden" id="type" name="type" value="${type}" />
							<input type="hidden" id="pass" name="pass" value="${pass}" />
						</div>
					</form>
				</div>
			</div>	
		</div>
	</div>
</body>

<style type="text/css">
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
