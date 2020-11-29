<!-- 지연 2020.03.09 수정 -->
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

		$("a[name^='delete']").on("click", function(e) { //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	});

	function fn_goHome() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/main' />");
		comSubmit.submit();
	}

	function fn_joinSubmit() {

		var comSubmit = new ComSubmit("joinForm");

		if ($("#PSMEM_JOB").val() == "null") {
			alert("직업을 선택해주세요.");
			$("#PSMEM_JOB").focus();
			return false;
		}
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
		if (!$("#PSMEM_CAREER").val()) {
			alert("활동경력을 작성해주세요.");
			$("#NAME").focus();
			return false;
		}
		if (!$("#PSMEM_INTRODUCE").val()) {
			alert("자기소개를 작성해주세요.");
			$("#PHONE").focus();
			return false;
		}

		comSubmit.setUrl("<c:url value='/joinAddInsert' />");
		comSubmit.submit();
	}

	var gfv_count = 1;
	
	function add_certi() {
		var str = "<tr style='height: auto;'><td style='width: 20%; text-align: right; height: 3em;'></td>"
				+ "<td style='width: 30%; font-size: 1.1em; text-align: left;'>"
				+ "<input type='text' placeholder='자격증 이름' id='CERTI_NAME' name='CERTI_NAME' style='width: 90%; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;'/></td>"
				+ "<td style='width: 20%; font-size: 1.1em; text-align: left;'>"
				+ "<input type='text' placeholder='발급 기관' id='CERTI_ORG' name='CERTI_ORG' style='width: 90%; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;'/></td>"
				+ "<td style='width: 15%; font-size: 1.1em; text-align: left;'>"
				+ "<input type='text' placeholder='취득 일자' id='CERTI_DATE' name='CERTI_DATE' style='width: 90%; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;'/></td>"
				+ "<td style='width: 10%; font-size: 1.1em; text-align: center;'>"
				+ "<input type='file' id='file' name='file_"
				+ (gfv_count)
				+ "' style='width: 14em; font-size: 0.9em;'></td><td style='width: 5%; font-size: 1.1em; text-align: center;'>"
				+ "<a href='#this' style='width: 3em; font-size: 0.9em;' id='delete_"
				+ (gfv_count)
				+ "' name='delete_"
				+ (gfv_count)
				+ "'><b>삭제</b></a></td></tr>"
			
		$("#list").append(str);
		
		gfv_count = Number(gfv_count) + Number(1);
		
		$("a[name^='delete']").on("click", function(e) {
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}
	
	function fn_deleteFile(obj) {
		obj.parent().parent().remove();
	}
</script>




<!--  회원가입 탭 -->
<div align="center" style="height: auto; text-align: center; margin-top: 0.5em;">
	<div style="text-align: center; margin-top: 4em; margin-bottom: 3em;">
		<span style="font-size: 2em; font-weight: bold;">펫시터 추가 정보 입력</span>
	</div>
	<div style="text-align: right; margin-top: 1em; margin-bottom: 3em; margin-right: 3em;">
		<span style="font-size: 1.1em;">* 표시는 필수 입력 사항입니다.</span>
	</div>
	
	<form action="joinPst2" id="joinForm" enctype="multipart/form-data" method="post">

		<input type="hidden" name="PSMEM_ID" value="${PSMEM_ID}"/>
	
		<div align="center">
		<table style="position: relative; width: 80%;">
			<tr style="height: 3em;">
				<td style="width: 22%; text-align: right; height: 3em;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em;">직업*</span>
				</td>
				<td colspan="5" style="font-size: 1.1em; text-align: left;">
					<select style="width: 8em" id="PSMEM_JOB" name="PSMEM_JOB">
						<option value="null">직업선택</option>
						<option value="학생">학생</option>
						<option value="직장인">회사원</option>
						<option value="주부">주부</option>
						<option value="기타">기타</option>
				</select>
				</td>
			</tr>
			<tr style="height: 5em;">
				<td style="width: 22%; text-align: right; height: 3em;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">관련학과 졸업 여부*</span>
				</td>
				<td colspan="5" style="font-size: 1.1em; text-align: left;">
					<label>
						<input type="radio" id="PSMEM_SCHOOL_FINISH_CHECK1" name="PSMEM_SCHOOL_FINISH_CHECK" value="Y">
							예
					</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label>
						<input type="radio" id="PSMEM_SCHOOL_FINISH_CHECK2" name="PSMEM_SCHOOL_FINISH_CHECK" value="N">
							아니오
					</label>
				</td>
			</tr>
			<tr style="height: 5em;">
				<td style="width: 22%; text-align: right; height: 3em;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">자격증 보유 여부*</span>
				</td>
				<td colspan="5" style="font-size: 1.1em; text-align: left;">
					<label>
						<input type="radio" id="PSMEM_CERTI_CHECK1" name="PSMEM_CERTI_CHECK" value="Y">
							예
					</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<label>
						<input type="radio" id="PSMEM_CERTI_CHECK2" name="PSMEM_CERTI_CHECK" value="N">
							아니오
					</label>
				</td>
			</tr>
			<tbody id="list">
				<tr style="height: auto;" id="certi_add">
					<td style="width: 22%; text-align: right; height: 3em;">
						<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em">자격증 정보</span>
					</td>
					<td style="width: 29%; font-size: 1.1em; text-align: left;">
						<input type="text" placeholder="자격증 이름" id="CERTI_NAME" name="CERTI_NAME" style='width: 90%; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;'/>
					</td>
					<td style="width: 19%; font-size: 1.1em; text-align: left;">
						<input type="text" placeholder="발급 기관" id="CERTI_ORG" name="CERTI_ORG" style="width: 93%; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;"/>
					</td>
					<td style="width: 15%; font-size: 1.1em; text-align: left;">
						<input type="text" placeholder="취득 일자" id="CERTI_DATE" name="CERTI_DATE" style="width: 90%; line-height: 1.5em; font-size: 1.1em; border-radius: 0.5em;"/>
					</td>
					<td style="width: 10%; font-size: 1.1em; text-align: center;">
						<input type="file" id="file" name="file_0" style="width: 14em; font-size: 0.9em;">
					</td>
					<td style="width: 5%; font-size: 1.1em; text-align: center;">
					</td>
				</tr>
			</tbody>
			<tr style="height: 3em;">
				<td style="text-align: right; height: 3em; text-align: right;" colspan="6">
					<button type="button" style="line-height: 1.9em; font-size: 0.9em; width: 8em; vertical-align: top; margin-bottom: 0.5em; border-radius: 0.5em;" onclick="add_certi()">자격증 추가</button>
				</td>
			</tr>
			<tr style="height: auto;">
				<td style="width: 22%; text-align: right; height: 3em; vertical-align: text-top;">
					<span style="font-weight: bold; margin-right: 2em; font-size: 1.2em;">활동 경력*</span>
				</td>
				<td colspan="5" style="font-size: 1.1em; text-align: left;">
					<textarea style="height: 8em; resize: none; border-radius: 0.5em;" id="PSMEM_CAREER" name="PSMEM_CAREER"></textarea>
				</td>
			</tr>
		</table>
		
		<input type="hidden" id="PSMEM_ID" name="PSMEM_ID" value="${map.PSMEM_ID}">
		<input type="hidden" id="PSMEM_CONSIGNMENT_ZIPCODE" name="PSMEM_CONSIGNMENT_ZIPCODE" value=" ">
		<input type="hidden" id="PSMEM_CONSIGNMENT_ADDRESS1" name="PSMEM_CONSIGNMENT_ADDRESS1" value=" ">
		<input type="hidden" id="PSMEM_CONSIGNMENT_ADDRESS2" name="PSMEM_CONSIGNMENT_ADDRESS2" value=" ">
		<input type="hidden" id="PSMEM_CONSIGNMENT_ADDRESS_ADD" name="PSMEM_CONSIGNMENT_ADDRESS_ADD" value=" ">
		<input type="hidden" id="PSMEM_INTRODUCE" name="PSMEM_INTRODUCE" value=" ">

		<div align="center" style="margin-top: 4em; margin-bottom: 2em;">
			<table>
				<tr>
					<th style="font-size: 1.1em; padding: 3em;">
						<button style="width: 13em; height: 3em; font-size: 1em; line-height: 1em;" class="my_button" id="cancel">나&nbsp;중&nbsp;에&nbsp;등&nbsp;록</button>
					</th>
					<th style="font-size: 1.1em; padding: 3em;">
						<button style="width: 13em; height: 3em; font-size: 1em; line-height: 1em;" class="my_button" id="join">다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;음</button>
					</th>
				</tr>
			</table>
		</div>
		</div>
	</form>

	<%@ include file="/WEB-INF/views/include/include-body.jspf"%>

</div>

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

<script type="text/javascript" src="./js/jquery-3.1.0.min.js"
	charset="utf-8">
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

	// 이미지 정보들을 담을 배열
	var sel_files = [];

	$(document).ready(function() {
		$("#input_imgs").on("change", handleImgFileSelect);
	});

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}

	function handleImgFileSelect(e) {
		// 이미지 정보들을 초기화
		sel_files = [];
		$(".imgs_wrap").empty();

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var index = 0;
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_files.push(f);

					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
						$(".imgs_wrap").append(html);
						index++;

					}
					reader.readAsDataURL(f);
				});
	}

	function deleteImageAction(index) {
		console.log("index : " + index);
		console.log("sel length : " + sel_files.length);

		sel_files.splice(index, 1);

		var img_id = "#img_id_" + index;
		$(img_id).remove();
	}

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}

	function submitAction() {
		console.log("업로드 파일 갯수 : " + sel_files.length);
		var data = new FormData();

		for (var i = 0, len = sel_files.length; i < len; i++) {
			var name = "image_" + i;
			data.append(name, sel_files[i]);
		}
		data.append("image_count", sel_files.length);

		if (sel_files.length < 1) {
			alert("한개이상의 파일을 선택해주세요.");
			return;
		}

		var xhr = new XMLHttpRequest();
		xhr.open("POST", "./study01_af.php");
		xhr.onload = function(e) {
			if (this.status == 200) {
				console.log("Result : " + e.currentTarget.responseText);
			}
		}
		xhr.send(data);
	}
</script>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>
