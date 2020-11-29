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

<c:set var="name" value="${pst.NAME}" />
<c:set var="grade" value="${pstAdd.PSMEM_CLASS}" />
<c:set var="school" value="${pstAdd.PSMEM_SCHOOL_FINISH_CHECK}" />
<c:set var="certiChk" value="${pstAdd.PSMEM_CERTI_CHECK}" />

<script type="text/javascript">
	// 이미지 슬라이드
	var slideIndex = 1;
	showSlides(slideIndex);

	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("demo");
		var captionText = document.getElementById("caption");
		if (n > slides.length) {slideIndex = 1}
		if (n < 1) {slideIndex = slides.length}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex-1].style.display = "block";
		dots[slideIndex-1].className += " active";
		captionText.innerHTML = dots[slideIndex-1].alt;
	}
	
// 매치 등록
	function petsittingInsert() {
		var form = document.matchInsert;

		//이 부분에는 이제 입력할 값을 넣어야 한다는 거
		if (form.largeHalf.value == "선택") {
			alert("요금을 설정해주세요.")
			form.largeHalf.focus();
			return false;
		}
		
		form.action = "/petsittingReserve";
		form.submit();
	}	
	
</script>

<form id="matchInsert" name="matchInsert" method="post" style="width: 1300px;">
	<input type="hidden" name="address1" id="address1"
		value="${pstAdd.PSMEM_CONSIGNMENT_ADDRESS1}" /> <input type="hidden"
		name="address2" id="address2"
		value="${pstAdd.PSMEM_CONSIGNMENT_ADDRESS2}" /> <input type="hidden"
		name="PSMEM_ID" id="PSMEM_ID" value="${ID}" /> <input type="hidden"
		name="name" id="name" value="${name}" /> <input type="hidden"
		name="GRADE" id="GRADE" value="${grade}" /> <input type="hidden"
		name="chkList" id="chkList" value="${chkList}" />



	<!-- 펫시터 소개 상단 -->
	<div 
		style="margin-top: 73px; margin-left: auto; margin-right: auto; width: 1200px; height:1500px; display: flex; flex-direction: row; justify-content: space-between;">
		<div class="div_flex"
			style=" width: 66%; padding: 40px; position: relative; top: 10em; left: 1em;">
			<div style="display: flex; flex-direction: row">
				<div
					style="overflow: hidden; width: 150px; height: 150px; border: none; border-radius: 12px; margin-top: 5px; margin-left: 10px; margin-right: 32px; position: relative; bottom: 4em; right: 4em;">
					<img width="150px" height="150px"
						style="object-fit: cover; display: inline-block;"
						src="resources/images/${pstPfl.PROFILE_ORIGINAL_FILE_NAME}" />
					<!-- 윗단은 멤버 프로필 사진 -->
					<!-- 프로필 사진도 가져와야 함 -->
				</div>
				<div
					style="overflow: hidden; width: 430px; position: relative; bottom: 1.5em;">
					<h1
						style="font-family: Noto Sans KR, sans-serif; font-size: 15px; color: #4C5056; line-height: 22px; letter-spacing: -0.2px">
						<span style="color: rgb(94, 99, 109)">${pstAdd.PSMEM_CONSIGNMENT_ADDRESS1}</span><br />
						<span style="font-weight: bold; color: gold; font-size: 1.5em;">${grade}
							펫시터 </span><b">&nbsp;&nbsp;&nbsp;&nbsp;${name}</b> 님
					</h1>
					<p
						style="font-family: Noto Sans KR, sans-serif; margin-top: 5px; font-size: 25px; color: #383C48; line-height: 30px; letter-spacing: -0.2px;">
						${matchDtl.MATCH_SUBJECT}</p>
					<!-- 해시 태그 시작 x service로 바꿈 -->
				</div>
			</div>
			<div
				style="display: flex; flex-direction: row; position: relative; right: 3em;">
				<!-- 다음에 수정할 때는 이 지랄하지 말고 테이블에 넣어서 반복 돌려야지... 이건 미친 짓이다. -->
				<div>
					<!-- 서비스 부분은 컨트롤러에서 스플릿 해서 배열로 담아오자. 그 다음 반복문으로 꺼내면서 조건문을 포함해서 나오도록. -->
					<div
						style="display: flex; margin-top: 50px; width: 600px; position: relative; text-align: center;">
						<h2
							style="font-weight: 600; font-size: 17px; letter-spacing: 1px; margin-bottom: 30px; line-height: 25px; color: #393C47">
							<img width="17px" height="17px"
								style="object-fit: cover; display: inline-block; margin-right: 5px;"
								src="resources/images/point.png"> ${name} 펫시터님의 상세 조건입니다.
						</h2>
					</div>
					<c:forEach var="service" items="${serviceList}">
						<c:if test="${service == 'service01'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>반려동물 없음</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										현재 반려동물 없음</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service02'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: auto; margin-right: auto; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>픽업</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										집 앞 픽업 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service03'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>대형견</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										대형견 예약 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service04'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>마당 있음</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										뛰어놀 마당 보유</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service05'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>노견 케어</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										노견 집중 케어 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service06'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>장기 예약</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										14일 이상 돌봄 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service07'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>실내 놀이</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										편한 실내 놀이 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service08'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>매일 산책</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										매일 근처 산책 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service09'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>목욕 가능</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										댕댕이 목욕 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service10'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>약물 경구 복용</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										약물 먹이기 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service11'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>강아지 케어</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										어린 댕댕 집중 관리</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service12'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>아파트</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										아파트 주거 중</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service13'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>빌라</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										빌라 거주 중</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service14'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>단독 주택</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										단독 주택 거주 중</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service15'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>싱글</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										집중 케어가 가능해요</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service16'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>아이 없음</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										집중 케어가 가능해요</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service17'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>반려동물 등록 가능</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										댕댕 등록 대행 가능</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 펫시터 소개 상단 끝 -->

			<!-- 펫시터 소개 시작 -->
			<div>
				<c:choose>
					<c:when test="${grade=='프로'}">
						<div
							style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(243, 243, 243); position: relative; right: 3em;">
							<div style="display: flex; align-items: center;">
								<img width="16" height="23"
									src="resources/images/pro_petsitter.png">
									<p
										style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px; margin-top: 15px;">
										${name} 님은 프로 펫시터입니다.</p>
							</div>
							<p
								style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
								프로 펫시터는 다수의 펫시팅 경험과 높은 고객 만족도는 물론, 댕댕텔링의 프로 시험을 통과한 펫시터입니다.</p>
						</div>
					</c:when>
					<c:when test="${grade=='일반'}">
						<div
							style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(243, 243, 243); position: relative; right: 3em;">
							<div style="display: flex; align-items: center;">
								<img width="16" height="23"
									src="resources/images/pro_petsitter.png">
									<p
										style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px; margin-top: 15px;">
										${name} 님은 일반 펫시터입니다.</p>
							</div>
							<p
								style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
								일반 펫시터는 다수의 예약 진행을 경험한 댕댕텔링의 프리미엄 펫시터입니다.</p>
						</div>
					</c:when>
					<c:when test="${grade=='신입'}">
						<div
							style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(243, 243, 243); position: relative;">
							<div style="display: flex; align-items: center;">
								<img width="16" height="23"
									src="resources/images/pro_petsitter.png">
									<p
										style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px; margin-top: 15px;">
										${name} 님은 신입 펫시터입니다.</p>
							</div>
							<p
								style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
								신입 펫시터는 댕댕텔링의 자격 시험을 통과한 전문 펫시터입니다.</p>
						</div>
					</c:when>
				</c:choose>
				<!-- 펫시터 소개 시작 -->
				<!-- 펫시터 인사글 -->
				<div style="margin-top: 53px; position: relative; right: 3em;">
					<h2
						style="font-weight: 600; font-size: 17px; letter-spacing: 1px; margin-bottom: 30; line-height: 25px; color: #393C47">
						<img width="17px" height="17px"
							style="object-fit: cover; display: inline-block; margin-right: 5px;"
							src="resources/images/point.png"> ${name} ${grade} 펫시터님을
							소개합니다
					</h2>
					<div style="border: 1px dotted; padding: 10px; border-radius: 10px">
						<p
							style="font-size: 15px; line-height: 25px; color: #555555; margin-top: 10px">
							${pstAdd.PSMEM_CAREER}<br /> ${pstAdd.PSMEM_INTRODUCE}
						</p>
					</div>
				</div>
			</div>

	<hr style="width: 90em; height:0.5em; color: grey; position: relative; top:10em; "></hr>

					<!--  두번째 아이템 부분 -->

						<div style="display: flex; flex-direction: row; position: relative; top:16em">
				<div
					style="overflow: hidden; width: 150px; height: 150px; border: none; border-radius: 12px; margin-top: 5px; margin-left: 10px; margin-right: 32px; position: relative; bottom: 4em; right: 4em;">
					<img width="150px" height="150px"
						style="object-fit: cover; display: inline-block;"
						src="resources/images/${pstPfl.PROFILE_ORIGINAL_FILE_NAME}" />
					<!-- 윗단은 멤버 프로필 사진 -->
					<!-- 프로필 사진도 가져와야 함 -->
				</div>
				<div
					style="overflow: hidden; width: 430px; position: relative; bottom: 1.5em;">
					<h1
						style="font-family: Noto Sans KR, sans-serif; font-size: 15px; color: #4C5056; line-height: 22px; letter-spacing: -0.2px">
						<span style="color: rgb(94, 99, 109)">${pstAdd.PSMEM_CONSIGNMENT_ADDRESS1}</span><br />
						<span style="font-weight: bold; color: gold; font-size: 1.5em;">${grade}
							펫시터 </span><b">&nbsp;&nbsp;&nbsp;&nbsp;${name}</b> 님
					</h1>
					<p
						style="font-family: Noto Sans KR, sans-serif; margin-top: 5px; font-size: 25px; color: #383C48; line-height: 30px; letter-spacing: -0.2px;">
						${matchDtl.MATCH_SUBJECT}</p>
					<!-- 해시 태그 시작 x service로 바꿈 -->
				</div>
			</div>


			<div
				style="display: flex; flex-direction: row; position: relative; right: 3em; top:15em;">
				<!-- 다음에 수정할 때는 이 지랄하지 말고 테이블에 넣어서 반복 돌려야지... 이건 미친 짓이다. -->
				<div>
					<!-- 서비스 부분은 컨트롤러에서 스플릿 해서 배열로 담아오자. 그 다음 반복문으로 꺼내면서 조건문을 포함해서 나오도록. -->
					<div
						style="display: flex; margin-top: 50px; width: 600px; position: relative; text-align: center;">
						<h2
							style="font-weight: 600; font-size: 17px; letter-spacing: 1px; margin-bottom: 30px; line-height: 25px; color: #393C47">
							<img width="17px" height="17px"
								style="object-fit: cover; display: inline-block; margin-right: 5px;"
								src="resources/images/point.png"> ${name} 펫시터님의 상세 조건입니다.
						</h2>
					</div>
					<c:forEach var="service" items="${serviceList}">
						<c:if test="${service == 'service01'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>반려동물 없음</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										현재 반려동물 없음</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service02'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: auto; margin-right: auto; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>픽업</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										집 앞 픽업 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service03'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>대형견</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										대형견 예약 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service04'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>마당 있음</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										뛰어놀 마당 보유</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service05'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>노견 케어</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										노견 집중 케어 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service06'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>장기 예약</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										14일 이상 돌봄 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service07'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>실내 놀이</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										편한 실내 놀이 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service08'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>매일 산책</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										매일 근처 산책 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service09'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>목욕 가능</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										댕댕이 목욕 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service10'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>약물 경구 복용</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										약물 먹이기 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service11'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>강아지 케어</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										어린 댕댕 집중 관리</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service12'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>아파트</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										아파트 주거 중</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service13'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>빌라</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										빌라 거주 중</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service14'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>단독 주택</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										단독 주택 거주 중</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service15'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>싱글</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										집중 케어가 가능해요</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service16'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>아이 없음</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										집중 케어가 가능해요</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service17'}">
							<div
								style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div
									style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
									<img width="32" height="32" src="resources/images/service1.png">
								</div>
								<div
									style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p
										style="font-family: &amp; amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>반려동물 등록 가능</b>
									</p>
									<p
										style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										댕댕 등록 대행 가능</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 펫시터 소개 상단 끝 -->

			<!-- 펫시터 소개 시작 -->
			<div>
				<c:choose>
					<c:when test="${grade=='프로'}">
						<div
							style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(243, 243, 243); position: relative; right: 3em;  top:16em;">
							<div style="display: flex; align-items: center;">
								<img width="16" height="23"
									src="resources/images/pro_petsitter.png">
									<p
										style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px; margin-top: 15px;">
										${name} 님은 프로 펫시터입니다.</p>
							</div>
							<p
								style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
								프로 펫시터는 다수의 펫시팅 경험과 높은 고객 만족도는 물론, 댕댕텔링의 프로 시험을 통과한 펫시터입니다.</p>
						</div>
					</c:when>
					<c:when test="${grade=='일반'}">
						<div
							style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(243, 243, 243); position: relative; right: 3em;">
							<div style="display: flex; align-items: center;">
								<img width="16" height="23"
									src="resources/images/pro_petsitter.png">
									<p
										style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px; margin-top: 15px;">
										${name} 님은 일반 펫시터입니다.</p>
							</div>
							<p
								style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
								일반 펫시터는 다수의 예약 진행을 경험한 댕댕텔링의 프리미엄 펫시터입니다.</p>
						</div>
					</c:when>
					<c:when test="${grade=='신입'}">
						<div
							style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(243, 243, 243); position: relative;">
							<div style="display: flex; align-items: center;">
								<img width="16" height="23"
									src="resources/images/pro_petsitter.png">
									<p
										style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px; margin-top: 15px;">
										${name} 님은 신입 펫시터입니다.</p>
							</div>
							<p
								style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
								신입 펫시터는 댕댕텔링의 자격 시험을 통과한 전문 펫시터입니다.</p>
						</div>
					</c:when>
				</c:choose>
				<!-- 펫시터 소개 시작 -->
				<!-- 펫시터 인사글 -->
				<div style="margin-top: 53px; position: relative; right: 3em; top: 15em;">
					<h2
						style="font-weight: 600; font-size: 17px; letter-spacing: 1px; margin-bottom: 30; line-height: 25px; color: #393C47">
						<img width="17px" height="17px"
							style="object-fit: cover; display: inline-block; margin-right: 5px;"
							src="resources/images/point.png"> ${name} ${grade} 펫시터님을
							소개합니다
					</h2>
					<div style="border: 1px dotted; padding: 10px; border-radius: 10px">
						<p
							style="font-size: 15px; line-height: 25px; color: #555555; margin-top: 10px">
							${pstAdd.PSMEM_CAREER}<br /> ${pstAdd.PSMEM_INTRODUCE}
						</p>
					</div>
				</div>
			</div>








		<!-- 두번째 아이템  끝 -->



			<!-- 이 부분에 펫시터 문의하기랑 이용후기가 달려야 함. -->
		</div>









		<div style="float: left; width: 30%;">
			<!-- 펫시터 예약 날짜 선택 -->
			<div
				style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 32px; padding-right: 32px; padding-bottom: 32px">
				<p
					style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
					예약 날짜 선택</p>
				<div style="display: flex; flex-grow: 1; margin-top: 1em">
					<form method="get" class="tm-search-form tm-section-pad-2">
						<div class="form-group tm-form-element tm-form-element-50"
							style="width: 22em; right: 3em; bottom: 1em">
							<i class="fa fa-calendar fa-2x tm-form-element-icon"></i> <input
								name="basicDate" type="text" class="flatpickr-input"
								id="basicDate" placeholder="클릭해서 예약 날짜를 선택해주세요."
								style="font-size: 1em">
						</div>
					</form>
				</div>

				<!-- 예약 시간 선택 -->
				<!-- 이 부분은 조건문으로 저장된 값보다 작은 값은 나오지 않게 해야 함. 하려고 했지만 귀찮으니 나중에 적용 -->
				<div
					style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 38px">
					<div style="width: 149px">
						<div
							style="display: flex; flex-direction: column; align-items: center; justify-content: space-between; margin-bottom: 8px; position: relative;">
							<p
								style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-bottom: 18px; text-align: center;">
								<b>체크인 시간</b>
							</p>
							<p
								style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4">${matchDtl.MATCH_CHECK_IN}
								이후</p>
						</div>
					</div>
					<div style="width: 149px">
						<div
							style="display: flex; flex-direction: column; align-items: center; justify-content: space-between; margin-bottom: 8px; text-align: center;">
							<p
								style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-bottom: 18px; text-align: center;">
								<b>체크아웃 시간</b>
							</p>
							<p
								style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4">${matchDtl.MATCH_CHECK_OUT}
								이전</p>
						</div>
					</div>
				</div>
				<!-- 예약 시간 선택 끝 -->
			</div>
			<!-- 펫시터 예약 날짜 선택 끝 -->
			<!-- 이용 요금 소개 -->
			<!-- 가능, 불가 선택. 지정된 액수 안에서 금액 설정 가능하게. -->

			<!-- 이용 요금 소개 끝 -->
			<!-- 카카오 지도 API: 펫시터 위치 표시 -->
			<div
				style="position: relative; line-height: 1em; display: flex; flex-direction: column; width: 375px; height: 400px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); margin-top: 38px; overflow: hidden; text-align: center;">
				<h2
					style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 8px">${name}
					펫시터님의 동네 위치입니다.</h2>
				<p
					style="font-size: 12px; letter-spacing: -0.2px; line-height: 10px">매칭이
					성사되면 정확한 위치를 확인하실 수 있어요!</p>
				<div id="map"
					style="position: absolute; height: 300px; border-radius: 4px; border: 1px solid #DFE3EA; overflow: hidden; display: inline-block; text-align: center; top: 23%; left: 52.5%; width: 95%; margin-top: -0.5em; margin-left: -50%;">
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd69701c52c23858bb7f642b6fddbe23&libraries=services,clusterer,drawing"></script>

					<script>
						var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
						var options = { //지도를 생성할 때 필요한 기본 옵션
							center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
							level : 4 //지도의 레벨(확대, 축소 정도)
						};

						var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

						//회원의 주소값을 바로 지도에 표시하기 위해 가져오는 form 정보.
						var form = document.matchInsert;
					
						//이 부분 이미지를 인터넷에서 가져올 수 있도록 해야할 듯.
						var imageSrc = 'file:///C:/Users/Dead Cat/git/DengDengProject/src/main/webapp/resources/images/dogmaker_after.png', // 마커이미지의 주소입니다    
							imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
							imageOption = {offset : new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다 + 마커 오버레이랑 클릭 버전도 있으니까 시간나면 트라이.
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
						//, markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						// 주소로 좌표를 검색합니다 + 주소를 가져와서 합쳐도 출력이 된다는 것을 알았으니 나중에 조건문을 넣어서 진행 단계에 따라 다르게 나오도록 하면 될 듯함.
						geocoder.addressSearch((matchInsert.address1.value), function(result, status) {
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
					</script>
				</div>
			</div>


			<!-- 펫시터 예약 날짜 선택 -->
			<div
				style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 32px; padding-right: 32px; padding-bottom: 32px; margin-top: 4em;">
				<p
					style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
					예약 날짜 선택</p>
				<div style="display: flex; flex-grow: 1; margin-top: 1em">
					<form method="get" class="tm-search-form tm-section-pad-2">
						<div class="form-group tm-form-element tm-form-element-50"
							style="width: 22em; right: 3em; bottom: 1em">
							<i class="fa fa-calendar fa-2x tm-form-element-icon"></i> <input
								name="basicDate" type="text" class="flatpickr-input"
								id="basicDate" placeholder="클릭해서 예약 날짜를 선택해주세요."
								style="font-size: 1em">
						</div>
					</form>
				</div>
				<!-- 예약 시간 선택 -->
				<!-- 이 부분은 조건문으로 저장된 값보다 작은 값은 나오지 않게 해야 함. 하려고 했지만 귀찮으니 나중에 적용 -->
				<div
					style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 38px">
					<div style="width: 149px">
						<div
							style="display: flex; flex-direction: column; align-items: center; justify-content: space-between; margin-bottom: 8px; position: relative;">
							<p
								style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-bottom: 18px; text-align: center;">
								<b>체크인 시간</b>
							</p>
							<p
								style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4">${matchDtl.MATCH_CHECK_IN}
								이후</p>
						</div>
					</div>
					<div style="width: 149px">
						<div
							style="display: flex; flex-direction: column; align-items: center; justify-content: space-between; margin-bottom: 8px; text-align: center;">
							<p
								style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-bottom: 18px; text-align: center;">
								<b>체크아웃 시간</b>
							</p>
							<p
								style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4">${matchDtl.MATCH_CHECK_OUT}
								이전</p>
						</div>
					</div>
				</div>
				<!-- 예약 시간 선택 끝 -->
			</div>
			<!-- 펫시터 예약 날짜 선택 끝 -->






			<div
				style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 25px; padding-right: 25px; padding-bottom: 32px; margin-top: 40px; text-align: center; vertical-align: middle; align-items: center; position: relative;">
				<p
					style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600"></p>
				<div
					style="display: block; height: 80px; width: auto; position: relative; text-align: center; vertical-align: middle;">
					<div
						style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
						<div
							style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
							<button type="button"
								style="height: 50px; width: 130px; font-size: 20px; font: bold; background-color: #037FBB; border: none; color: #fff; cursor: pointer; border-radius: 10px;"
								name="petsittingReserveBt" id="petsittingReserveBt"
								onclick="petsittingInsert()">예약하기</button>
						</div>
					</div>
					<div
						style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
						<div
							style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
							<button type="button"
								style="height: 50px; width: 130px; font-size: 20px; font: bold; background-color: #037FBB; border: none; color: #fff; cursor: pointer; border-radius: 10px;"
								name="petsittingReserveBt" id="petsittingReserveBt"
								onclick="petsittingInsert()">찜하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>


<style>
.div_flex {

 -webkit-flex-direction:column;
　flex-direction:column;
}
</style>


<!-- flatpickr jQuery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Flatpickr -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
<!-- flatpickr -->
<script id="INLINE_PEN_JS_ID">
	console.log("chkList:", '${chkList}');
	
	$("#basicDate").flatpickr({  // 이 방식은 펫시터가 사용. //일단 disable이 불가능한 것 같으니 일반 회원도 이걸로 사용.
		mode: "multiple",	//다중 선택
		dateFormat: "Y-m-d",
		minDate: "today",  //펫시터가 선택하는 날짜는 DB에 리스트로 저장했다가 일반 회원이 고를 때 enable로 가능한 날짜만 표시.
		disable: ${chkList}
	});					  //그렇게 DB에 저장하면 펫시터가 원하는 날짜만 골라서 매칭할 수 있을 것 같음.
	
	$("#rangeDate").flatpickr({	//이 방식은 일반 회원이 사용
		mode: "range",		//시작에서 끝까지 from to 형식으로 선택	//이 방식은 또 어떻게 검색해야 할지 감이 안 온다.
		dateFormat: "Y-m-d",
		minDate: "today",
		disable: [result]	//배열을 읽지를 못하네 어쩌지
		//disable: ["2020-02-18", "2020-02-19", "2020-02-21", "2020-02-20", "2020-02-27", "2020-02-26"]  //이 부분은 테이블에 불가능한 날짜를 리스트로 저장하고, 회원이 일정 고를 때 긁어와서 저기에 넣어야 할 것 같음.
	});

</script>

<!-- flatPickr 나머지 기능 -->
<!-- <div>
	<img src="https://chmln.github.io/flatpickr/images/logo.png"
		alt="flatpickr">
		<h1>Flatpickr</h1>
		<hr>
			<div class="flatpickr">
				<h2>Basic DateTime</h2>
				<input type="text" id="basicDate"
					placeholder="Please select Date Time" data-input
					class="flatpickr-input">

					<h2>Range Datetime</h2> <input type="text" id="rangeDate"
					placeholder="Please select Date Range" data-input
					class="flatpickr-input">
			</div> -->
<!-- 테스트용 코드 -->
<!-- <button type="button" class="testBt" name="test" id="test" onclick="testDate()">확인</button> -->
<!-- 
function testDate() {
	var form = document.matchInsert;
	var testVal = document.matchInsert.basicDate
	var str = "";
	
	if(testVal.value == null || testVal.value == '') {
		alert("값이 들어오지 않았습니다.");
	} else {
		alert("값이 있습니다.")
	}
	alert("1")

	for(help in testVal) {
		str += help + "=" + testVal[help] + "\n";
	}
	alert("2")
	alert(str)
	alert("3")
	//document.write("값은", typeof document.matchInsert.basicDate);
} -->
<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>
</html>