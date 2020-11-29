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
	
	//엔터키 누를 시 이벤트 막기
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		};
	}, true);
	
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
	function pstInsert() {
		var form = document.matchDetail;

		//이 부분에는 이제 입력할 값을 넣어야 한다는 거
		if (form.basicDate.value == "") {
			alert("날짜를 선택해주세요.")
			form.basicDate.focus();
			return false;
		}
		
		window.opener.name = "opener";
		form.target = "opener";
		form.action = "/petsittingReserve";
		form.submit();
		self.close();
	}	
</script>

<!-- 이미지 슬라이드 -->
<style>
body {
  font-family: Arial;
  margin: 0;
}

* {
  box-sizing: border-box;
}

img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 1px 16px;
  color: white;
}

.minirow {
  float: right;
  position: relative;
  left: -50%;
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.minicolumn {
  float: left;
  position: relative;
  left: 48%;

}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}
</style>

<c:set var="name" value="${pst.NAME}" />
<c:set var="grade" value="${pstAdd.PSMEM_CLASS}" />
<c:set var="school" value="${pstAdd.PSMEM_SCHOOL_FINISH_CHECK}" />
<c:set var="certiChk" value="${pstAdd.PSMEM_CERTI_CHECK}" />

</head>

<body>
	<!-- 회원정보 -->
	<!-- 회원정보 -->
<div style="height: auto; min-height: 600px; text-align: center; margin-top: 0.5em;">

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
				<td style="width: 10%; text-laign: center">
					<span style="font-size: 1.2em;">취득 일자</span>
				</td>
				<td style="width: 8%;">
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

<div style="text-align: center; margin-top: 3em; margin-bottom: 2em;">
		<span style="font-size: 2em; font-weight: bold;">반려견 목록</span>
	</div>

	<div align="center" style="margin-top: 1em; margin-bottom: 10em;">
		<c:choose>
			<c:when test="${fn:length(petList) > 0 }">
				<c:forEach items="${petList}" var="row">
					<table
						style="width: 80%; height: auto; border: solid; border-radius: 1em; margin-bottom: 1em;">
						<tr style="height: 4em;">
							<td rowspan="3" style="width: 25%;" align="center"><img
								style="object-fit: cover; border-style: solid; border-radius: 10em; width: 10em; height: 10em; cursor: pointer; border: solid; position: relative;"
								src="/resources/downimage/${row.STO_FILE_NAME}"
								onclick="window.open('myPetDetail?petId=${row.PET_ID}', 'window', 'width=1320px, height=600px, scrollbars=yes')">
							</td>
							<td style="width: 18.75%;" align="right"><span
								style="font-size: 1.2em; margin-right: 2em;"><b>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</b></span>
							</td>
							<td style="width: 18.75%;"><span
								style="font-size: 1.1em; margin-left: 1em;">${row.NAME}</span></td>
							<td style="width: 18.75%;" align="right"><span
								style="font-size: 1.2em; margin-right: 2em;"><b>등록번호</b></span>
							</td>
							<td style="width: 18.75%;"><span
								style="font-size: 1.1em; margin-left: 1em;">${row.DATA_NUM}</span>
							</td>
						</tr>
						<tr style="height: 4em;">
							<td style="width: 18.75%;" align="right"><span
								style="font-size: 1.2em; margin-right: 2em;"><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b></span>
							</td>
							<td style="width: 18.75%;"><span
								style="font-size: 1.1em; margin-left: 1em;">${row.KIND}</span></td>
							<td style="width: 18.75%;" align="right"><span
								style="font-size: 1.2em; margin-right: 2em;"><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b></span>
							</td>
							<td style="width: 18.75%;"><span
								style="font-size: 1.1em; margin-left: 1em;"> <c:if
										test="${row.SEX == 'M'}">
												남아
											</c:if> <c:if test="${row.SEX == 'F'}">
												여아
											</c:if>
							</span></td>
						</tr>
						<tr style="height: 4em;">
							<td style="width: 18.75%;" align="right"><span
								style="font-size: 1.2em; margin-right: 2em;"><b>나&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이</b></span>
							</td>
							<td style="width: 18.75%;"><span
								style="font-size: 1.1em; margin-left: 1em;">${row.AGE}</span>&nbsp;살
							</td>
							<td style="width: 18.75%;" align="right">
							</td>
							<td style="width: 18.75%;">
							</td>
						</tr>
					</table>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p>조회된 결과가 없습니다.</p>
			</c:otherwise>
		</c:choose>
	</div>
	
<div align="center" style="position: relative; margin-top: 2em; margin-bottom: 10em;">
	<div style="text-align: center; position: relative; width: auto">
		<button style="width: 13em; height: 3em; font-size: 1.2em; margin-right: 4em" id="modify"
			class="my_button" onclick="window.close();">닫&nbsp;&nbsp;&nbsp;&nbsp;기</button>

		<button style="width: 13em; height: 3em; font-size: 1.2em;" id="modify"
			class="my_button" onclick="location.href = 'memDeleteAdmin?type=${map.MEMBER_DIVISION}&&id=${map.PSMEM_ID}&&pass=${map.PASSWORD1}'">탈&nbsp;&nbsp;&nbsp;&nbsp;퇴</button>
	</div>
</div>
</body>

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

</html>
