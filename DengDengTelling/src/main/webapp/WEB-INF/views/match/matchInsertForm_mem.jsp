<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="kr" lang="kr">

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<c:set var="name" value="${match.NAME}" />
<c:set var="grade" value="${match.GRADE}" />
<c:set var="school" value="${match.SCHOOL}" />

<form id="fileUpload" name="fileUpload" enctype="multipart/form-data" action="multiFileUpload" method="post"> 
	<div class="wrapper" style="margin: 30px; border: 5px solid #dddddd; padding: 30px; width: 1300px;">
		<div class="header">
			<h1>이미지 첨부</h1>
		</div>
		<div class="body">
			<!-- 첨부 버튼 -->
			<div id="attach">
				<label class="waves-effect waves-teal btn-flat" for="uploadInputBox">여기를 눌러 이미지를 첨부해주세요.</label>
				<input id="uploadInputBox" style="display: none" type="file" name="file" multiple="multiple" />
				<input type="text" name="src"/>
			</div>

			<!-- 미리보기 영역 -->
			<div id="preview" class="content"></div>

			<!-- multipart 업로드시 영역 -->
			<form id="uploadForm" style="display: none;"/>
		</div>
		<div class="footer">
			<button class="submit">
				<a href="#" title="등록" class="btnlink">이미지 등록</a>
			</button>
		</div>
	</div>
</form>
	<!-- 이미지 첨부 끝 -->
	<!-- 펫시터 소개 상단 -->
<form id="matchInsert" name="mtchInsert" method="post">
	<div style="margin-top: 73px; margin-left: auto; margin-right: auto; width: 1027px; display: flex; flex-direction: row; justify-content: space-between">
		<div style="width: 580px">
			<div style="display: flex; flex-direction: row">
				<div style="overflow: hidden; width: 100px; height: 100px; border: none; border-radius: 12px; margin-top: 29px">
					<img width="100" height="100" style="object-fit: cover; display: inline-block;" src="resources/images/ja1.jpg">
					<!-- 윗단은 멤버 프로필 사진 --> <!-- 프로필 사진도 가져와야 함 -->
				</div>
				<div style="margin-left: 32px"> <!-- 시간나면 글자 색이나 스타일 좀 꾸미자. -->
					<h1 style="font-family: Noto Sans KR, sans-serif; font-size: 15px; color: #4C5056; line-height: 22px; letter-spacing: -0.2px">
						<span style="color:blue">${match.ADDRESS1}</span> <span style="color:gold">${match.DIVISION}</span> ${name} 님</h1>
					<p style="font-family: Noto Sans KR, sans-serif; margin-top: 5px; font-size: 25px; color: #383C48; line-height: 37px; letter-spacing: -0.2px">
						<input style="font-family: Noto Sans KR, sans-serif; margin-top: 5px; font-size: 15px; color: #383C48; line-height: 1px;"
							type="text" id="SUBJECT" name="SUBJECT" placeholder="매칭 페이지에 보일 제목을 작성해주세요.">
					</p>
					<!-- 해시 태그 시작 -->
					<!-- 이 부분은 팝업으로 체크해서 보여주도록 한다. 그러려면 저장할 때 배열 형식으로 저장하게끔 해야 한다. -->
					<div 
						style="display: flex; flex-wrap: wrap; flex-direction: row; margin-top: 12px; width: 458px">
						<p
							style="font-size: 14px; line-height: 21px; letter-spacing: -0.2px; color: rgb(94, 99, 109); margin-right: 7px;">
							#가족과 살아요</p>
						<p
							style="font-size: 14px; line-height: 21px; letter-spacing: -0.2px; color: rgb(94, 99, 109); margin-right: 7px;">
							#아파트</p>
						<p
							style="font-size: 14px; line-height: 21px; letter-spacing: -0.2px; color: rgb(94, 99, 109); margin-right: 7px;">
							#현재는 반려동물을 키우지 않아요</p>
						<p
							style="font-size: 14px; line-height: 21px; letter-spacing: -0.2px; color: #5E636D; margin-right: 7px">
							#서초구 서초1동 펫시터</p>
					</div>
					<!-- 해시 태그 끝 -->
				</div>
			</div>
			<!-- 펫시터 소개 상단 끝 -->
			
			<!-- 펫시터 소개 시작 -->
			<c:choose>
				<c:when test="${grade=='프로'}">
					<div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(250, 250, 251); position: relative;">
						<div style="display: flex; align-items: center;">
							<img width="16" height="23" src="/resources/images/pro_petsitter.png">
							<p style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px;">
								${name} 님은 프로 펫시터입니다.
							</p>
						</div>
						<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
							프로 펫시터는 다수의 펫시팅 경험과 높은 고객 만족도는 물론, 댕댕텔링의 프로 시험을 통과한 펫시터입니다.
						</p>
					</div>
				</c:when>
				<c:when test="${grade=='일반'}">
					<div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(250, 250, 251); position: relative;">
						<div style="display: flex; align-items: center;">
							<img width="16" height="23" src="resources/images/pro_petsitter.png">
							<p style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px;">
								${name} 님은 일반 펫시터입니다.
							</p>
						</div>
						<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
							일반 펫시터는 다수의 예약 진행을 경험한 댕댕텔링의 프리미엄 펫시터입니다.
						</p>
					</div>
				</c:when>
				<c:when test="${grade=='신입'}">
					<div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(250, 250, 251); position: relative;">
						<div style="display: flex; align-items: center;">
							<img width="16" height="23" src="resources/images/pro_petsitter.png">
							<p style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px;">
								${name} 님은 신입 펫시터입니다.
							</p>
						</div>
						<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
							신입 펫시터는 댕댕텔링의 자격 시험을 통과한 전문 펫시터입니다.
						</p>
					</div>
				</c:when>
			</c:choose>
			<!-- 펫시터 소개 시작 -->
			<!-- 펫시터 인사글 -->
			<div style="margin-top: 53px">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; margin-bottom: 30; line-height: 25px; color: #393C47">
					${name} ${grade} 펫시터님을 소개합니다</h2>
					<div style="border: 1px dotted; padding: 10px; border-radius: 10px">
						<p style="font-size: 15px; line-height: 25px; color: #555555; margin-top: 10px">
							${match.CAREER}
						</p>
					</div>
			</div>

			<!--펫시터 자격증 및 교육 수료 --> <!-- 이 부분은 리스트를 불러와서  하나씩 뽑아야 함. -->
			<div style="margin-top: 58px">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 20px">
					자격증 및 교육 수료</h2>
				<c:choose>
					<c:when test="${school=='Y'}">
						<p
							style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
							${name} 님은 반려동물 관련 학과를 졸업한 전문 인재입니다.</p>
					</c:when>
				</c:choose>
				<div
					style="display: flex; flex-direction: row; align-items: center; margin: 32px 0px;">
					<div
						style="width: 220px; height: 130px; border-radius: 5px; overflow: hidden; border: 1px solid rgb(235, 235, 235);">
						<div
							style="width: 220px; height: 130px; filter: blur(1.25px); background-image: url(&quot;images/certificate.png&quot;); background-position: center center; background-repeat: no-repeat; background-size: cover;"></div>
					</div>
					<!-- 윗단에  -->
					<div
						style="display: flex; flex-direction: column; margin-left: 32px;">
						<p
							style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(56, 60, 72);">
							${match.LI_NAME}</p>
						<p
							style="font-size: 14px; letter-spacing: -0.2px; line-height: 19px; color: rgb(56, 60, 72); margin-top: 7px;">
							(사) K.S.D 문화교육원</p>
						<!-- 윗단은 자격증 담당 기관 -->
						<p
							style="font-size: 12px; line-height: 17px; color: rgb(129, 137, 155); margin-top: 32px;">
							2018년 4월 28일에 취득하였습니다</p>
						<!-- 취득일자  + 에 취득하셨습니다.-->
					</div>
				</div>
			</div>
			<!--펫시터 자격증 및 교육 수료 -->
			<!-- 이용 가능 서비스 --> <!-- 굳이 리스트로 뽑지 말고, 각 항목마다 값을 매겨서, 리스트로 컬럼에 저장한 다음 스플릿 해서 꺼내면 되지 않을까? --> <!-- 테이블 수정 관련 메모장 확인 -->
			<div style="margin-top: 85px; width: 600px">
				<h2
					style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 24px">
					이용 가능 서비스</h2>
				<div style="display: flex; flex-wrap: wrap; flex-direction: row">

					<!-- 장기 예약 -->
					<div
						style="display: flex; flex-direction: row; align-items: center; width: 200px; height: 69px;">
						<img width="32" height="32" src="resources/images/service1.png">
						<div style="margin-left: 13px;">
							<p
								style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: rgb(85, 85, 85);">
								장기 예약</p>
							<p
								style="font-size: 11px; letter-spacing: -0.2px; line-height: 17px; color: rgb(94, 99, 109); margin-top: 5px;">
								14일 이상 돌봄 가능</p>
						</div>
					</div>

					<!--실내 놀이 -->
					<div
						style="display: flex; flex-direction: row; align-items: center; width: 200px; height: 69px;">
						<img width="32" height="32" src="resources/images/service2.png">
						<div style="margin-left: 13px;">
							<p
								style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: rgb(85, 85, 85);">
								실내 놀이</p>
							<p
								style="font-size: 11px; letter-spacing: -0.2px; line-height: 17px; color: rgb(94, 99, 109); margin-top: 5px;">
								터그놀이, 노즈워크 등</p>
							<input type="hidden" id="address1" name="address1" value="${match.ADDRESS1}" /> <input type="hidden" id="address2"
								name="address2" value="${match.ADDRESS2}" />
						</div>
					</div>

					<!--매일 산책 -->
					<div
						style="display: flex; flex-direction: row; align-items: center; width: 200px; height: 69px;">
						<img width="32" height="32" src="resources/images/service3.png">
						<div style="margin-left: 13px;">
							<p
								style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: rgb(85, 85, 85);">
								매일 산책</p>
							<p
								style="font-size: 11px; letter-spacing: -0.2px; line-height: 17px; color: rgb(94, 99, 109); margin-top: 5px;">
								산책 및 실외 배변 가능</p>
						</div>
					</div>

					<!--목욕 가능 -->
					<div
						style="display: flex; flex-direction: row; align-items: center; width: 200px; height: 69px;">
						<img width="32" height="32" src="resources/images/service4.png">
						<div style="margin-left: 13px;">
							<p
								style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: rgb(85, 85, 85);">
								목욕 가능</p>
							<p
								style="font-size: 11px; letter-spacing: -0.2px; line-height: 17px; color: rgb(94, 99, 109); margin-top: 5px;">
								비용은 펫시터와 협의</p>
						</div>
					</div>

					<!--약물 복용 -->
					<div
						style="display: flex; flex-direction: row; align-items: center; width: 200px; height: 69px;">
						<img width="32" height="32" src="resources/images/service5.png">
						<div style="margin-left: 13px;">
							<p
								style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: rgb(85, 85, 85);">
								약물 복용</p>
							<p
								style="font-size: 11px; letter-spacing: -0.2px; line-height: 17px; color: rgb(94, 99, 109); margin-top: 5px;">
								경구(입) 약물 복용 가능</p>
						</div>
					</div>

					<!--집앞 픽업 -->
					<div
						style="display: flex; flex-direction: row; align-items: center; width: 200px; height: 69px;">
						<img width="32" height="32" src="resources/images/service6.png">
						<div style="margin-left: 13px;">
							<p
								style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: rgb(85, 85, 85);">
								집앞 픽업</p>
							<p
								style="font-size: 11px; letter-spacing: -0.2px; line-height: 17px; color: rgb(94, 99, 109); margin-top: 5px;">
								비용은 펫시터와 협의</p>
						</div>
					</div>
				</div>
			</div>
			<!-- 이용 가능 서비스 끝 -->
		</div>
		<div>
			<!-- 펫시터 후기 --> <!-- 이미지 댓글 형식으로 만들어야 함 -->
			<!-- 펫시터 예약 날짜 선택 -->
			<div style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 32px; padding-right: 32px; padding-bottom: 32px">
				<p style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-top: 38px; font-weight: bold">
					언제 펫시터가 필요한가요?
				</p>
				<div style="display: flex; flex-grow: 1; margin-top: 1em">
					<form action="index.html" method="get" class="tm-search-form tm-section-pad-2">
						<div class="form-group tm-form-element tm-form-element-50" style="width: 280px; right: 3em; bottom: 1em">
							<i class="fa fa-calendar fa-2x tm-form-element-icon"></i>
							<input name="inputCheckIn" type="text" class="form-control" id="inputCheckIn" placeholder="체크인 날짜" style="font-size: 1em">
						</div>
						<div class="form-group tm-form-element tm-form-element-50" style="width: 40px; right: 3em; bottom: 1em; font-size: 2em; text-align: center">
							~
						</div>
						<div class="form-group tm-form-element tm-form-element-50" style="width: 280px; right: 3em; top: 2em">
							<i class="fa fa-calendar fa-2x tm-form-element-icon"></i>
							<input name="inputCheckOut" type="text" class="form-control" id="inputCheckOut" placeholder="체크아웃 날짜" style="font-size: 1em">
						</div>
					</form>
				</div>

				<!-- 예약 시간 선택 -->
				<div style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 38px">
					<div style="width: 149px">
						<p style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-bottom: 18px">
							체크인 시간
						</p>
						<select id="type" name="checkInTime" style="width: 10.5em">
							<option value="time">10:00</option>
							<option value="time">11:00</option>
							<option value="time">12:00</option>
							<option value="time">13:00</option>
							<option value="time">14:00</option>
							<option value="time">15:00</option>
							<option value="time">16:00</option>
							<option value="time">17:00</option>
							<option value="time">18:00</option>
							<option value="time">19:00</option>
							<option value="time">20:00</option>
							<option value="time">21:00</option>
							<option value="time">22:00</option>
						</select>
					</div>
					<div style="width: 149px">
						<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-bottom: 8px">
							<p style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47">
								체크아웃 시간
							</p>
							<p style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4"></p>
						</div>
						<select id="type" name="checkOutTime" style="width: 10.5em">
							<option value="time">10:00</option>
							<option value="time">11:00</option>
							<option value="time">12:00</option>
							<option value="time">13:00</option>
							<option value="time">14:00</option>
							<option value="time">15:00</option>
							<option value="time">16:00</option>
							<option value="time">17:00</option>
							<option value="time">18:00</option>
							<option value="time">19:00</option>
							<option value="time">20:00</option>
							<option value="time">21:00</option>
							<option value="time">22:00</option>
						</select>
					</div>
				</div>
				<!-- 예약 시간 선택 끝 -->
				<!-- 맡기는 반려동물 선택 --> <!-- 이 부분도 pet_member에서 가져온 값들 중 이름만 뽑아서 리스트로 만든 다음에 넣어야 할 것 같은데... -->
				<!-- 근데 선택하면 어떻게 하지? 여러 마리 선택하면 추가되게 해야 되는데 -->
				<p style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-top: 38px; margin-bottom: 18px">맡기시는 반려동물</p>
				<select id="pet" name="type" style="width: 22em">
					<option value="mypet">뭉치</option>
					<option value="mypet">댕댕이</option>
				</select>

				<div style="display: flex; align-items: center; justify-content: center; width: 311px; height: 59px; border-radius: 3px; background-color: #71A2FF; margin-top: 50px; user-select: none; cursor: pointer">
					<p style="font-family: Noto Sans KR; font-weight: 600; font-size: 15px; letter-spacing: 0.2px; line-height: 22px; color: white">예약 요청</p>
				</div>
			</div>
			<!-- 맡기는 반려동물 선택 끝 -->
			<!-- 펫시터 예약 날짜 선택 끝 -->
			<!-- 이용 요금 소개 --> <!-- 가능, 불가 선택. 지정된 액수 안에서 금액 설정 가능하게. -->
			<div style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding: 38px 32px; margin-top: 38px">
				<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-between">
					<p style="font-size: 17px; font-weight: 600; letter-spacing: -0.2px; line-height: 25px; color: #393C47">이용 요금</p>
					<div style="display: flex; align-items: center; flex-direction: row">
						<div style="display: flex; flex-direction: row; align-items: center; margin-right: 3px">
							<p style="font-size: 13px; line-height: 18px; color: #383C48">1박 케어</p>
						<div style="width: 1px; height: 15px; background-color: #ECEDF0; margin-left: 10px; margin-right: 10px"></div>
							<p style="font-size: 13px; line-height: 18px; color: #383C48">데이케어</p>
						</div>
					</div>
				</div>
				<div style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 31px">
					<div style="display: flex; flex-direction: row; align-items: center; height: 24px">
						<img width="24" height="24" src="resources/images/price_pet_small.png" alt="소형견">
						<p style="font-size: 15px; line-height: 19px; color: #383C48; margin-left: 10px">소형견</p>
						<p style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 12px">7키로 미만</p>
					</div>
					<div style="display: flex; flex-direction: row">
						<div style="display: flex; align-items: center; flex-direction: row">
							<p style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B; margin-right: 12px">40,000원</p>
							<p style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">35,000원</p>
						</div>
					</div>
				</div>

				<div style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 14px">
					<div style="display: flex; flex-direction: row; align-items: center; height: 24px">
						<img width="24" height="24" src="resources/images/price_pet_medium.png" alt="중형견">
						<p style="font-size: 15px; line-height: 19px; color: #383C48; margin-left: 10px">중형견</p>
						<p style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 12px">15키로 미만</p>
					</div>
					<div style="display: flex; flex-direction: row">
						<div style="display: flex; align-items: center; flex-direction: row">
							<p style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B; margin-right: 12px">50,000원</p>
							<p style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">40,000원</p>
						</div>
					</div>
				</div>

				<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-top: 14px">
					<div style="display: flex; flex-direction: row; align-items: center; height: 24px">
						<img width="24" height="24" src="resources/images/price_pet_large_gray.png" alt="대형견">
						<p style="font-size: 15px; line-height: 19px; color: #383C48; margin-left: 10px">대형견</p>
						<p style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 12px">15키로 이상</p>
					</div>
					<div style="display: flex; flex-direction: row">
						<div style="display: flex; align-items: center; width: 62px; flex-direction: column; margin-right: 12px">
							<p style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #999999">예약불가</p>
						</div>
						<div style="display: flex; flex-direction: column; align-items: center; width: 62px">
							<p style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #999999">예약불가</p>
						</div>
					</div>
				</div>
				<div style="width: 310px; height: 1px; background-color: #EBEBEB; margin: 32px 0"></div>
			</div>
			<!-- 이용 요금 소개 끝 -->
			<!-- 달력 -->
			<!-- <div style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding: 38px; margin-top: 38px">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 24px">예약 가능 날짜</h2>
				<div>
					<div
						style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-bottom: 21px">
						<div
							style="display: flex; align-items: center; justify-content: center; border: 1px solid #9DA4B4; opacity: 0.5; width: 32px; height: 32px; border-radius: 50%; pointer-events: none; user-select: none; cursor: pointer">
							<img width="5" height="10"
								src="/static/images/page_details/schedule_left_arrow.png">
						</div>
						<p
							style="font-family: Noto Sans KR, sans-serif; font-size: 18px; line-height: 27px; letter-spacing: -0.2px; color: #383C48">2020년
							1월</p>
						<div
							style="display: flex; align-items: center; justify-content: center; border: 1px solid #9DA4B4; width: 32px; height: 32px; border-radius: 50%; user-select: none; cursor: pointer">
							<img width="5" height="10"
								src="/static/images/page_details/schedule_right_arrow.png">
						</div>
					</div>
					<div
						style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-bottom: 12px">
						<div style="width: 42px">
							<p
								style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #5E636D; text-align: center">일</p>
						</div>
						<div style="width: 42px">
							<p
								style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #5E636D; text-align: center">월</p>
						</div>
						<div style="width: 42px">
							<p
								style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #5E636D; text-align: center">화</p>
						</div>
						<div style="width: 42px">
							<p
								style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #5E636D; text-align: center">수</p>
						</div>
						<div style="width: 42px">
							<p
								style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #5E636D; text-align: center">목</p>
						</div>
						<div style="width: 42px">
							<p
								style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #5E636D; text-align: center">금</p>
						</div>
						<div style="width: 42px">
							<p
								style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #5E636D; text-align: center">토</p>
						</div>
					</div>
					<div
						style="display: flex; flex-direction: row; justify-content: space-between">
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div style="flex-grow: 1"></div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div style="flex-grow: 1"></div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div style="flex-grow: 1"></div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">1</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">2</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">3</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">4</p>
							</div>
						</div>
					</div>
					<div
						style="display: flex; flex-direction: row; justify-content: space-between">
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">5</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">6</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">7</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">8</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">9</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">10</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">11</p>
							</div>
						</div>
					</div>
					<div
						style="display: flex; flex-direction: row; justify-content: space-between">
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">12</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">13</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">14</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">15</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">16</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">17</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">18</p>
							</div>
						</div>
					</div>
					<div
						style="display: flex; flex-direction: row; justify-content: space-between">
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">19</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">20</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">21</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">22</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">23</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">24</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">25</p>
							</div>
						</div>
					</div>
					<div
						style="display: flex; flex-direction: row; justify-content: space-between">
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">26</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">27</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: #F2F3F7">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: #9DA4B4">28</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: rgb(242, 243, 247);">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: rgb(157, 164, 180);">29</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: rgb(242, 243, 247);">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: rgb(157, 164, 180);">30</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div
								style="display: flex; align-items: center; justify-content: center; flex-grow: 1; background-color: rgb(242, 243, 247);">
								<p
									style="font-weight: 400; font-size: 12px; letter-spacing: -0.2px; line-height: 14px; text-align: center; color: rgb(157, 164, 180);">31</p>
							</div>
						</div>
						<div
							style="display: flex; margin: 0.5px; background-color: white; width: 42px; height: 42px">
							<div style="flex-grow: 1"></div>
						</div>
					</div>
					<div
						style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 24px; margin-left: 36px; margin-right: 36px">
						<div
							style="display: flex; flex-direction: row; align-items: center">
							<div
								style="background-color: #71A2FF; width: 15px; height: 15px; margin-right: 8px"></div>
							<p
								style="font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: #4E525A">이용
								가능 날짜</p>
						</div>
						<div
							style="display: flex; flex-direction: row; align-items: center">
							<div
								style="background-color: #F2F3F7; border-width: 1px solid #E0E0E0; width: 15px; height: 15px; margin-right: 8px"></div>
							<p
								style="font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: #4E525A">예약
								불가 날짜</p>
						</div>
					</div>
				</div>
			</div> -->
			<div>
				<img src="https://chmln.github.io/flatpickr/images/logo.png"
					alt="flatpickr">
					<h1>Flatpickr</h1>
					<hr>
						<div class="flatpickr">
							<h2>Basic DateTime</h2>
							<input type="text" id="basicDate"
								placeholder="Please select Date Time" data-input
								class="flatpickr-input">

								<h2>Range Datetime</h2> <input type="text" id="rangeDate"
								placeholder="Please select Date Range" data-input
								class="flatpickr-input">

									<h2>Time Picker</h2> <input type="text" id="timePicker"
									placeholder="Please select Time" class="flatpickr-input">
						</div>
						<h2>Week Number with Reset Date</h2>
						<div class=resetDate>
							<input type="text" placeholder="Select Date.." data-input
								class="flatpickr-input">
								<button class="input-button" title="clear" data-clear>RESET</button>
						</div>
			</div>
			<!-- 달력 끝 -->
					<!-- 카카오 지도 API: 펫시터 위치 표시 -->
			<div style="position: relative; line-height: 1em; display: flex; flex-direction: column; width: 375px; height: 400px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); margin-top: 38px; overflow: hidden; text-align: center;">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 8px">${name} 펫시터 님의 동네 위치입니다.</h2>
					<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 10px">매칭이 성사되면 정확한 위치를 확인하실 수 있어요!</p>
				<div id="map" style="position: absolute; height: 300px; border-radius: 4px; border: 1px solid #DFE3EA; overflow: hidden; display: inline-block; text-align: center; top: 23%; left: 52.5%; width: 95%; margin-top: -0.5em; margin-left: -50%;">
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd69701c52c23858bb7f642b6fddbe23&libraries=services,clusterer,drawing"></script>

					<script>
						var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
						var options = { //지도를 생성할 때 필요한 기본 옵션
							center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
							level : 3 //지도의 레벨(확대, 축소 정도)
						};

						var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

						//회원의 주소값을 바로 지도에 표시하기 위해 가져오는 form 정보.
						var form = document.matchInsert;
					
						//이 부분 이미지를 인터넷에서 가져올 수 있도록 해야할 듯.
						var imageSrc = 'file:///C:/Users/Dead Cat/git/DengDengProject/src/main/webapp/resources/images/dogmaker_after.png', // 마커이미지의 주소입니다    
							imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
							imageOption = {offset : new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다 + 마커 오버레이랑 클릭 버전도 있으니까 시간나면 트라이.
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
						//, markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						// 주소로 좌표를 검색합니다 + 주소를 가져와서 합쳐도 출력이 된다는 것을 알았으니 나중에 조건문을 넣어서 진행 단계에 따라 다르게 나오도록 하면 될 듯함.
						geocoder.addressSearch((form.address1.value + form.address2.value), function(result, status) {
						//geocoder.addressSearch('경기도 의정부시 용민로 21번길 101', function(result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									image : markerImage, // 마커이미지 설정 
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다 + 인포 윈도우는 다르게 수정할 수 있으니까 시간 나면 알아보자.
								var infowindow = new kakao.maps.InfoWindow({
									content : '<div style="width:150px;text-align:center;padding:6px 0;">펫시터님 위치</div>'
								});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
					</script>
				</div>
			</div>
		</div>
	</div>
</form>

<!-- flatpickr jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Flatpickr -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
<!-- flatpickr -->  
<script id="INLINE_PEN_JS_ID">
	$("#basicDate").flatpickr({  // 이 방식은 펫시터가 사용.
		mode: "multiple",	//다중 선택
		dateFormat: "Y-m-d",
		minDate: "today"  //펫시터가 선택하는 날짜는 DB에 리스트로 저장했다가 일반 회원이 고를 때 enable로 가능한 날짜만 표시.
	});					  //그렇게 DB에 저장하면 펫시터가 원하는 날짜만 골라서 매칭할 수 있을 것 같음.

	$("#rangeDate").flatpickr({	//이 방식은 일반 회원이 사용
		mode: "range",		//시작에서 끝까지 from to 형식으로 선택
		dateFormat: "Y-m-d",
		minDate: "today",
		//enable: ["", "", ""]  //이 부분은 테이블에 불가능한 날짜를 리스트로 저장하고, 회원이 일정 고를 때 긁어와서 저기에 넣어야 할 것 같음.
	});
</script>
<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>