<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
2020.02.13 호석 
-->
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-match-search.jspf"%>

<script type="text/javascript">
	function insertForm() {
		var form = document.matchMain;

		form.action = "/matchInsertForm";
		form.submit();
	}
	
	function modifyForm() {
		var form = document.matchMain;

		form.action = "/matchModifyForm";
		form.submit();
	}
	
</script>
<form id="matchMain" name="matchMain" method="POST">
	<c:if test="${msg != null}">
		<script type="text/javascript">
			alert("매칭 정보가 수정되었습니다.");
		</script>
	</c:if>
	
	<div style="height: auto; border-top: solid;">
		<!-- 선부분 -->
		<div style="height: auto">

			<!-- 모든펫시터 리스트 -->
			<div style="text-align: center; margin-top: 5em">
				<span style="font-weight: bold; font-size: 2em;">모든 펫시터를 만나보세요!</span>
			</div>
			<div class="form-group tm-form-element tm-form-element-2" style="position: relative; align-items: right; text-align: right; margin-top: 1em">
				<button type="button" class="btn btn-primary1 tm-btn-search" style="font-size: 1em" onclick="location.href='matchAddList?num=1'">전체보기</button>	<!-- 이 부분에 모든 매칭 리스트 뽑아오는 쿼리 -->
			</div><!-- 각 버튼은 검색 결과 페이지로 넘어가는데, 리스트를 모두 다 가져온다. 그리고 페이징 해야지! -->
			
			<div class="ttr_Services_html_row3 row" style="margin-top: 2em">
				<c:forEach var="all" items="${allList}" end="4">
				<div style="position: relative; text-align: center; cursor: pointer;" onclick="location.href='matchDetailGo?seq=${all.MATCH_NO}&&ID=${all.ID}'">
					<div style="float: left; position: relative; text-align: center; width: 18%; margin-left: 1.5%">
						<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div class="html_content">
							<p style="text-align: Center;">
								<span class="ttr_image" style="float: none; display: block; text-align: center; overflow: hidden; margin-bottom: 10px;"><span>
									<img class="ttr_uniform" src="resources/downimage/<c:out value='${all.IMAGE}'/>" style="width: 250px; height: 150px;" /></span></span>
									<span style="color: #6E6E6E;"><b><c:out value="${all.ADDRESS}"/></b></span>
							</p>
							<p style="margin-top: 10px; margin-bottom: 10px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
								<span style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(5, 38, 55, 1); display: block; height: 35px; text-align: center;"><c:out value="${all.SUBJECT}"/></span>
							</p>
							<p style="margin-top: 5px; margin-bottom: 2px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
								<span style="color: #DBA901;"><b><c:out value="${all.CLASS}"/></b></span> <font color="#FA5882"><b>펫시터</b></font>&nbsp;&nbsp;&nbsp;<span style="color: #000000;"><c:out value="${all.NAME}"/></span>&nbsp;님</p>
							<p style="margin-top: 2px; margin-bottom: 5px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
								<span style="color: gray; font-size: 11px;"><c:out value="${all.COUNT}"/>회의 펫시팅 경험이 있습니다.</span></p>	
						</div>
						<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div style="clear: both;"></div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>

		<!-- 프로펫시터 리스트 -->
		<div style="text-align: center; margin-top: 5em">
			<span style="font-weight: bold; font-size: 2em;">프로 펫시터를 만나보시겠어요?</span>
		</div>
		<div class="form-group tm-form-element tm-form-element-2" style="position: relative; align-items: right; text-align: right; margin-top: 1em">
			<button type="button" class="btn btn-primary1 tm-btn-search" style="font-size: 1em" onclick="location.href='matchAddList?num=2'">전체보기</button> <!-- 이 부분에 프로 펫시터 모든 목록 뽑아와야 함 -->
		</div>
		
		<div class="ttr_Services_html_row3 row" style="margin-top: 2em">
			<c:forEach var="pro" items="${proList}" end="4">
			<div style="position: relative; text-align: center; cursor: pointer;" onclick="location.href='matchDetailGo?seq=${pro.MATCH_NO}&&ID=${pro.ID}'">
				<div style="float: left; position: relative; text-align: center; width: 18%; margin-left: 1.5%">
					<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div class="html_content">
						<p style="text-align: Center;">
							<span class="ttr_image" style="float: none; display: block; text-align: center; overflow: hidden; margin-bottom: 10px;"><span>
								<img class="ttr_uniform" src="resources/downimage/<c:out value='${pro.IMAGE}'/>" style="width: 250px; height: 150px;" /></span></span>
								<span style="color: #6E6E6E;"><b><c:out value="${pro.ADDRESS}"/></b></span>
						</p>
						<p style="margin-top: 10px; margin-bottom: 10px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
							<span style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(5, 38, 55, 1); display: block; height: 35px; text-align: center;"><c:out value="${pro.SUBJECT}"/></span>
						</p>
						<p style="margin-top: 5px; margin-bottom: 2px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
							<span style="color: #DBA901;"><b><c:out value="${pro.CLASS}"/></b></span> <font color="#FA5882"><b>펫시터</b></font>&nbsp;&nbsp;&nbsp;<span style="color: #000000;"><c:out value="${pro.NAME}"/></span>&nbsp;님</p>
						<p style="margin-top: 2px; margin-bottom: 5px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
							<span style="color: gray; font-size: 11px;"><c:out value="${pro.COUNT}"/>회의 펫시팅 경험이 있습니다.</span></p>	
					</div>
					<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div style="clear: both;"></div>
				</div>
			</div>
			</c:forEach>
		</div>

		<!-- 신규펫시터 리스트 -->
		<div style="text-align: center; margin-top: 5em">
			<span style="font-weight: bold; font-size: 2em;">신규 펫시터를 할인된 가격으로 만나보세요.</span>
		</div>
		<div class="form-group tm-form-element tm-form-element-2" style="position: relative; align-items: right; text-align: right; margin-top: 1em">
			<button type="button" class="btn btn-primary1 tm-btn-search" style="font-size: 1em" onclick="location.href='matchAddList?num=3'">전체보기</button>
		</div>

		<div class="ttr_Services_html_row3 row" style="margin-top: 2em; margin-bottom: 100px;">
			<c:forEach var="nlt" items="${newList}" end="4">
			<div style="position: relative; text-align: center; cursor: pointer;" onclick="location.href='matchDetailGo?seq=${nlt.MATCH_NO}&&ID=${nlt.ID}'">
				<div style="float: left; position: relative; text-align: center; width: 18%; margin-left: 1.5%">
					<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div class="html_content">
						<p style="text-align: Center;">
							<span class="ttr_image" style="float: none; display: block; text-align: center; overflow: hidden; margin-bottom: 10px;"><span>
								<img class="ttr_uniform" src="resources/downimage/<c:out value='${nlt.IMAGE}'/>" style="width: 250px; height: 150px;" /></span></span>
								<span style="color: #6E6E6E;"><b><c:out value="${nlt.ADDRESS}"/></b></span>
						</p>
						<p style="margin-top: 10px; margin-bottom: 10px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
							<span style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(5, 38, 55, 1); display: block; height: 35px; text-align: center;"><c:out value="${nlt.SUBJECT}"/></span>
						</p>
						<p style="margin-top: 5px; margin-bottom: 2px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
							<span style="color: #DBA901;"><b><c:out value="${nlt.CLASS}"/></b></span> <font color="#FA5882"><b>펫시터</b></font>&nbsp;&nbsp;&nbsp;<span style="color: #000000;"><c:out value="${nlt.NAME}"/></span>&nbsp;님</p>
						<p style="margin-top: 2px; margin-bottom: 5px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
							<span style="color: gray; font-size: 11px;"><c:out value="${nlt.COUNT}"/>회의 펫시팅 경험이 있습니다.</span></p>	
					</div>
					<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div style="clear: both;"></div>
				</div>
			</div>
			</c:forEach>
		</div>
			<!-- 아래는 버튼, 이 부분은 조건을 넣어야 함. 일반인지 펫시터인지. -->
		<c:choose>
			<c:when test="${MEM_TYPE == '펫시터'}">
				<div style="text-align: center; margin-top: 5em">
					<span style="font-weight: bold; font-size: 1.8em; margin-bottom: 15px;">펫시터님! 매칭 등록은 하셨나요?</span>
					<br/>
					<p style="color:#BDBDBD; margin-top: 15px;">매칭 등록을 완료하셔야 매칭 서비스에 노출이 됩니다.</p>
				</div>
				<div style="display: block; height: 150px; width: auto; position: relative; text-align: center; vertical-align: middle; margin-bottom: 15px;">
					<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
						<div style="height: 30px; width: 30%; margin-top: 45px; margin-left: 50px; margin-right: 50px; text-align: center; position: relative; vertical-align: middle;">
							<button style="height: 50px; width: 200px; font-size: 25px; font: bold; background-color: #FFBF00; border: none; color:#fff; cursor: pointer; border-radius: 10px;" onclick="insertForm()">매칭 등록</button>
						</div>
					</div>
					<div style="display: inline-block; height: auto; width: auto; text-align: center; position: relative; vertical-align: middle;">
						<div style="height: 30px; width: 30%; margin-top: 45px; margin-left: 50px; margin-right: 50px; text-align: center; position: relative; vertical-align: middle;">
							<button style="height: 50px; width: 200px; font-size: 25px; font: bold; background-color: #FFBF00; border: none; color:#fff; cursor: pointer; border-radius: 10px;" onclick="modifyForm()">매칭 수정</button>
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
	</div>
</form>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>