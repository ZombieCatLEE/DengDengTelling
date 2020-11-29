<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-mypage-menu.jspf"%>
<script type="text/javascript" src="resources/js/common.js"></script>

<style>
li {
	float: left;
}

li {
	list-style: none;
}
</style>
<div class="tab-box">
	<ul>
		<li class="selected" onclick="location.href = '/MyInfodetail'">회원 정보</li>
		<li onclick="location.href = '/myPetList'">마이 펫</li>
		<li onclick="location.href = '/memMatchList'">매칭 내역</li>
		<li onclick="location.href = '/cashList'">거래 내역</li>
		<li onclick="location.href = '/warning'">이용 후기</li>
	</ul>
</div>

<!-- 회원정보 -->
<div style="height: auto; min-height: 600px; text-align: center; margin-top: 0.5em; border-top: solid; margin-bottom: 10em;">

	<div style="text-align: center; margin-top: 8em; margin-bottom: 6em;">
		<span style="font-size: 2em; font-weight: bold;">펫시터 회원 정보</span>
	</div>

	<table style="position: relative; width: 100%;">
		<tr style="height: 3em;">
			<td style="width: 20%; text-align: right; height: 3em;">
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">아이디</span>
			</td>
			<td style="width: 38%; font-size: 1.1em; text-align: left;">
				${map.PSMEM_ID}
			</td>
			<td style="width: 40%; text-align: center;">
				<span style="font-weight: bold; font-size: 1.2em;">프로필</span>
			</td>
		</tr>
		<tr style="height: 3em;">
			<td style="width: 22%; text-align: right;">
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">이름</span>
			</td>
			<td style="width: 38%; font-size: 1.1em; text-align: left;">
				${map.NAME}
			</td>
			<td style="width: 50%; text-align: center;" rowspan="5" >
				<c:if test="${path != null}">
					<img id="img" style="object-fit: cover; border: solid; border-radius: 1em; width: 300px; height: 300px;" src="/resources/downimage/${path}" />
				</c:if>
				<c:if test="${path == null}">
					<img id="img" style="object-fit: cover; border: solid; border-radius: 1em; width: 300px; height: 300px;" src="/resources/images/blank.jpg" />
				</c:if>
			</td>
		</tr>
		<tr style="height: 3em;">
			<td style="width: 22%; text-align: right;">
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">연락처</span>
			</td>
			<td style="width: 38%; font-size: 1.1em; text-align: left;">
				${map.PHONE}
			</td>
			<td style="width: 50%; text-align: center;">
			</td>
		</tr>
		<tr style="height: 3em;">
			<td style="width: 22%; text-align: right;">
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">이메일</span>
			</td>
			<td style="width: 38%; font-size: 1.1em; text-align: left;">
				${map.EMAIL}
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
		<tr style="height: 3em;">
			<td style="width: 22%; text-align: right;">
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">주소</span>
			</td>
			<td style="width: 38%; font-size: 1.1em; text-align: left;" colspan="2">
				<b>[${map.ZIPCODE}]</b>&nbsp;${map.ADDRESS1}&nbsp;${map.ADDRESS2}&nbsp;${map.ADDRESS_ADD}
			</td>
		</tr>
		<tr style="height: 3em;">
			<td style="width: 22%; text-align: right;">
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">직업</span>
			</td>
			<td style="width: 38%; font-size: 1.1em; text-align: left;" colspan="2">
				${map1.PSMEM_JOB}
			</td>
		</tr>
		<tr style="height: 3em;">
			<td style="width: 22%; text-align: right;">
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">관련학과 졸업 여부</span>
			</td>
			<td style="width: 38%; font-size: 1.1em; text-align: left;" colspan="2">
				${map1.PSMEM_SCHOOL_FINISH_CHECK}
			</td>
		</tr>
		<tr style="height: 3em;">
			<td style="width: 22%; text-align: right;">
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">자격증 보유 여부</span>
			</td>
			<td style="width: 38%; font-size: 1.1em; text-align: left;" colspan="2">
				${map1.PSMEM_CERTI_CHECK}
			</td>
		</tr>
	</table>
	
	<div align="center">
		<table style="width: 100%; margin-top: 1em;">
			<tr align="center">
				<td style="width: 22%; text-align: right;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">자격증 정보</span>
				</td>
				<td style="width: 20%; text-laign: center;">
					<span style="font-size: 1.2em; position: relative;">이미지</span>
				</td>
				<td style="width: 25%; text-laign: center">
					<span style="font-size: 1.2em;">자격명</span>
				</td>
				<td style="width: 15%; text-laign: center">
					<span style="font-size: 1.2em;">발급 기관</span>
				</td>
				<td style="width: 8%; text-laign: center">
					<span style="font-size: 1.2em;">취득 일자</span>
				</td>
				<td style="width: 10%;">
				</td>
			</tr>
			<c:forEach var="row" items="${certi}" varStatus="var">
				<tr align="center">
					<td style="width: 22%; text-align: right;">
					</td>
					<td style="width: 20%; text-align: center; padding: 5px;">
						<img id="img" style="object-fit: cover; border: solid; border-radius: 1em; width: 150px; height: 100px;" src="/resources/downimage/${row.PROFILE_ORIGINAL_FILE_NAME }" />
					</td>
					<td style="width: 25%; text-align: center; padding: 5px;">
						<span style="font-size: 1.1em;">${row.CERTI_NAME}</span>
					</td>
					<td style="width: 15%; text-align: center; padding: 5px;">
						<span style="font-size: 1.1em;">${row.CERTI_ORG}</span>
					</td>
					<td style="width: 8%; text-align: center; padding: 5px;">
						<span style="font-size: 1.1em;">${row.CERTI_DATE}</span>
					</td>
					<td style="width: 10%;">
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="right">
					<button id="modifyCerti"
						style="line-height: 1.9em; font-size: 0.9em; width: 8em; vertical-align: top; margin-bottom: 0.5em; border-radius: 0.5em; margin-right: 10%;"
						onclick="window.open('modifyCertiForm', 'popup', 'width=1140, height=700, status=yes, resizable=yes, scrollbars=yes')">
						자격증 수정
					</button>
				</td>
			</tr>
			
		</table>
	</div>
		
	<table style="position: relative; width: 100%; margin-top: 1.5em;">
		<tr style="height: 3em;">
			<td style="width: 22%; text-align: right; height: 3em;">
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">위탁 장소</span>
			</td>
				<td style="font-size: 1.1em; text-align: left;" colspan="2">
				<b>[${map1.PSMEM_CONSIGNMENT_ZIPCODE}]</b>&nbsp;${map1.PSMEM_CONSIGNMENT_ADDRESS1}&nbsp;${map1.PSMEM_CONSIGNMENT_ADDRESS2}&nbsp;${map1.PSMEM_CONSIGNMENT_ADDRESS_ADD}
			</td>
		</tr>
	</table>

	<table style="position: relative; width: 100%; margin-top: 1.5em;">
		<tr>
			<td style="width: 22%; text-align: right; vertical-align: text-top;">
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">위탁 장소 이미지</span>
			</td>
			<td	style="width: 68%;">
				<!-- 이미지 슬라이드 -->
				<div style="text-align: center;">
					<c:forEach var="pstIMG" items="${list}" varStatus="status">
			  			<div class="mySlides">
			   	 			<img src="resources/downimage/<c:out value='${pstIMG.PSMEM_ORIGINAL_FILE_NAME}'/>" style="height: 400px; width: auto">
			  			</div>
			    	</c:forEach>
			    	
			 		<div style="display: flex; flex-direction: row; margin-top: 10px; float: right; position: relative; left: -50%; clear: both;">
			  			<c:forEach var="petIMAGE" items="${list}" varStatus="status">
							<div style="display: flex; flex-direction: column; float: left; position: relative; left: 48%;">
								<img class="demo cursor" src="resources/downimage/<c:out value='${petIMAGE.PSMEM_ORIGINAL_FILE_NAME}'/>" style="width: auto; height: 75px;" onclick="currentSlide(<c:out value='${status.count}'/>)" />
							</div>
				    	</c:forEach>
				    </div>
				</div>
				<!-- 이미지 슬라이드 끝 -->
			</td>
			<td style="width: 10%;">
			</td>
		</tr>
		<tr style="margin-top: 1.5em; height: 5em;">
			<td colspan="3" align="right">
				<button id="modifyPlace"
					style="line-height: 1.9em; font-size: 0.9em; width: 8em; vertical-align: top; margin-bottom: 0.5em; border-radius: 0.5em; margin-right: 10%;"
					onclick="window.open('modifyPstPlaceForm', 'popup2', 'width=1140, height=700, status=yes, resizable=yes, scrollbars=yes');">
					이미지 수정
				</button>
			</td>
		</tr>
	</table>

	<table style="position: relative; width: 100%; margin-top: 3em;">
		<tr style="height: 3em;">
			<td style="width: 22%; text-align: right; vertical-align: text-top;">
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">활동 경력</span>
			</td>
			<td style="width: 78%; height: 7em; font-size: 1.1em;" colspan="2" align="left">
				<textarea style="font-size: 1.1em; width: 90%; height: 100%; resize: none; border-radius: 0.5em;" readonly="readonly">${map1.PSMEM_CAREER}</textarea>
			</td>
		</tr>
		<tr style="height: 1.5em;">
		</tr>
		<tr style="height: 3em;">
			<td style="width: 22%; text-align: right; vertical-align: text-top;">
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">자기소개</span>
			</td>
			<td style="width: 78%; height: 7em; font-size: 1.1em;" colspan="2" align="left">
				<textarea style="font-size: 1.1em; width: 90%; height: 100%; resize: none; border-radius: 0.5em;" readonly="readonly">${map1.PSMEM_INTRODUCE}</textarea>
			</td>
		</tr>
		<tr style="height: 3em;">
			<td style="width: 22%; text-align: right;">
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">펫시팅 경험</span>
			</td>
			<td style="width: 78%; height: 7em; font-size: 1.1em;" colspan="2" align="left">
				${map.USE_TIME}&nbsp;&nbsp;회
			</td>
		</tr>
	</table>
</div>

<div align="center" style="position: relative; margin-top: 2em; margin-bottom: 10em;">
	<div style="text-align: center; position: relative; width: auto">
		<button style="width: 13em; height: 3em; font-size: 1.2em; margin-right: 4em" id="modify"
			class="my_button" onclick="window.open('memInfoModifyForm', 'window', 'width=1320px, height=600px, scrollbars=yes')">수&nbsp;&nbsp;&nbsp;&nbsp;정</button>

		<button style="width: 13em; height: 3em; font-size: 1.2em;" id="modify"
			class="my_button" onclick="location.href = 'memDeleteComfirm'">탈&nbsp;&nbsp;&nbsp;&nbsp;퇴</button>
	</div>
</div>

<script type="text/javascript">
	/* $(document).ready(function(){ 
		if (!location.hash) { 
			location.hash = '#reload';
			location.href = location.href;
		}
		
		if (location.href.indexOf('#reload') == -1)
			  location.href += '#reload'
	});  */
	
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
</script>

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

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>