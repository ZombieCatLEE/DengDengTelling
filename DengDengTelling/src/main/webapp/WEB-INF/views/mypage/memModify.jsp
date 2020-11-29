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

	//엔터 누를 시 이벤트 발생 방지
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		};
	}, true);

	function memModifySave() {
		var form = document.memModifyForm;
		if (form.PASSWORD1.value == null || form.PASSWORD1.value == '') {
			alert("비밀번호를 입력해주세요.")
			form.PASSWORD1.focus();
			return false;
		}
		if (form.PASSWORD2.value == null || form.PASSWORD2.value == '') {
			alert("비밀번호 확인을 입력해주세요.")
			form.PASSWORD2.focus();
			return false;
		}
		form.action = "/memInfoModify";
		form.submit();
	}	
	
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
	
	//연락처 - 자동 입력
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
	
	function refreshParent() {
		opener.parent.location="/MyInfodetail";
		opener.document.location.href="/MyInfodetail";
		opener.parent.location.reload();
		
		window.close();
	}
</script>

</head>

<body onunload="refreshParent();">

<!-- 회원정보 -->
<form id="memModifyForm" name="memModifyForm" method="post" enctype="multipart/form-data">
	<div align="center" style="height: auto; text-align: center; margin-top: 0.5em;">
		<div style="text-align: center; margin-top: 4em; margin-bottom: 3em;">
			<span style="font-size: 2em; font-weight: bold;">회원 정보 수정</span>
		</div>
		<div style="text-align: right;; margin-top: 1em; margin-bottom: 3em; margin-right: 3em;">
			<span style="font-size: 1.1em;">* 표시는 필수 입력 사항입니다.</span>
		</div>
		<table style="position: relative; width: 100%;">
			<tr style="height: 3em;">
				<td style="width: 20%; text-align: right; height: 3em;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">아이디</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					${map.MEM_ID}
				</td>
				<td style="width: 40%; text-align: center;">
					<span style="font-weight: bold; font-size: 1.2em;">프로필</span>
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
					<c:if test="${path != null}">
						<img id="img" style="object-fit: cover; width: 300px; height: 300px; border: solid; border-radius: 1em;" src="/resources/downimage/${path}" />
					</c:if>
					<c:if test="${path == null}">
						<img id="img" style="object-fit: cover; width: 300px; height: 300px; border: solid; border-radius: 1em;" src="/resources/images/blank.jpg" />
					</c:if>
				</td>
			</tr>
			<tr style="height: 3em;">
				<td style="width: 20%; text-align: right; height: 3em;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">비밀번호 확인*</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					<input type="password" name="PASSWORD2" id="PASSWORD2"
							maxlength="20" style="width: 10em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;">
				</td>
				<td style="width: 40%; text-align: center;">
				</td>
			</tr>
			<tr style="height: 3em;">
				<td style="width: 22%; text-align: right;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">이름</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					${map.NAME}
				</td>
				<td style="width: 40%; text-align: center;">
				</td>
			</tr>
			<tr style="height: 3em;">
				<td style="width: 22%; text-align: right;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">연락처</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					<input type="text" name="PHONE" id="PHONE" onKeyup="inputPhoneNumber(this);" 
						maxlength="13" style="width: 10em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;"
						value="${map.PHONE}">
				</td>
				<td style="width: 50%; text-align: center;">
				</td>
			</tr>
			<tr style="height: 3em;">
				<td style="width: 22%; text-align: right;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">이메일</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					<input type="text" name="EMAIL" id="EMAIL" value="${map.EMAIL}"
					style="width: 15em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;">
				</td>
				<td style="width: 40%; text-align: center;">
				</td>
			</tr>
			<tr style="height: 3em;">
				<td style="width: 22%; text-align: right;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">성별</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					${map.SEX} 
				</td>
				<td style="width: 40%; text-align: center;">
					<a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 수정</a>
					<input type="file" id="input_imgs" name="file" multiple />
					<input type="hidden" id="PROFILE_NO" name="PROFILE_NO" value="${map1.PROFILE_NO}">
				</td>
			</tr>
			<tr style="height: 3em;">
				<td style="width: 22%; text-align: right;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">생년월일</span>
				</td>
				<td style="width: 38%; font-size: 1.1em; text-align: left;">
					${map.BIRTHDAY}
				</td>
				<td style="width: 40%; text-align: center;">
				</td>
			</tr>
			<tr style="height: 0.7em;">
			</tr>
			<tr style="height: 3em;">
				<td style="width: 22%; text-align: right; vertical-align: text-top;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">주소</span>
				</td>
				<td style="width: 78%; font-size: 1.1em; height: auto; text-align: left;" colspan="2">
					<c:if test="${map.ZIPCODE == null || map.ZIPCODE == '' }">
						<button type="button" style="line-height: 1.9em; font-size: 0.9em; width: 8em; vertical-align: top; margin-bottom: 0.5em; border-radius: 0.5em;" onclick="openZipSearch()">우편번호 검색</button>
						<input type="text" name="ZIPCODE" id="ZIPCODE" style="line-height: 1.5em; font-size: 1.1em; width: 7em; border-radius: 0.5em;" placeholder="  우편번호"/><br/>
						<input type="text" name="ADDRESS1" id="ADDRESS1" style="line-height: 1.5em; font-size: 1.1em; width: 90%; margin-bottom: 0.5em; border-radius: 0.5em;"/>
						<input type="text" name="ADDRESS2" id="ADDRESS2" style="line-height: 1.5em; font-size: 1.1em; width: 60%; border-radius: 0.5em;" placeholder="  상세주소"/>
						<input type="text" name="ADDRESS_ADD" id="ADDRESS_ADD" style="line-height: 1.5em; font-size: 1.1em; width: 28%; border-radius: 0.5em;"/><br/>
					</c:if>
					<c:if test="${map.ZIPCODE != null || !map.ZIPCODE == '' }">
						<button type="button" style="line-height: 1.9em; font-size: 0.9em; width: 8em; vertical-align: top; margin-bottom: 0.5em; border-radius: 0.5em;" onclick="openZipSearch()">우편번호 검색</button>
						<input type="text" name="ZIPCODE" id="ZIPCODE" style="line-height: 1.5em; font-size: 1.1em; width: 7em; border-radius: 0.5em;" placeholder="우편번호" value="${map.ZIPCODE}"/><br/>
						<input type="text" name="ADDRESS1" id="ADDRESS1" style="line-height: 1.5em; font-size: 1.1em; width: 90%; margin-bottom: 0.5em; border-radius: 0.5em;" value="${map.ADDRESS1}"/>
						<input type="text" name="ADDRESS2" id="ADDRESS2" style="line-height: 1.5em; font-size: 1.1em; width: 60%; border-radius: 0.5em;" placeholder="상세주소" value="${map.ADDRESS2}"/>
						<input type="text" name="ADDRESS_ADD" id="ADDRESS_ADD" style="line-height: 1.5em; font-size: 1.1em; width: 28%; border-radius: 0.5em;" value="${map.ADDRESS_ADD}"/><br/>
					</c:if>
				</td>
			</tr>
		</table>

		<div align="center" style="margin-top: 4em; margin-bottom: 2em;">
			<table>
				<tr>
					<th style="font-size: 1.1em; padding: 3em;">
						<button style="width: 13em; height: 3em; font-size: 1em; line-height: 1em;" class="my_button" onclick="window.close();">취&nbsp;&nbsp;&nbsp;&nbsp;소</button>
					</th>
					<th style="font-size: 1.1em; padding: 3em;">
						<button style="width: 13em; height: 3em; font-size: 1em; line-height: 1em;" class="my_button" id="modify" onclick="memModifySave()">저&nbsp;&nbsp;&nbsp;&nbsp;장</button>
					</th>
				</tr>
			</table>
		</div>
	</div>
</form>

</body>

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
		new daum.Postcode(
				{
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
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
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
</script>

<!-- 이미지 업로드 관련 스크립트 -->
<script type="text/javascript" src="./js/jquery-3.1.0.min.js" charset="utf-8"></script>
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
		filesArr.forEach(function(f) {
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

</html>