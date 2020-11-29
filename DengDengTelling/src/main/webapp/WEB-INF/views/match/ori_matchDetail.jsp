<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<div class="mainGallery"
	style="z-index: 0; display: flex; flex-direction: row; width: 100%; height: 580px; margin-top: 85px; position: relative">
	<div style="width: 62.5%; height: 580px; overflow: hidden">
		<img width="900" height="580" class="normalImage"
			style="object-fit: cover; width: 100%; user-select: none; cursor: pointer"
			src="images/sitter1.jpg">
	</div>
	<div
		style="display: flex; flex-grow: 1; width: 37.5%; height: 580px; flex-direction: column">
		<div style="width: 100%; height: 290px; overflow: hidden">
			<img height="290" class="normalImage"
				style="object-fit: cover; user-select: none; cursor: pointer; width: 100%"
				src="images/sitter3.jpg">
		</div>
		<div style="width: 100%; height: 290px; overflow: hidden">
			<img height="290" class="normalImage"
				style="object-fit: cover; user-select: none; cursor: pointer; width: 100%"
				src="images/sitter1.jpg">
		</div>
	</div>
</div>

<div
	style="margin-top: 73px; margin-left: auto; margin-right: auto; width: 1027px; display: flex; flex-direction: row; justify-content: space-between">
	<div style="width: 580px">
		<div style="display: flex; flex-direction: row">
			<div
				style="overflow: hidden; width: 100px; height: 100px; border: none; border-radius: 12px; margin-top: 5px">
				<img width="100" height="100"
					style="object-fit: cover; display: inline-block;"
					src="images/ja1.jpg">
			</div>
			<div style="margin-left: 32px">
				<h1
					style="font-family: Noto Sans KR, sans-serif; font-size: 15px; color: #4C5056; line-height: 22px; letter-spacing: -0.2px">
					서울 서초구 서초1동 펫시터 · 유*진
					<!-- -->
					님
				</h1>
				<p
					style="font-family: Noto Sans KR, sans-serif; margin-top: 5px; font-size: 25px; color: #383C48; line-height: 37px; letter-spacing: -0.2px">정성을
					다해 사랑으로 돌봐드려요</p>
				<!-- 해시태그부분 -->
				<div
					style="display: flex; flex-wrap: wrap; flex-direction: row; margin-top: 12px; width: 458px">
					<p
						style="font-size: 14px; line-height: 21px; letter-spacing: -0.2px; color: rgb(94, 99, 109); margin-right: 7px;">#가족과
						살아요</p>
					<p
						style="font-size: 14px; line-height: 21px; letter-spacing: -0.2px; color: rgb(94, 99, 109); margin-right: 7px;">#아파트</p>
					<p
						style="font-size: 14px; line-height: 21px; letter-spacing: -0.2px; color: rgb(94, 99, 109); margin-right: 7px;">#현재는
						반려동물을 키우지 않아요</p>
					<p
						style="font-size: 14px; line-height: 21px; letter-spacing: -0.2px; color: #5E636D; margin-right: 7px">#서초구
						서초1동 펫시터</p>
				</div>
			</div>
		</div>

		<!-- 프로펫시터소개부분 -->
		<div
			style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(250, 250, 251); position: relative;">
			<div style="display: flex; align-items: center;">
				<img width="16" height="23" src="images/pro_petsitter.png">
				<p
					style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px;">유*진님은
					프로 펫시터입니다</p>
			</div>
			<p
				style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">프로
				펫시터는 다수의 예약 진행 경험과 함께, 높은 고객 만족도를 받은 펫시터입니다</p>
		</div>

		<!-- 펫시터 인사글 -->
		<div style="margin-top: 53px">
			<h2
				style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47">유*진
				펫시터님을 소개합니다</h2>
			<p
				style="font-size: 15px; line-height: 25px; color: #555555; margin-top: 32px">
				우연한 기회에 펫시터에 대해 알게 되었고 제가 너무 좋아하고 잘할 수 있는 일이라 생각되어 시작하게 되었습니다.. 활동을
				하다보니 역시나 저에게 너무 잘 맞았고 일이라는 생각이 전혀 안 들 정도로 아이들과 교감하는 것이 행복했습니다. 집에 오는
				아가들이 잘 따르고 편안해 할 때와 너무 만족해 하시며 고마워 하시는 견주님들을 볼 때 너무 보람있고 행복한 일이라고
				느끼고 있습니다. 앞으로도 처음 그 마음처럼 사랑과 정성으로 아이들을 돌보겠습니다~~^^</p>
		</div>

		<!--펫시터 자격증 및 교육 수료 -->
		<div style="margin-top: 58px">
			<h2
				style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 20px">자격증
				및 교육 수료</h2>
			<div
				style="display: flex; flex-direction: row; align-items: center; margin: 32px 0px;">
				<div
					style="width: 220px; height: 130px; border-radius: 5px; overflow: hidden; border: 1px solid rgb(235, 235, 235);">
					<div
						style="width: 220px; height: 130px; filter: blur(1.25px); background-image: url(&quot;images/certificate.png&quot;); background-position: center center; background-repeat: no-repeat; background-size: cover;"></div>
				</div>
				<div
					style="display: flex; flex-direction: column; margin-left: 32px;">
					<p
						style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(56, 60, 72);">펫시터
						전문가 교육</p>
					<p
						style="font-size: 14px; letter-spacing: -0.2px; line-height: 19px; color: rgb(56, 60, 72); margin-top: 7px;">(사)
						K.S.D 문화교육원</p>
					<p
						style="font-size: 12px; line-height: 17px; color: rgb(129, 137, 155); margin-top: 32px;">2018년
						4월 28일에 취득하였습니다</p>
				</div>
			</div>
		</div>

		<!-- 이용가능서비스 -->
		<div style="margin-top: 85px; width: 600px">
			<h2
				style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 24px">이용
				가능 서비스</h2>
			<div style="display: flex; flex-wrap: wrap; flex-direction: row">

				<!-- 장기 예약 -->
				<div
					style="display: flex; flex-direction: row; align-items: center; width: 200px; height: 69px;">
					<img width="32" height="32" src="images/service1.png">
					<div style="margin-left: 13px;">
						<p
							style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: rgb(85, 85, 85);">장기
							예약</p>
						<p
							style="font-size: 11px; letter-spacing: -0.2px; line-height: 17px; color: rgb(94, 99, 109); margin-top: 5px;">14일
							이상 돌봄 가능</p>
					</div>
				</div>

				<!--실내 놀이 -->
				<div
					style="display: flex; flex-direction: row; align-items: center; width: 200px; height: 69px;">
					<img width="32" height="32" src="images/service2.png">
					<div style="margin-left: 13px;">
						<p
							style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: rgb(85, 85, 85);">실내
							놀이</p>
						<p
							style="font-size: 11px; letter-spacing: -0.2px; line-height: 17px; color: rgb(94, 99, 109); margin-top: 5px;">터그놀이,
							노즈워크 등</p>
					</div>
				</div>

				<!--매일 산 -->
				<div
					style="display: flex; flex-direction: row; align-items: center; width: 200px; height: 69px;">
					<img width="32" height="32" src="images/service3.png">
					<div style="margin-left: 13px;">
						<p
							style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: rgb(85, 85, 85);">매일
							산책</p>
						<p
							style="font-size: 11px; letter-spacing: -0.2px; line-height: 17px; color: rgb(94, 99, 109); margin-top: 5px;">산책
							및 실외 배변 가능</p>
					</div>
				</div>

				<!--목욕 가능 -->
				<div
					style="display: flex; flex-direction: row; align-items: center; width: 200px; height: 69px;">
					<img width="32" height="32" src="images/service4.png">
					<div style="margin-left: 13px;">
						<p
							style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: rgb(85, 85, 85);">목욕
							가능</p>
						<p
							style="font-size: 11px; letter-spacing: -0.2px; line-height: 17px; color: rgb(94, 99, 109); margin-top: 5px;">비용은
							펫시터와 협의</p>
					</div>
				</div>

				<!--약물 복용 -->
				<div
					style="display: flex; flex-direction: row; align-items: center; width: 200px; height: 69px;">
					<img width="32" height="32" src="images/service5.png">
					<div style="margin-left: 13px;">
						<p
							style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: rgb(85, 85, 85);">약물
							복용</p>
						<p
							style="font-size: 11px; letter-spacing: -0.2px; line-height: 17px; color: rgb(94, 99, 109); margin-top: 5px;">경구(입)
							약물 복용 가능</p>
					</div>
				</div>


				<!--집앞 픽업 -->
				<div
					style="display: flex; flex-direction: row; align-items: center; width: 200px; height: 69px;">
					<img width="32" height="32" src="images/service6.png">
					<div style="margin-left: 13px;">
						<p
							style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 19px; color: rgb(85, 85, 85);">집앞
							픽업</p>
						<p
							style="font-size: 11px; letter-spacing: -0.2px; line-height: 17px; color: rgb(94, 99, 109); margin-top: 5px;">비용은
							펫시터와 협의</p>
					</div>
				</div>
			</div>
		</div>

		<!-- 펫시터 후기 -->
		<div style="margin-top: 80px">
			<div
				style="display: flex; flex-direction: row; align-items: center; margin-bottom: 38px">
				<h2
					style="font-weight: 600; font-size: 22px; letter-spacing: -0.2px; line-height: 33px; color: #393C47; margin-right: 20px; margin-bottom: 0">펫시터
					후기 45개</h2>
				<div
					style="display: flex; flex-direction: row; justify-content: space-between; width: 113px">
					<!-- 별점표시 -->
					<img width="18" height="18" src="images/star_1.png"> <img
						width="18" height="18" src="images/star_1.png"> <img
						width="18" height="18" src="images/star_1.png"> <img
						width="18" height="18" src="images/star_1.png"> <img
						width="18" height="18" src="images/star_1.png">
				</div>
			</div>

			<!-- 후기 사진모음 -->
			<div style="display: flex; flex-direction: row">
				<div
					style="display: flex; overflow: hidden; border-radius: 3px; margin-right: 9px; user-select: none; cursor: pointer; position: relative;">
					<img width="139" height="139"
						src="https://d1cd60iwvuzqnn.cloudfront.net/resized/comment/17b39198691441e0827ea89ac75010fa.jpg"
						style="object-fit: cover;">
				</div>
				<div
					style="display: flex; overflow: hidden; border-radius: 3px; margin-right: 9px; user-select: none; cursor: pointer; position: relative;">
					<img width="139" height="139"
						src="https://d1cd60iwvuzqnn.cloudfront.net/resized/comment/7bfeaaf404c94a4183e2ad791cdd8743.jpg"
						style="object-fit: cover;">
				</div>
				<div
					style="display: flex; overflow: hidden; border-radius: 3px; margin-right: 9px; user-select: none; cursor: pointer; position: relative;">
					<img width="139" height="139"
						src="https://d1cd60iwvuzqnn.cloudfront.net/resized/comment/ab671e14ddc24db6b8d0c53e2d9c6078.jpg"
						style="object-fit: cover;">
				</div>
				<div
					style="display: flex; overflow: hidden; border-radius: 3px; margin-right: 9px; user-select: none; cursor: pointer; position: relative;">
					<img width="139" height="139"
						src="https://d1cd60iwvuzqnn.cloudfront.net/resized/comment/4b62b412b59945c88b563ccd4a6b21b1.jpg"
						style="object-fit: cover;">
					<div
						style="display: flex; position: absolute; top: 0px; left: 0px; right: 0px; bottom: 0px; width: 139px; height: 139px; align-items: center; justify-content: center; background-color: rgba(0, 0, 0, 0.59); border-radius: 3px;">
						<p
							style="font-size: 17px; letter-spacing: 0.5px; line-height: 25px; color: white;">+5</p>
					</div>
				</div>
			</div>

			<!-- 후기 글모음 영역 -->
			<div style="margin-top: 38px">

				<!-- 후기 글모음1 -->
				<div
					style="display: flex; flex-direction: column; border-top: 1px solid rgb(235, 235, 235); padding: 38px 0px;">
					<div
						style="display: flex; flex-direction: row; align-items: center;">
						<img width="50" height="50"
							src="https://d1cd60iwvuzqnn.cloudfront.net/resized/pet/d6b6bc3f7ee1483dafa660b850408721.jpg"
							style="object-fit: cover; border-radius: 50%;">
						<div style="margin-left: 18px;">
							<!-- 글쓴이 -->
							<p
								style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(56, 60, 72);">정*림</p>
							<p
								style="font-size: 13px; line-height: 19px; color: rgb(76, 80, 86); margin-top: 6px;">2020년
								1월 22일</p>
						</div>
					</div>
					<!-- 후기 -->
					<p
						style="font-size: 15px; line-height: 25px; color: rgb(76, 80, 86); margin-top: 18px;">매일
						매일 꼼꼼하게 써주시는 일지를 보면서 저희가족들이 여행의 고단함을 달랬답니다. 사진과 영상을 보면서 많이 웃고 안심이
						되었습니다. 강아지를 정말 이뻐해 주시는 팻시터님의 가족분들의 사랑이 느껴져서 마음 편히 여행 다녀올 수 있었습니다.
						마음깊이 감사드립니다. 큐가 누나를 그리워할 것 같아서 조만간 또 방문할 것 같습니다. 또 뵙겠습니다.</p>
					<div style="display: flex; flex-direction: row; margin-top: 33px;">
						<img width="90" height="90"
							src="https://d1cd60iwvuzqnn.cloudfront.net/resized/comment/17b39198691441e0827ea89ac75010fa.jpg"
							style="border-radius: 2px; object-fit: cover; margin-right: 9px; user-select: none; cursor: pointer;">
						<img width="90" height="90"
							src="https://d1cd60iwvuzqnn.cloudfront.net/resized/comment/7bfeaaf404c94a4183e2ad791cdd8743.jpg"
							style="border-radius: 2px; object-fit: cover; margin-right: 9px; user-select: none; cursor: pointer;">
					</div>

					<!-- 댓글 -->
					<div
						style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 32px;">
						<img width="50" height="50"
							src="https://d1cd60iwvuzqnn.cloudfront.net/profile/be56da9b0c7744728f69074daf287d10.jpg"
							style="object-fit: cover; border-radius: 50%;">
						<div
							style="background-color: rgb(250, 250, 252); width: 515px; padding: 20px 24px;">
							<div
								style="display: flex; flex-direction: row; align-items: center;">
								<p
									style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(56, 60, 72);">펫시터님
									답글</p>
								<p
									style="font-size: 13px; line-height: 19px; color: rgb(157, 164, 180); margin-left: 9px;">5일
									전</p>
							</div>
							<p
								style="font-size: 15px; line-height: 25px; color: rgb(85, 85, 85); margin-top: 12px;">저야말로
								큐랑 있으며 힐링 되었어여... 마음이 통하는 느낌..큐가 눈빛으로 소리로 하는 말을 다 알아 듣겠더라구여..어찌나
								신기했는지..똑똑하고 매너도 좋은 큐..누나랑 이모랑 잊지말고 또 만나자~^^♡</p>
						</div>
					</div>
				</div>

				<!-- 후기 글모음2 -->
				<div
					style="display: flex; flex-direction: column; border-top: 1px solid rgb(235, 235, 235); padding: 38px 0px;">
					<div
						style="display: flex; flex-direction: row; align-items: center;">
						<img width="50" height="50"
							src="https://d1cd60iwvuzqnn.cloudfront.net/pet/63cb96e20adb4b45b9e17dac57c9c4f1.jpg"
							style="object-fit: cover; border-radius: 50%;">
						<div style="margin-left: 18px;">
							<p
								style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(56, 60, 72);">임*정</p>
							<p
								style="font-size: 13px; line-height: 19px; color: rgb(76, 80, 86); margin-top: 6px;">2020년
								1월 9일</p>
						</div>
					</div>
					<p
						style="font-size: 15px; line-height: 25px; color: rgb(76, 80, 86); margin-top: 18px;">후기남기고
						그러는게 어색하리만큼 우리콩지는 그냥 이집딸이예요 ㅎㅎ 엄마아빠언니오빠 온식구가 너무너무 예뻐해주고 사랑해주니까
						자기집인줄안다니까요 ~ 아파트입구에서부터 기억하고는 집에 빨리들어갈라구 몸부림치면서 짖어대는데 어찌나
						서운하던지~^^;역시나 들어가자마자 엄마나왔어(꼭 이러는거같았어요 ㅋㅋ)</p>
					<div style="display: flex; flex-direction: row; margin-top: 33px;">
						<img width="90" height="90"
							src="https://d1cd60iwvuzqnn.cloudfront.net/resized/comment/ab671e14ddc24db6b8d0c53e2d9c6078.jpg"
							style="border-radius: 2px; object-fit: cover; margin-right: 9px; user-select: none; cursor: pointer;">
					</div>

					<!-- 댓글 -->
					<div
						style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 32px;">
						<img width="50" height="50"
							src="https://d1cd60iwvuzqnn.cloudfront.net/profile/be56da9b0c7744728f69074daf287d10.jpg"
							style="object-fit: cover; border-radius: 50%;">
						<div
							style="background-color: rgb(250, 250, 252); width: 515px; padding: 20px 24px;">
							<div
								style="display: flex; flex-direction: row; align-items: center;">
								<p
									style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(56, 60, 72);">펫시터님
									답글</p>
								<p
									style="font-size: 13px; line-height: 19px; color: rgb(157, 164, 180); margin-left: 9px;">5일
									전</p>
							</div>
							<p
								style="font-size: 15px; line-height: 25px; color: rgb(85, 85, 85); margin-top: 12px;">맞아여~콩지는
								저희 막내딸이어여~~언니 너무 좋아하지만 콩지는 저랑 항상 자는 저희 막내딸이에여..너무 사랑스러운 우리
								막내딸..고 귀여운 목소리 그립네여..건강하게 지내다 금방 만나장♡♡♡</p>
						</div>
					</div>
				</div>

				<!-- 후기 글모음3 -->
				<div
					style="display: flex; flex-direction: column; border-top: 1px solid rgb(235, 235, 235); padding: 38px 0px;">
					<div
						style="display: flex; flex-direction: row; align-items: center;">
						<img width="50" height="50"
							src="https://d1cd60iwvuzqnn.cloudfront.net/resized/pet/6bba9ed5e5434ec5b101b09606254614.jpg"
							style="object-fit: cover; border-radius: 50%;">
						<div style="margin-left: 18px;">
							<p
								style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(56, 60, 72);">이*람</p>
							<p
								style="font-size: 13px; line-height: 19px; color: rgb(76, 80, 86); margin-top: 6px;">2020년
								1월 3일</p>
						</div>
					</div>
					<p
						style="font-size: 15px; line-height: 25px; color: rgb(76, 80, 86); margin-top: 18px;">이번이
						벌써 3번째 펫시팅이었는데 역시나 너무 잘 돌봐주셔서 꼬야 너무 잘 있다왔어요 ^^ 일지도 자주 보내주시고 간식도 잘
						챙겨주셔서 있는동안 넘 잘지내다 온거 같아서 오히려 집에 오니 우울해 하네요ㅠㅠ 어디 갈때 맘놓고 맡길수 있는 곳이
						생겨서 너무 감사하고 고맙습니다 ^^ 다음에 또 펫시팅 할 계획있다면 망설임 없이 또 혜진 펫시터님깨 부탁드릴거 같아요
						너무 감사했습니다~~!!!</p>
					<div style="display: flex; flex-direction: row; margin-top: 33px;">
						<img width="90" height="90"
							src="https://d1cd60iwvuzqnn.cloudfront.net/resized/comment/84a8e94585b04324a6c047b39b4d213f.jpg"
							style="border-radius: 2px; object-fit: cover; margin-right: 9px; user-select: none; cursor: pointer;">
						<img width="90" height="90"
							src="https://d1cd60iwvuzqnn.cloudfront.net/resized/comment/be346e97d27248cab58922d8c8cc0323.jpg"
							style="border-radius: 2px; object-fit: cover; margin-right: 9px; user-select: none; cursor: pointer;">
					</div>

					<!-- 댓글 -->
					<div
						style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 32px;">
						<img width="50" height="50"
							src="https://d1cd60iwvuzqnn.cloudfront.net/profile/be56da9b0c7744728f69074daf287d10.jpg"
							style="object-fit: cover; border-radius: 50%;">
						<div
							style="background-color: rgb(250, 250, 252); width: 515px; padding: 20px 24px;">
							<div
								style="display: flex; flex-direction: row; align-items: center;">
								<p
									style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(56, 60, 72);">펫시터님
									답글</p>
								<p
									style="font-size: 13px; line-height: 19px; color: rgb(157, 164, 180); margin-left: 9px;">5일
									전</p>
							</div>
							<p
								style="font-size: 15px; line-height: 25px; color: rgb(85, 85, 85); margin-top: 12px;">꼬야랑
								산책하던 때가 너무 생각나네여.진짜 꼬야 때문에 많이 걷고 얼마나 상쾌한 기분이었는지~~ 몸도 마음도 너무 건강한
								꼬야..사랑도 많은 꼬야..건강하게 지내고 또 만나자~♡♡</p>
						</div>
					</div>
				</div>

				<div
					style="display: flex; align-items: center; justify-content: center; height: 50px; border-radius: 25px; border: 1px solid rgb(129, 137, 155); margin-bottom: 100px; user-select: none; cursor: pointer; margin-top: 12px;">
					<p
						style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: rgb(56, 60, 72);">펫시터
						후기 더보기</p>
				</div>
			</div>
		</div>
	</div>
	<div>
		<!-- 펫시터 예약 날짜선택 -->
		<div
			style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 32px; padding-right: 32px; padding-bottom: 32px">
			<p
				style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-top: 38px; font-weight: bold">언제
				펫시터가 필요한가요?</p>

			<div style="display: flex; flex-grow: 1; margin-top: 1em">

				<form action="index.html" method="get"
					class="tm-search-form tm-section-pad-2">
					<div class="form-group tm-form-element tm-form-element-50"
						style="width: 300px; right: 3em; bottom: 1em">
						<i class="fa fa-calendar fa-2x tm-form-element-icon"></i> <input
							name="check-in" type="text" class="form-control"
							id="inputCheckIn" placeholder="체크인" style="font-size: 1em">
					</div>
					<div class="form-group tm-form-element tm-form-element-50"
						style="width: 300px; right: 3em; top: 1em">
						<i class="fa fa-calendar fa-2x tm-form-element-icon"></i> <input
							name="check-out" type="text" class="form-control"
							id="inputCheckOut" placeholder="체크아웃" style="font-size: 1em">
					</div>
				</form>
			</div>

			<!-- 예약시간선택 -->
			<div
				style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 38px">
				<div style="width: 149px">
					<p
						style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-bottom: 18px">체크인
						시간</p>
					<select id="type" name="type" style="width: 8em">
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
					<div
						style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-bottom: 18px">
						<p
							style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47">체크아웃
							시간</p>
						<p
							style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4"></p>
					</div>

					<select id="type" name="type" style="width: 8em">
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

			<!-- 맡기는 반려동물 선택 -->
			<p
				style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-top: 38px; margin-bottom: 18px">맡기시는
				반려동물</p>
			<select id="pet" name="type" style="width: 20em">
				<option value="mypet">뭉치</option>
				<option value="mypet">댕댕이</option>
			</select>

			<div
				style="display: flex; align-items: center; justify-content: center; width: 311px; height: 59px; border-radius: 3px; background-color: #71A2FF; margin-top: 50px; user-select: none; cursor: pointer">
				<p
					style="font-family: Noto Sans KR; font-weight: 600; font-size: 15px; letter-spacing: 0.2px; line-height: 22px; color: white">예약
					요청</p>
			</div>
		</div>

		<!-- 이용요금소개 -->
		<div
			style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding: 38px 32px; margin-top: 38px">
			<div
				style="display: flex; flex-direction: row; align-items: center; justify-content: space-between">
				<p
					style="font-size: 17px; font-weight: 600; letter-spacing: -0.2px; line-height: 25px; color: #393C47">이용
					요금</p>
				<div style="display: flex; align-items: center; flex-direction: row">
					<div
						style="display: flex; flex-direction: row; align-items: center; margin-right: 8px">
						<p style="font-size: 13px; line-height: 18px; color: #383C48">1박
							케어</p>
						<div
							style="width: 1px; height: 15px; background-color: #ECEDF0; margin-left: 15px; margin-right: 15px"></div>
						<p style="font-size: 13px; line-height: 18px; color: #383C48">데이케어</p>
					</div>
				</div>
			</div>

			<div
				style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 31px">
				<div
					style="display: flex; flex-direction: row; align-items: center; height: 24px">
					<img width="24" height="24" src="images/price_pet_small.png"
						alt="소형견">
					<p
						style="font-size: 15px; line-height: 19px; color: #383C48; margin-left: 10px">소형견</p>
					<p
						style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 12px">7키로
						미만</p>
				</div>
				<div style="display: flex; flex-direction: row">
					<div
						style="display: flex; align-items: center; flex-direction: row">
						<p
							style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B; margin-right: 12px">40,000원</p>
						<p
							style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">35,000원</p>
					</div>
				</div>
			</div>

			<div
				style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 14px">
				<div
					style="display: flex; flex-direction: row; align-items: center; height: 24px">
					<img width="24" height="24" src="images/price_pet_medium.png"
						alt="중형견">
					<p
						style="font-size: 15px; line-height: 19px; color: #383C48; margin-left: 10px">중형견</p>
					<p
						style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 12px">7~14.9키로</p>
				</div>
				<div style="display: flex; flex-direction: row">
					<div
						style="display: flex; align-items: center; flex-direction: row">
						<p
							style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B; margin-right: 12px">50,000원</p>
						<p
							style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">40,000원</p>
					</div>
				</div>
			</div>

			<div
				style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-top: 14px">
				<div
					style="display: flex; flex-direction: row; align-items: center; height: 24px">
					<img width="24" height="24" src="images/price_pet_large_gray.png"
						alt="대형견">
					<p
						style="font-size: 15px; line-height: 19px; color: #383C48; margin-left: 10px">대형견</p>
					<p
						style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 12px">15키로
						이상</p>
				</div>
				<div style="display: flex; flex-direction: row">
					<div
						style="display: flex; align-items: center; width: 62px; flex-direction: column; margin-right: 12px">
						<p
							style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #999999">예약불가</p>
					</div>
					<div
						style="display: flex; flex-direction: column; align-items: center; width: 62px">
						<p
							style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #999999">예약불가</p>
					</div>
				</div>
			</div>
			<div
				style="width: 310px; height: 1px; background-color: #EBEBEB; margin: 32px 0"></div>
		</div>

		<div
			style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding: 38px; margin-top: 38px">
			<h2
				style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 24px">예약
				가능 날짜</h2>
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
		</div>

		<!-- 펫시터 위치 지도표시 -->
		<div
			style="display: flex; flex-direction: column; width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); margin-top: 38px; overflow: hidden">
			<div
				style="display: flex; flex-grow: 1; flex-direction: column; justify-content: center; margin-left: 38px; margin-right: 38px">
				<div
					style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 38px; margin-bottom: 34px">
					<p
						style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47">펫시터님
						위치</p>
					<div>
						<p
							style="font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #777777; width: 160px; font-family: Noto Sans KR, sans-serif; margin-top: 3px">서초구
							서초1동</p>
						<p
							style="font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #777777; width: 160px; margin-top: 5px">남부터미널역에서
							도보로 10분</p>
					</div>
				</div>
			</div>

			<div style="width: 373px; height: 270px;">
				<div style="height: 270px; position: relative; overflow: hidden;">
					<div
						style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; background-color: rgb(229, 227, 223);">
						<div class="gm-style"
							style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px;">
							<div tabindex="0"
								style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; cursor: url(&quot;https://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;), default; touch-action: pan-x pan-y;">
								<div
									style="z-index: 1; position: absolute; left: 50%; top: 50%; width: 100%; transform: translate(0px, 0px);">
									<div
										style="position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;">
										<div
											style="position: absolute; left: 0px; top: 0px; z-index: 0;">
											<div
												style="position: absolute; z-index: 984; transform: matrix(1, 0, 0, 1, -53, -130);">
												<div
													style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px;">
													<div style="width: 256px; height: 256px;"></div>
												</div>
												<div
													style="position: absolute; left: -256px; top: 0px; width: 256px; height: 256px;">
													<div style="width: 256px; height: 256px;"></div>
												</div>
												<div
													style="position: absolute; left: -256px; top: -256px; width: 256px; height: 256px;">
													<div style="width: 256px; height: 256px;"></div>
												</div>
												<div
													style="position: absolute; left: 0px; top: -256px; width: 256px; height: 256px;">
													<div style="width: 256px; height: 256px;"></div>
												</div>
												<div
													style="position: absolute; left: 0px; top: 256px; width: 256px; height: 256px;">
													<div style="width: 256px; height: 256px;"></div>
												</div>
												<div
													style="position: absolute; left: -256px; top: 256px; width: 256px; height: 256px;">
													<div style="width: 256px; height: 256px;"></div>
												</div>
											</div>
										</div>
									</div>
									<div
										style="position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div>
									<div
										style="position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div>
									<div
										style="position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"></div>
									<div
										style="position: absolute; left: 0px; top: 0px; z-index: 0;">
										<div
											style="position: absolute; z-index: 984; transform: matrix(1, 0, 0, 1, -53, -130);">
											<div
												style="position: absolute; left: 0px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
												<img draggable="false" alt="" role="presentation"
													src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i16!2i55891!3i25395!4i256!2m3!1e0!2sm!3i498211814!3m12!2sko!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!4e0&amp;key=AIzaSyA3yo2t9-MMvAKjgelaGSUk46KuFFGNAD4&amp;token=98579"
													style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
											</div>
											<div
												style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
												<img draggable="false" alt="" role="presentation"
													src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i16!2i55891!3i25396!4i256!2m3!1e0!2sm!3i498211814!3m12!2sko!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!4e0&amp;key=AIzaSyA3yo2t9-MMvAKjgelaGSUk46KuFFGNAD4&amp;token=103249"
													style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
											</div>
											<div
												style="position: absolute; left: 0px; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
												<img draggable="false" alt="" role="presentation"
													src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i16!2i55891!3i25397!4i256!2m3!1e0!2sm!3i498211754!3m12!2sko!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!4e0&amp;key=AIzaSyA3yo2t9-MMvAKjgelaGSUk46KuFFGNAD4&amp;token=55084"
													style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
											</div>
											<div
												style="position: absolute; left: -256px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
												<img draggable="false" alt="" role="presentation"
													src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i16!2i55890!3i25396!4i256!2m3!1e0!2sm!3i498211754!3m12!2sko!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!4e0&amp;key=AIzaSyA3yo2t9-MMvAKjgelaGSUk46KuFFGNAD4&amp;token=122058"
													style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
											</div>
											<div
												style="position: absolute; left: -256px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
												<img draggable="false" alt="" role="presentation"
													src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i16!2i55890!3i25395!4i256!2m3!1e0!2sm!3i498211754!3m12!2sko!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!4e0&amp;key=AIzaSyA3yo2t9-MMvAKjgelaGSUk46KuFFGNAD4&amp;token=117388"
													style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
											</div>
											<div
												style="position: absolute; left: -256px; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
												<img draggable="false" alt="" role="presentation"
													src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i16!2i55890!3i25397!4i256!2m3!1e0!2sm!3i498211754!3m12!2sko!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!4e0&amp;key=AIzaSyA3yo2t9-MMvAKjgelaGSUk46KuFFGNAD4&amp;token=126728"
													style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
											</div>
										</div>
									</div>
								</div>
								<div class="gm-style-pbc"
									style="z-index: 2; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; opacity: 0;">
									<p class="gm-style-pbt"></p>
								</div>
								<div
									style="z-index: 3; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; touch-action: pan-x pan-y;">
									<div
										style="z-index: 4; position: absolute; left: 50%; top: 50%; width: 100%; transform: translate(0px, 0px);">
										<div
											style="position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div>
										<div
											style="position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div>
										<div
											style="position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;">
											<div
												style="position: absolute; left: -74.9493px; top: -74.9003px;">
												<div
													style="width: 150px; height: 150px; border-radius: 50%; border: 1.5px solid rgba(0, 86, 255, 0.3); background-color: rgba(128, 171, 255, 0.3);"></div>
											</div>
										</div>
										<div
											style="position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;"></div>
									</div>
								</div>
							</div>
							<iframe aria-hidden="true" frameborder="0"
								style="z-index: -1; position: absolute; width: 100%; height: 100%; top: 0px; left: 0px; border: none;"></iframe>
							<div
								style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;">
								<a target="_blank" rel="noopener"
									href="https://maps.google.com/maps?ll=37.490079,127.019571&amp;z=16&amp;t=m&amp;hl=ko&amp;gl=US&amp;mapclient=apiv3"
									title="Google 지도에서 이 지역 열기(새 창으로 열림)"
									style="position: static; overflow: visible; float: none; display: inline;"><div
										style="width: 66px; height: 26px; cursor: pointer;">
										<img alt=""
											src="https://maps.gstatic.com/mapfiles/api-3/images/google4.png"
											draggable="false"
											style="position: absolute; left: 0px; top: 0px; width: 66px; height: 26px; user-select: none; border: 0px; padding: 0px; margin: 0px;">
									</div></a>
							</div>
							<div
								style="background-color: white; padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto, Arial, sans-serif; color: rgb(34, 34, 34); box-sizing: border-box; box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; z-index: 10000002; display: none; width: 300px; height: 180px; position: absolute; left: 37px; top: 45px;">
								<div
									style="padding: 0px 0px 10px; font-size: 16px; box-sizing: border-box;">지도
									데이터</div>
								<div style="font-size: 13px;">지도 데이터 ©2020 SK telecom</div>
								<button draggable="false" title="닫기" aria-label="닫기"
									type="button" class="gm-ui-hover-effect"
									style="background: none; display: block; border: 0px; margin: 0px; padding: 0px; position: absolute; cursor: pointer; user-select: none; top: 0px; right: 0px; width: 37px; height: 37px;">
									<img
										src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224px%22%20height%3D%2224px%22%20viewBox%3D%220%200%2024%2024%22%20fill%3D%22%23000000%22%3E%0A%20%20%20%20%3Cpath%20d%3D%22M19%206.41L17.59%205%2012%2010.59%206.41%205%205%206.41%2010.59%2012%205%2017.59%206.41%2019%2012%2013.41%2017.59%2019%2019%2017.59%2013.41%2012z%22%2F%3E%0A%20%20%20%20%3Cpath%20d%3D%22M0%200h24v24H0z%22%20fill%3D%22none%22%2F%3E%0A%3C%2Fsvg%3E%0A"
										style="pointer-events: none; display: block; width: 13px; height: 13px; margin: 12px;">
								</button>
							</div>
							<div class="gmnoprint"
								style="z-index: 1000001; position: absolute; right: 52px; bottom: 0px; width: 150px;">
								<div draggable="false" class="gm-style-cc"
									style="user-select: none; height: 14px; line-height: 14px;">
									<div
										style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
										<div style="width: 1px;"></div>
										<div
											style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div>
									</div>
									<div
										style="position: relative; padding-right: 6px; padding-left: 6px; box-sizing: border-box; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;">
										<a
											style="text-decoration: none; cursor: pointer; display: none;">지도
											데이터</a><span>지도 데이터 ©2020 SK telecom</span>
									</div>
								</div>
							</div>
							<div class="gmnoscreen"
								style="position: absolute; right: 0px; bottom: 0px;">
								<div
									style="font-family: Roboto, Arial, sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">지도
									데이터 ©2020 SK telecom</div>
							</div>
							<div class="gmnoprint gm-style-cc" draggable="false"
								style="z-index: 1000001; user-select: none; height: 14px; line-height: 14px; position: absolute; right: 0px; bottom: 0px;">
								<div
									style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
									<div style="width: 1px;"></div>
									<div
										style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div>
								</div>
								<div
									style="position: relative; padding-right: 6px; padding-left: 6px; box-sizing: border-box; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;">
									<a
										href="https://www.google.com/intl/ko_US/help/terms_maps.html"
										target="_blank" rel="noopener"
										style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);">이용약관</a>
								</div>
							</div>
							<button draggable="false" title="전체 화면보기로 전환"
								aria-label="전체 화면보기로 전환" type="button"
								class="gm-control-active gm-fullscreen-control"
								style="background: none rgb(255, 255, 255); border: 0px; margin: 10px; padding: 0px; position: absolute; cursor: pointer; user-select: none; border-radius: 2px; height: 40px; width: 40px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; overflow: hidden; display: none; top: 0px; right: 0px;">
								<img
									src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%20018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23666%22%20d%3D%22M0%2C0v2v4h2V2h4V0H2H0z%20M16%2C0h-4v2h4v4h2V2V0H16z%20M16%2C16h-4v2h4h2v-2v-4h-2V16z%20M2%2C12H0v4v2h2h4v-2H2V12z%22%2F%3E%0A%3C%2Fsvg%3E%0A"
									style="height: 18px; width: 18px;"><img
									src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23333%22%20d%3D%22M0%2C0v2v4h2V2h4V0H2H0z%20M16%2C0h-4v2h4v4h2V2V0H16z%20M16%2C16h-4v2h4h2v-2v-4h-2V16z%20M2%2C12H0v4v2h2h4v-2H2V12z%22%2F%3E%0A%3C%2Fsvg%3E%0A"
									style="height: 18px; width: 18px;"><img
									src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23111%22%20d%3D%22M0%2C0v2v4h2V2h4V0H2H0z%20M16%2C0h-4v2h4v4h2V2V0H16z%20M16%2C16h-4v2h4h2v-2v-4h-2V16z%20M2%2C12H0v4v2h2h4v-2H2V12z%22%2F%3E%0A%3C%2Fsvg%3E%0A"
									style="height: 18px; width: 18px;">
							</button>
							<div draggable="false" class="gm-style-cc"
								style="user-select: none; height: 14px; line-height: 14px; display: none; position: absolute; right: 0px; bottom: 0px;">
								<div
									style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
									<div style="width: 1px;"></div>
									<div
										style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div>
								</div>
								<div
									style="position: relative; padding-right: 6px; padding-left: 6px; box-sizing: border-box; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;">
									<a target="_blank" rel="noopener"
										title="Google에 도로 지도 또는 이미지 오류 신고"
										href="https://www.google.com/maps/@37.490079,127.019571,16z/data=!10m1!1e1!12b1?source=apiv3&amp;rapsrc=apiv3"
										style="font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;">지도
										오류 신고</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="js/datepicker.min.js"></script>

<script>
	const pickerCheckIn = datepicker('#inputCheckIn');
    const pickerCheckOut = datepicker('#inputCheckOut');
</script>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>