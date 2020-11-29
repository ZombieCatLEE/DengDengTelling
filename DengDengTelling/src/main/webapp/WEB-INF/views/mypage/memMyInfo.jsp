<!-- 2020.02.11. PM6:10 -->
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
		<li onclick="location.href = '/myBookMark'">찜</li>
		<li onclick="location.href = '/warning'">이용 후기</li>
	</ul>
</div>

<!-- 회원정보 -->
<div style="height: auto; min-height: 600px; text-align: center; margin-top: 0.5em; border-top: solid; margin-bottom: 10em;">

	<div style="text-align: center; margin-top: 8em; margin-bottom: 6em;">
		<span style="font-size: 2em; font-weight: bold;">회원 정보</span>
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
				<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">이용횟수</span>
			</td>
			<td style="width: 38%; font-size: 1.1em; text-align: left;" colspan="2">
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
	$(document).ready(function(){ }); 
</script>

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
	border: 2px solid #A8A8A8;
	margin-top: 20px;
	margin-bottom: 15px;
}

.imgs_wrap img {
	width: 14.5em;
	height: 14.5em;
}
</style>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>