<!-- 지연 수정 2020.03.11-->
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
<c:if test="${MEM_TYPE == '펫시터'}">
	<ul>
		<li onclick="location.href = '/MyInfodetail'">회원 정보</li>
		<li class="selected" onclick="location.href = '/myPetList'">마이 펫</li>
		<li onclick="location.href = '/memMatchList'">매칭 내역</li>
		<li onclick="location.href = '/cashList'">거래 내역</li>
		<li onclick="location.href = '/warning'">이용 후기</li>
	</ul>

</c:if>
<c:if test="${MEM_TYPE == '일반 회원'}">
	<ul>
		<li onclick="location.href = '/MyInfodetail'">회원 정보</li>
		<li class="selected" onclick="location.href = '/myPetList'">마이 펫</li>
		<li onclick="location.href = '/memMatchList'">매칭 내역</li>
		<li onclick="location.href = '/myBookMark'">찜</li>
		<li onclick="location.href = '/warning'">이용 후기</li>
	</ul>
</c:if>
</div>

<!-- 댕댕이 목록 -->
<div style="height: auto; border-top: solid; min-height: 600px">
	<div style="height: auto;">
		<div class="wrapper">
			<div
				style="text-align: center; margin-top: 5em; margin-bottom: 1em; width: auto">
				<span style="font-size: 2em; font-weight: bold;">나의 댕댕이</span>
			</div>
		
			<div style="text-align: center; margin-bottom: 1em;">
				<span style="position: relative; left: 20em"> 등록수&nbsp;&nbsp;<b>${count}</b>마리
				</span>
			</div>
		
			<!-- <div align="center">
				<div style="height: 13em; width: 50em; border-style: solid;"
					onclick="location.href = 'nml_my_pet_detail.html' "> -->
		
			<div align="center">
				<c:choose>
					<c:when test="${fn:length(petList) > 0 }">
						<c:forEach items="${petList}" var="row">
							<table style="width: 80%; height: auto; border: solid; border-radius: 1em; margin-bottom: 1em;">
								<tr style="height: 4em;">
									<td rowspan="3" style="width: 25%;" align="center">
											<img
												style="object-fit: cover; border-style: solid; border-radius: 10em; width: 10em; height: 10em; cursor: pointer; border: solid; position: relative;"
												src="/resources/downimage/${row.STO_FILE_NAME}" onclick="window.open('myPetDetail?petId=${row.PET_ID}', 'window', 'width=1320px, height=600px, scrollbars=yes')">
									</td>
									<td style="width: 18.75%;" align="right">
										<span style="font-size: 1.2em; margin-right: 2em;"><b>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</b></span>
									</td>
									<td style="width: 18.75%;">
										 <span style="font-size: 1.1em; margin-left: 1em;">${row.NAME}</span>
									</td>
									<td style="width: 18.75%;" align="right">
										<span style="font-size: 1.2em; margin-right: 2em;"><b>등록번호</b></span>
									</td>
									<td style="width: 18.75%;">
										<span style="font-size: 1.1em; margin-left: 1em;">${row.DATA_NUM}</span>
									</td>
								</tr>
								<tr style="height: 4em;">
									<td style="width: 18.75%;" align="right">
										<span style="font-size: 1.2em; margin-right: 2em;"><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b></span>
									</td>
									<td style="width: 18.75%;">
										 <span style="font-size: 1.1em; margin-left: 1em;">${row.KIND}</span>
									</td>
									<td style="width: 18.75%;" align="right">
										<span style="font-size: 1.2em; margin-right: 2em;"><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b></span> 
									</td>
									<td style="width: 18.75%;">
										<span style="font-size: 1.1em; margin-left: 1em;">
											<c:if test="${row.SEX == 'M'}">
												남아
											</c:if>
											<c:if test="${row.SEX == 'F'}">
												여아
											</c:if>
										</span>
									</td>
								</tr>
								<tr style="height: 4em;">
									<td style="width: 18.75%;" align="right">
										<span style="font-size: 1.2em; margin-right: 2em;"><b>나&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이</b></span>
									</td>
									<td style="width: 18.75%;">
										 <span style="font-size: 1.1em; margin-left: 1em;">${row.AGE}</span>&nbsp;살
									</td>
									<td style="width: 18.75%;" align="center">
										<button style="width: 6em; height: 2.5em; font-size: 1.1em; line-height: 1em; " class="my_button"
											onclick="window.open('myPetDetail?petId=${row.PET_ID}', 'window', 'width=1320px, height=600px, scrollbars=yes')">수정</button>
									</td>
									<td style="width: 18.75%;" align="center">
										<button style="width: 6em; height: 2.5em; font-size: 1.1em; line-height: 1em; " class="my_button"
											onclick="location.href='myPetDelete?PET_MEM_ID=${row.PET_ID}'">삭제</button>
									</td>
								</tr>
							</table>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>조회된 결과가 없습니다.</p>
					</c:otherwise>
				</c:choose>
		
				<!-- 추가등록 버튼 -->
				<div align="center">
					<button style="height: 3em; font-size: 1.1em; line-height: 1em; width: 8em; margin-top: 2em; margin-bottom: 2em;"
						class="my_button" onclick="window.open('myPagePetInsert', 'window', 'width=1320px, height=600px, scrollbars=yes')">등&nbsp;&nbsp;&nbsp;&nbsp;록</button>
				</div>
			</div>
		</div>
	</div>
</div>

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
	margin-top: 30px;
	margin-bottom: 15px;
}

.imgs_wrap img {
	width: 14.5em;
	height: 14.5em;
}
</style>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>