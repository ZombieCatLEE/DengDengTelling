<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%
	String pageChoice = request.getParameter("num");
%>

<!-- 버튼 클릭시,
일반 회원 가입 버튼이면 다음 페이지에 [1]깂을 전송
펫시터 회원 가입 버튼이면 다음페이지에 [2]값을 전송
다음페이지에서 받는 값에 따라 일반페이지로 갈지, 펫시터 페이지로 갈지 나눠짐 -->

<div id="ttr_content_and_sidebar_container" style="margin-bottom: 150px;">
	<div id="ttr_content">
		<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
		<div class="ttr_About_html_row0 row">
			<div class="post_column col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<p style="text-align: Center;">
					<span style="font-family: 'Arial'; font-weight: 700; font-size: 2em; color: rgba(5, 38, 55, 1);">
						댕댕텔링 회원가입</span>
				</p>
			</div>
		</div>

		<div id="ttr_About_html_row3 row">
			<div align="center">
				<!-- 일반회원가입 버튼 -->
				<div style="position: relative; right: 15em; top: 10em; width:10em">
					<img src="resources/images/mem_img.png" style=" width:5em; position: relative; left: 0.8em;">
					<p style="margin: 1.43em 0em 0em 0em; line-height: 1.76056338028169;">
						<span>
							<a href="memJoinAgree" target="_self" class="btn btn-lg btn-primary">
								<input type="hidden" id="joinType" name="joinType" value="1">일반회원 가입</a>
						</span>
					</p>
				</div>
			</div>

			<div align="center">
				<div style="position: relative; left: 13em; top:0.5em; width:10em ">
						<img src="resources/images/pst_img.PNG" style=" width:5em; position: relative; left: 0.8em;">
					<p style="margin: 1.43em 0em 0em 0em; line-height: 1.76056338028169;">
						<span>
							<a HREF="pstJoinAgree" target="_self" class="btn btn-lg btn-primary">
								<input type="hidden" id="joinType" name="joinType" value="2">펫시터 회원가입</a>
						</span>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>