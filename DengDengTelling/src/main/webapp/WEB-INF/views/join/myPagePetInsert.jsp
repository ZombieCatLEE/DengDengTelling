<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title></title>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	function petJoinSave() {
		var form = document.petJoinForm;

		if(!$("#PET_MEM_NAME").val()){
			alert("이름을 입력해주세요.");
			$("#PET_MEM_NAME").focus();
			return false;
		}
		var chkbox = form.PET_MEM_SEX; 
		var chk = false; 
		for(var i = 0; i < chkbox.length; i++) { 
			if(chkbox[i].checked) { 
				chk = true; 
				} 
		}
		if(!chk) { 
			alert("성별을 체크해주세요.")
			$("#PET_MEM_SEX1").focus();
			return false;
		}
		if(!$("#PET_MEM_KIND").val()){
			alert("견종을 입력해주세요.");
			$("#PET_MEM_KIND").focus();
			return false;
		}
		if(!$("#PET_MEM_SIZE").val()){
			alert("크기를 입력해주세요.");
			$("#PET_MEM_SIZE").focus();
			return false;
		}
		if(!$("#PET_MEM_WEIGHT").val()){
			alert("무게를 입력해주세요.");
			$("#PET_MEM_WEIGHT").focus();
			return false;
		}
		if(!$("#PET_MEM_AGE").val()){
			alert("나이를 입력해주세요.");
			$("#PET_MEM_AGE").focus();
			return false;
		}
		var chkbox1 = form.PET_MEM_SEX_CHECK; 
		var chk = false; 
		for(var i=0 ; i<chkbox1.length ; i++) { 
			if(chkbox1[i].checked) { 
				chk = true; 
			} 
		}
		if(!chk) { 
			alert("중성화 여부에 체크해주세요.")
			$("#PET_MEM_SEX_CHECK1").focus();
			return false;
		}
		var chkbox2 = form.PET_MEM_CASE; 
		var chk = false; 
		for(var i=0 ; i<chkbox2.length ; i++) { 
			if(chkbox2[i].checked) { 
				chk = true; 
				} 
		}
		if(!chk) { 
			alert("병력 여부에 체크해주세요.");
			$("#PET_MEM_CASE1").focus();
			return false;
		}
		var imgChk = form.input_imgs.files[0];
		if(imgChk == null) {
			alert("프로필 사진을 등록해주세요.");
			return false;
		}
		
		var chkbox1 = document.getElementsByName('PET_MEMBER_ADD_RESPONSE');
		var chk = false;
		for (var i = 0; i < chkbox1.length; i++) {
			if (chkbox1[i].checked) {
				chk = true;
			}
		}
		if (!chk) {
			alert("1번 항목에 체크해주세요.");
			form.PET_MEMBER_ADD_RESPONSE1.focus();
			return false;
		}

		var chkbox2 = document.getElementsByName('PET_MEMBER_ADD_HUMAN');
		var chk = false;
		for (var i = 0; i < chkbox2.length; i++) {
			if (chkbox2[i].checked) {
				chk = true;
			}
		}
		if (!chk) {
			alert("2번 항목에 체크해주세요.");
			form.PET_MEMBER_ADD_HUMAN1.focus();
			return false;
		}

		var chkbox3 = document.getElementsByName('PET_MEMBER_ADD_BARK');
		var chk = false;
		for (var i = 0; i < chkbox3.length; i++) {
			if (chkbox3[i].checked) {
				chk = true;
			}
		}
		if (!chk) {
			alert("3번 항목에 체크해주세요.");
			form.PET_MEMBER_ADD_BARK1.focus();
			return false;
		}

		var chkbox4 = document.getElementsByName('PET_MEMBER_ADD_TRAINING');
		var chk = false;
		for (var i = 0; i < chkbox4.length; i++) {
			if (chkbox4[i].checked) {
				chk = true;
			}
		}
		if (!chk) {
			alert("4번 항목에 체크해주세요.");
			form.PET_MEMBER_ADD_TRAINING1.focus();
			return false;
		}

		var chkbox5 = document.getElementsByName('PET_MEMBER_ADD_DDONG_STYLE');
		var chk = false;
		for (var i = 0; i < chkbox5.length; i++) {
			if (chkbox5[i].checked) {
				chk = true;
			}
		}
		if (!chk) {
			alert("5번 항목에 체크해주세요.");
			form.PET_MEMBER_ADD_DDONG_STYLE1.focus();
			return false;
		}

		var chkbox6 = document.getElementsByName('PET_MEMBER_ADD_SHARP_BODY');
		var chk = false;
		for (var i = 0; i < chkbox6.length; i++) {
			if (chkbox6[i].checked) {
				chk = true;
			}
		}
		if (!chk) {
			alert("6번 항목에 체크해주세요.");
			form.PET_MEMBER_ADD_SHARP_BODY1.focus();
			return false;
		}

		var chkbox7 = document.getElementsByName('PET_MEMBER_ADD_ATTACK');
		var chk = false;
		for (var i = 0; i < chkbox7.length; i++) {
			if (chkbox7[i].checked) {
				chk = true;
			}
		}
		if (!chk) {
			alert("7번 항목에 체크해주세요.");
			form.PET_MEMBER_ADD_ATTACK1.focus();
			return false;
		}

		var chkbox8 = document.getElementsByName('PET_MEMBER_ADD_VACCINATION');
		var chk = false;
		for (var i = 0; i < chkbox8.length; i++) {
			if (chkbox8[i].checked) {
				chk = true;
			}
		}
		if (!chk) {
			alert("8번 항목에 체크해주세요.");
			form.PET_MEMBER_ADD_VACCINATION1.focus();
			return false;
		}

		form.action = "/petRegister";
		form.submit();
	}

	//이 부분은 왜 추가된거지?
	/* $(document).ready(function(){
		$('input[type="checkbox"][name="PET_MEM_SEX_CHECK"]').click(function(){
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="PET_MEM_SEX_CHECK"]').prop('checked',false);
				$(this).prop('checked',true);
			}
		});
	});
	
	$(document).ready(function(){
		$('input[type="checkbox"][name="PET_MEM_CASE"]').click(function(){
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="PET_MEM_CASE"]').prop('checked',false);
				$(this).prop('checked',true);
			}
		});
	});

	$(document).ready(function() {
		$('input[type="checkbox"][name="PET_MEMBER_ADD_RESPONSE"]').click(function() {
			if ($(this).prop('checked')) {
				$('input[type="checkbox"][name="PET_MEMBER_ADD_RESPONSE"]').prop('checked', false);
					$(this).prop('checked', true);
			}
		});
	});

	$(document).ready(function() {
		$('input[type="checkbox"][name="PET_MEMBER_ADD_HUMAN"]').click(function() {
			if ($(this).prop('checked')) {
				$('input[type="checkbox"][name="PET_MEMBER_ADD_HUMAN"]').prop('checked', false);
					$(this).prop('checked', true);
			}
		});
	});

	$(document).ready(function() {
		$('input[type="checkbox"][name="PET_MEMBER_ADD_BARK"]').click(function() {
			if ($(this).prop('checked')) {
				$('input[type="checkbox"][name="PET_MEMBER_ADD_BARK"]').prop('checked', false);
					$(this).prop('checked', true);
			}
		});
	});

	$(document).ready(function() {
		$('input[type="checkbox"][name="PET_MEMBER_ADD_TRAINING"]').click(function() {
			if ($(this).prop('checked')) {
				$('input[type="checkbox"][name="PET_MEMBER_ADD_TRAINING"]').prop('checked', false);
					$(this).prop('checked', true);
			}
		});
	});

	$(document).ready(function() {
		$('input[type="checkbox"][name="PET_MEMBER_ADD_DDONG_STYLE"]').click(function() {
			if ($(this).prop('checked')) {
				$('input[type="checkbox"][name="PET_MEMBER_ADD_DDONG_STYLE"]').prop('checked', false);
					$(this).prop('checked', true);
			}
		});
	});

	$(document).ready(function() {
		$('input[type="checkbox"][name="PET_MEMBER_ADD_SHARP_BODY"]').click(function() {
			if ($(this).prop('checked')) {
				$('input[type="checkbox"][name="PET_MEMBER_ADD_SHARP_BODY"]').prop('checked', false);
					$(this).prop('checked', true);
			}
		});
	});

	$(document).ready(function() {
		$('input[type="checkbox"][name="PET_MEMBER_ADD_ATTACK"]').click(function() {
			if ($(this).prop('checked')) {
				$('input[type="checkbox"][name="PET_MEMBER_ADD_ATTACK"]').prop('checked', false);
					$(this).prop('checked', true);
			}
		});
	});

	$(document).ready(function() {
		$('input[type="checkbox"][name="PET_MEMBER_ADD_VACCINATION"]').click(function() {
			if ($(this).prop('checked')) {
				$('input[type="checkbox"][name="PET_MEMBER_ADD_VACCINATION"]').prop('checked', false);
					$(this).prop('checked', true);
			}
		});
	}); */

	//연락처 하이픈 자동 입력
	function inputPhoneNumber(obj) {

		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = "";

		if (number.length < 4) {
			return number;
		} else if (number.length < 7) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3);
		} else if (number.length < 11) {
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
	<form name="petJoinForm" id="petJoinForm" enctype="multipart/form-data" method="post" onsubmit="return false;">
		<!-- 댕댕이정보 입력 시작 -->
		<div align="center" style="height: auto;">
			<div style="text-align: center; margin-top: 4em">
				<span style="font-size: 2em; font-weight: bold;">댕댕이 등록</span>
				<div style="text-align: center; margin-top: 1em">
					<span style="font-size: 1em; position: relative; right: 10.5em;"></span>
				</div>
			</div>
			<div
				style="text-align: right;; margin-top: 1em; margin-bottom: 3em; margin-right: 3em;">
				<span style="font-size: 1.1em;">* 표시는 필수 입력 사항입니다.</span>
			</div>
			<input type="hidden" name="ID" value="${ID}" />
			<table style="position: relative; width: 100%;">
				<tr style="height: 3em;">
					<td style="width: 20%; text-align: right;"><span
						style="font-weight: bold; margin-right: 2em; font-size: 1.2em">이름*</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;"><input type="text"
						name="PET_MEM_NAME" id="PET_MEM_NAME"
						style="width: 6em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;" />
					</td>
					<td style="width: 40%; text-align: center;"><span
						style="font-weight: bold; font-size: 1.2em;">프로필</span></td>
				</tr>
				<tr style="height: 5em;">
					<td style="width: 22%; text-align: right;"><span
						style="font-weight: bold; margin-right: 2em; font-size: 1.2em">성별*</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;"><label
						style="margin-right: 3em;"> <input type="radio"
							name="PET_MEM_SEX" id="PET_MEM_SEX1" value="M"
							style="position: relative;"> 남아
					</label> <label> <input type="radio" name="PET_MEM_SEX"
							id="PET_MEM_SEX2" value="F" style="position: relative;">
							여아
					</label></td>
					<td class="imgs_wrap" style="text-align: center;" rowspan="5">
						<img id="img"
						style="object-fit: cover; width: 300px; height: 300px; border: solid; border-radius: 2em;" />
					</td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;"><span
						style="font-weight: bold; margin-right: 2em; font-size: 1.2em">견종*</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;"><input type="text"
						name="PET_MEM_KIND" id="PET_MEM_KIND"
						style="width: 15em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="my_button"
							style="width: 6em; font-size: 1em;"
							onclick="window.open('petSearch', 'popup', 'width=600px, height=500px, scrollbars=yes')">견종
							검색</button></td>
					<td style="width: 40%; text-align: center;"></td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;"><span
						style="font-weight: bold; margin-right: 2em; font-size: 1.2em">크기*</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;"><input type="text"
						name="PET_MEM_SIZE" id="PET_MEM_SIZE"
						style="width: 6em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;" />
					</td>
					<td style="width: 40%; text-align: center;"></td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;"><span
						style="font-weight: bold; margin-right: 2em; font-size: 1.2em">몸무게*</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;"><input type="text"
						name="PET_MEM_WEIGHT" id="PET_MEM_WEIGHT"
						style="width: 3em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;" /><b>&nbsp;Kg</b>
					</td>
					<td style="width: 40%; text-align: center;"></td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;"><span
						style="font-weight: bold; margin-right: 2em; font-size: 1.2em">등록번호</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;"><input type="text"
						name="PET_NO" id="PET_NO"
						style="width: 15em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;" />
					</td>
					<td style="width: 40%; text-align: center;"></td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;"><span
						style="font-weight: bold; margin-right: 2em; font-size: 1.2em">나이*</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;"><input type="text"
						name="PET_MEM_AGE" id="PET_MEM_AGE"
						style="width: 3em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;" /><b>&nbsp;살</b>
					</td>
					<td style="width: 40%; text-align: center;"><a
						href="javascript:" onclick="fileUploadAction();" class="my_button">파일
							수정</a> <input type="file" id="input_imgs" name="file" multiple /></td>
				</tr>
				<tr style="height: 5em;">
					<td style="width: 22%; text-align: right;"><span
						style="font-weight: bold; margin-right: 2em; font-size: 1.2em">중성화*</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;"><label
						style="margin-right: 3em;"> <input type="radio"
							name="PET_MEM_SEX_CHECK" id="PET_MEM_SEX_CHECK1" value="Y"
							style="position: relative;"> 예&nbsp;&nbsp;&nbsp;&nbsp;
					</label> <label> <input type="radio" name="PET_MEM_SEX_CHECK"
							id="PET_MEM_SEX_CHECK2" value="N" style="position: relative;">
							아니오
					</label></td>
					<td style="width: 40%; text-align: center;"></td>
				</tr>
				<tr style="height: 5em;">
					<td style="width: 22%; text-align: right;"><span
						style="font-weight: bold; margin-right: 2em; font-size: 1.2em">병력*</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;"><label
						style="margin-right: 3em;"> <input type="radio"
							name="PET_MEM_CASE" id="PET_MEM_CASE1" value="Y"
							style="position: relative;"> 유&nbsp;&nbsp;&nbsp;&nbsp;
					</label> <label> <input type="radio" name="PET_MEM_CASE" value="N"
							id="PET_MEM_CASE2" style="position: relative;"> 무
					</label></td>
					<td style="width: 40%; text-align: center;"></td>
				</tr>
				<tr style="height: 0.7em;">
				</tr>
				<tr>
					<td
						style="width: 22%; text-align: right; vertical-align: text-top;">
						<span
						style="font-weight: bold; margin-right: 2em; font-size: 1.2em;">주치병원</span>
					</td>
					<td style="width: 78%; font-size: 1.1em; height: auto;" colspan="2">
						<button type="button"
							style="line-height: 1.9em; font-size: 0.9em; width: 8em; vertical-align: top; margin-bottom: 0.5em; border-radius: 0.5em;"
							onclick="openZipSearch()">우편번호 검색</button> <input type="text"
						name="PET_MEM_ZIPCODE" id="PET_MEM_ZIPCODE"
						style="line-height: 1.5em; font-size: 1.1em; width: 7em; border-radius: 0.5em;"
						placeholder="  우편번호" /><br /> <input type="text"
						name="PET_MEM_ADDRESS1" id="PET_MEM_ADDRESS1"
						style="line-height: 1.5em; font-size: 1.1em; width: 90%; margin-bottom: 0.5em; border-radius: 0.5em;" />
						<input type="text" name="PET_MEM_ADDRESS2" id="PET_MEM_ADDRESS2"
						style="line-height: 1.5em; font-size: 1.1em; width: 60%; border-radius: 0.5em;"
						placeholder="  상세주소" /> <input type="text"
						name="PET_MEM_ADDRESS_ADD" id="PET_MEM_ADDRESS_ADD"
						style="line-height: 1.5em; font-size: 1.1em; width: 28%; border-radius: 0.5em;" /><br />
					</td>
					<td style="width: 40%; text-align: center;"></td>
				</tr>
				<tr style="height: 0.7em;">
				</tr>
				<tr>
					<td style="width: 22%; text-align: right;"><span
						style="font-weight: bold; margin-right: 2em; font-size: 1.2em">병원
							연락처</span></td>
					<td style="width: 38%; font-size: 1.1em;"><input type="text"
						id="PET_MEM_PHONE" name="PET_MEM_PHONE"
						style="width: 10em; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;"
						onKeyup="inputPhoneNumber(this);" maxlength="13"></td>
					<td style="width: 40%; text-align: center;"></td>
				</tr>
				<tr style="height: 0.7em;">
				</tr>
				<tr>
					<td
						style="width: 22%; text-align: right; vertical-align: text-top;">
						<span
						style="font-weight: bold; margin-right: 2em; font-size: 1.2em">특징</span>
					</td>
					<td style="width: 78%; height: 7em; font-size: 1.1em;" colspan="2">
						<textarea name="PET_MEM_FEATURE" id="PET_MEM_FEATURE"
							style="font-size: 1.1em; width: 90%; height: 100%; resize: none; border-radius: 0.5em;"></textarea>
					</td>
				</tr>
				<tr style="height: 2em;">
				</tr>
			</table>
		</div>

		<div style="height: auto;">
			<div style="text-align: center; margin-top: 3em">
				<span style="font-size: 1.5em; font-weight: bold;"> 댕댕이의 성향을
					알려주세요.</span>
			</div>

			<div align="center">
				<table
					style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
					<tr
						style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
						<th style="width: 2em;"></th>
						<th
							style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">
							<b>1. 다른 강아지를 만났을 때 반응을 알려주세요.</b>
						</th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_RESPONSE"
							id="PET_MEMBER_ADD_RESPONSE1" value="1" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_RESPONSE1">무서워하며 경계해요.</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_RESPONSE"
							id="PET_MEMBER_ADD_RESPONSE2" value="2" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_RESPONSE2">짖거나 달려들어요.</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_RESPONSE"
							id="PET_MEMBER_ADD_RESPONSE3" value="3" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_RESPONSE3">반가워하며 함께 놀아요.</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_RESPONSE"
							id="PET_MEMBER_ADD_RESPONSE4" value="4" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_RESPONSE4">별로 관심을 두지 않아요.</label></th>
					</tr>
				</table>
				<table
					style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
					<tr
						style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
						<th style="width: 2em;"></th>
						<th
							style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">
							<b>2. 낯선 사람을 만났을 때 반응을 알려주세요.</b>
						</th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_HUMAN"
							id="PET_MEMBER_ADD_HUMAN1" value="1" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_HUMAN1">무서워하며 경계해요.</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_HUMAN"
							id="PET_MEMBER_ADD_HUMAN2" value="2" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_HUMAN2">짖거나 달려들어요.</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_HUMAN"
							id="PET_MEMBER_ADD_HUMAN3" value="3" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_HUMAN3">반가워하며 함께 놀아요.</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_HUMAN"
							id="PET_MEMBER_ADD_HUMAN4" value="4" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_HUMAN4">별로 관심을 두지 않아요.</label></th>
					</tr>
				</table>

				<table
					style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
					<tr
						style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
						<th style="width: 2em;"></th>
						<th
							style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">
							<b>3. 댕댕이의 짖음 정도에 대해 알려주세요.</b>
						</th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_BARK" id="PET_MEMBER_ADD_BARK1"
							value="1" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_BARK1">짖음이 거의 없어요.</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_BARK" id="PET_MEMBER_ADD_BARK2"
							value="2" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_BARK2">외부 소음 및 낯선 사람을 볼 때 짖어요.</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_BARK" id="PET_MEMBER_ADD_BARK3"
							value="3" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_BARK3">평소 헛짖음이 있어요.</label></th>
					</tr>
				</table>

				<table
					style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
					<tr
						style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
						<th style="width: 2em;"></th>
						<th
							style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">
							<b>4. 앉아, 기다려 같은 기본 훈련이 되어 있나요?</b>
						</th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_TRAINING"
							id="PET_MEMBER_ADD_TRAINING1" value="1" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_TRAINING1">네, 되어 있어요.</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_TRAINING"
							id="PET_MEMBER_ADD_TRAINING2" value="2" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_TRAINING2">아니요, 되어 있지 않아요.</label></th>
					</tr>
				</table>

				<table
					style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
					<tr
						style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
						<th style="width: 2em;"></th>
						<th
							style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">
							<b>5. 댕댕이의 배변 스타일을 알려주세요.</b>
						</th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_DDONG_STYLE"
							id="PET_MEMBER_ADD_DDONG_STYLE1" value="1" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_DDONG_STYLE1">배변패드 및 지정된 장소에서 볼 일을
								봐요.</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_DDONG_STYLE"
							id="PET_MEMBER_ADD_DDONG_STYLE2" value="2" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_DDONG_STYLE2">눈이 오나 비가 오나 실외 배변을 해요.</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_DDONG_STYLE"
							id="PET_MEMBER_ADD_DDONG_STYLE3" value="3" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_DDONG_STYLE3">아직 배변 훈련이 되어 있지 않아요.</label></th>
					</tr>
				</table>

				<table
					style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
					<tr
						style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
						<th style="width: 2em;"></th>
						<th
							style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;"
							colspan="7"><b>6. 만지면 물거나 예민하게 반응하는 부위가 있나요?</b></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_SHARP_BODY"
							id="PET_MEMBER_ADD_SHARP_BODY1" value="1" /></th>
						<th style="font-size: 1.1em; padding: 0.3em; width: 8em;"><label
							for="PET_MEMBER_ADD_SHARP_BODY1">가슴</label></th>

						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_SHARP_BODY"
							id="PET_MEMBER_ADD_SHARP_BODY2" value="2" /></th>
						<th style="font-size: 1.1em; padding: 0.3em; width: 8em;"><label
							for="PET_MEMBER_ADD_SHARP_BODY2">얼굴</label></th>

						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_SHARP_BODY"
							id="PET_MEMBER_ADD_SHARP_BODY3" value="3" /></th>
						<th style="font-size: 1.1em; padding: 0.3em; width: 8em;"><label
							for="PET_MEMBER_ADD_SHARP_BODY3">등</label></th>

						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_SHARP_BODY"
							id="PET_MEMBER_ADD_SHARP_BODY4" value="4" /></th>
						<th style="font-size: 1.1em; padding: 0.3em; width: 8em;"><label
							for="PET_MEMBER_ADD_SHARP_BODY4">배</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_SHARP_BODY"
							id="PET_MEMBER_ADD_SHARP_BODY5" value="5" /></th>
						<th style="font-size: 1.1em; padding: 0.3em; width: 8em;"><label
							for="PET_MEMBER_ADD_SHARP_BODY5">꼬리</label></th>

						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_SHARP_BODY"
							id="PET_MEMBER_ADD_SHARP_BODY6" value="6" /></th>
						<th style="font-size: 1.1em; padding: 0.3em; width: 8em;"><label
							for="PET_MEMBER_ADD_SHARP_BODY6">앞발</label></th>

						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_SHARP_BODY"
							id="PET_MEMBER_ADD_SHARP_BODY7" value="7" /></th>
						<th style="font-size: 1.1em; padding: 0.3em; width: 8em;"><label
							for="PET_MEMBER_ADD_SHARP_BODY7">뒷발</label></th>

						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_SHARP_BODY"
							id="PET_MEMBER_ADD_SHARP_BODY8" value="8" /></th>
						<th style="font-size: 1.1em; padding: 0.3em; width: 8em;"><label
							for="PET_MEMBER_ADD_SHARP_BODY8">없음</label></th>
					</tr>
				</table>
				<table
					style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
					<tr
						style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
						<th style="width: 2em;"></th>
						<th
							style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">
							<b>7. 사람을 물거나 다른 강아지를 공격한 적 있나요?</b>
						</th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_ATTACK"
							id="PET_MEMBER_ADD_ATTACK1" value="1" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_ATTACK1">아니요, 없어요.</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_ATTACK"
							id="PET_MEMBER_ADD_ATTACK2" value="2" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_ATTACK2">예, 있어요.</label></th>
					</tr>
				</table>

				<table
					style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
					<tr
						style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
						<th style="width: 2em;"></th>
						<th
							style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">
							<b>8. 예방 접종은 되어 있나요?</b>
						</th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_VACCINATION"
							id="PET_MEMBER_ADD_VACCINATION1" value="1" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_VACCINATION1">예, 되어 있어요.</label></th>
					</tr>
					<tr>
						<th style="width: 2em; padding-left: 1em;"><input
							type="radio" name="PET_MEMBER_ADD_VACCINATION"
							id="PET_MEMBER_ADD_VACCINATION2" value="2" /></th>
						<th style="font-size: 1.1em; padding: 0.3em;"><label
							for="PET_MEMBER_ADD_VACCINATION2">아니요, 아직 안 되어 있어요.</label></th>
					</tr>
				</table>
				<div style="margin-top: 2em;">
					<span>※ 사실과 다른 정보로 인해 사고가 발생할 경우 책임은 견주 본인에게 있음을 안내해드립니다.</span>
				</div>

				<table>
					<tr>
						<th style="font-size: 1.1em; padding: 3em;">
							<button
								style="width: 13em; height: 3em; font-size: 1em; line-height: 1em;"
								class="my_button" onclick="history.go(-1); return false;">취소</button>
						</th>
						<th style="font-size: 1.1em; padding: 3em;">
							<button
								style="width: 13em; height: 3em; font-size: 1em; line-height: 1em;"
								class="my_button" onclick="petJoinSave();">등록</button>
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
	object-fit: cover;
	width: 300px;
	height: 300px;
	border: solid;
	border-radius: 2em;
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
							document.getElementById("PET_MEM_ADDRESS_ADD").value = extraAddr;

						} else {
							document.getElementById("PET_MEM_ADDRESS_ADD").value = '';
						}

						document.getElementById("PET_MEM_ZIPCODE").value = data.zonecode;
						document.getElementById("PET_MEM_ADDRESS1").value = addr;
						document.getElementById("PET_MEM_ADDRESS2").focus();
					}
				}).open();
	}
</script>

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

</html>