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
	if(message!=null && message!=''){	//message가 있으면
		alert(message);		//alert으로 띄운다.
		if(url!=null && url!=''){	//url이 있으면,
			location.href = "<c:url value='${url}'/>";
		}else{
			history.go(-1);
		}
	}else{
		location.href = "<c:url value='/adminMain'/>";
	}
})
</script>
</head>

