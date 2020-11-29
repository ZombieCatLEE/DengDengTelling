<!-- 지연 수정 2020.03.09 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>

<%
	String id = request.getParameter("pst_id");
%>

<script type="text/javascript">
	function fn_idCheck() {
		var ID = {
			ID : $('#PSMEM_ID').val()
		}; // {ID="입력한 ID값"}
		if (!$('#PSMEM_ID').val()) {
			alert("아이디를 입력해주세요");
			return false;
		}

		$.ajax({
			url : "<c:url value='/join/idCheck'/>",
			type : 'get',
			data : ID,
			success : function(data) {

				if ($.trim(data) == "") {
					$('#chkMsg').html("사용가능한 아이디 입니다.").css("color", "blue");
				} else {
					$('#chkMsg').html("사용불가능한 아이디 입니다.").css("color", "red");
				}
			},
			error : function() {
				alert("조회할 아이디를 입력해주세요.");
			}
		});
	};

	$(document).ready(function() {

		$("#cancel").on("click", function(e) {
			e.preventDefault();
			fn_goHome();
		});

		$("#join").on("click", function(e) {
			e.preventDefault();
			fn_joinSubmit();
		});
	});

	function fn_goHome() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/login' />");
		comSubmit.submit();
	}

	function fn_joinSubmit() {

		var comSubmit = new ComSubmit("joinForm");

		if (!$("#PSMEM_ID").val()) {
			alert("아이디를 입력해주세요.");
			$("#MEM_ID").focus();
			return false;
		}
		if ($("#chkMsg").html() != "사용가능한 아이디 입니다.") {
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
		if (!$("#PASSWORD1").val()) {
			alert("비밀번호를 입력해주세요.");
			$("#PASSWORD1").focus();
			return false;
		}
		if (!$("#PASSWORD2").val()) {
			alert("비밀번호 확인을 입력해주세요.");
			$("#PASSWORD2").focus();
			return false;
		}
		if (!$("#NAME").val()) {
			alert("이름을 입력해주세요.");
			$("#NAME").focus();
			return false;
		}
		if (!$("#PHONE").val()) {
			alert("연락처를 입력해주세요.");
			$("#PHONE").focus();
			return false;
		}

		var chkbox = document.getElementsByName("SEX");
		var chk = false;
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked) {
				chk = true;
			}
		}
		if (!chk) {
			alert("성별을 체크해주세요.");
			$("#SEX").focus(); //포커스 안 먹음
			return false;
		}
		
		if (!$("#BIRTHDAY").val()) {
			alert("생일을 입력해주세요.");
			$("#BIRTHDAY").focus();
			return false;
		}
		if (!$("#ZIPCODE").val()) {
			alert("우편번호를 입력해주세요.");
			$("#ZIPCODE").focus();
			return false;
		}
		if (!$("#ADDRESS1").val()) {
			alert("주소를 입력해주세요.");
			$("#ADDRESS1").focus();
			return false;
		}
		if(!$("#ADDRESS2").val()){
			alert("상세주소를 입력해주세요.");
			$("#ADDRESS2").focus();
			return false;
		}
		else {
			var id = joinForm.PSMEM_ID.value; //id값을 다음페이지에 넘겨준다. 
			joinForm.pst_id.value = id;

			alert("펫시터 가입이 완료되었습니다!\n추가정보 입력 페이지로 이동합니다.");

			comSubmit.setUrl("<c:url value='/joinPst1' />");
			comSubmit.submit();
			return false;
		}
	}

	$("#joinForm").on("submit", function(e) {
	});
	
	function inputPhoneNumber(obj) {

	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";

	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
	}
	
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		};
	}, true);
</script>

<!-- 회원가입 입력 시작 -->
<div align="center" style="height: auto; text-align: center; margin-top: 0.5em;">
	<div style="text-align: center; margin-top: 4em; margin-bottom: 3em;">
		<span style="font-size: 2em; font-weight: bold;">펫시터 회원 가입</span>
	</div>
	<div style="text-align: right; margin-top: 1em; margin-bottom: 3em; margin-right: 3em;">
		<span style="font-size: 1.1em;">* 표시는 필수 입력 사항입니다.</span>
	</div>

	<form action="joinPst1" id="joinForm" enctype="multipart/form-data" method="post">
		<table style="position: relative; width: 100%;">
			<tr style="height: 3em;">
				<td style="width: 20%; text-align: right; height: 3em;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">아이디*</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					<input type="text" id="PSMEM_ID" name="PSMEM_ID"
					 	maxlength="15" style="width: 10em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;">&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input type="hidden" name="pst_id" value="">
					 <input type="button" id="idCheckBtn" value="아이디중복확인" 
						 style="line-height: 1.9em; font-size: 0.9em; width: 8em; vertical-align: top; margin-bottom: 0.5em; border-radius: 0.5em;" 
						 onclick="fn_idCheck();">
				</td>
				<td style="width: 40%; text-align: center;">
					<span style="font-weight: bold; font-size: 1.2em;">프로필 사진 등록</span>
				</td>
			</tr>
			<tr>
				<td style="width: 20%; text-align: right;">
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					<span id="chkMsg" style="position: relative;"></span>
				</td>
			</tr>
			<tr style="height: 3em;">
				<td style="width: 20%; text-align: right; height: 3em;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">비밀번호*</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					<input type="password" name="PASSWORD1" id="PASSWORD1"
						maxlength="20" style="width: 10em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;">
				</td>
				<td class="imgs_wrap" style="text-align: center;" rowspan="5" >
					<img id="img" />
				</td>
			</tr>
			<tr style="height: 3em;">
				<td style="width: 20%; text-align: right; height: 3em;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">비밀번호 확인*</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					<input type="password" name="PASSWORD2" id="PASSWORD2"
							maxlength="20" style="width: 10em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;">
							&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="alert-success" style="display: none; color: blue; position: relative;">
						비밀번호가 일치합니다.
					</span> 
					<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; position: relative;">
						비밀번호가 일치하지 않습니다.
					</span>
				</td>
				<td style="width: 40%; text-align: center;">
				</td>
			</tr>
			<tr style="height: 3em;">
				<td style="width: 22%; text-align: right;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">이름*</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					<input type="text" name="NAME" id="NAME"
						style="width: 10em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;">
				</td>
				<td style="width: 40%; text-align: center;">
				</td>
			</tr>
			<tr style="height: 3em;">
				<td style="width: 22%; text-align: right;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">연락처*</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					<input type="text" name="PHONE" id="PHONE" onKeyup="inputPhoneNumber(this);" 
						maxlength="13" style="width: 10em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;">
				</td>
				<td style="width: 40%; text-align: center;">
				</td>
			</tr>
			<tr style="height: 3em;">
				<td style="width: 22%; text-align: right;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">이메일</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					<input type="text" name="EMAIL" id="EMAIL"
					style="width: 15em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;">
				</td>
				<td style="width: 40%; text-align: center;">
				</td>
			</tr>
			<tr style="height: 5em;">
				<td style="width: 22%; text-align: right;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">성별*</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					<label><input type="radio" id="SEX1" name="SEX" value="남">남자</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label><input type="radio" id="SEX2" name="SEX" value="여">여자</label>
				</td>
				<td style="width: 40%; text-align: center;">
					<a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 업로드</a>
					<input type="file" id="input_imgs" name="file" multiple />
				</td>
			</tr>
			<tr style="height: 5em;">
				<td style="width: 22%; text-align: right;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">생년월일*</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					<input type="text" placeholder="생년월일을 선택해주세요." type="text"
						name="BIRTHDAY" id="BIRTHDAY" class="flatpickr-input"
						style="width: 20em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;">
				</td>
				<td style="width: 40%; text-align: center;">
				</td>
			</tr>
			<tr style="height: 0.7em;">
			</tr>
			<tr style="height: auto;">
				<td style="width: 22%; text-align: right; vertical-align: text-top;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">주소*</span>
				</td>
				<td style="width: 78%; font-size: 1.1em; height: auto; text-align: left;" colspan="2">
					<button type="button" style="line-height: 1.9em; font-size: 0.9em; width: 8em; vertical-align: top; margin-bottom: 0.5em; border-radius: 0.5em;" onclick="openZipSearch()">우편번호 검색</button>
					<input type="text" name="ZIPCODE" id="ZIPCODE" style="line-height: 1.5em; font-size: 1.1em; width: 7em; border-radius: 0.5em;" placeholder="  우편번호"/><br/>
					<input type="text" name="ADDRESS1" id="ADDRESS1" style="line-height: 1.5em; font-size: 1.1em; width: 90%; margin-bottom: 0.5em; border-radius: 0.5em;"/>
					<input type="text" name="ADDRESS2" id="ADDRESS2" style="line-height: 1.5em; font-size: 1.1em; width: 60%; border-radius: 0.5em;" placeholder="  상세주소"/>
					<input type="text" name="ADDRESS_ADD" id="ADDRESS_ADD" style="line-height: 1.5em; font-size: 1.1em; width: 28%; border-radius: 0.5em;"/><br/>
				</td>
			</tr>
		</table>
		
		<div align="center" style="margin-top: 4em; margin-bottom: 2em;">
			<table>
				<tr>
					<th style="font-size: 1.1em; padding: 3em;">
						<button style="width: 13em; height: 3em; font-size: 1em; line-height: 1em;" class="my_button" id="cancel">처&nbsp;음&nbsp;으&nbsp;로</button>
					</th>
					<th style="font-size: 1.1em; padding: 3em;">
						<button style="width: 13em; height: 3em; font-size: 1em; line-height: 1em;" class="my_button" id="join">가&nbsp;입&nbsp;완&nbsp;료</button>
					</th>
				</tr>
			</table>
		</div>
	</form>

	<%@ include file="/WEB-INF/views/include/include-body.jspf"%>

</div>

<style type="text/css">
input[type=file] {
	display: none;
}

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

.imgs_wrap {
	width: 15em;
	height: 15em;
	margin-top: 30px;
	margin-bottom: 15px;
}

.imgs_wrap img {
	width: 300px;
	height: 300px;
	object-fit: cover; 
	border: solid; 
	border-radius: 1em;
}
</style>

<script type="text/javascript">
	//우편번호 검색
	function openZipSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("ADDRESS_ADD").value = extraAddr;

				} else {
					document.getElementById("ADDRESS_ADD").value = '';
				}

				document.getElementById("ZIPCODE").value = data.zonecode;
				document.getElementById("ADDRESS1").value = addr;
				document.getElementById("ADDRESS2").focus();
			}
		}).open();
	}

	//비밀번호 확인 
	$('#PASSWORD2').keyup(function() {
		var pwd1 = $("#PASSWORD1").val();
		var pwd2 = $("#PASSWORD2").val();
		if (pwd1 != "" && pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#empty").css('display', 'none');
				$("#alert-success").css('display', 'inline-block');
				$("#alert-danger").css('display', 'none');
			} else {
				//alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
				$("#empty").css('display', 'none');
				$("#alert-success").css('display', 'none');
				$("#alert-danger").css('display', 'inline-block');
			}
		}
	});
</script>

<!-- 이미지 업로드 관련 스크립트 -->
<script type="text/javascript" src="./js/jquery-3.1.0.min.js"
	charset="utf-8"></script>
<script type="text/javascript">
	// 이미지 정보들을 담을 배열
	var sel_files = [];

	$(document).ready(function() {
		$("#input_imgs").on("change", handleImgFileSelect);
	});

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}

	function handleImgFileSelect(e) {

		// 이미지 정보들을 초기화
		sel_files = [];
		$(".imgs_wrap").empty();

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var index = 0;
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}

					sel_files.push(f);

					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
						$(".imgs_wrap").append(html);
						index++;

					}
					reader.readAsDataURL(f);

				});
	}
</script>

<!-- flatpickr jQuery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Flatpickr -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
<!-- flatpickr -->
<script id="INLINE_PEN_JS_ID">
	$("#BIRTHDAY").flatpickr({
		mode : "single",
		dateFormat : "Y/m/d",
		maxDate : "today"
	});
</script>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>