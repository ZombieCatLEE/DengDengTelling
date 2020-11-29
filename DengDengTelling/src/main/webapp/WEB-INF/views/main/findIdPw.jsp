<!-- 2010.02.10 오후4:41 작성  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<script type="text/javascript">
	function fIdsubmit() {
		
		if(!$("#NAME").val()){
			alert("이름을 입력해주세요.");
			$("#NAME").focus();
			return false;
		}
		
		if(!$("#PHONE").val()){
			alert("연락처를 입력해주세요.");
			$("#PHONE").focus();
			return false;
		}
		formId.submit();

	}

	function fPwsubmit() {
		
		if(!$("#ID").val()){
			alert("아이디를 입력해주세요.");
			$("#ID").focus();
			return false;
		}
		
		if(!$("#BIRTHDAY").val()){
			alert("생년월일을 입력해주세요.");
			$("#BIRTHDAY").focus();
			return false;
		}
		
		if(!$("#PW_PHONE").val()){
			alert("연락처를 입력해주세요.");
			$("#PW_PHONE").focus();
			return false;
		}
		
		formPw.submit();

	}
</script>

<body>
	<div style="height: 700px;">

		<div class="findId">

			<form id="formId" method="post" action="findIdResult">
				<div style="text-align: center;">
					<div style="position: relative; right: 18em; margin-top: 3em">
						<span style="font-size: 1.5em">이름 :</span>
					</div>
					<div style="">
						<input type="text" name="NAME" id="NAME" placeholder="이름을 입력해주세요."
							style="width: 30em; position: relative;; bottom: 2em; margin-left: 3em">
					</div>
				</div>

				<div align = "center">
					<div style="position: relative; right: 18.9em; margin-top: 3em; ">
						<span style="font-size: 1.5em">연락처 : </span>
					</div>
					<div>
						<input type="number" id="PHONE" name="PHONE"
							placeholder="연락처를 입력해주세요."
							style="width: 30em; position: relative;; bottom: 2em;  margin-left: 3em">
					</div>
				</div>
			</form>

			<div style="text-align: center; position: relative;">
				<a href="#" onclick="fIdsubmit();"><button
						style="height: 2em; width: 10em;">ID 찾기</button></a>
			</div>
		</div>

		<div align="center" style="margin-top: 5em;">
			<hr width="55%">
		</div>

		<form id="formPw" method="post" action="findPwResult">
			<div style="text-align: center; margin-top: 5em">
				<div style="position: relative; right: 17em; margin-top: 3em">
					<span style="font-size: 1.5em">ID :</span>
				</div>
				<div>
					<input type="text" name="ID" id="ID" placeholder="ID을 입력해주세요."
						style="width: 30em; position: relative;; bottom: 2em;  margin-left: 3em">
				</div>
			</div>

			<div style="text-align: center;">
				<div style="position: relative; right: 19.2em; margin-top: 0.5em">
					<span style="font-size: 1.5em">생년월일 : </span>
				</div>
				<div>
					<input type="number" name="BIRTHDAY" id="BIRTHDAY"
						placeholder="생년월일 8자리를 입력해주세요. (예. 19900112)"
						style="width: 30em; position: relative;; bottom: 2em; margin-left: 3em">
				</div>
			</div>

			<div style="text-align: center;">
				<div style="position: relative; right: 18.5em; margin-top: 0.5em">
					<span style="font-size: 1.5em">연락처 : </span>
				</div>
				<div>
					<input type="number" name="PHONE" id="PW_PHONE"
						placeholder="연락처를 입력해주세요. (예. 000-0000-0000)"
						style="width: 30em; position: relative;; bottom: 2em; margin-left: 3em">
				</div>
			</div>
		</form>

		<div style="text-align: center; position: relative;">
			<a href="#" onclick="fPwsubmit();"><button
					style="height: 2em; width: 10em;">비밀번호 찾기</button></a>
		</div>
	</div>




<style>



 input[type="text"]
{
    border: none;
    border-bottom: 1px solid #1e5220;
    background: transparent;
    outline: none;
    color: #333;
    font-size: 16px;
}
    input[type="text"]:focus {
     outline: 0 !important;
 }


 input
{
    border: none;
    border-bottom: 1px solid #1e5220;
    background: transparent;
    outline: none;
    height: 40px;
    color: #333;
    font-size: 16px;
}
    input:focus {
     outline: 0 !important;
 }



	button{

	 background: #5483EC;
    color: #fff;
    font-size: 20px;
    font-weight:bold;
    padding: 7px 15px;
    border-radius: 20px;
    transition: 0.4s;
    border: none;

}

button:hover{
	cursor: pointer;
    background: #0B2564;
}
</style>



	<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

	<div
		style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-bottom-collapse: separate;"></div>
	<script type="text/javascript">
		WebFontConfig = {
			google : {
				families : [ 'Open+Sans', 'Open+Sans:700' ]
			}
		};
		(function() {
			var wf = document.createElement('script');
			wf.src = ('https:' == document.location.protocol ? 'https' : 'http')
					+ '://ajax.googleapis.com/ajax/libs/webfont/1.0.31/webfont.js';
			wf.type = 'text/javascript';
			wf.async = 'true';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(wf, s);
		})();
	</script>
</body>

</html>