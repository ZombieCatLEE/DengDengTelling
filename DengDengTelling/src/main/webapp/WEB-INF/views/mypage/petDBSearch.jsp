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
	function filter(){
		if($('#txtFilter').val()=="")
			$("#languageTBody tr").css('display','');
			else{
			$("#languageTBody tr").css('display','none');
			$("#languageTBody tr[name*='"+$('#txtFilter').val()+"']").css('display','');
		}
		return false;
	}
	
	function setParentText(KIND, SIZE) {
		opener.document.getElementById("PET_MEM_KIND").value = KIND.value;
		opener.document.getElementById("PET_MEM_SIZE").value = SIZE.value;
		
		window.close();
	}
</script>
</head>

<body>
	<div align="center">
		<table style="width: 100%; padding-top: 1em;">
			<tr>
				<td style="width: 30%; height: 2em; text-align: right;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em"><b>견종 검색 : </b></span> 
				</td>
				<td style="width: 50%; height: 2em;" colspan="2">
					<input type="text" id="txtFilter" onkeyup='{filter(); return false}' onkeypress='javascript:if(event.keyCode==13){filter(); return false;}' name="petSearch" style="width: 100%; position: relative; line-height: 2em; border-radius: 0.5em; font-size: 1em;" placeholder="  견종을 검색하세요.">
				</td>
				<td style="width: 20%; height: 2em;">
					<button type="button" class="my_button" style="font-size: 1.1em; height: 2em; width: 5em; margin-left: 1em;" onclick="Search();">검&nbsp;&nbsp;색</button> 
				</td>
			</tr>
			<tr style="height: 0.5em;">
				<td style="border-bottom: solid; padding-top: 1em;" colspan="4">
				</td>
			</tr>
			<c:if test="${petInfoList != null}">
				<tr>
					<td style="width: 55%; height: 2em; text-align: center;" colspan="2">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em"><b>견종</b></span>
					</td>
					<td style="width: 25%; height: 2em; text-align: center;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em"><b>크기</b></span>
					</td>
					<td style="width: 20%; height: 2em; text-align: center;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em"><b>선택</b></span>
					</td>
				</tr>
				<tr style="height: 0.5em;">
					<td style="border-top: solid; padding-bottom: 1em;" colspan="4">
					</td>
				</tr>
				<tbody id="languageTBody">
					<c:forEach var="i" items="${petInfoList}" varStatus="var">
						<tr name="${i.PET_BREED_NAME}">
							<td style="width: 55%; height: 2em; text-align: center;" colspan="2">
								<span style="font-weight: bold; margin-right: 2em; font-size: 1.1em">${i.PET_BREED_NAME}</span>
								<input type="hidden" name="PET_MEM_KIND${var.count}" id="PET_MEM_KIND${var.count}" value="${i.PET_BREED_NAME}"/>
							</td>
							<td style="width: 25%; height: 2em; text-align: center;">
								<span style="font-weight: bold; margin-right: 2em; font-size: 1.1em">${i.PET_BREED_SIZE}</span>
								<input type="hidden" name="PET_MEM_SIZE${var.count}" id="PET_MEM_SIZE${var.count}" value="${i.PET_BREED_SIZE}"/>
							</td>
							<td style="width: 20%; height: 2em; text-align: center;">
								<Button type="button" class="my_button" style="font-size: 1.1em; height: 2em; width: 4em;" onclick="setParentText(PET_MEM_KIND${var.count}, PET_MEM_SIZE${var.count})">선택</Button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</c:if>
		</table>
	</div>
</body>

<style type="text/css">

.my_button {
	display: inline-block;
	text-align: center;
	background-color: #006BCC;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}
</style>

</html>