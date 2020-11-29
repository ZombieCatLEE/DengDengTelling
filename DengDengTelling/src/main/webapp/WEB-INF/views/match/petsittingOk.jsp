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

<script type="text/javascript">
	
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

<div style="display: flex; height: 100px; width: auto; position: relative; text-align: center; align-items: center;">
	<p style="text-align: Center; position: relative; align-items: center; position: relative; margin: auto;">
		<span style="font-family: 'Arial'; font-weight: 700; font-size: 3em; color: rgba(5, 38, 55, 1);">펫시팅 예약이 완료되었습니다.</span>
	</p>
</div>
<div style="display: flex; width: 100%; height: 500px;">
    <div style="flex: 2; text-align: center; align-items: center; vertical-align: middle; position: relative;">
    	<p style="text-align: Center; position: relative; align-items: center; position: relative;">
			<span style="font-family: 'Arial'; font-weight: 700; font-size: 25px; color: rgba(5, 38, 55, 1);">메인 화면으로 돌아가실래요?</span>
		</p>
    </div>
    <div style="flex: 3; position: relative; margin-bottom: 50px;">
		<img style="margin: auto; position: absolute; overflow: hidden; max-height: 400px; max-width: auto; top: 0; bottom: 0; left: 0; right: 0; border-radius: 50%;" src="resources/images/dog_(81).jpg"/>
    </div>
    <div style="flex: 2; background: #81F781;">
    	<div>예약한 내용을 확인하고 싶으신가요?</div>
    	
    	<button type="button" onclick="location.href='petsittingTest'">이동</button>
    </div>
</div>


<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>