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
	
	function petModifyForm() {
		var form = document.petDetail;
		
		form.action = "/myPetModifyForm";
		form.submit();
	}
	
	function refresh_Event() {
		opener.parent.location="/myPetList";
		opener.parent.location.reload();
	}
	
</script>

</head>

<body onload="refresh_Event();">
<!-- 댕댕이정보 입력 시작 -->
<div align="center" style="height: auto;">
	<div style="text-align: center; margin-top: 4em">
		<span style="font-size: 2em; font-weight: bold;">댕댕이 정보</span>
		<div style="text-align: center; margin-top: 1em">
			<span style="font-size: 1em; position: relative; right: 10.5em;"></span>
		</div>
	</div>
	
	<form name="petDetail" id="petDetail"><input type="hidden" name="petId" value="${detail.PET_MEM_ID}"/></form>
	
		<!-- 이름 -->
		<div style="text-align: left; margin-top: 3em; width: 70%">
			<table style="position: relative; width: 100%;">
				<tr style="height: 3em;">
					<td style="width: 20%; text-align: right; ">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">이름</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;">
						${detail.PET_MEM_NAME}
					</td>
					<td style="width: 40%; text-align: center;">
						<span style="font-weight: bold; font-size: 1.2em;">프로필</span>
					</td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">성별</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;">
						<c:if test="${detail.PET_MEM_SEX == 'M'}">
							남아
						</c:if>
						<c:if test="${detail.PET_MEM_SEX == 'F'}">
							여아
						</c:if>
					</td>
					<td style="text-align: center;" rowspan="5" >
						<img id="img" style="object-fit: cover; width: 300px; height: 300px; border: solid; border-radius: 2em;" src="/resources/downimage/${profile.PROFILE_STORED_FILE_NAME}" />
					</td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">품종</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;">
						${detail.PET_MEM_KIND}
					</td>
					<td style="width: 40%; text-align: center;">
					</td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">크기</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;">
						${detail.PET_MEM_SIZE}
					</td>
					<td style="width: 40%; text-align: center;">
					</td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">몸무게</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;">
						${detail.PET_MEM_WEIGHT}<b>&nbsp;Kg</b> 
					</td>
					<td style="width: 40%; text-align: center;">
					</td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">등록번호</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;">
						<c:if test="${detail.PET_NO == null || detail.PET_NO == ''}">
							등록되지 않았습니다.
						</c:if>
						<c:if test="${detail.PET_NO != null || !detail.PET_NO == ''}">
							${detail.PET_NO}
						</c:if>
					</td>
					<td style="width: 40%; text-align: center;">
					</td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">나이</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;">
						${detail.PET_MEM_AGE}<b>&nbsp;살</b> 
					</td>
					<td style="width: 40%; text-align: center;">
					</td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">중성화</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;">
						<c:if test="${detail.PET_MEM_SEX_CHECK == 'Y'}">
							예
						</c:if>
						<c:if test="${detail.PET_MEM_SEX_CHECK == 'N'}">
							아니오
						</c:if>
					</td>
					<td style="width: 40%; text-align: center;">
					</td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">병력</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;">
						<c:if test="${detail.PET_MEM_CASE == 'Y'}">
							유
						</c:if>
						<c:if test="${detail.PET_MEM_CASE == 'N'}">
							무
						</c:if>
					</td>
					<td style="width: 40%; text-align: center;">
					</td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">주치병원</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;" colspan="2">
						<c:if test="${detail.PET_MEM_ZIPCODE == null || detail.PET_MEM_ZIPCODE == '' }">	
							등록된 주소가 없습니다.
						</c:if>
						<c:if test="${detail.PET_MEM_ZIPCODE != null || !detail.PET_MEM_ZIPCODE == '' }">	
							<b>[${detail.PET_MEM_ZIPCODE}]</b>&nbsp;${detail.PET_MEM_ADDRESS1}&nbsp;${detail.PET_MEM_ADDRESS2}&nbsp;${detail.PET_MEM_ADDRESS_ADD}
						</c:if>
					</td>
					<td style="width: 40%; text-align: center;">
					</td>
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">병원 연락처</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;">
						<c:if test="${detail.PET_MEM_PHONE == null || detail.PET_MEM_PHONE == '' }">	
							등록된 연락처가 없습니다.
						</c:if>
						<c:if test="${detail.PET_MEM_PHONE != null || !detail.PET_MEM_PHONE == '' }">	
							${detail.PET_MEM_PHONE}
						</c:if>
					</td>
					<td style="width: 40%; text-align: center;">
					</td>
				</tr>
				<tr style="height: 0.7em;">
				</tr>
				<c:if test="${detail.PET_MEM_FEATURE == null || detail.PET_MEM_FEATURE == '' }">
					<tr style="height: 3em;">
						<td style="width: 22%; text-align: right;">
							<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">특징</span>
						</td>
						<td style="width: 78%; font-size: 1.1em;" colspan="2">
							등록되지 않았습니다.
						</td>
					</tr>
				</c:if>
				<c:if test="${detail.PET_MEM_FEATURE != null || !detail.PET_MEM_FEATURE == '' }">
					<tr style="height: 3em;">
						<td style="width: 22%; text-align: right; vertical-align: text-top;">
							<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">특징</span>
						</td>
						<td style="width: 78%; height: 7em; font-size: 1.1em;" colspan="2">
							<textarea style="font-size: 1.1em; width: 90%; height: 100%; resize: none; border-radius: 0.5em;" readonly="readonly">
								${detail.PET_MEM_FEATURE}
							</textarea>
						</td>
					</tr>
				</c:if>
				<tr style="height: 0.7em;">
				</tr>
				<tr style="height: 3em;">
					<td style="width: 22%; text-align: right;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">맡긴 횟수</span>
					</td>
					<td style="width: 38%; font-size: 1.1em;">
						${detail.PET_MEM_USE_TIME}&nbsp;&nbsp;회
					</td>
					<td style="width: 40%; text-align: center;">
					</td>
				</tr>
			</table>
		</div>
</div>

<div style="height: auto;">
	<div style="text-align: center; margin-top: 4em">
		<span style="font-size: 2em; font-weight: bold;">댕댕이 정보</span>
	</div>

	<div align="center">
			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>1. 다른 강아지를 만났을 때의 반응.</b>
					</th>
				</tr>
				<c:if test="${detailAdd.PET_MEMBER_ADD_RESPONSE == '1'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_RESPONSE1" value="1" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_RESPONSE1">무서워하며 경계해요.</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_RESPONSE == '2'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_RESPONSE2" value="2" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_RESPONSE2">짖거나 달려들어요.</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_RESPONSE == '3'}">
				<tr> 
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_RESPONSE3" value="3" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">	
						<label for="PET_MEMBER_ADD_RESPONSE3">반가워하며 함께 놀아요.</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_RESPONSE == '4'}">
				<tr> 
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_RESPONSE4" value="4" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_RESPONSE4">별로 관심을 두지 않아요.</label>
					</th>
				</tr>
				</c:if>
			</table>

			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>2. 낯선 사람을 만났을 때의 반응.</b>
					</th>
				</tr>
				<c:if test="${detailAdd.PET_MEMBER_ADD_HUMAN == '1'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_HUMAN1" value="1" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_HUMAN1">무서워하며 경계해요.</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_HUMAN == '2'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_HUMAN2" value="2" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_HUMAN2">짖거나 달려들어요.</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_HUMAN == '3'}">
				<tr> 
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_HUMAN3" value="3" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">	
						<label for="PET_MEMBER_ADD_HUMAN3">반가워하며 함께 놀아요.</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_HUMAN == '4'}">
				<tr> 
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_HUMAN4" value="4" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_HUMAN4">별로 관심을 두지 않아요.</label>
					</th>
				</tr>
				</c:if>
			</table>
			
			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>3. 댕댕이의 짖음 정도.</b>
					</th>
				</tr>
				<c:if test="${detailAdd.PET_MEMBER_ADD_BARK == '1'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_BARK1" value="1" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_BARK1">짖음이 거의 없어요.</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_BARK == '2'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_BARK2" value="2" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_BARK2">외부 소음 및 낯선 사람을 볼 때 짖어요.</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_BARK == '3'}">
				<tr> 
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_BARK3" value="3" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">	
						<label for="PET_MEMBER_ADD_BARK3">평소 헛짖음이 있어요.</label>
					</th>
				</tr>
				</c:if>
			</table>
				
			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>4. 앉아, 기다려 같은 기본 훈련.</b>
					</th>
				</tr>
				<c:if test="${detailAdd.PET_MEMBER_ADD_TRAINING == '1'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_TRAINING1" value="1" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_TRAINING1">네, 되어 있어요.</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_TRAINING == '2'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_TRAINING2" value="2" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_TRAINING2">아니요, 되어 있지 않아요.</label>
					</th>
				</tr>
				</c:if>
			</table>
			
			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>5. 댕댕이 배변 스타일.</b>
					</th>
				</tr>
				<c:if test="${detailAdd.PET_MEMBER_ADD_DDONG_STYLE == '1'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_DDONG_STYLE1" value="1" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_DDONG_STYLE1">배변패드 및 지정된 장소에서 볼 일을 봐요.</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_DDONG_STYLE == '2'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_DDONG_STYLE2" value="2" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_DDONG_STYLE2">눈이 오나 비가 오나 실외 배변을 해요.</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_DDONG_STYLE == '3'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_DDONG_STYLE3" value="2" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_DDONG_STYLE3">아직 배변 훈련이 되어 있지 않아요.</label>
					</th>
				</tr>
				</c:if>
			</table>
			
			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>6. 만지면 물거나 예민하게 반응하는 부위.</b>
					</th>
				</tr>
				<c:if test="${detailAdd.PET_MEMBER_ADD_SHARP_BODY == '1'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_SHARP_BODY1" value="1" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY1">가슴</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_SHARP_BODY == '2'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_SHARP_BODY2" value="2" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY2">얼굴</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_SHARP_BODY == '3'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_SHARP_BODY3" value="3" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY3">등</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_SHARP_BODY == '4'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_SHARP_BODY4" value="4" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY4">배</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_SHARP_BODY == '5'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_SHARP_BODY5" value="5" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY5">꼬리</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_SHARP_BODY == '6'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_SHARP_BODY6" value="6" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY6">앞발</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_SHARP_BODY == '7'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_SHARP_BODY7" value="7" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY7">뒷발</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_SHARP_BODY == '8'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_SHARP_BODY8" value="8" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY8">없음</label>
					</th>
				</tr>
				</c:if>
			</table>

			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>7. 사람을 물거나 다른 강아지를 공격한 경험.</b>
					</th>
				</tr>
				<c:if test="${detailAdd.PET_MEMBER_ADD_ATTACK == '1'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_ATTACK1" value="1" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_ATTACK1">아니요, 없어요.</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_ATTACK == '2'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_ATTACK" id="PET_MEMBER_ADD_ATTACK2" value="2" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_ATTACK2">예, 있어요.</label>
					</th>
				</tr>
				</c:if>
			</table>
			
			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>8. 예방 접종 여부.</b>
					</th>
				</tr>
				<c:if test="${detailAdd.PET_MEMBER_ADD_VACCINATION == '1'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_VACCINATION1" value="1" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_VACCINATION1">예, 되어 있어요.</label>
					</th>
				</tr>
				</c:if>
				<c:if test="${detailAdd.PET_MEMBER_ADD_VACCINATION == '2'}">
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" id="PET_MEMBER_ADD_VACCINATION2" value="2" checked="checked"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_VACCINATION2">아니요, 아직 안 되어 있어요.</label>
					</th>
				</tr>
				</c:if>
			</table>
			
			<table>
				<tr>
					<th style="font-size: 1.1em; padding: 3em;">
						<button class="my_button" style="width: 13em; height: 3em; font-size: 1em; line-height: 1em;" id="cancel" onclick="window.close();">닫&nbsp;&nbsp;&nbsp;&nbsp;기</button>
					</th>
					<th style="font-size: 1.1em; padding: 3em;">
						<button class="my_button" style="width: 13em; height: 3em; font-size: 1em; line-height: 1em;" id="modify" onclick="petModifyForm()">수&nbsp;&nbsp;&nbsp;&nbsp;정</button>
					</th>
				</tr>
			</table>
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