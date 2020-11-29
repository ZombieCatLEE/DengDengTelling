<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<head>
<script type="text/javascript">
$(document).ready(function(){ 
	var message = "${message}";
	var url = "${url}";
	var step = "${step}";
	if(message != null && message != ''){	//message가 있으면
		alert(message);		//alert으로 띄운다.
		if(url != null && url != ''){	//url이 있으면,
			if(step == "추가") {	/* 추가 위탁 완료 */
				alert("회원 가입이 마무리 되지 않았습니다.\n추가 정보 입력으로 이동합니다.");
				location.href = "<c:url value='/joinAdd1'/>";	
			} else if(step == "위탁") {
				alert("회원 가입이 마무리 되지 않았습니다.\n위탁 정보 입력으로 이동합니다.");
				location.href = "<c:url value='/joinAdd2'/>";
			} else if(step == "완료") {
				location.href = "<c:url value='${url}'/>";				
			} else {
				location.href = "<c:url value='${url}'/>";
			}
		}else{
			history.go(-1);
		}
	}else{
		location.href = "<c:url value='/main'/>";
	}
})
</script>
</head>
