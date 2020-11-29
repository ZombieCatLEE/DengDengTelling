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
	function matchConfirm() {
		var form = document.matchInsert;
		
		if (form.SUBJECT.value == null || form.SUBJECT.value == '') {
			alert("제목을 입력해주세요.")
			form.SUBJECT.focus();
			return false;
		}
		
		if (form.basicDate.value == null || form.basicDate.value == '') {
			alert("날짜를 선택해주세요.")
			form.basicDate.focus();
			return false;
		}
		
		if (form.checkInTime.value == "선택") {
			alert("체크인 시간을 선택해주세요.")
			form.checkInTime.focus();
			return false;
		}
		
		if (form.checkOutTime.value == "선택") {
			alert("체크아웃 시간을 선택해주세요.")
			form.checkOutTime.focus();
			return false;
		}

		if (form.smallAll.value == "선택") {
			alert("요금을 설정해주세요.")
			form.smallAll.focus();
			return false;
		}

		if (form.smallHalf.value == "선택") {
			alert("요금을 설정해주세요.")
			form.smallHalf.focus();
			return false;
		}

		if (form.mediumAll.value == "선택") {
			alert("요금을 설정해주세요.")
			form.mediumAll.focus();
			return false;
		}

		if (form.mediumHalf.value == "선택") {
			alert("요금을 설정해주세요.")
			form.mediumHalf.focus();
			return false;
		}

		if (form.largeAll.value == "선택") {
			alert("요금을 설정해주세요.")
			form.largeAll.focus();
			return false;
		}

		if (form.largeHalf.value == "선택") {
			alert("요금을 설정해주세요.")
			form.largeHalf.focus();
			return false;
		}
		
		
		/* if (form.serviceChk.value == null || form.serviceChk.value == '') {
			alert("가능한 서비스를 선택해주세요.")
			return false;
		} */
		form.action = "/matchCommit";
		form.submit();
	}	
	
</script>

<form id="matchInsert" name="matchInsert" method="post">
	<input type="hidden" name="address1" id="address1" value="${pstAdd.PSMEM_CONSIGNMENT_ADDRESS1}" />
	<input type="hidden" name="address2" id="address2" value="${pstAdd.PSMEM_CONSIGNMENT_ADDRESS2}" />	
	<input type="hidden" name="PSMEM_ID" id="PSMEM_ID" value="${ID}" />
	<input type="hidden" name="name" id="name" value="${name}"/>
	<input type="hidden" name="GRADE" id="GRADE" value="${grade}"/>
	<c:forEach items="${pstImg}" end="0" var="firstImg">
		<input type="hidden" name="firstFile" id="firstFile" value="${firstImg.PSMEM_ORIGINAL_FILE_NAME}"/>
	</c:forEach>
	
<!-- 이미지 슬라이드 -->
	<div class="container" style="text-align: center;">
		<!-- <a class="prev" onclick="plusSlides(-1)">❮</a>
  		<a class="next" onclick="plusSlides(1)">❯</a> -->
		<c:forEach var="pstIMG" items="${pstImg}" varStatus="status">
  			<div class="mySlides">
   	 			<div class="numbertext"><c:out value="${status.count}"/> / <c:out value="${status.end}"/></div>
   	 			<img src="resources/downimage/<c:out value='${pstIMG.PSMEM_ORIGINAL_FILE_NAME}'/>" style="height: 600px; width: auto">
  			</div>
    	</c:forEach>
    	
 		<div class="minirow" style="margin-top: 10px;" >
  			<c:forEach var="petIMAGE" items="${pstImg}" varStatus="status">
				<div class="minicolumn">
					<img class="demo cursor" src="resources/downimage/<c:out value='${petIMAGE.PSMEM_ORIGINAL_FILE_NAME}'/>" style="width: auto; height: 100px;" onclick="currentSlide(<c:out value='${status.count}'/>)" />
				</div>
	    	</c:forEach>
	    </div>
	</div>
	<!-- 이미지 슬라이드 끝 -->
	<!-- 펫시터 소개 상단 -->
	<div style="margin-top: 73px; margin-left: auto; margin-right: auto; width: 1027px; display: flex; flex-direction: row; justify-content: space-between">
		<div style="float: left; width: 66%; padding: 40px;">
			<div style="display: flex; flex-direction: row">
				<div style="overflow: hidden; width: 100px; height: 100px; border: none; border-radius: 12px; margin-top: 5px; margin-left: 10px; margin-right: 32px;">
					<img width="100" height="100" style="object-fit: cover; display: inline-block;" src="resources/downimage/${pstPfl.PROFILE_ORIGINAL_FILE_NAME}"/>
			<!-- 윗단은 멤버 프로필 사진 --> <!-- 프로필 사진도 가져와야 함 -->
				</div>
				<div style="overflow: hidden; width: 400px;">
					<h1 style="font-family: Noto Sans KR, sans-serif; font-size: 15px; color: #4C5056; line-height: 22px; letter-spacing: -0.2px">
						<span style="color: rgb(94, 99, 109)">${pstAdd.PSMEM_CONSIGNMENT_ADDRESS1}</span> <span style="font-weight: bold; color: gold">${pst.MEMBER_DIVISION}</span>  ${name} 님</h1>
					<p style="font-family: Noto Sans KR, sans-serif; margin-top: 5px; font-size: 25px; color: #383C48; line-height: 37px; letter-spacing: -0.2px;">
						<input style="font-family: Noto Sans KR, sans-serif; margin-top: 10px; font-size: 20px; color: #383C48; line-height: 1px;"
							type="text" id="SUBJECT" name="SUBJECT" placeholder='"매칭 페이지에 보일 제목을 작성해주세요."'/>
					</p>
					<!-- 해시 태그 시작 x service로 바꿈 -->
				</div>
			</div>
			<div>
				<div>
					<div style="display: flex; flex-wrap: wrap; flex-direction: row; margin-top: 50px; width: 458px">
					<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; margin-bottom: 30; line-height: 25px; color: #393C47">
						<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/point.png"> 조건을 선택해 주세요.</h2>
					</div>
						<table style="border-spacing: 60px 15px; margin: auto;">
							<tr>
								<td><input type="checkbox" id="serviceChk1" class="serviceChk" name="serviceChk" value="service01"/><label for="serviceChk1">반려동물 없음</label></td>
								<td><input type="checkbox" id="serviceChk2" class="serviceChk" name="serviceChk" value="service02"/><label for="serviceChk2">픽업</label></td>
								<td><input type="checkbox" id="serviceChk3" class="serviceChk" name="serviceChk" value="service03"/><label for="serviceChk3">대형견</label></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="serviceChk4" class="serviceChk" name="serviceChk" value="service04"/><label for="serviceChk4">마당 있음</label></td>
								<td><input type="checkbox" id="serviceChk5" class="serviceChk" name="serviceChk" value="service05"/><label for="serviceChk5">노견 케어</label></td>
								<td><input type="checkbox" id="serviceChk6" class="serviceChk" name="serviceChk" value="service06"/><label for="serviceChk6">장기 예약</label></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="serviceChk7" class="serviceChk" name="serviceChk" value="service07"/><label for="serviceChk7">실내 놀이</label></td>
								<td><input type="checkbox" id="serviceChk8" class="serviceChk" name="serviceChk" value="service08"/><label for="serviceChk8">매일 산책</label></td>
								<td><input type="checkbox" id="serviceChk9" class="serviceChk" name="serviceChk" value="service09"/><label for="serviceChk9">목욕 가능</label></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="serviceChk10" class="serviceChk" name="serviceChk" value="service10"/><label for="serviceChk10">약물 경구 복용</label></td>
								<td><input type="checkbox" id="serviceChk11" class="serviceChk" name="serviceChk" value="service11"/><label for="serviceChk11">강아지 케어</label></td>
								<td><input type="checkbox" id="serviceChk12" class="serviceChk" name="serviceChk" value="service12"/><label for="serviceChk12">아파트</label></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="serviceChk13" class="serviceChk" name="serviceChk" value="service13"/><label for="serviceChk13">빌라</label></td>
								<td><input type="checkbox" id="serviceChk14" class="serviceChk" name="serviceChk" value="service14"/><label for="serviceChk14">단독 주택</label></td>
								<td><input type="checkbox" id="serviceChk15" class="serviceChk" name="serviceChk" value="service15"/><label for="serviceChk15">싱글</label></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="serviceChk16" class="serviceChk" name="serviceChk" value="service16"/><label for="serviceChk16">아이 없음</label></td>
								<td><input type="checkbox" id="serviceChk17" class="serviceChk" name="serviceChk" value="service17"/><label for="serviceChk1">반려동물 등록 가능</label></td>
							</tr>
							<!-- 체크 박스와 관련된 jquery를 만들어서, 등록 버튼을 누르면 값을 가지고 넘어가도록 한다. -->
					<!-- 서비스 체크 박스 끝 -->
					</table>
				</div>
			</div>
			<!-- 펫시터 소개 상단 끝 -->
			
			<!-- 펫시터 소개 시작 -->
			<c:choose>
				<c:when test="${grade=='프로'}">
					<div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(243, 243, 243); position: relative;">
						<div style="display: flex; align-items: center;">
							<img width="16" height="23" src="resources/images/pro_petsitter.png">
							<p style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px; margin-top: 15px;">
								${name} 님은 프로 펫시터입니다.
							</p>
						</div>
						<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
							프로 펫시터는 다수의 펫시팅 경험과 높은 고객 만족도는 물론, 댕댕텔링의 프로 시험을 통과한 펫시터입니다.
						</p>
					</div>
				</c:when>
				<c:when test="${grade=='일반'}">
					<div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(243, 243, 243); position: relative;">
						<div style="display: flex; align-items: center;">
							<img width="16" height="23" src="resources/images/pro_petsitter.png">
							<p style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px; margin-top: 15px;">
								${name} 님은 일반 펫시터입니다.
							</p>
						</div>
						<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
							일반 펫시터는 다수의 예약 진행을 경험한 댕댕텔링의 프리미엄 펫시터입니다.
						</p>
					</div>
				</c:when>
				<c:when test="${grade=='신입'}">
					<div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(243, 243, 243); position: relative;">
						<div style="display: flex; align-items: center;">
							<img width="16" height="23" src="resources/images/pro_petsitter.png">
							<p style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px; margin-top: 15px;">
								${name} 님은 신입 펫시터입니다.
							</p>
						</div>
						<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
							신입 펫시터는 댕댕텔링의 자격 시험을 통과한 전문 펫시터입니다.
						</p>
					</div>
				</c:when>
			</c:choose>
			<!-- 펫시터 소개 시작 -->
			<!-- 펫시터 인사글 -->
			<div style="margin-top: 53px">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; margin-bottom: 30; line-height: 25px; color: #393C47">
					<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/point.png"> ${name} ${grade} 펫시터님을 소개합니다</h2>
					<div style="border: 1px dotted; padding: 10px; border-radius: 10px">
						<p style="font-size: 15px; line-height: 25px; color: #555555; margin-top: 10px">
							${pstAdd.PSMEM_CAREER}<br/>
							${pstAdd.PSMEM_INTRODUCE}
						</p>
					</div>
			</div>

			<!--펫시터 자격증 및 교육 수료 --> <!-- 이 부분은 리스트를 불러와서  하나씩 뽑아야 함. -->
			<div style="margin-top: 58px">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; line-height: 25px; color: #393C47; margin-bottom: 20px">
					<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/point.png"> 자격증 및 교육 수료</h2>
				<c:forEach var="certi" items="${certi}" varStatus="status">
				<div style="display: flex; flex-direction: column; border-top: 1px solid rgb(235, 235, 235); padding: 10px 0px; ">
					<div style="display: flex; flex-direction: row; align-items: center;">
						<img width="200" height="100" src="resources/downimage/${certi.PROFILE_ORIGINAL_FILE_NAME}" style="object-fit: cover; margin-left: 20px; margin-right: 30px;">
						<div style="margin-left: 18px;">
							<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(56, 60, 72);">
								<b>${certi.CERTI_NAME}</b></p>
							<p style="font-size: 14px; letter-spacing: -0.2px; line-height: 19px; color: rgb(56, 60, 72); margin-top: 20px;">
								${certi.CERTI_ORG}</p>
							<!-- 윗단은 자격증 담당 기관 -->
							<p style="font-size: 12px; line-height: 17px; color: rgb(129, 137, 155); margin-top: 7px;">
								${certi.CERTI_DATE}에 취득하였습니다</p>
						<!-- 취득일자  + 에 취득하셨습니다.-->
						</div>
					</div>
				</div>
				</c:forEach>
				<c:choose>
					<c:when test="${school=='Y'}">
						<div style="display: flex; align-items: center;">
							<img width="16" height="23" src="resources/images/medal.png">
							<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-left: 20px; margin-top: 15px">
								&nbsp;&nbsp;&nbsp;${name} 님은 <font color="red" size="2"><b>반려동물 관련 학과</b></font>를 졸업한 전문 인재입니다.</p>
						</div>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${certiChk=='Y'}">
						<div style="display: flex; align-items: center;">
							<img width="16" height="23" src="resources/images/medal.png">
							<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-left: 20px; margin-top: 15px">
								&nbsp;&nbsp;&nbsp;${name} 님은 <font color="red" size="2"><b>반려동물 관련 자격증</b></font>을 취득한 전문 인재입니다.</p>
						</div>
					</c:when>
				</c:choose>
			</div>
			<!--펫시터 자격증 및 교육 수료 -->
			<!-- 펫시터 반려동물 -->
			<div style="margin-top: 58px">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; line-height: 25px; color: #393C47; margin-bottom: 20px">
					<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/point.png"> 펫시터님과 함께하는 반려동물</h2>
				<c:forEach var="petMem" items="${pet}" >
					<div style="display: flex; flex-direction: column; border-top: 1px solid rgb(235, 235, 235); padding: 10px 0px; ">
						<div style="display: flex; flex-direction: row; align-items: center;">
							<img width="60" height="60" src="resources/downimage/<c:out value='${petMem.STO_FILE_NAME}'/>" style="object-fit: cover; border-radius: 50%; margin-left: 20px; margin-right: 20px;">
							<div style="margin-left: 18px;">
								<!-- 글쓴이 -->
								<div style="display: flex; flex-display: column">
								<p style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(56, 60, 72); margin-top: 7px;">
								<b>이름 : </b><c:out value="${petMem.NAME}"/>&nbsp;&nbsp;&nbsp;(<c:out value="${petMem.SEX}"/>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${petMem.AGE}"/> 살 
								</div style="display: flex; flex-display: column">
								<div>
								<p style="font-size: 15px; line-height: 19px; color: rgb(76, 80, 86); margin-top: 6px;">
								<b><c:out value="${petMem.KIND}"/></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${petMem.PET_SIZE}"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;무게 : <c:out value="${petMem.KG}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중성화 여부 : <c:out value="${petMem.SEX_CHK}"/></p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div style="float: left; width: 30%;">
			<!-- 펫시터 후기 --> <!-- 이미지 댓글 형식으로 만들어야 함 -->
			<!-- 펫시터 예약 날짜 선택 -->
			<div style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 32px; padding-right: 32px; padding-bottom: 32px">
				<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
					펫시팅 가능 일정
				</p>
				펫시팅이 불가능한 날짜를 선택해주세요.
				<div style="display: flex; flex-grow: 1; margin-top: 1em">
					<form method="get" class="tm-search-form tm-section-pad-2">
						<div class="form-group tm-form-element tm-form-element-50" style="width: 22em; right: 3em; bottom: 1em">
							<i class="fa fa-calendar fa-2x tm-form-element-icon"></i>
							<input name="basicDate" type="text" class="flatpickr-input" id="basicDate" placeholder="펫시팅이 불가능한 날짜를 선택해주세요." style="font-size: 1em">
						</div>
					</form>
				</div>

				<!-- 예약 시간 선택 -->
				<div style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 38px">
					<div style="width: 149px">
						<p style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-bottom: 18px">
							체크인 시간
						</p>
						<select id="checkInTime" name="checkInTime" style="width: 10.5em">
							<option value="선택">선택</option>
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="15:00">15:00</option>
							<option value="16:00">16:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
							<option value="19:00">19:00</option>
							<option value="20:00">20:00</option>
							<option value="21:00">21:00</option>
							<option value="22:00">22:00</option>
						</select>
					</div>
					<div style="width: 149px">
						<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-bottom: 8px">
							<p style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47">
								체크아웃 시간
							</p>
							<p style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4"></p>
						</div>
						<select id="checkOutTime" name="checkOutTime" style="width: 10.5em">
							<option value="선택">선택</option>
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="15:00">15:00</option>
							<option value="16:00">16:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
							<option value="19:00">19:00</option>
							<option value="20:00">20:00</option>
							<option value="21:00">21:00</option>
							<option value="22:00">22:00</option>
						</select>
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
				<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-top: 14px">
					<div style="display: flex; flex-direction: row; align-items: center; height: 24px">
						<img width="24" height="24" src="resources/images/price_pet_small.png" alt="소형견">
						<p style="font-size: 15px; line-height: 19px; color: #383C48; margin-left: 10px">소형견</p>
						<p style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 5px">7키로 미만</p>
					</div>
					<div style="display: flex; flex-direction: row">
						<div style="display: flex; align-items: center; flex-direction: row">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 1px; color: #4E525B; margin-right: 11px">
								<select id="smallAll" name="smallAll" style="width: 7em; margin-right: 2px">
									<option value="선택">선택</option>
									<option value="30,000원">30,000원</option>
									<option value="29,000원">29,000원</option>
									<option value="28,000원">28,000원</option>
									<option value="27,000원">27,000원</option>
									<option value="26,000원">26,000원</option>
									<option value="25,000원">25,000원</option>
									<!-- <option value="예약 불가">예약 불가</option> -->
								</select>
							</p>
						</div>
						<div style="display: flex; flex-direction: column; align-items: center; width: 62px">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">
								<select id="smallHalf" name="smallHalf" style="width: 7em">
									<option value="선택">선택</option>
									<option value="25,000원">25,000원</option>
									<option value="24,000원">24,000원</option>
									<option value="23,000원">23,000원</option>
									<option value="22,000원">22,000원</option>
									<option value="21,000원">21,000원</option>
									<option value="20,000원">20,000원</option>
									<!-- <option value="예약 불가">예약 불가</option> -->
								</select>
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
								<select id="mediumAll" name="mediumAll" style="width: 7em; margin-right: 2px">
									<option value="선택">선택</option>
									<option value="40,000원">40,000원</option>
									<option value="39,000원">39,000원</option>
									<option value="38,000원">38,000원</option>
									<option value="37,000원">37,000원</option>
									<option value="36,000원">36,000원</option>
									<option value="35,000원">35,000원</option>
									<!-- <option value="예약 불가">예약 불가</option> -->
								</select>
							</p>
						</div>
						<div style="display: flex; flex-direction: column; align-items: center; width: 62px">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">
								<select id="mediumHalf" name="mediumHalf" style="width: 7em">
									<option value="선택">선택</option>
									<option value="35,000원">35,000원</option>
									<option value="34,000원">34,000원</option>
									<option value="33,000원">33,000원</option>
									<option value="32,000원">32,000원</option>
									<option value="31,000원">31,000원</option>
									<option value="30,000원">30,000원</option>
									<!-- <option value="예약 불가">예약 불가</option> -->
								</select>
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
								<select id="largeAll" name="largeAll" style="width: 7em; margin-right: 2px">
									<option value="선택">선택</option>
									<option value="50,000원">50,000원</option>
									<option value="49,000원">49,000원</option>
									<option value="48,000원">48,000원</option>
									<option value="47,000원">47,000원</option>
									<option value="46,000원">46,000원</option>
									<option value="45,000원">45,000원</option>
									<!-- <option value="예약 불가">예약 불가</option> -->
								</select>
							</p>
						</div>
						<div style="display: flex; flex-direction: column; align-items: center; width: 62px">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">
								<select id="largeHalf" name="largeHalf" style="width: 7em">
									<option value="선택">선택</option>
									<option value="45,000원">45,000원</option>
									<option value="44,000원">44,000원</option>
									<option value="43,000원">43,000원</option>
									<option value="42,000원">42,000원</option>
									<option value="41,000원">41,000원</option>
									<option value="40,000원">40,000원</option>
									<!-- <option value="예약 불가">예약 불가</option> -->
								</select>
							</p>
						</div>
					</div>
				</div>
				<div style="width: 310px; height: 1px; background-color: #EBEBEB; margin: 32px 0"></div>
			</div>
			<!-- 이용 요금 소개 끝 -->
			<!-- 카카오 지도 API: 펫시터 위치 표시 -->
			<div style="position: relative; line-height: 1em; display: flex; flex-direction: column; width: 375px; height: 400px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); margin-top: 38px; overflow: hidden; text-align: center;">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 8px">${name} 펫시터님의 위탁 장소 위치입니다.</h2>
					<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 10px">위치가 정확한지 확인해주세요!</p>
				<div id="map" style="position: absolute; height: 300px; border-radius: 4px; border: 1px solid #DFE3EA; overflow: hidden; display: inline-block; text-align: center; top: 23%; left: 52.5%; width: 95%; margin-top: -0.5em; margin-left: -50%;">
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd69701c52c23858bb7f642b6fddbe23&libraries=services,clusterer,drawing"></script>

					<script>
						var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
						var options = { //지도를 생성할 때 필요한 기본 옵션
							center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
							level : 3 //지도의 레벨(확대, 축소 정도)
						};

						var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

						//회원의 주소값을 바로 지도에 표시하기 위해 가져오는 form 정보.
						var form = document.matchInsert;
					
						//이 부분 이미지를 인터넷에서 가져올 수 있도록 해야할 듯.
						var imageSrc = 'https://i.imgur.com/YYv8igP.png', // 마커이미지의 주소입니다    
							imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
							imageOption = {offset : new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다 + 마커 오버레이랑 클릭 버전도 있으니까 시간나면 트라이.
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
						//, markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						var address = matchInsert.address1.value + ' ' + matchInsert.address2.value
						// 주소로 좌표를 검색합니다 + 주소를 가져와서 합쳐도 출력이 된다는 것을 알았으니 나중에 조건문을 넣어서 진행 단계에 따라 다르게 나오도록 하면 될 듯함.
						geocoder.addressSearch(address, function(result, status) {
						//geocoder.addressSearch('경기도 의정부시 용민로 21번길 101', function(result, status) { //확인용
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
									content : '<div style="width:150px;text-align:center;padding:1px 0;">위탁 장소</div>'
								});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
					</script>
				</div>
			</div>
		<div style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 25px; padding-right: 25px; padding-bottom: 32px; margin-top: 40px; text-align: center; vertical-align: middle; align-items: center; position: relative;">
			<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600"></p>
			<div style="display: block; height: 80px; width: auto; position: relative; text-align: center; vertical-align: middle;">
				<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
					<div style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
						<button type="button" style="height: 50px; width: 130px; font-size: 20px; font: bold; background-color: #037FBB; border: none; color:#fff; cursor: pointer; border-radius: 10px;" name="petsittingReserveBt" id="petsittingReserveBt" onclick="matchConfirm()">등록하기</button>
					</div>
				</div>
				<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
					<div style="height: 30px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; position: relative; vertical-align: middle;">
						<button type="button" style="height: 50px; width: 130px; font-size: 20px; font: bold; background-color: #037FBB; border: none; color:#fff; cursor: pointer; border-radius: 10px;" onclick="history.back()">돌아가기</button>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</form>

<!-- flatpickr jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Flatpickr -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
<!-- flatpickr -->  
<script id="INLINE_PEN_JS_ID">
	$("#basicDate").flatpickr({  // 이 방식은 펫시터가 사용.
		mode: "multiple",	//다중 선택
		dateFormat: "Y-m-d",
		minDate: "today"  //펫시터가 선택하는 날짜는 DB에 리스트로 저장했다가 일반 회원이 고를 때 enable로 가능한 날짜만 표시.
	});					  //그렇게 DB에 저장하면 펫시터가 원하는 날짜만 골라서 매칭할 수 있을 것 같음.

	$("#rangeDate").flatpickr({	//이 방식은 일반 회원이 사용
		mode: "range",		//시작에서 끝까지 from to 형식으로 선택
		dateFormat: "Y-m-d",
		minDate: "today"//,
		//enable: ["", "", ""]  //이 부분은 테이블에 불가능한 날짜를 리스트로 저장하고, 회원이 일정 고를 때 긁어와서 저기에 넣어야 할 것 같음.
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