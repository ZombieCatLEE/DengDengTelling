<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
2020.02.12 호석 
-->
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-match-search.jspf"%>

<div style="height: auto; border-top: solid;">
	<!-- 선부분 -->

	<div style="height: auto">
	
		<!-- 모든펫시터 리스트 -->
		<div id="ttr_page" class="container">
			<div id="ttr_content_and_sidebar_container">
				<div id="ttr_content">
					<div id="ttr_content_margin" class="container-fluid" style="">
						<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<!-- 본문 큰 제목부분 : 펫시터 -->
						<div class="ttr_Training_html_row0 row">
							<div class="post_column col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="ttr_Training_html_column00">
									<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
									<div class="html_content" style="position: relative; margin-top: 50px; margin-bottom: 60px;">
										<p style="text-align: Center;">
										<c:choose>
											<c:when test="${resultComplete != null}">
												<c:choose>
													<c:when test="${NAME != null}">
														<span style="font-family: 'Arial'; font-weight: 700; font-size: 2em; color: rgba(5, 38, 55, 1);">
															${NAME} 님의 검색 조건과 일치하는 펫시터 목록입니다.</span>
													</c:when>
													<c:otherwise>
														<span style="font-family: 'Arial'; font-weight: 700; font-size: 2em; color: rgba(5, 38, 55, 1);">
															검색 조건과 일치하는 펫시터 목록입니다.</span>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${NAME != null}">
														<span style="font-family: 'Arial'; font-weight: 700; font-size: 2em; color: rgba(5, 38, 55, 1);">
															${NAME} 님의 검색 조건과 일치하는 펫시터가 없습니다.</span>
													</c:when>
													<c:otherwise>
														<span style="font-family: 'Arial'; font-weight: 700; font-size: 2em; color: rgba(5, 38, 55, 1);">
															검색 조건과 일치하는 펫시터가 없습니다.</span>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
										</p>
									</div>

								</div>
							</div>
						</div>

						<!-- 첫번째 펫시터 상세내용 -->
						<c:forEach var="list" items="${resultComplete}">	<!-- 이 부분에 디테일 링크 어디에 걸지 생각해보자. 링크는 get 방식으로 넘겨서 이동하는 걸로. detail method 그대로 사용 -->
						<div class="ttr_Training_html_row1 row"
							style="position: relative; margin-top: 1em; margin-bottom: 1em; ">
							<!-- 첫번째 시터 이미지 -->
							<div class="post_column col-lg-4 col-md-4 col-sm-4 col-xs-12">
								<div class="ttr_Training_html_column10">
									<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
									<div class="html_content" style="position:relative; right:5em;">
										<p>
											<span style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 0em 0em; cursor: pointer;" onclick="location.href='matchDetailGo?seq=${list.MATCH_NO}&&ID=${list.PSMEM_ID}'">
												<span><img src="resources/downimage/<c:out value='${list.MATCH_PLACE_IMAGE}'/>" style="max-width: 300px; max-height: 300px;"/></span></span>
										</p>
									</div>
									<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
									<div style="clear: both;"></div>
								</div>
							</div>

							<!-- 첫번째 시터 상세내용 -->
							<div class="post_column col-lg-8 col-md-8 col-sm-8 col-xs-12">
								<div class="ttr_Training_html_column11">
									<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
									<div class="html_content" style="position:relative; right:5em; margin-top: 15px;">
										<div style="position: relative; align-items: center; text-align: center; vertical-align: middle; width: 550px;">
											<p>
												<span style="font-family: 'Arial'; font-weight: 700; font-size: 1.143em; color: #6E6E6E; position: relative;">
													<c:out value="${list.PSMEM_ADDRESS1}"/></span>
											</p>
											<p style="margin: 1em 0em 1em 0em;">
													<span style="font-family: 'Arial'; font-weight: bold; font-size: 2em; color: #2E2E2E; cursor: pointer;" onclick="location.href='matchDetailGo?seq=${list.MATCH_NO}&&ID=${list.PSMEM_ID}'">
														<c:out value="${list.MATCH_SUBJECT}"/></span>
											</p>
											<p style="margin: 0.71em 0em 0.36em 0em;">
													<span style="font-family: 'Arial'; font-weight: bold; font-size: 1.5em; color: #2E2E2E;">
														<c:out value="${list.PSMEM_CLASS}"/>&nbsp;펫시터&nbsp;<c:out value="${list.PSMEM_NAME}"/>&nbsp;님</span>
											</p>
											<p style="margin: 1.43em 0em 0.36em 0em; line-height: 1.76056338028169;">
												<c:forEach var="service" items="<c:out value='${list.POSSIBLE_SERVICE}'/>" end="6">
													<c:if test="${service == 'service01'}">
														<span style="color: rgba(5, 38, 55, 1);">#현재 반려동물 없음&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service02'}">
														<span style="color: rgba(5, 38, 55, 1);">#집 앞 픽업 가능&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service03'}">
														<span style="color: rgba(5, 38, 55, 1);">#대형견 예약 가능&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service04'}">
														<span style="color: rgba(5, 38, 55, 1);">#뛰어놀 마당 보유&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service05'}">
														<span style="color: rgba(5, 38, 55, 1);">#노견 집중 케어 가능&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service06'}">
														<span style="color: rgba(5, 38, 55, 1);">#14일 이상 돌봄 가능&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service07'}">
														<span style="color: rgba(5, 38, 55, 1);">#편한 실내 놀이 가능&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service08'}">
														<span style="color: rgba(5, 38, 55, 1);">#매일 근처 산책 가능&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service09'}">
														<span style="color: rgba(5, 38, 55, 1);">#댕댕이 목욕 가능&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service10'}">
														<span style="color: rgba(5, 38, 55, 1);">#약물 먹이기 가능&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service11'}">
														<span style="color: rgba(5, 38, 55, 1);">#어린 댕댕 집중 관리&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service12'}">
														<span style="color: rgba(5, 38, 55, 1);">#아파트 거주 중&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service13'}">
														<span style="color: rgba(5, 38, 55, 1);">#빌라 거주 중&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service14'}">
														<span style="color: rgba(5, 38, 55, 1);">#단독 주택 거주 중&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service15'}">
														<span style="color: rgba(5, 38, 55, 1);">#집중 케어가 가능해요&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service16'}">
														<span style="color: rgba(5, 38, 55, 1);">#집중 케어가 가능해요&nbsp;</span>
													</c:if>
													<c:if test="${service == 'service17'}">
														<span style="color: rgba(5, 38, 55, 1);">#댕댕 등록 대행 가능</span>
													</c:if>
												</c:forEach>
											</p>
										</div>
										<div style="position: relative; left:8em; bottom: 8em;">
											<p style="margin-top: 10px; margin-bottom:5px; text-align: right">
												<b>대형견</b> : &nbsp;<span style="font-size: 1.2em; font-weight: bold; color: #084B8A;"><c:out value="${list.PRICE_LARGE_ALL}"/></span>&nbsp;/&nbsp;맡김&nbsp;&nbsp;|&nbsp;&nbsp;
												<span style="font-size: 1.2em; font-weight: bold; color: #084B8A;"><c:out value="${list.PRICE_LARGE_HALF}"/></span>&nbsp;/&nbsp;돌봄
											</p>
											<p style="margin-top: 10px; margin-bottom:5px; text-align: right">
												<b>중형견</b> : &nbsp;<span style="font-size: 1.2em; font-weight: bold; color: #084B8A;"><c:out value="${list.PRICE_MEDIUM_ALL}"/></span>&nbsp;/&nbsp;맡김&nbsp;&nbsp;|&nbsp;&nbsp;
												<span style="font-size: 1.2em; font-weight: bold; color: #084B8A;"><c:out value="${list.PRICE_MEDIUM_ALL}"/></span>&nbsp;/&nbsp;돌봄
											</p>
											<p style="margin-top: 10px; margin-bottom:5px; text-align: right">
												<b>소형견</b> : &nbsp;<span style="font-size: 1.2em; font-weight: bold; color: #084B8A;"><c:out value="${list.PRICE_SMALL_ALL}"/></span>&nbsp;/&nbsp;맡김&nbsp;&nbsp;|&nbsp;&nbsp;
												<span style="font-size: 1.2em; font-weight: bold; color: #084B8A;"><c:out value="${list.PRICE_SMALL_ALL}"/></span>&nbsp;/&nbsp;돌봄
											</p>
										</div>
									</div>
									<div
										style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
									<div style="clear: both;"></div>
								</div>
							</div>
						</div>
						</c:forEach>
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