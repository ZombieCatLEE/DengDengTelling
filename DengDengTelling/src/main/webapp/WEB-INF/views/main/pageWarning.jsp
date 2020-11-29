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
		<li onclick="location.href = '/myPetList'">마이 펫</li>
		<li onclick="location.href = '/memMatchList'">매칭 내역</li>
		<li onclick="location.href = '/cashList'">거래 내역</li>
		<li class="selected" onclick="location.href = '/warning'">이용 후기</li>
	</ul>

</c:if>
<c:if test="${MEM_TYPE == '일반 회원'}">
	<ul>
		<li onclick="location.href = '/MyInfodetail'">회원 정보</li>
		<li onclick="location.href = '/myPetList'">마이 펫</li>
		<li onclick="location.href = '/memMatchList'">매칭 내역</li>
		<li onclick="location.href = '/myBookMark'">찜</li>
		<li class="selected" onclick="location.href = '/warning'">이용 후기</li>
	</ul>
</c:if>
</div>

<div align="center">
	<div style="width: 80%; min-height: 600px; text-align: center; margin-top: 10em; margin-bottom: 10em;">
		<img style="width: 60%; height: auto;" src="resources/images/page_check.png">
	</div>
</div>


<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>