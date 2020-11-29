<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%-- <%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%> --%>

<style>
input[type="text"], input[type="password"] {
    border: none;
    border-bottom: 1px solid #1e5220;
    background: transparent;
    outline: none;
    height: 40px;
    color: #333;
    font-size: 16px;
}

.PASSWORD1:focus {
	outline: 0 !important;
}

.loginBt{
	background: #5483EC;
    color: #fff;
    font-size: 20px;
    font-weight:bold;
    padding: 7px 15px;
    border-radius: 20px;
    transition: 0.4s;
    border: none;
}

.loginBt:hover{
	cursor: pointer;
    background: #0B2564;
}

a {
    text-decoration: none;
    line-height: 20px;
    color: #0B2564;
    display: block;
    text-align: center;
    float: inherit !important;
}

a:hover {
    color: #7D9FF0;
}
</style>

<script type="text/javascript">
	function adminLoginConfirm() {
		var form = document.adminLogin;

		if (form.ADMIN_ID.value == null || form.ADMIN_ID.value == '') {
			alert("아이디를 입력해주세요.")
			form.ADMIN_ID.focus();
			return false;
		}

		if (form.ADMIN_PW.value == null || form.ADMIN_PW.value == '') {
			alert("비밀번호를 입력해주세요.")
			form.ADMIN_PW.focus();
			return false;
		}
		form.action = "/adminLoginResult";
		form.submit();
	}
	
	function enterkey() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
        	adminLoginConfirm();
        }
	}
</script>

<form id="adminLogin" name="adminLogin" method="POST">
	<div style="min-height: 600px; margin-top: 10em; margin-bottom: 3em;">
		<div align="center">
			
			<div style=" width: 30em; height: 30em; box-shadow: 0 0 10px">
				<div style="border: solid;  border-radius:100px; border-color:gray; width:7em; height: 7em; text-align: center; position: relative; bottom: 4em; background: white">
					<img src="resources/images/login_img.png">
				</div>
				
				<div style="position: relative; bottom: 3em;">
					<span style="color:#5483EC; font-weight: bold; font-size: 2em">ADMIN LOGIN</span>
				</div>
				<!-- 아이디 -->
				<div align="center" >
					<div style="position: relative; right: 8em; bottom:4em; margin-top: 3em">
						<span style="font-size: 1em; font-weight:bold; color:#5483EC;">아이디</span>
					</div>
					<div
						style="width: 20em; position: relative; right: ; bottom: 4em;">
						<input type="text" id="ADMIN_ID" name="ADMIN_ID" placeHolder="아이디"
							class="adminLoginInput">
					</div>
				</div>
				<!-- 아이디 -->
				<!-- 패스워드 -->
				<div style="position: relative; top: 1em">
					<div style="position: relative; right: 7.4em; margin-top: 1em; bottom: 4em;">
						<span style="font-size: 1em; font-weight:bold; color:#5483EC; ">비밀번호</span>
					</div>
					<div style="width: 20em; position: relative; right: ; bottom: 4em;">
						<input
							type="password" id="ADMIN_PW" name="ADMIN_PW" onkeyup="enterkey();"
							placeHolder="비밀번호" class="adminLoginInput">
					</div>
					<!-- 패스워드 -->
				</div>
				<div align="center">
					<div
						style="position: relative; bottom: ; text-align: center;">
						<button type="button" style=" height: 2em;  width: 15em; border-radius: 100px"
							class="loginBt" id="loginBt" onclick="adminLoginConfirm()">로그인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</html>