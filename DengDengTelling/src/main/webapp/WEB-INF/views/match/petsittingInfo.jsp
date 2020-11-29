<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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

<script type="text/javascript">
	function pstUpdate() {
		var form = document.petsittingDetail;
		
		form.action = "/petsittingUpdate";
		form.submit();
	}	
	
	function pstDelete() {
		var form = document.petsittingDetail;

		form.action = "/petsittingDelete";
		form.submit();
	}
</script>

<form id="petsittingDetail" name="petsittingDetail" method="post">
	<!-- 카카오 지도에 사용 -->
	<input type="hidden" name="P_ADD1" id="P_ADD1" value="${pstDetail.P_ADD1}" />
	<input type="hidden" name="P_ADD2" id="P_ADD2" value="${pstDetail.P_ADD2}" />
	<input type="hidden" name="M_ADD1" id="M_ADD1" value="${pstDetail.M_ADD1}" />
	<input type="hidden" name="M_ADD2" id="M_ADD2" value="${pstDetail.M_ADD2}" />
	<!-- 조건문 및 업데이트에 사용 -->
	<input type="hidden" name="type" id="type" value="${MEM_TYPE}" />
	<input type="hidden" name="step" id="step" value="${pstDetail.PROGRESS_STEPS}" />
	<input type="hidden" name="pnum" id="pnum" value="${pstDetail.PROGRESS_NO}" />
	<!-- 금전 정보 등에 사용 -->
	<input type="hidden" name="M_ID" id="M_ID" value="${pstDetail.MEM_ID}" />
	<input type="hidden" name="P_ID" id="P_ID" value="${pstDetail.PSMEM_ID}" />
	<input type="hidden" name="PRICE" id="PRICE" value="${pstDetail.PRICE}" />
	<input type="hidden" name="PET_STR" id="PET_STR" value="${pstDetail.PET_ID}" />
	
	<!-- 펫시터 소개 상단 -->
	<div style="margin-top: 5px; margin-left: auto; margin-right: auto; width: 1027px; display: flex; flex-direction: row; justify-content: space-between">
		<div style="float: left; width: 66%; padding: 20px;">
			<div>
				<p style="font-family: Noto Sans KR, sans-serif; margin-top: 5px; font-size: 30px; color: #383C48; line-height: 30px; letter-spacing: -0.2px; text-align: center; align-items: center; position: relative;">
					예약 정보
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
							<span style="font-weight: bold; color: gold;">${pstDetail.P_CLASS}</span>&nbsp;펫시터&nbsp;<b>&nbsp;&nbsp;${pstDetail.P_NAME}</b>&nbsp;님
								&nbsp;&nbsp;/&nbsp;&nbsp;<b>${pstDetail.P_SEX}</b>&nbsp;&nbsp;/&nbsp;&nbsp;<b>${pstDetail.P_JOB}</b><br/>
						</h1>
					</div>
					<c:choose>
						<c:when test="${MEM_TYPE == '펫시터'}">
							<div>
								<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
									<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png" />연락처 : ${pstDetail.P_MOBILE}
								</p>
							<div>
							</div>
								<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
									<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png" />이메일 : ${pstDetail.P_EMAIL}
								</p>
							</div>
						</c:when>
						<c:otherwise>
							<c:if test="${pstDetail.PROGRESS_STEPS == 1 || pstDetail.PROGRESS_STEPS == 2}">
								<div>
									<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
										<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png" />연락처 : 예약이 완료되면 확인하실 수 있습니다.
									</p>
								<div>
								</div>
									<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
										<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png" />이메일 : 예약이 완료되면 확인하실 수 있습니다.
									</p>
								</div>
							</c:if>
							<c:if test="${pstDetail.PROGRESS_STEPS != 1 && pstDetail.PROGRESS_STEPS != 2}">
								<div>
									<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
										<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png" />연락처 : ${pstDetail.P_MOBILE}
									</p>
								<div>
								</div>
									<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
										<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png" />이메일 : ${pstDetail.P_EMAIL}
									</p>
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div style="display: flex; flex-direction: row"> <!-- 다음에 수정할 때는 이 지랄하지 말고 테이블에 넣어서 반복 돌려야지... 이건 미친 짓이다. -->
				<div> <!-- 서비스 부분은 컨트롤러에서 스플릿 해서 배열로 담아오자. 그 다음 반복문으로 꺼내면서 조건문을 포함해서 나오도록. -->
					<div style="display: flex; margin-top: 5px; width: 600px; position: relative; text-align: center;">
					<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; margin-bottom: 15px; line-height: 25px; color: #393C47">
						<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/check.png"> 위탁 장소 주소</h2>
					</div>
					<c:choose>
						<c:when test="${MEM_TYPE == '펫시터'}">
								<div style="display: block; width: auto; height: 25px; float: left; position: relative; text-align: cetner;">
									<div style="display: inline-block; margin-left: 35px; position: relative; width: 150;">
										<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 13px; color: #084B8A;">
											<b>${pstDetail.P_ADD1}&nbsp;${pstDetail.P_ADD2}&nbsp;${pstDetail.P_ADD_ADD}</b></p> 
									</div>
								</div>
						</c:when>
						<c:otherwise>
							<c:if test="${pstDetail.PROGRESS_STEPS == 1 || pstDetail.PROGRESS_STEPS == 2}">
								<div style="display: block; width: auto; height: 25px; float: left; position: relative; text-align: cetner;">
									<div style="display: inline-block; margin-left: 35px; position: relative; width: 150;">
										<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 13px; color: #084B8A;">
											<b>${pstDetail.P_ADD1}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">*상세 주소는 예약이 완료된 뒤 확인하실 수 있습니다.</font></p> 
									</div>
								</div>
							</c:if>
							<c:if test="${pstDetail.PROGRESS_STEPS != 1 && pstDetail.PROGRESS_STEPS != 2}">
								<div style="display: block; width: auto; height: 25px; float: left; position: relative; text-align: cetner;">
									<div style="display: inline-block; margin-left: 35px; position: relative; width: 150;">
										<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 13px; color: #084B8A;">
											<b>${pstDetail.P_ADD1}&nbsp;${pstDetail.P_ADD2}&nbsp;${pstDetail.P_ADD_ADD}</b></p> 
									</div>
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div style="display: flex; flex-direction: row"> <!-- 다음에 수정할 때는 이 지랄하지 말고 테이블에 넣어서 반복 돌려야지... 이건 미친 짓이다. -->
				<div> <!-- 서비스 부분은 컨트롤러에서 스플릿 해서 배열로 담아오자. 그 다음 반복문으로 꺼내면서 조건문을 포함해서 나오도록. -->
					<div style="display: flex; margin-top: 5px; width: 600px; position: relative; text-align: center;">
					<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; margin-bottom: 15px; line-height: 25px; color: #393C47">
						<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/check.png"> 상세 조건</h2>
					</div>
					<c:forEach var="service" items="${serviceArr}">
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
				
				<c:choose>
					<c:when test="${pstDetail.P_SCHOOL =='Y'}">
						<div style="display: flex; align-items: center; margin-left: 20px;">
							<img width="13" height="18" src="resources/images/medal.png">
							<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 13px; color: #555555; margin-top: 10px">
								&nbsp;&nbsp;&nbsp;${pstDetail.P_NAME} 님은 <font color="red" size="2"><b>반려동물 관련 학과</b></font>를 졸업한 전문 인재입니다.</p>
						</div>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${pstDetail.P_CERTI == 'Y'}">
						<div style="display: flex; align-items: center; margin-left: 20px;">
							<img width="13" height="18" src="resources/images/medal.png">
							<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 13px; color: #555555; margin-top: 1px">
								&nbsp;&nbsp;&nbsp;${pstDetail.P_NAME} 님은 <font color="red" size="2"><b>반려동물 관련 자격증</b></font>을 취득한 전문 인재입니다.</p>
						</div>
					</c:when>
				</c:choose>
			</div>
			<!--펫시터 자격증 및 교육 수료 -->
			<!-- 펫시터 반려동물 -->
			<div style="margin-top: 30px;">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; line-height: 25px; color: #393C47; margin-bottom: 20px">
					<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/check.png"> 반려동물</h2>
				<c:forEach var="petMem" items="${p_pet}" >
					<div style="display: flex; flex-direction: column; border-right: dashed 0.5px; border-bottom: dashed 0.5px; border-color: #58ACFA; border-radius: 30px; margin-bottom: 5px;">
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
			<!-- 위는 펫시터 매치 정보 -->
			<div style="margin-top: 70px; margin-bottom: 70px;">
				<hr width="100%" style="border: dashed 0.5px; border-color: #F5A9BC;"/>
			</div>
			<!-- 아래는 멤버 예약 정보 -->
			<div style="display: flex; flex-direction: row; border: dotted 1px; margin-top: 50px; border-radius: 15px; border-color: #F78181; height: 135px;">
				<div style="overflow: hidden; width: 100px; height: 100px; border: none; border-radius: 12px; margin-top: 15px; margin-left: 10px; margin-right: 32px;">
					<img width="100" height="100" style="object-fit: cover; display: inline-block;" src="resources/downimage/${memPfl.PROFILE_ORIGINAL_FILE_NAME}"/>
			<!-- 윗단은 멤버 프로필 사진 --> <!-- 프로필 사진도 가져와야 함 -->
				</div>
				<div style="overflow: hidden; width: 430px;">
					<div>
						<h1 style="font-family: Noto Sans KR, sans-serif; font-size: 20px; color: #4C5056; line-height: 35px; letter-spacing: -0.2px; ">
							<span style="font-weight: bold; color: gold;">소중한</span><b>&nbsp;&nbsp;${pstDetail.M_NAME}</b>&nbsp;님
								&nbsp;&nbsp;/&nbsp;&nbsp;<b>${pstDetail.M_SEX}</b>
						</h1>
					</div>
					<c:choose>
						<c:when test="${MEM_TYPE == '일반 회원'}" >
							<div>
								<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
									<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png" />연락처 : ${pstDetail.M_MOBILE}
								</p>
							<div>
							</div>
								<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
									<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png" />이메일 : ${pstDetail.M_EMAIL}
								</p>
							</div>
						</c:when>
						<c:otherwise>
							<c:if test="${pstDetail.PROGRESS_STEPS == 1 || pstDetail.PROGRESS_STEPS == 2}">
								<div>
									<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
										<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png" />연락처 : 예약이 완료되면 확인하실 수 있습니다.
									</p>
								<div>
								</div>
									<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
										<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png" />이메일 : 예약이 완료되면 확인하실 수 있습니다.
									</p>
								</div>
							</c:if>
							<c:if test="${pstDetail.PROGRESS_STEPS != 1 && pstDetail.PROGRESS_STEPS != 2}">
								<div>
									<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
										<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png" />연락처 : ${pstDetail.M_MOBILE}
									</p>
								<div>
								</div>
									<p style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #585858; line-height: 20px; letter-spacing: -0.2px;">
										<img width="14px" height="14px" style="object-fit: cover; margin-right: 5px;" src="resources/images/check.png" />이메일 : ${pstDetail.M_EMAIL}
									</p>
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div style="display: flex; flex-direction: row">
				<div>
					<div style="display: flex; margin-top: 5px; width: 600px; position: relative; text-align: center;">
						<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; line-height: 25px; color: #393C47; margin-bottom: 10px">
							<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/checkMem.png"> 거주지 주소</h2>
					</div>
					<c:choose>
						<c:when test="${MEM_TYPE == '일반 회원'}" >
							<div style="display: block; width: auto; height: 25px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; margin-left: 35px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 13px; color: #084B8A;">
										<b>${pstDetail.M_ADD1}&nbsp;${pstDetail.M_ADD2}&nbsp;${pstDetail.M_ADD_ADD}</b></p> 
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:if test="${pstDetail.PROGRESS_STEPS == 1 || pstDetail.PROGRESS_STEPS == 2}">
								<div style="display: block; width: auto; height: 25px; float: left; position: relative; text-align: cetner;">
									<div style="display: inline-block; margin-left: 35px; position: relative; width: 150;">
										<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 13px; color: #084B8A;">
											<b>${pstDetail.M_ADD1}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">*상세 주소는 예약이 완료된 뒤 확인하실 수 있습니다.</font></p> 
									</div>
								</div>
							</c:if>
							<c:if test="${pstDetail.PROGRESS_STEPS != 1 && pstDetail.PROGRESS_STEPS != 2}">
								<div style="display: block; width: auto; height: 25px; float: left; position: relative; text-align: cetner;">
									<div style="display: inline-block; margin-left: 35px; position: relative; width: 150;">
										<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 13px; color: #084B8A;">
											<b>${pstDetail.M_ADD1}&nbsp;${pstDetail.M_ADD2}&nbsp;${pstDetail.M_ADD_ADD}</b></p> 
									</div>
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- 멤버 반려동물 -->
			<div style="margin-top: 30px; margin-bottom: 100px;">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; line-height: 25px; color: #393C47; margin-bottom: 10px">
					<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/checkMem.png"> 반려동물</h2>
				<c:forEach var="petMem" items="${m_pet}" >
					<div style="display: flex; flex-direction: column; border-right: dashed 0.5px; border-bottom: dashed 0.5px; border-color: #FA5858; border-radius: 30px; margin-bottom: 5px;">
						<div style="display: flex; flex-direction: row; align-items: center;">
							<img width="50" height="50" src="resources/downimage/<c:out value='${petMem.STO_FILE_NAME}'/>" style="object-fit: cover; border-radius: 50%; margin-left: 20px; margin-right: 20px;">
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
					<p style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4; text-align: left;">${pstDetail.PETSITTING_DAYS}</p>
				</div>

				<!-- 예약 시간 선택 --> <!-- 이 부분은 조건문으로 저장된 값보다 작은 값은 나오지 않게 해야 함. 하려고 했지만 귀찮으니 나중에 적용 -->
				<div style="border: dotted 1px; display: flex; flex-direction: row; justify-content: space-between; margin-top: 10px; padding: 8px; border-radius: 15px; border-color: #A4A4A4;">
					<div style="width: 149px; margin-top: 10px;">
						<div style="display: flex; flex-direction: column; align-items: center; justify-content: space-between; margin-bottom: 1px; position: relative; text-align: center;">
							<p style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #6E6E6E; margin-bottom: 18px; position: relative; text-align: center;">
								<b>체크인 시간</b>
							</p>
							<p style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4; margin-left: 10px;">${pstDetail.CHECK_IN} 이후</p>
						</div>
					</div>
					<div style="width: 149px; margin-top: 10px;">
						<div style="display: flex; flex-direction: column; align-items: center; justify-content: space-between; margin-bottom: 8px; position: relative; text-align: center;">
							<p style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #6E6E6E; margin-bottom: 18px; text-align: center;">
								<b>체크아웃 시간</b>
							</p>
							<p style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4; margin-left: 10px;">${pstDetail.CHECK_OUT} 이전</p>
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
								${pstDetail.PRICE_S_A}
							</p>
						</div>
						<div style="display: flex; flex-direction: column; align-items: center; width: 62px">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">
								${pstDetail.PRICE_S_H}
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
								${pstDetail.PRICE_M_A}
							</p>
						</div>
						<div style="display: flex; flex-direction: column; align-items: center; width: 62px">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">
								${pstDetail.PRICE_M_H}
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
								${pstDetail.PRICE_L_A}
							</p>
						</div>
						<div style="display: flex; flex-direction: column; align-items: center; width: 62px">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">
								${pstDetail.PRICE_L_H}
							</p>
						</div>
					</div>
				</div>
			</div>
			<!-- 이용 요금 소개 끝 -->
			<!-- 지도 부분에 조건을 넣어서 결제 이상 단계면 상세 주소까지 표시되도록 해야 함. -->
			<!-- 카카오 지도 API: 펫시터 위치 표시 --> 
			<div style="position: relative; line-height: 1em; display: flex; flex-direction: column; width: 375px; height: 400px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); margin-top: 38px; overflow: hidden; text-align: center;">
				<c:if test="${MEM_TYPE == '일반 회원'}" >
					<c:choose>
						<c:when test="${pstDetail.PROGRESS_STEPS == 1 || pstDetail.PROGRESS_STEPS == 2}" >
							<h2 style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 8px">${pstDetail.P_NAME} 펫시터님의 위탁 지역입니다.</h2>
							<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 10px">매칭이 성사되면 정확한 위치를 확인하실 수 있어요!</p>		
						</c:when>
						<c:otherwise>
							<h2 style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 8px; margin-top: 30px;">${pstDetail.P_NAME} 펫시터님의 위탁 장소입니다.</h2>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${MEM_TYPE == '펫시터'}" >
					<c:choose>
						<c:when test="${pstDetail.PROGRESS_STEPS == 1 || pstDetail.PROGRESS_STEPS == 2}" >
							<h2 style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 8px">${pstDetail.M_NAME} 회원님의 거주 지역입니다.</h2>
							<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 10px">매칭이 성사되면 정확한 위치를 확인하실 수 있어요!</p>		
						</c:when>
						<c:otherwise>
							<h2 style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 8px; margin-top: 30px;">${pstDetail.M_NAME} 회원님의 거주 위치입니다.</h2>
						</c:otherwise>
					</c:choose>
				</c:if>
				
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

						//아래는 주소 조건을 넣기 위해 짜본 조건문
						var address;
						if(petsittingDetail.type.value == '일반 회원') {
							if(petsittingDetail.step.value == 1 || petsittingDetail.step.value == 2) {
								address = petsittingDetail.P_ADD1.value
							} else {
								address = petsittingDetail.P_ADD1.value + ' ' + petsittingDetail.P_ADD2.value
							}	
						} else if(petsittingDetail.type.value == '펫시터') {
							if(petsittingDetail.step.value == 1 || petsittingDetail.step.value == 2) {
								address = petsittingDetail.M_ADD1.value
							} else {
								address = petsittingDetail.M_ADD1.value + ' ' + petsittingDetail.M_ADD2.value
							}
						}
						
						// 주소로 좌표를 검색합니다 + 주소를 가져와서 합쳐도 출력이 된다는 것을 알았으니 나중에 조건문을 넣어서 진행 단계에 따라 다르게 나오도록 하면 될 듯함.
						geocoder.addressSearch(address, function(result, status) {
						//geocoder.addressSearch((petsittingDetail.P_ADD1.value + petsittingDetail.P_ADD2.value), function(result, status) {
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
			<div style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 25px; padding-right: 25px; padding-bottom: 32px; margin-top: 40px; text-align: center; vertical-align: middle; align-items: center; position: relative;">
				<c:choose>
					<c:when test="${pstDetail.DEL_GB == 'Y'}">
						<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
							펫시팅이 취소되었습니다.
						</p>
						<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
							<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
								<div style="height: 30px; width: auto; margin-top: 40px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
									<font style="size: 20px;"><b>${pstDetail.DEL_NAME} 님</b>의 사정으로 펫시팅이 취소되었습니다.</font>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:if test="${pstDetail.PROGRESS_STEPS == 1}">	<!-- 예약 진행 단계 -->
							<c:if test="${MEM_TYPE == '일반 회원'}">
								<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
									예약 확인을 기다리고 있습니다.
								</p>
								<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
									<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
										<div style="height: 30px; width: auto; margin-top: 30px; margin-left: 10px; text-align: center; position: relative; vertical-align: middle;">
											<font style="size: 20px;"><b>예약 신청 날짜 : &nbsp;</b><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pstDetail.RESERVE_DATE}" /></font>
										</div>
									</div>
								</div>
								<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
									<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
										<div style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
											<font style="size: 20px;">잠시만 기다려 주세요.</font>
										</div>
										<div style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
											<button type="button" style="height: 40px; width: 100px; font-size: 15px; font: bold; background-color: #037FBB; border: none; color:#fff; cursor: pointer; border-radius: 10px;" name="petsittingDeleteBt" id="petsittingDeleteBt" onclick="pstDelete()">예약 취소</button>
											<input type="hidden" name="del_name" value="${pstDetail.M_NAME}"/>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${MEM_TYPE == '펫시터'}">
								<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
									예약 신청을 확인해주세요.
								</p>
								<div style="margin-top: 30px; margin-bottom: 30px;"> <!-- 이 부분은 가져온 값을 돌려서 인덱스가 있으면, 으로 해서 조건을 줘야 할 것 같다. 혹시 모르니 한 10마리까지 만들어 놓을까? -->
									<h4 style="color: red;">예약을 승인하시겠습니까?</h4>
									<br/>
									<font style="size: 18px"><b>예약 내용을 다시 한번 확인해주세요.</b></font>
								</div>
								<div style="display: block; height: 80px; width: auto; position: relative; text-align: center; vertical-align: middle;">
									<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
										<div style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
											<button type="button" style="height: 50px; width: 130px; font-size: 20px; font: bold; background-color: #037FBB; border: none; color:#fff; cursor: pointer; border-radius: 10px;" name="petsittingUpdateBt" id="petsittingUpdateBt" onclick="pstUpdate()">예약 승인</button>
										</div>
									</div>
									<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
										<div style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
											<button type="button" style="height: 50px; width: 130px; font-size: 20px; font: bold; background-color: #037FBB; border: none; color:#fff; cursor: pointer; border-radius: 10px;" name="petsittingDeleteBt" id="petsittingDeleteBt" onclick="pstDelete()">예약 거절</button>
											<input type="hidden" name="del_name" value="${pstDetail.P_NAME}"/>
										</div>
									</div>
								</div>
							</c:if>
						</c:if>
						<c:if test="${pstDetail.PROGRESS_STEPS == 2}"> <!-- 결제 진행 단계 -->
							<c:if test="${MEM_TYPE == '일반 회원'}">
								<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
									예약이 완료되었습니다.
								</p>
								<div style="margin-top: 30px; margin-bottom: 10px;"> <!-- 이 부분은 가져온 값을 돌려서 인덱스가 있으면, 으로 해서 조건을 줘야 할 것 같다. 혹시 모르니 한 10마리까지 만들어 놓을까? -->
									<font style="size: 20px; font: bold">결제를 진행해주세요.</font><br/>
								</div>
								<div style="display: block; height: 80px; width: auto; position: relative; text-align: center; vertical-align: middle;">
									<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
										<div style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
											<button type="button" style="height: 50px; width: 130px; font-size: 20px; font: bold; background-color: #037FBB; border: none; color:#fff; cursor: pointer; border-radius: 10px;" name="petsittingUpdateBt" id="petsittingUpdateBt" value="3" onclick="pstUpdate()">결제</button>
											<input type="hidden" name="DATES" value="${pstDetail.PETSITTING_DAYS}"/>
										</div>
									</div>
									<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
										<div style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
											<button type="button" style="height: 50px; width: 130px; font-size: 20px; font: bold; background-color: #037FBB; border: none; color:#fff; cursor: pointer; border-radius: 10px;" name="petsittingDeleteBt" id="petsittingDeleteBt" onclick="pstDelete()">예약 취소</button>
											<input type="hidden" name="del_name" value="${petsittingDetail.M_NAME}"/>
										</div>
									</div>
								</div>
								<!-- 결제 진행 = 카카오 페이? -->
							</c:if>
							<c:if test="${MEM_TYPE == '펫시터'}">
								<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
									결제를 기다리고 있습니다.
								</p>
								<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
									<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
										<div style="height: 30px; width: auto; margin-top: 30px; margin-left: 10px; text-align: center; position: relative; vertical-align: middle;">
											<font style="size: 20px;"><b>예약 신청 날짜 : &nbsp;</b><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pstDetail.RESERVE_DATE}" /></font>
										</div>
									</div>
								</div>
								<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
									<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
										<div style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
											<font style="size: 20px;">잠시만 기다려 주세요.</font>
										</div>
										<div style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
											<button type="button" style="height: 40px; width: 100px; font-size: 15px; font: bold; background-color: #037FBB; border: none; color:#fff; cursor: pointer; border-radius: 10px;" name="petsittingDeleteBt" id="petsittingDeleteBt" onclick="pstDelete()">예약 취소</button>
											<input type="hidden" name="del_name" value="${petsittingDetail.P_NAME}"/>
										</div>
									</div>
								</div>
							</c:if>
						</c:if>
						<c:if test="${pstDetail.PROGRESS_STEPS == 3}"> <!-- 펫시팅 진행 단계 -->
							<input type="hidden" name="firstDay" value="${firstDay}" />	<!-- 예약 첫 날 가져오기 -->
							<input type="hidden" name="lastDay" value="${lastDay}" />	<!-- 예약 끝 날 가져오기 -->
							<input type="hidden" name="nowDay" value="${nowDay}" />		<!-- 오늘 날짜 가져오기 -->
							
							<c:if test="${MEM_TYPE == '일반 회원'}">
								<c:if test="${firstDay - nowDay > 0}">
									<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
										예약 날짜를 기다리고 있습니다.
									</p>
									<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
										<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
											<div style="height: 30px; width: auto; margin-top: 30px; margin-left: 10px; text-align: center; position: relative; vertical-align: middle;">
												<h4>약속일까지 <b>${firstDay - nowDay}일</b> 남았습니다.</h4>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${firstDay - nowDay <= 0 && lastDay - nowDay > 0}">
									<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
										펫시팅이 진행 중입니다.
									</p>
									<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
										<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
											<div style="height: 30px; width: auto; margin-top: 30px; margin-left: 10px; text-align: center; position: relative; vertical-align: middle;">
												<h4>펫시팅 <b>${nowDay - firstDay + 1}일</b>차 입니다.</h4>
											</div>
											<div style="margin-top: 30px; margin-bottom: 10px;"> <!-- 이 부분은 가져온 값을 돌려서 인덱스가 있으면, 으로 해서 조건을 줘야 할 것 같다. 혹시 모르니 한 10마리까지 만들어 놓을까? -->
												<h4>종료까지 <b> ${lastDay - nowDay + 1}일</b> 남았습니다.</h4>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${lastDay - nowDay <= 0}">
									<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
										펫시팅이 종료되었습니다.
									</p>
									<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
										<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
											<div style="height: 30px; width: auto; margin-top: 15px; margin-left: 10px; text-align: center; position: relative; vertical-align: middle;">
												<h4>댕댕이와 만나셨다면</h4>
												<h4> <b>펫시팅 종료 버튼</b>을 눌러주세요.</h4>
											</div>
										</div>
									</div>
									<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
										<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
											<div style="height: 30px; width: auto; margin-top: 35px; margin-left: 10px; margin-right: 10px; margin-bottom: 10px; text-align: center; position: relative; vertical-align: middle;">
												<button type="button" style="height: 50px; width: 130px; font-size: 20px; font: bold; background-color: #037FBB; border: none; color:#fff; cursor: pointer; border-radius: 10px;" name="petsittingUpdateBt" id="petsittingUpdateBt" value="4" onclick="pstUpdate()">펫시팅 종료</button>
											</div>
										</div>
									</div>
								</c:if>
							</c:if>
							<c:if test="${MEM_TYPE == '펫시터'}">
								<c:if test="${firstDay - nowDay >= 0}">
									<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
										예약 날짜를 기다리고 있습니다.
									</p>
									<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
										<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
											<div style="height: 30px; width: auto; margin-top: 30px; margin-left: 10px; text-align: center; position: relative; vertical-align: middle;">
												<h4>약속일까지 <b>${firstDay - nowDay}일</b> 남았습니다.</h4>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${firstDay - nowDay <= 0 && lastDay - nowDay > 0}">
									<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
											펫시팅이 진행 중입니다.
									</p>
									<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
										<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
											<div style="height: 30px; width: auto; margin-top: 30px; margin-left: 10px; text-align: center; position: relative; vertical-align: middle;">
												<h4>펫시팅 <b>${nowDay - firstDay + 1}일</b>차 입니다.</h4>
											</div>
											<div style="margin-top: 30px; margin-bottom: 10px;"> <!-- 이 부분은 가져온 값을 돌려서 인덱스가 있으면, 으로 해서 조건을 줘야 할 것 같다. 혹시 모르니 한 10마리까지 만들어 놓을까? -->
												<h4>종료까지 <b> ${lastDay - nowDay + 1}일</b>남았습니다.</h4>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${lastDay - nowDay <= 0}">
									<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
										펫시팅이 종료되었습니다.
									</p>
									<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
										<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
											<div style="height: 30px; width: auto; margin-top: 30px; margin-left: 10px; text-align: center; position: relative; vertical-align: middle;">
												<h4>펫시팅 종료를 기다리고 있습니다.</h4>
											</div>
										</div>
									</div>
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${pstDetail.PROGRESS_STEPS == 4}">
							<c:if test="${MEM_TYPE == '일반 회원'}">
								<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
									이용 후기를 남겨주세요.
								</p>
								<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
									<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
										<div style="height: 30px; width: auto; margin-top: 15px; margin-left: 10px; text-align: center; position: relative; vertical-align: middle;">
											<h5>회원님이 남기신 후기는</h5>
											<h5>펫시터와 댕댕텔링에게 큰 도움이 됩니다.</h5>
										</div>
									</div>
								</div>
								<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
									<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
										<div style="height: 30px; width: auto; margin-top: 35px; margin-left: 10px; margin-right: 10px; margin-bottom: 10px; text-align: center; position: relative; vertical-align: middle;">
											<button type="button" style="height: 50px; width: 130px; font-size: 20px; font: bold; background-color: #037FBB; border: none; color:#fff; cursor: pointer; border-radius: 10px;" name="petsittingUpdateBt" id="petsittingUpdateBt" value="5" onclick="pstUpdate()">후기 등록하기</button>
										</div>
									</div>
								</div>
								<!--  후기 남기기로 이동합니다. (이 부분 페이지 따로 만들건지 아니면 여기 본문에 만들건지 생각해봐야 함.)
								본문에 만들 경우 when문으로 step == 4 이면 후기 및 설문 조사 페이지를 띄우고 other일 경우 일반 페이지 양식
								이 부분은 위의 조건문에서 step이 5면, 작성했느지 안 했는지 확인하도록 해야 함.-->
							</c:if>
							<c:if test="${MEM_TYPE == '펫시터'}">
								<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
									펫시팅이 종료되었습니다.
								</p>
								<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
									<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
										<div style="height: auto; width: auto; margin-top: 15px; margin-left: 10px; text-align: center; position: relative; vertical-align: middle;">
											<font style="size: 20xp"><b>${pstDetail.P_NAME} 펫시터님</b> 고생 많으셨습니다.<br/>
											펫시팅 및 출금, 기타 이용에 관한 문의사항은<br/>
											댕댕텔링에게 알려주세요.</font>
										</div>
									</div>
								</div>
							</c:if>
						</c:if>
						<c:if test="${pstDetail.PROGRESS_STEPS == 5}">
							<c:if test="${MEM_TYPE == '일반 회원'}">
								<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
									펫시팅이 종료되었습니다.
								</p>
								<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
									<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
										<div style="height: auto; width: auto; margin-top: 15px; margin-left: 10px; text-align: center; position: relative; vertical-align: middle;">
											<h4><b>${pstDetail.M_NAME} 회원님</b> 감사합니다.</h4>
											<h4>펫시팅 및 기타 이용에 관한 문의사항은</h4>
											<h4>댕댕텔링에게 알려주세요.</h4>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${MEM_TYPE == '펫시터'}">
								<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
									펫시팅이 종료되었습니다.
								</p>
								<div style="display: block; width: auto; position: relative; text-align: center; vertical-align: middle;">
									<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
										<div style="height: auto; width: auto; margin-top: 15px; margin-left: 10px; text-align: center; position: relative; vertical-align: middle;">
											<h4><b>${pstDetail.P_NAME} 펫시터님</b> 고생 많으셨습니다.</h4>
											<h4>펫시팅 및 출금, 기타 이용에 관한 문의사항은</h4>
											<h4>댕댕텔링에게 알려주세요.</h4>
										</div>
									</div>
								</div>
							</c:if>
						</c:if>
					</c:otherwise>
				</c:choose>				
			</div>
		</div>
	</div>
</form>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>