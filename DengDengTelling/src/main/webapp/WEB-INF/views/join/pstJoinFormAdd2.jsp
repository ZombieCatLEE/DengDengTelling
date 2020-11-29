<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>

<%
	String id = request.getParameter("PSMEM_ID");
%>

<script type="text/javascript">
	$(document).ready(function() {

		$("#cancel").on("click", function(e) {
			e.preventDefault();
			fn_goHome();
		});

		$("#join").on("click", function(e) {
			e.preventDefault();
			fn_joinSubmit();
		});

		$("#addFile").on("click", function(e) {
			//파일 추가 버튼 
			e.preventDefault();
			fn_addFile();
		});

		$("a[name^='delete']").on("click", function(e) {
			e.preventDefault();
			fn_deleteFile($(this));
		});

	});

	function fn_goHome() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/login' />");
		comSubmit.submit();
	}

	function fn_joinSubmit() {

		var comSubmit = new ComSubmit("joinForm");

		if (!$("#PSMEM_CONSIGNMENT_ZIPCODE").val()) {
			alert("우편번호를 입력해주세요.");
			$("#ZIPCODE").focus();
			return false;
		}

		if (!$("#PSMEM_CONSIGNMENT_ADDRESS1").val()) {
			alert("주소를 입력해주세요.");
			$("#ADDRESS1").focus();
			return false;
		}

		if (!$("#PSMEM_INTRODUCE").val()) {
			alert("자기소개를 작성해주세요.");
			$("#PHONE").focus();
			return false;
		}

		comSubmit.setUrl("<c:url value='/joinPstAdd' />");
		comSubmit.submit();
	}

	$("#joinForm").on("submit", function(e) {
	});

	var gfv_count = 1;

	function fn_addFile() {
		var str = "<tr><td style='width: 22%; text-align: right; vertical-align: text-top;'></td>"
				+ "<td style='width: 58%;'><input type='file' id='file' name='file_"
				+ (gfv_count)
				+ "' style='width: 90%; font-size: 1em; margin-left: 15em; margin-bottom: 1.5em;'></td>"
				+ "<td style='width: 20%;'><a href='#this' id='delete' name='delete_"
				+ (gfv_count)
				+ "' style='font-size: 1em;'><b>삭제</b></a></td></tr>"

		$("#fileDiv").append(str);
		
		gfv_count = Number(gfv_count) + Number(1);
		
		$("a[name^='delete']").on("click", function(e) {
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}

	function fn_deleteFile(obj) {
		obj.parent().remove();
	}
</script>

<!--  위탁장소 등록-->
<div align="center" style="height: auto; text-align: center; margin-top: 0.5em;">
	<div style="text-align: center; margin-top: 4em; margin-bottom: 3em;">
		<span style="font-size: 2em; font-weight: bold;">위탁장소 정보 입력</span>
	</div>
	<div style="text-align: right; margin-top: 1em; margin-bottom: 3em; margin-right: 3em;">
		<span style="font-size: 1.1em;">* 표시는 필수 입력 사항입니다.</span>
		<input type="hidden" name="PSMEM_ID" value="${PSMEM_ID}"/>
	</div>
	<div align="center">
	<form action="joinPstAdd" id="joinForm" enctype="multipart/form-data" method="post">
		<table style="width: 80%">
			<tr style="height: auto; padding-bottom: 3em;">
				<td style="width: 22%; text-align: right; vertical-align: text-top;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">위탁 장소*</span>
				</td>
				<td style="width: 78%; font-size: 1.1em; height: auto; text-align: left;" colspan="2">
					<button type="button" style="line-height: 1.9em; font-size: 0.9em; width: 8em; vertical-align: top; margin-bottom: 0.5em; border-radius: 0.5em;" onclick="openZipSearch()">우편번호 검색</button>
					<input type="text" name="PSMEM_CONSIGNMENT_ZIPCODE" id="PSMEM_CONSIGNMENT_ZIPCODE" style="line-height: 1.5em; font-size: 1.1em; width: 7em; border-radius: 0.5em;" placeholder="  우편번호"/><br/>
					<input type="text" name="PSMEM_CONSIGNMENT_ADDRESS1" id="PSMEM_CONSIGNMENT_ADDRESS1" style="line-height: 1.5em; font-size: 1.1em; width: 90%; margin-bottom: 0.5em; border-radius: 0.5em;"/>
					<input type="text" name="PSMEM_CONSIGNMENT_ADDRESS2" id="PSMEM_CONSIGNMENT_ADDRESS2" style="line-height: 1.5em; font-size: 1.1em; width: 60%; border-radius: 0.5em;" placeholder="  상세주소"/>
					<input type="text" name="PSMEM_CONSIGNMENT_ADDRESS_ADD" id="PSMEM_CONSIGNMENT_ADDRESS_ADD" style="line-height: 1.5em; font-size: 1.1em; width: 28%; border-radius: 0.5em;"/><br/>
				</td>
			</tr>
			<tr style="height: 3em;">
			</tr>
			<tr>
				<td colspan="3" style="text-align: right;">
					<span style="font-size: 1.1em; margin-right: 3em; ">위탁 장소 이미지는 5개를 권장합니다.</span>
				</td>
			</tr>
			<tbody id="fileDiv">
				<tr>
					<td style="width: 22%; text-align: right; vertical-align: text-top;">
					 	<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">위탁 장소 이미지</span>
					</td>
					<td style="width: 58%;">
						<input type="file" id="file" name="file_0" style="width: 90%; font-size: 1em; margin-left: 15em; margin-bottom: 1.5em;">
					</td>
					<td style="width: 20%;">
						<!-- <a href="#this" id="delete" name="delete" style="font-size: 1em;"><b>삭제</b></a> -->
					</td>
				</tr>
			</tbody>
			
			<tr style="padding-top: 3em;">
				<td colspan="3" style="text-align: right; padding-right: 5em;">
					<a href="#this" class="btn" id="addFile" style="border: solid; border-radius: 2em; background-color: #006BCC; color: #fff;"><b>파일 추가</b></a>
				</td>
			</tr>
			<tr style="height: 2em;"></tr>
			<tr style="height: auto; margin-top: 1em; margin-bottom: 1em;">
				<td style="width: 22%; text-align: right; vertical-align: text-top;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em;">자기 소개*</span>
				</td>
				<td colspan="2" style="width: 78%; font-size: 1.1em; text-align: left;">
					<textarea style="height: 8em; width: 90%; resize: none; border-radius: 0.5em;" id="PSMEM_INTRODUCE" name="PSMEM_INTRODUCE"></textarea>
				</td>
			</tr>
		</table>
	
		<input type="hidden" id="PSMEM_ID" name="PSMEM_ID" value="${map.PSMEM_ID}">
		
		<div align="center" style="margin-top: 4em; margin-bottom: 2em;">
			<table>
				<tr>
					<th style="font-size: 1.1em; padding: 3em;">
						<button style="width: 13em; height: 3em; font-size: 1em; line-height: 1em;" class="my_button" id="cancel">나&nbsp;중&nbsp;에&nbsp;등&nbsp;록</button>
					</th>
					<th style="font-size: 1.1em; padding: 3em;">
						<button style="width: 13em; height: 3em; font-size: 1em; line-height: 1em;" class="my_button" id="join">완&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;료</button>
					</th>
				</tr>
			</table>
		</div>
	</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/include-body.jspf"%>

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

.imgs_wrap {
	width: 15em;
	height: 15em;
	border: 2px solid #A8A8A8;
	margin-top: 15px;
	margin-bottom: 15px;
}

.imgs_wrap img {
	width: 14.5em;
	height: 14.5em;
}
</style>

<script type="text/javascript">
	//우편번호 검색
	function openZipSearch() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document
									.getElementById("PSMEM_CONSIGNMENT_ADDRESS_ADD").value = extraAddr;

						} else {
							document
									.getElementById("PSMEM_CONSIGNMENT_ADDRESS_ADD").value = '';
						}

						document.getElementById("PSMEM_CONSIGNMENT_ZIPCODE").value = data.zonecode;
						document.getElementById("PSMEM_CONSIGNMENT_ADDRESS1").value = addr;
						document.getElementById("PSMEM_CONSIGNMENT_ADDRESS2")
								.focus();
					}
				}).open();
	}
</script>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>