<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
2020.02.13 호석 
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="kr" lang="kr">

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<c:set var="name" value="${pst.NAME}" />
<c:set var="grade" value="${pstAdd.PSMEM_CLASS}" />
<c:set var="school" value="${pstAdd.PSMEM_SCHOOL_FINISH_CHECK}" />
<c:set var="certiChk" value="${pstAdd.PSMEM_CERTI_CHECK}" />

<script type="text/javascript">
	
	function petsittingOk() {
		var form = document.petsittingReserve;
		
		var deng_chk = document.getElementsByName("PETARR");
		var checked = 0;
		
		for(i = 0; i < deng_chk.length; i++) {
			if(deng_chk[i].checked == true) {
				checked += 1;
			}
		}
		
		if(checked == 0) {
			alert("맡기실 댕댕이를 선택해주세요.")
			return false;
		} 
		
		form.action = "/petsittingOk";
		form.submit();	
	}
	
</script>

<div>
<form id="petsittingReserve" name="petsittingReserve" method="post">
	<!-- 카카오 지도에 사용 -->
	<input type="hidden" name="address1" id="address1" value="${pstAdd.PSMEM_CONSIGNMENT_ADDRESS1}" />
	<input type="hidden" name="address2" id="address2" value="${pstAdd.PSMEM_CONSIGNMENT_ADDRESS2}" />
	<!-- petsitting 예약하기 쪽으로 넘어가는 데이터-->
	<input type="hidden" name="PSMEM_ID" id="PSMEM_ID" value="${matchDtl.PSMEM_ID}"/> <!-- 펫시터 아이디  -->
	<input type="hidden" name="MATCH_REGISTER_NO" id="MATCH_REGISTER_NO" value="${matchDtl.MATCH_NO}"/> <!-- 매치 글 번호 -->
	<input type="hidden" name="MEM_ID" id="MEM_ID" value="${ID}"/> <!-- 세션에서 받아오는 회원 아이디 -->
	<input type="hidden" name="CHECK_IN" id="CHECK_IN" value="${matchDtl.MATCH_CHECK_IN}"/>	<!-- 체크인 -->
	<input type="hidden" name="CHECK_OUT" id="CHECK_OUT" value="${matchDtl.MATCH_CHECK_OUT}"/> <!-- 채크아웃 -->
	<!-- 가격을 설정하기 위해 넘어가는 값 -->
	<input type="hidden" name="PRICE_SMALL_ALL" id="PRICE_SMALL_ALL" value="${matchDtl.PRICE_SMALL_ALL}"/> <!-- 소형견 올 -->
	<input type="hidden" name="PRICE_SMALL_HALF" id="PRICE_SMALL_HALF" value="${matchDtl.PRICE_SMALL_HALF}"/> <!-- 소형견 하프 -->
	<input type="hidden" name="PRICE_MEDIUM_ALL" id="PRICE_MEDIUM_ALL" value="${matchDtl.PRICE_MEDIUM_ALL}"/> <!-- 중형견 올 -->
	<input type="hidden" name="PRICE_MEDIUM_HALF" id="PRICE_MEDIUM_HALF" value="${matchDtl.PRICE_MEDIUM_HALF}"/> <!-- 중형견 하프 -->
	<input type="hidden" name="PRICE_LARGE_ALL" id="PRICE_LARGE_ALL" value="${matchDtl.PRICE_LARGE_ALL}"/> <!-- 대형견 올 -->
	<input type="hidden" name="PRICE_LARGE_HALF" id="PRICE_LARGE_HALF" value="${matchDtl.PRICE_LARGE_HALF}"/> <!-- 대형견 하프 -->
	
	<!-- 펫시터 소개 상단 -->
	<div style="margin-top: 5px; margin-left: auto; margin-right: auto; width: 1027px; display: flex; flex-direction: row; justify-content: space-between">
		<div style="float: left; width: 66%; padding: 20px;">
			<div>
				<p style="font-family: Noto Sans KR, sans-serif; margin-top: 5px; font-size: 30px; color: #383C48; line-height: 30px; letter-spacing: -0.2px; text-align: center; align-items: center; position: relative;">
					펫시팅 예약
				</p>
				<div style="margin-top: 30px; margin-bottom: 30px;">
					<hr width="100%" style="border: solid 2px; border-color: #0080FF; margin-top: 30px; margin-bottom: 40px;"/>
				</div>
			</div>
			<div style="display: flex; flex-direction: row; border: dotted 1px; border-radius: 15px; border-color: #58ACFA; height: 135px;">
				<div style="overflow: hidden; width: 100px; height: 100px; border: none; border-radius: 12px; margin-top: 15px; margin-left: 10px; margin-right: 32px;">
					<img width="100" height="100" style="object-fit: cover; display: inline-block;" src="resources/downimage/${pstPfl.PROFILE_ORIGINAL_FILE_NAME}"/>
			<!-- 윗단은 멤버 프로필 사진 --> <!-- 프로필 사진도 가져와야 함 -->
				</div>
				<div style="overflow: hidden; width: 430px;">
					<div>
						<h1 style="font-family: Noto Sans KR, sans-serif; font-size: 20px; color: #4C5056; line-height: 35px; letter-spacing: -0.2px; ">
							<span style="font-weight: bold; color: gold;">${grade}</span>&nbsp;펫시터&nbsp;<b>${name}</b>&nbsp;님
								&nbsp;&nbsp;/&nbsp;&nbsp;<b>${pst.SEX}</b>&nbsp;&nbsp;/&nbsp;&nbsp;<b>${pstAdd.PSMEM_JOB}</b><br/>
						</h1>
						<input type="hidden" name="P_CLASS" value="${grade}" />
						<input type="hidden" name="P_NAME" value="${name}" />
						<input type="hidden" name="P_SEX" value="${pst.SEX}" />
						<input type="hidden" name="P_JOB" value="${pstAdd.PSMEM_JOB}" />
					</div>
					<div>
						<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
							<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png">연락처 : 예약이 완료되면 확인하실 수 있습니다.
							<input type="hidden" name="P_MOBILE" value="${pst.PHONE}" />
						</p>
					<div>
					</div>
						<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
							<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png">이메일 : 예약이 완료되면 확인하실 수 있습니다.
							<input type="hidden" name="P_EMAIL" value="${pst.EMAIL}" />
						</p>
					</div>
					<!-- 해시 태그 시작 x service로 바꿈 -->
				</div>
			</div>
			<div style="display: flex; flex-direction: row"> <!-- 다음에 수정할 때는 이 지랄하지 말고 테이블에 넣어서 반복 돌려야지... 이건 미친 짓이다. -->
				<div> <!-- 서비스 부분은 컨트롤러에서 스플릿 해서 배열로 담아오자. 그 다음 반복문으로 꺼내면서 조건문을 포함해서 나오도록. -->
					<div style="display: flex; margin-top: 5px; width: 600px; position: relative; text-align: center;">
					<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; margin-bottom: 15px; line-height: 25px; color: #393C47">
						<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/check.png"> 위탁 장소 주소</h2>
					</div>
					<div style="display: block; width: auto; height: 25px; float: left; position: relative; text-align: cetner;">
						<div style="display: inline-block; margin-left: 35px; position: relative; width: 150;">
							<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 13px; color: #084B8A;">
								<b>${pstAdd.PSMEM_CONSIGNMENT_ADDRESS1}</b></p>
								<input type="hidden" name="P_ADD1" value="${pstAdd.PSMEM_CONSIGNMENT_ADDRESS1}" />
								<input type="hidden" name="P_ADD2" value="${pstAdd.PSMEM_CONSIGNMENT_ADDRESS2}" />
								<input type="hidden" name="P_ADD_ADD" value="${pstAdd.PSMEM_CONSIGNMENT_ADDRESS_ADD}" />
						</div>
					</div>
				</div>
			</div>
			<div style="display: flex; flex-direction: row"> <!-- 다음에 수정할 때는 이 지랄하지 말고 테이블에 넣어서 반복 돌려야지... 이건 미친 짓이다. -->
				<div> <!-- 서비스 부분은 컨트롤러에서 스플릿 해서 배열로 담아오자. 그 다음 반복문으로 꺼내면서 조건문을 포함해서 나오도록. -->
					<div style="display: flex; margin-top: 5px; width: 600px; position: relative; text-align: center;">
					<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; margin-bottom: 15px; line-height: 25px; color: #393C47">
						<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/check.png"> 상세 조건</h2>
					</div>
					<c:forEach var="service" items="${serviceList}">
						<c:if test="${service == 'service01'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service01.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>현재 반려동물 없음</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service02'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service02.png"></div>
								<div style="display: inline-block; margin-left: 7px; margin-right: auto; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>집 앞 픽업 가능</b></p>
									
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service03'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service03.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>대형견 예약 가능</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service04'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service04.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>뛰어놀 마당 보유</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service05'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service05.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>노견 집중 케어 가능</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service06'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service06.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>14일 이상 돌봄 가능</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service07'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service07.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>편한 실내 놀이 가능</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service08'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service08.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>매일 근처 산책 가능</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service09'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service09.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>댕댕이 목욕 가능</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service10'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service10.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>약물 먹이기 가능</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service11'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service11.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>어린 댕댕 집중 관리</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service12'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner;  margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service12.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>아파트 주거 중</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service13'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service13.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>빌라 거주 중</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service14'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service14.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>단독 주택 거주 중</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service15'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service15.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>혼자 살아요</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service16'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service16.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>아이가 없어요</b></p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service17'}">
							<div style="display: block; width: 200px; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="15" height="15" src="resources/images/service17.png"></div>
								<div style="display: inline-block; margin-left: 7px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>반려동물 등록 대행 가능</b></p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 펫시터 소개 상단 끝 -->
			
			<!--펫시터 자격증 및 교육 수료 --> <!-- 이 부분은 리스트를 불러와서  하나씩 뽑아야 함. -->
			<div style="margin-top: 30px">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; margin-bottom: 15px; line-height: 25px; color: #393C47">
						<img width="15px" height="15px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/check.png"> 자격증 및 교육 수료</h2>
				<div style="margin-bottom: 10px;">
					<div style="display: block; margin-left: 18px;">
						<c:forEach var="certi" items="${certi}" varStatus="status">
							<img width="17" height="17" style="margin-right: 5px; margin-left: 11px;" src="resources/images/certi.png">
							<div style="display: inline-block; width: 42%; position: relative; text-align: left; vertical-align: middle; align-items: left;">
								<span style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 27px; color: rgb(85, 85, 85);">
									<b>${certi.CERTI_NAME}</b></span></div>
						</c:forEach>
					</div>
				</div>
				<input type="hidden" name="P_CERTI" value="${certiChk}" />
				<input type="hidden" name="P_SCHOOL" value="${school}" />
				<c:choose>
					<c:when test="${school=='Y'}">
						<div style="display: flex; align-items: center; margin-left: 20px;">
							<img width="13" height="18" src="resources/images/medal.png">
							<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 13px; color: #555555; margin-top: 10px">
								&nbsp;&nbsp;&nbsp;${name} 님은 <font color="red" size="2"><b>반려동물 관련 학과</b></font>를 졸업한 전문 인재입니다.</p>
						</div>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${certiChk=='Y'}">
						<div style="display: flex; align-items: center; margin-left: 20px;">
							<img width="13" height="18" src="resources/images/medal.png">
							<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 13px; color: #555555; margin-top: 1px">
								&nbsp;&nbsp;&nbsp;${name} 님은 <font color="red" size="2"><b>반려동물 관련 자격증</b></font>을 취득한 전문 인재입니다.</p>
						</div>
					</c:when>
				</c:choose>
			</div>
			<!--펫시터 자격증 및 교육 수료 -->
			<!-- 펫시터 반려동물 -->
			<div style="margin-top: 30px;">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; line-height: 25px; color: #393C47; margin-bottom: 20px">
					<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/check.png"> 반려동물</h2>
				<c:forEach var="petMem" items="${pet}" >
					<div style="display: flex; flex-direction: column; border-right: dashed 0.5px; border-bottom: dashed 0.5px; border-color: #58ACFA; border-radius: 30px; margin-bottom: 5px;">
						<div style="display: flex; flex-direction: row; align-items: center;">
							<img width="35" height="35" src="resources/downimage/<c:out value='${petMem.STO_FILE_NAME}'/>" style="object-fit: cover; border-radius: 50%; margin-left: 20px; margin-right: 20px;">
							<div style="margin-left: 18px;">
								<!-- 글쓴이 -->
								<div style="display: flex; flex-display: column">
								<p style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 15px; color: rgb(56, 60, 72); margin-top: 10px;">
								<b>이름 : </b><c:out value="${petMem.NAME}"/>&nbsp;&nbsp;&nbsp;<c:out value="${petMem.SEX}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${petMem.AGE}"/> 살 
								</div style="display: flex; flex-display: column">
								<div>
								<p style="font-size: 13px; line-height: 14px; color: rgb(76, 80, 86); margin-top: 1px;">
								<b><c:out value="${petMem.KIND}"/></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${petMem.PET_SIZE}"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;무게 : <c:out value="${petMem.KG}"/>&nbsp;Kg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중성화 여부 : <c:out value="${petMem.SEX_CHK}"/></p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 위는 펫시터 매치 정보 -->
			<div style="margin-top: 70px; margin-bottom: 70px;">
				<hr width="100%" style="border: dashed 0.5px; border-color: #F5A9BC;"/>
			</div>
			<!-- 아래는 멤버 예약 정보 -->
			<div style="display: flex; flex-direction: row; border: dotted 1px; margin-top: 50px; border-radius: 15px; border-color: #F78181; height: 135px;">
				<div style="overflow: hidden; width: 100px; height: 100px; border: none; border-radius: 12px; margin-top: 15px; margin-left: 10px; margin-right: 32px;">
					<img width="100" height="100" style="object-fit: cover; display: inline-block;" src="resources/downimage/${mem.MEM_PROFILE}"/>
			<!-- 윗단은 멤버 프로필 사진 --> <!-- 프로필 사진도 가져와야 함 -->
				</div>
				<div style="overflow: hidden; width: 430px;">
					<div>
						<h1 style="font-family: Noto Sans KR, sans-serif; font-size: 20px; color: #4C5056; line-height: 35px; letter-spacing: -0.2px; ">
							<span style="font-weight: bold; color: gold;">소중한</span><b>&nbsp;&nbsp;${mem.MEM_NAME}</b>&nbsp;님
								&nbsp;&nbsp;/&nbsp;&nbsp;<b>${mem.MEM_SEX}</b>
						</h1>
						<input type="hidden" name="M_NAME" value="${mem.MEM_NAME}" />
						<input type="hidden" name="M_SEX" value="${mem.MEM_SEX}" />
						
					</div>
					<div>
						<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
							<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/checkMem.png"/>연락처 : ${mem.MEM_PHONE}
						</p>
						<input type="hidden" name="M_MOBILE" value="${mem.MEM_PHONE}" />
					<div>
					</div>
						<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
							<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/checkMem.png"/>이메일 : ${mem.MEM_EMAIL}
						</p>
						<input type="hidden" name="M_EMAIL" value="${mem.MEM_EMAIL}" />
					</div>
				</div>
			</div>
			<div style="display: flex; flex-direction: row">
				<div>
					<div style="display: flex; margin-top: 5px; width: 600px; position: relative; text-align: center;">
						<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; line-height: 25px; color: #393C47; margin-bottom: 10px">
							<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/checkMem.png"/> 거주지 주소</h2>
					</div>
					<div style="display: block; width: auto; height: 25px; float: left; position: relative; text-align: cetner;">
						<div style="display: inline-block; margin-left: 35px; position: relative; width: auto;">
							<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 13px; color: #FA5858;">
								<b>${mem.MEM_ADD1} ${mem.MEM_ADD2} ${mem.MEM_ADD_ADD}</b></p>
								<input type="hidden" name="M_ADD1" value="${mem.MEM_ADD1}" />
								<input type="hidden" name="M_ADD2" value="${mem.MEM_ADD2}" />
								<input type="hidden" name="M_ADD_ADD" value="${mem.MEM_ADD_ADD}" />
						</div>
					</div>
				</div>
			</div>
			<!-- 멤버 반려동물 -->
			<div style="margin-top: 30px; margin-bottom: 100px;">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; line-height: 25px; color: #393C47; margin-bottom: 10px">
					<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/checkMem.png" > 반려동물</h2>
				<c:forEach var="petMem" items="${memPet}" >
					<div style="display: flex; flex-direction: column; border-right: dashed 0.5px; border-bottom: dashed 0.5px; border-color: #FA5858; border-radius: 30px; margin-bottom: 5px;">
						<div style="display: flex; flex-direction: row; align-items: center;">
							<img width="35" height="35" src="resources/downimage/<c:out value='${petMem.STO_FILE_NAME}'/>" style="object-fit: cover; border-radius: 50%; margin-left: 20px; margin-right: 20px;">
							<div style="margin-left: 18px;">
								<!-- 글쓴이 -->
								<div style="display: flex; flex-display: column">
								<p style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 15px; color: rgb(56, 60, 72); margin-top: 10px;">
								<b>이름 : </b><c:out value="${petMem.NAME}"/>&nbsp;&nbsp;&nbsp;(<c:out value="${petMem.SEX}"/>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${petMem.AGE}"/> 살 
								</div style="display: flex; flex-display: column">
								<div>
								<p style="font-size: 13px; line-height: 14px; color: rgb(76, 80, 86); margin-top: 1px;">
								<b><c:out value="${petMem.KIND}"/></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${petMem.PET_SIZE}"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;무게 : <c:out value="${petMem.KG}"/>&nbsp;Kg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중성화 여부 : <c:out value="${petMem.SEX_CHK}"/></p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 이 부분에 펫시터 문의하기랑 이용후기가 달려야 함. -->
		</div>
		<div style="float: left; width: 30%;">
			<!-- 펫시터 예약 날짜 선택 -->
			<div style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 32px; padding-right: 32px; padding-bottom: 32px; margin-top: 50px;">
				<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 5px; font-weight: 600">
					예약 날짜
				</p>
				<div style="width: auto; display: flex; flex-direction: column; align-items: left; justify-content: space-between; margin-top: 30px; margin-bottom: 8px; margin-left: 15px; margin-right: 15px; position: relative; padding: 1px;">
					<p style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4; text-align: left;">${basicDate}</p>
					<input type="hidden" id="PETSITTING_DAYS" name="PETSITTING_DAYS" value="${basicDate}" />
				</div>

				<!-- 예약 시간 선택 --> <!-- 이 부분은 조건문으로 저장된 값보다 작은 값은 나오지 않게 해야 함. 하려고 했지만 귀찮으니 나중에 적용 -->
				<div style="border: dotted 1px; display: flex; flex-direction: row; justify-content: space-between; margin-top: 10px; padding: 8px; border-radius: 15px; border-color: #A4A4A4;">
					<div style="width: 149px; margin-top: 10px;">
						<div style="display: flex; flex-direction: column; align-items: center; justify-content: space-between; margin-bottom: 1px; position: relative; text-align: center;">
							<p style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #6E6E6E; margin-bottom: 18px; position: relative; text-align: center;">
								<b>체크인 시간</b>
							</p>
							<p style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4; margin-left: 10px;">${matchDtl.MATCH_CHECK_IN} 이후</p>
						</div>
					</div>
					<div style="width: 149px; margin-top: 10px;">
						<div style="display: flex; flex-direction: column; align-items: center; justify-content: space-between; margin-bottom: 8px; position: relative; text-align: center;">
							<p style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #6E6E6E; margin-bottom: 18px; text-align: center;">
								<b>체크아웃 시간</b>
							</p>
							<p style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4; margin-left: 10px;">${matchDtl.MATCH_CHECK_OUT} 이전</p>
						</div>
					</div>
				</div>
				<!-- 예약 시간 선택 끝 -->
			</div>
			<!-- 펫시터 예약 날짜 선택 끝 -->
			<!-- 이용 요금 소개 --> <!-- 가능, 불가 선택. 지정된 액수 안에서 금액 설정 가능하게. -->
			<div style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding: 38px 32px; margin-top: 38px">
				<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-between">
					<p style="font-size: 17px; font-weight: 600; letter-spacing: -0.2px; line-height: 25px; color: #393C47">이용 요금</p>
					<div style="display: flex; align-items: center; flex-direction: row">
						<div style="display: flex; flex-direction: row; align-items: center; margin-right: 3px">
							<p style="font-size: 13px; line-height: 18px; color: #383C48">1박 케어</p>
						<div style="width: 1px; height: 15px; background-color: #ECEDF0; margin-left: 10px; margin-right: 10px"></div>
							<p style="font-size: 13px; line-height: 18px; color: #383C48">데이케어</p>
						</div>
					</div>
				</div>
				<div style="width: 310px; height: 1px; background-color: #EBEBEB; margin-top: 10px; margin-bottom: 30px"></div>
				<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-top: 14px">
					<div style="display: flex; flex-direction: row; align-items: center; height: 24px">
						<img width="24" height="24" src="resources/images/price_pet_small.png" alt="소형견">
						<p style="font-size: 15px; line-height: 19px; color: #383C48; margin-left: 10px">소형견</p>
						<p style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 5px">7키로 미만</p>
					</div>
					<div style="display: flex; flex-direction: row">
						<div style="display: flex; align-items: center; flex-direction: row">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 1px; color: #4E525B; margin-right: 11px">
								${matchDtl.PRICE_SMALL_ALL}
							</p>
						</div>
						<div style="display: flex; flex-direction: column; align-items: center; width: 62px">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">
								${matchDtl.PRICE_SMALL_HALF}
							</p>
						</div>
					</div>
				</div>
				<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-top: 14px">
					<div style="display: flex; flex-direction: row; align-items: center; height: 24px">
						<img width="24" height="24" src="resources/images/price_pet_medium.png" alt="중형견">
						<p style="font-size: 15px; line-height: 19px; color: #383C48; margin-left: 10px">중형견</p>
						<p style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 5px">15키로 미만</p>
					</div>
					<div style="display: flex; flex-direction: row">
						<div style="display: flex; align-items: center; flex-direction: row">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 1px; color: #4E525B; margin-right: 11px">
								${matchDtl.PRICE_MEDIUM_ALL}
							</p>
						</div>
						<div style="display: flex; flex-direction: column; align-items: center; width: 62px">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">
								${matchDtl.PRICE_MEDIUM_HALF}
							</p>
						</div>
					</div>
				</div>
				<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-top: 14px">
					<div style="display: flex; flex-direction: row; align-items: center; height: 24px">
						<img width="24" height="24" src="resources/images/price_pet_large.png" alt="대형견">
						<p style="font-size: 15px; line-height: 19px; color: #383C48; margin-left: 10px">대형견</p>
						<p style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 5px">15키로 이상</p>
					</div>
					<div style="display: flex; flex-direction: row">
						<div style="display: flex; align-items: center; flex-direction: row">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 1px; color: #4E525B; margin-right: 11px">
								${matchDtl.PRICE_LARGE_ALL}
							</p>
						</div>
						<div style="display: flex; flex-direction: column; align-items: center; width: 62px">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">
								${matchDtl.PRICE_LARGE_HALF}
							</p>
						</div>
					</div>
				</div>
			</div>
			<!-- 이용 요금 소개 끝 -->
			<!-- 카카오 지도 API: 펫시터 위치 표시 -->
			<div style="position: relative; line-height: 1em; display: flex; flex-direction: column; width: 375px; height: 400px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); margin-top: 38px; overflow: hidden; text-align: center;">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 8px">${name} 펫시터님의 동네 위치입니다.</h2>
					<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 10px">매칭이 성사되면 정확한 위치를 확인하실 수 있어요!</p>
				<div id="map" style="position: absolute; height: 300px; border-radius: 4px; border: 1px solid #DFE3EA; overflow: hidden; display: inline-block; text-align: center; top: 23%; left: 52.5%; width: 95%; margin-top: -0.5em; margin-left: -50%;">
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd69701c52c23858bb7f642b6fddbe23&libraries=services,clusterer,drawing"></script>

					<script>
						var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
						var options = { //지도를 생성할 때 필요한 기본 옵션
							center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
							level : 4 //지도의 레벨(확대, 축소 정도)
						};

						var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

						//회원의 주소값을 바로 지도에 표시하기 위해 가져오는 form 정보.
						var form = document.matchDetail;
					
						//이 부분 이미지를 인터넷에서 가져올 수 있도록 해야할 듯.
						var imageSrc = 'https://i.imgur.com/YYv8igP.png', // 마커이미지의 주소입니다    
							imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
							imageOption = {offset : new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다 + 마커 오버레이랑 클릭 버전도 있으니까 시간나면 트라이.
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
						//, markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						// 주소로 좌표를 검색합니다 + 주소를 가져와서 합쳐도 출력이 된다는 것을 알았으니 나중에 조건문을 넣어서 진행 단계에 따라 다르게 나오도록 하면 될 듯함.
						geocoder.addressSearch((petsittingReserve.address1.value), function(result, status) {
						//geocoder.addressSearch('경기도 의정부시 용민로 21', function(result, status) { //확인용
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									image : markerImage, // 마커이미지 설정 
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다 + 인포 윈도우는 다르게 수정할 수 있으니까 시간 나면 알아보자.
								var infowindow = new kakao.maps.InfoWindow({
									content : '<div style="width:150px;text-align:center;padding:6px 0;">위탁 지역</div>'
								});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
						//마커 이미지(막대 문 강아지) : https://i.imgur.com/YYv8igP.png  <img src="https://i.imgur.com/YYv8igP.png" title="dogmaker_after.png"/>
						//마커 이미지(서있는 강아지) : https://i.imgur.com/5qoSokU.png  <img src="https://i.imgur.com/5qoSokU.png" title="dogmaker_before.png"/>
					</script>
				</div>
			</div>
			<div style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 25px; padding-right: 25px; padding-bottom: 32px; margin-top: 40px; margin-bottom: 50px; text-align: center; vertical-align: middle; align-items: center; position: relative;">
				<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
					보살필 댕댕이를 선택해주세요!
				</p>
				<div style="width: 310px; height: 1px; background-color: #EBEBEB; margin-bottom: 5px"></div>
				<div style="margin-top: 30px; margin-bottom: 10px;"> <!-- 이 부분은 가져온 값을 돌려서 인덱스가 있으면, 으로 해서 조건을 줘야 할 것 같다. 혹시 모르니 한 10마리까지 만들어 놓을까? -->
					<c:forEach var="deng" items="${memPet}" varStatus="status">
						<div style="align-items: left; position: relative; text-align: left; margin-left: 30px;">
							<input type="checkbox" id="PETARR${status.count}" class="PETARR" name="PETARR" value="<c:out value='${deng.PET_ID}'/>"/><label for="PETARR${status.count}">
								<font style="font-size: 13px; color: #585858;"><c:out value="${deng.NAME}"/>&nbsp;&nbsp;/&nbsp;&nbsp;<c:out value="${deng.KIND}"/>&nbsp;&nbsp;/&nbsp;&nbsp;<c:out value="${deng.AGE}"/>&nbsp;살</font></label>
						</div>
					</c:forEach>
				</div>
				<div style="display: block; height: 80px; width: auto; position: relative; text-align: center; vertical-align: middle;">
					<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
						<div style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
							<button type="button" style="height: 50px; width: 130px; font-size: 20px; font: bold; background-color: #037FBB; border: none; color:#fff; cursor: pointer; border-radius: 10px;" name="petsittingInfoGo" id="petsittingInfoGo" onclick="petsittingOk()">신청</button>
						</div>
					</div>
					<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
						<div style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
							<button type="button" style="height: 50px; width: 130px; font-size: 20px; font: bold; background-color: #037FBB; border: none; color:#fff; cursor: pointer; border-radius: 10px;" onclick="history.back()">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>