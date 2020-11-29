<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>
<script type="text/javascript" src="resources/js/common.js"></script>

<script type="text/javascript"> 

/* function fn_submit(id){	
	// alert(id);
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/myInfoDelete'/>");
	comSubmit.addParam("MEM_ID", id);
	comSubmit.submit();
}; */

// 매치 등록
function memDelete() {
	var form = document.matchDetail;

	form.action = "/myInfoDelete";
	form.submit();
}	
</script>

<!-- 회원탈퇴 -->
<div align="center" style="height: auto; text-align: center margin-top: 0.5em;">

	<div style="text-align: center; margin-top: 4em">
		<span style="font-size: 2em; font-weight: bold;">회원 탈퇴</span>
	</div>

	<div class="myPageDelete"> 
		<div class="info11">
			<div style="margin-top: 3em;">
				<p style="color: red; font-weight: bold; text-align: center;">*회원탈퇴를 신청하기 전에 아래 사항을 꼭 확인해주세요.*</p>
				<p style="text-align: center;">탈퇴 신청시 즉시 탈퇴 처리됩니다.</p>
				<p style="text-align: center;">탈퇴 전 작성된 게시물이나 댓글 등은 탈퇴 후에도 유지됩니다.</p>
				<p style="text-align: center;">게시물 삭제 등을 원하는 경우 반드시 삭제 처리 후 탈퇴를 신청해주세요.</p>
				<p style="text-align: center;">비밀번호 확인 후 탈퇴하기 버튼을 누르면 탈퇴가 진행됩니다.</p>
				<br />
			</div>
			<div class="pwd" align="center" style="text-align: center; margin-top:5em; margin-bottom:3em;">
		
			<form action="myInfoDelete" method="post" name="frm" id="frm">
				<p style= "position: relative; bottom: 3.5em;">비밀번호 확인</p>
				<div align="center">
					<input type="password" id="PASSWORD1" name="PASSWORD1" style="width: 15em; position: relative; bottom: 3.5em;">
				</div>
				<div align="center">
					<button class="my_button" style="width: 13em; height: 3em; font-size: 1.1em;" onclick="memDelete()">탈퇴하기</button>
					<input type="hidden" id="ID" name="ID" value="${ID}" />
					<input type="hidden" id="MEM_TYPE" name="MEM_TYPE" value="${MEM_TYPE}" />
				</div>
			</form>
			</div>
		</div>	
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){ }); 
</script>

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



<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>