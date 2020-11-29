<!-- 2010.02.10 오후4:41 작성  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<script type="text/javascript">
	function loginConfirm() {
		var form = document.login;

		if (form.ID.value == null || form.ID.value == '') {
			alert("아이디를 입력해주세요.")
			form.ID.focus();
			return false;
		}

		if (form.PASSWORD1.value == null || form.PASSWORD1.value == '') {
			alert("비밀번호를 입력해주세요.")
			form.PASSWORD1.focus();
			return false;
		}
		form.action = "/loginResult";
		form.submit();
	}

	function findIdPw() {
		var form = document.login;

		form.action = "/findIdPw";
		form.submit();
	}
	
	function enterkey() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
             loginConfirm();
        }
	}
</script>

<style>
</style>
<form id="login" name="login" method="POST">
	<div style="height: 600px; margin-top: 10em; ">
		<div align="center">
			
			<div style=" width: 30em; height:40em; box-shadow: 0 0 10px">
				<div style="border: solid;  border-radius:100px; border-color:gray; width:7em; height: 7em; text-align: center; position: relative; bottom: 4em; background: white">
					<img src="resources/images/login_img.png">
				</div>
				
				<div style="position: relative; bottom: 3em;">
					<span style="color:#5483EC; font-weight: bold; font-size: 2em">LOGIN</span>
				</div>
				<!-- 아이디 -->
				<div align="center" >
					<div style="position: relative; right: 8em; bottom:4em; margin-top: 3em">
						<span style="font-size: 1em; font-weight:bold; color:#5483EC;">아이디</span>
					</div>
					<div
						style="width: 20em; position: relative; right: ; bottom: 4em;">
						<input type="text" id="ID" name="ID" placeHolder="아이디를 입력해주세요."
							class="loginInput">
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
							type="password" id="PASSWORD1" name="PASSWORD1" onkeyup="enterkey();"
							placeHolder="비밀번호" class="loginInput">
					</div>
					<!-- 패스워드 -->
				</div>
				<div align="center">
					<div
						style="position: relative; bottom: ; text-align: center;">
						<button type="button" style=" height: 2em;  width: 15em; border-radius: 100px"
							class="loginBt" id="loginBt" onclick="loginConfirm()">로그인</button>
					</div>
					<div align="center">
						<div
							style="text-align: center; position: relative; top: 1em; right: 5em; width: 12em">
							<!-- <button style="height: 2em; width: 10em;" onclick="findIdPw()">ID/비밀번호
								찾기</button>
								 -->
								<a href="#" onclick="findIdPw()">비밀번호를 잊으셨나요?</a>
						</div>
						<div
							style="text-align: center; position: relative; top: 2em; right: 4.5em; width: 13em">
							<!-- <button style="height: 2em; width: 10em;"
								onclick="location.href = 'join.html' ">회원가입</button> -->
								
								<a href="#" onclick="location.href = '/joinPage'">아직 아이디가 없으신가요?</a>
								
						</div> 
					</div>
				</div>
			</div>
		</div>
	</div>
</form>


<style>
 input[type="text"], input[type="password"]
{
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


<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>