<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
2020.02.12 호석 
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="kr" lang="kr">

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>


<div style="display: flex; height: 100px; width: 100%; position: relative; text-align: center; align-items: center;">
	<p style="text-align: Center; position: relative; align-items: center; position: relative; margin: auto;">
		<span style="font-family: 'Arial'; font-weight: 700; font-size: 3em; color: rgba(5, 38, 55, 1);">펫시팅 임시 페이지입니다.</span>
	</p>
</div>
<div style="display: flex; width: 100%; height: 500px; align-items: center; position: relative; text-align: center;">
	<div style="display: flex-wrap; align-items: center; text-align: center; position: relative;">
		<c:forEach var="item" items="${petsittingInfo}">
			<div onclick="location.href='petsittingInfo?pnum=${item.PROGRESS_NO}'" style="cursor: pointer;">
				<c:out value="${item.PROGRESS_NO}" />
				<c:out value="${item.PSMEM_ID}" />
				<c:out value="${item.MEM_ID}" />
				<br/>
			</div>
		</c:forEach>
	</div>
</div>

<div style="height: auto">
	<div style="text-align: center; margin-top: 3em">
		<span style="font-size: 1.5em; font-weight: bold;">
			댕댕이의 성향을 알려주세요.</span>
	</div>

	<div align="center">
		<form action="petRegisterAdd" id="joinForm" method="post">
			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>1. 다른 강아지를 만났을 때 반응을 알려주세요.</b>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_RESPONSE" id="PET_MEMBER_ADD_RESPONSE1" value="1"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_RESPONSE1">무서워하며 경계해요.</label>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_RESPONSE" id="PET_MEMBER_ADD_RESPONSE2" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_RESPONSE2">짖거나 달려들어요.</label>
					</th>
				</tr>
				<tr> 
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_RESPONSE" id="PET_MEMBER_ADD_RESPONSE3" value="3"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">	
						<label for="PET_MEMBER_ADD_RESPONSE3">반가워하며 함께 놀아요.</label>
					</th>
				</tr>
				<tr> 
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_RESPONSE" id="PET_MEMBER_ADD_RESPONSE4" value="4"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_RESPONSE4">별로 관심을 두지 않아요.</label>
					</th>
				</tr>
			</table>

			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>2. 낯선 사람을 만났을 때 반응을 알려주세요.</b>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_HUMAN" id="PET_MEMBER_ADD_HUMAN1" value="1"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_HUMAN1">무서워하며 경계해요.</label>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_HUMAN" id="PET_MEMBER_ADD_HUMAN2" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_HUMAN2">짖거나 달려들어요.</label>
					</th>
				</tr>
				<tr> 
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_HUMAN" id="PET_MEMBER_ADD_HUMAN3" value="3"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">	
						<label for="PET_MEMBER_ADD_HUMAN3">반가워하며 함께 놀아요.</label>
					</th>
				</tr>
				<tr> 
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_HUMAN" id="PET_MEMBER_ADD_HUMAN4" value="4"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_HUMAN4">별로 관심을 두지 않아요.</label>
					</th>
				</tr>
			</table>
			
			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>3. 댕댕이의 짖음 정도에 대해 알려주세요.</b>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_BARK" id="PET_MEMBER_ADD_BARK1" value="1"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_BARK1">짖음이 거의 없어요.</label>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_BARK" id="PET_MEMBER_ADD_BARK2" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_BARK2">외부 소음 및 낯선 사람을 볼 때 짖어요.</label>
					</th>
				</tr>
				<tr> 
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_BARK" id="PET_MEMBER_ADD_BARK3" value="3"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">	
						<label for="PET_MEMBER_ADD_BARK3">평소 헛짖음이 있어요.</label>
					</th>
				</tr>
			</table>
				
			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>4. 앉아, 기다려 같은 기본 훈련이 되어 있나요?</b>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_TRAINING" id="PET_MEMBER_ADD_TRAINING1" value="1"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_TRAINING1">네, 되어 있어요.</label>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_TRAINING" id="PET_MEMBER_ADD_TRAINING2" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_TRAINING2">아니요, 되어 있지 않아요.</label>
					</th>
				</tr>
			</table>
			
			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>5. 댕댕이의 배변 스타일을 알려주세요.</b>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_DDONG_STYLE" id="PET_MEMBER_ADD_DDONG_STYLE1" value="1"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_DDONG_STYLE1">배변패드 및 지정된 장소에서 볼 일을 봐요.</label>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_DDONG_STYLE" id="PET_MEMBER_ADD_DDONG_STYLE2" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_DDONG_STYLE2">눈이 오나 비가 오나 실외 배변을 해요.</label>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_DDONG_STYLE" id="PET_MEMBER_ADD_DDONG_STYLE3" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_DDONG_STYLE3">아직 배변 훈련이 되어 있지 않아요.</label>
					</th>
				</tr>
			</table>
			
			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;" colspan="7">	
						<b>6. 만지면 물거나 예민하게 반응하는 부위가 있나요?</b>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_SHARP_BODY" id="PET_MEMBER_ADD_SHARP_BODY1" value="1"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em; width: 8em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY1">가슴</label>
					</th>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_SHARP_BODY" id="PET_MEMBER_ADD_SHARP_BODY2" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em; width: 8em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY2">얼굴</label>
					</th>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_SHARP_BODY" id="PET_MEMBER_ADD_SHARP_BODY3" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em; width: 8em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY3">등</label>
					</th>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_SHARP_BODY" id="PET_MEMBER_ADD_SHARP_BODY4" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em; width: 8em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY4">배</label>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_SHARP_BODY" id="PET_MEMBER_ADD_SHARP_BODY5" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em; width: 8em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY5">꼬리</label>
					</th>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_SHARP_BODY" id="PET_MEMBER_ADD_SHARP_BODY6" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em; width: 8em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY6">앞발</label>
					</th>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_SHARP_BODY" id="PET_MEMBER_ADD_SHARP_BODY7" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em; width: 8em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY7">뒷발</label>
					</th>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_SHARP_BODY" id="PET_MEMBER_ADD_SHARP_BODY8" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em; width: 8em;">
						<label for="PET_MEMBER_ADD_SHARP_BODY8">없음</label>
					</th>
				</tr>
			</table>

			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>7. 사람을 물거나 다른 강아지를 공격한 적 있나요?</b>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_ATTACK" id="PET_MEMBER_ADD_ATTACK1" value="1"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_ATTACK1">아니요, 없어요.</label>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_ATTACK" id="PET_MEMBER_ADD_ATTACK2" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_ATTACK2">예, 있어요.</label>
					</th>
				</tr>
			</table>
			
			<table style="text-align: left; border: dashed rgb(3, 127, 187); border-radius: 2em; margin-top: 2em; width: 50em; height: auto; padding: 1em;">
				<tr style="position: relative; top: 1em; left: 1em; font-weight: bold; margin-bottom: 2em;">
					<th style="width: 2em;">
					</th>
					<th style="font-size: 1.2em; padding-top: 0.5em; padding-bottom: 1em;">	
						<b>8. 예방 접종은 되어 있나요?</b>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_VACCINATION" id="PET_MEMBER_ADD_VACCINATION1" value="1"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_VACCINATION1">예, 되어 있어요.</label>
					</th>
				</tr>
				<tr>
					<th style="width: 2em; padding-left: 1em;">
						<input type="radio" name="PET_MEMBER_ADD_VACCINATION" id="PET_MEMBER_ADD_VACCINATION2" value="2"/>
					</th>
					<th style="font-size: 1.1em; padding: 0.3em;">
						<label for="PET_MEMBER_ADD_VACCINATION2">아니요, 아직 안 되어 있어요.</label>
					</th>
				</tr>
			</table>

			<c:choose>
				<c:when test="${ID != null}">
					<input type="hidden" id="ID" name="ID" value="${ID}"/>
				</c:when>
				<c:otherwise>
					<input type="hidden" id="ID" name="ID" value="${TempID}"/>
				</c:otherwise>
			</c:choose>

			<input type="hidden" id="ID" name="PET_MEM_ID" value="${PET_MEM_ID}"/>
			<input type="hidden" id="ID" name="PET_MEM_NAME" value="${map.PET_MEM_NAME}"/>

			<div style="margin-top: 2em;">
				<span>※ 사실과 다른 정보로 인해 사고가 발생할 경우 책임은 견주 본인에게 있음을 안내해드립니다.</span>
			</div>
			
			<table>
				<tr>
					<th style="font-size: 1.1em; padding: 3em;">
						<button style="width: 13em; height: 3em" id="cancel">이전</button>
					</th>
					<th style="font-size: 1.1em; padding: 3em;">
						<button style="width: 13em; height: 3em" id="join">등록 완료</button>
					</th>
				</tr>
			</table>
		</form>
		<%@ include file="/WEB-INF/views/include/include-body.jspf"%>
	</div>
</div>
<%-- 
<%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</html>