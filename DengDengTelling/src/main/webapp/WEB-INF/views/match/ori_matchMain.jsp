<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-match-search.jspf"%>

<script type="text/javascript">
	function insertForm() {
		var form = document.match;

		form.action = "/matchInsertForm";
		form.submit();
	}
</script>
<form id="match" name="match" method="POST">
	<div style="height: auto; border-top: solid;">
		<!-- 선부분 -->

		<div style="height: auto">

			<!-- 모든펫시터 리스트 -->
			<div style="text-align: center; margin-top: 5em">
				<span style="font-weight: bold; font-size: 2em;">모든 펫시터를
					만나보세요</span>
			</div>
			<div class="form-group tm-form-element tm-form-element-2"
				style="position: relative; left: 104em; margin-top: 2em">
				<button type="submit" class="btn btn-primary1 tm-btn-search"
					style="font-size: 1em">전체보기</button>
			</div>

			<div class="ttr_Services_html_row3 row" style="margin-top: 1em">
				<div class="post_column col-lg-3 col-md-6 col-sm-6 col-xs-12">
					<div class="ttr_Services_html_column30">
						<div
							style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div class="html_content">
							<p style="text-align: Center;">
								<span class="ttr_image"
									style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 1.43em 0em;"><span><img
										class="ttr_uniform" src="images/sitter1.jpg"
										style="width: 250px; height: 150px;" /></span></span><span
									style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(78, 78, 78, 1);">서울시
									서초구 서초동</span>
							</p>
							<p
								style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
								<span style="color: rgba(5, 38, 55, 1);">정성을 다해 돌보아드려요!</span>
							</p>
							<p
								style="margin: 0.71em 0em 0.36em 7em; text-align: Center; line-height: 1.76056338028169;">
								<span class='star-rating'>★★★★★(20)</span>
						</div>
						<div
							style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div style="clear: both;"></div>
					</div>
				</div>

				<div class="post_column col-lg-3 col-md-6 col-sm-6 col-xs-12">
					<div class="ttr_Services_html_column31">
						<div
							style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div class="html_content">
							<p style="text-align: Center;">
								<span class="ttr_image"
									style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 1.43em 0em;"><span><img
										class="ttr_uniform" src="images/sitter2.JPG"
										style="width: 250px; height: 150px" /></span></span><span
									style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(78, 78, 78, 1);">서울시
									강남구 논현동</span>
							</p>
							<p
								style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
								<span style="color: rgba(5, 38, 55, 1);">24시간 밀착케어해드려요!</span>
							</p>
							<p
								style="margin: 0.71em 0em 0.36em 7em; text-align: Center; line-height: 1.76056338028169;">
								<span class='star-rating'>★★★★★(20)</span>
						</div>
						<div
							style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div style="clear: both;"></div>
					</div>
				</div>
				<div class="post_column col-lg-3 col-md-6 col-sm-6 col-xs-12">
					<div class="ttr_Services_html_column31">
						<div
							style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div class="html_content">
							<p style="text-align: Center;">
								<span class="ttr_image"
									style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 1.43em 0em;"><span><img
										class="ttr_uniform" src="images/sitter3.jpg"
										style="width: 250px; height: 150px" /></span></span><span
									style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(78, 78, 78, 1);">서울시
									강남구 대치3동</span>
							</p>
							<p
								style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
								<span style="color: rgba(5, 38, 55, 1);">자식같이 보살핍니다^^</span>
							</p>
							<p
								style="margin: 0.71em 0em 0.36em 7em; text-align: Center; line-height: 1.76056338028169;">
								<span class='star-rating'>★★★★★(20)</span>
						</div>
						<div
							style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div style="clear: both;"></div>
					</div>
				</div>
				<div class="post_column col-lg-3 col-md-6 col-sm-6 col-xs-12">
					<div class="ttr_Services_html_column31">
						<div
							style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div class="html_content">
							<p style="text-align: Center;">
								<span class="ttr_image"
									style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 1.43em 0em;"><span><img
										class="ttr_uniform" src="images/sitter4.jpg"
										style="width: 250px; height: 150px" /></span></span><span
									style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(78, 78, 78, 1);">서울시
									서초구 양재동</span>
							</p>
							<p
								style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
								<span style="color: rgba(5, 38, 55, 1);">행복이 가득한집으로 맡겨주세요</span>
							</p>
							<p
								style="margin: 0.71em 0em 0.36em 7em; text-align: Center; line-height: 1.76056338028169;">
								<span class='star-rating'>★★★★★(20)</span>
						</div>
						<div
							style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div style="clear: both;"></div>
					</div>
				</div>
			</div>
		</div>

		<!-- 프로펫시터 리스트 -->
		<div style="text-align: center; margin-top: 5em">
			<span style="font-weight: bold; font-size: 2em;">평점이 높은 펫시터를
				만나보시겠어요?</span>
		</div>
		<div class="form-group tm-form-element tm-form-element-2"
			style="position: relative; left: 104em; margin-top: 2em">
			<button type="submit" class="btn btn-primary1 tm-btn-search"
				style="font-size: 1em">전체보기</button>
		</div>

		<div class="ttr_Services_html_row3 row" style="margin-top: 1em">
			<div class="post_column col-lg-3 col-md-6 col-sm-6 col-xs-12">
				<div class="ttr_Services_html_column30">
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div class="html_content">
						<p style="text-align: Center;">
							<span class="ttr_image"
								style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 1.43em 0em;"><span><img
									class="ttr_uniform" src="images/sitter1.jpg"
									style="width: 250px; height: 150px;" /></span></span><span
								style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(78, 78, 78, 1);">서울시
								서초구 서초동</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
							<span style="color: rgba(5, 38, 55, 1);">정성을 다해 돌보아드려요!</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 7em; text-align: Center; line-height: 1.76056338028169;">
							<span class='star-rating'>★★★★★(20)</span>
					</div>
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div style="clear: both;"></div>
				</div>
			</div>

			<div class="post_column col-lg-3 col-md-6 col-sm-6 col-xs-12">
				<div class="ttr_Services_html_column31">
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div class="html_content">
						<p style="text-align: Center;">
							<span class="ttr_image"
								style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 1.43em 0em;"><span><img
									class="ttr_uniform" src="images/sitter2.JPG"
									style="width: 250px; height: 150px" /></span></span><span
								style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(78, 78, 78, 1);">서울시
								강남구 논현동</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
							<span style="color: rgba(5, 38, 55, 1);">24시간 밀착케어해드려요!</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 7em; text-align: Center; line-height: 1.76056338028169;">
							<span class='star-rating'>★★★★★(20)</span>
					</div>
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div style="clear: both;"></div>
				</div>
			</div>
			<div class="post_column col-lg-3 col-md-6 col-sm-6 col-xs-12">
				<div class="ttr_Services_html_column31">
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div class="html_content">
						<p style="text-align: Center;">
							<span class="ttr_image"
								style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 1.43em 0em;"><span><img
									class="ttr_uniform" src="images/sitter3.jpg"
									style="width: 250px; height: 150px" /></span></span><span
								style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(78, 78, 78, 1);">서울시
								강남구 대치3동</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
							<span style="color: rgba(5, 38, 55, 1);">자식같이 보살핍니다^^</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 7em; text-align: Center; line-height: 1.76056338028169;">
							<span class='star-rating'>★★★★★(20)</span>
					</div>
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div style="clear: both;"></div>
				</div>
			</div>
			<div class="post_column col-lg-3 col-md-6 col-sm-6 col-xs-12">
				<div class="ttr_Services_html_column31">
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div class="html_content">
						<p style="text-align: Center;">
							<span class="ttr_image"
								style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 1.43em 0em;"><span><img
									class="ttr_uniform" src="images/sitter4.jpg"
									style="width: 250px; height: 150px" /></span></span><span
								style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(78, 78, 78, 1);">서울시
								서초구 양재동</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
							<span style="color: rgba(5, 38, 55, 1);">행복이 가득한집으로 맡겨주세요</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 7em; text-align: Center; line-height: 1.76056338028169;">
							<span class='star-rating'>★★★★★(20)</span>
					</div>
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>

		<!-- 신규펫시터 리스트 -->
		<div style="text-align: center; margin-top: 5em">
			<span style="font-weight: bold; font-size: 2em;">신규펫시터를 할인된
				가격으로 만나보세요.</span>
		</div>
		<div class="form-group tm-form-element tm-form-element-2"
			style="position: relative; left: 104em; margin-top: 2em">
			<button type="submit" class="btn btn-primary1 tm-btn-search"
				style="font-size: 1em">전체보기</button>
		</div>

		<div class="ttr_Services_html_row3 row" style="margin-top: 1em">
			<div class="post_column col-lg-3 col-md-6 col-sm-6 col-xs-12">
				<div class="ttr_Services_html_column30">
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div class="html_content">
						<p style="text-align: Center;">
							<span class="ttr_image"
								style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 1.43em 0em;"><span><img
									class="ttr_uniform" src="images/sitter1.jpg"
									style="width: 250px; height: 150px;" /></span></span><span
								style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(78, 78, 78, 1);">서울시
								서초구 서초동</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
							<span style="color: rgba(5, 38, 55, 1);">정성을 다해 돌보아드려요!</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 7em; text-align: Center; line-height: 1.76056338028169;">
							<span class='star-rating'>★★★★★(20)</span>
					</div>
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div style="clear: both;"></div>
				</div>
			</div>

			<div class="post_column col-lg-3 col-md-6 col-sm-6 col-xs-12">
				<div class="ttr_Services_html_column31">
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div class="html_content">
						<p style="text-align: Center;">
							<span class="ttr_image"
								style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 1.43em 0em;"><span><img
									class="ttr_uniform" src="images/sitter2.JPG"
									style="width: 250px; height: 150px" /></span></span><span
								style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(78, 78, 78, 1);">서울시
								강남구 논현동</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
							<span style="color: rgba(5, 38, 55, 1);">24시간 밀착케어해드려요!</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 7em; text-align: Center; line-height: 1.76056338028169;">
							<span class='star-rating'>★★★★★(20)</span>
					</div>
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div style="clear: both;"></div>
				</div>
			</div>
			<div class="post_column col-lg-3 col-md-6 col-sm-6 col-xs-12">
				<div class="ttr_Services_html_column31">
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div class="html_content">
						<p style="text-align: Center;">
							<span class="ttr_image"
								style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 1.43em 0em;"><span><img
									class="ttr_uniform" src="images/sitter3.jpg"
									style="width: 250px; height: 150px" /></span></span><span
								style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(78, 78, 78, 1);">서울시
								강남구 대치3동</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
							<span style="color: rgba(5, 38, 55, 1);">자식같이 보살핍니다^^</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 7em; text-align: Center; line-height: 1.76056338028169;">
							<span class='star-rating'>★★★★★(20)</span>
					</div>
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div style="clear: both;"></div>
				</div>
			</div>
			<div class="post_column col-lg-3 col-md-6 col-sm-6 col-xs-12">
				<div class="ttr_Services_html_column31">
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div class="html_content">
						<p style="text-align: Center;">
							<span class="ttr_image"
								style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 1.43em 0em;"><span><img
									class="ttr_uniform" src="images/sitter4.jpg"
									style="width: 250px; height: 150px" /></span></span><span
								style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(78, 78, 78, 1);">서울시
								서초구 양재동</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
							<span style="color: rgba(5, 38, 55, 1);">행복이 가득한집으로 맡겨주세요</span>
						</p>
						<p
							style="margin: 0.71em 0em 0.36em 7em; text-align: Center; line-height: 1.76056338028169;">
							<span class='star-rating'>★★★★★(20)</span>
					</div>
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div style="clear: both;"></div>
				</div>
			</div>
			<div>
				<button style="height: 2em; width: 10em;" id="insrtMtch"
					name="insrtMtch" onclick="insertForm()">매칭 등록</button>
			</div>
		</div>
	</div>
</form>
<script src="js/datepicker.min.js"></script>

<script>
	const pickerCheckIn = datepicker('#inputCheckIn');
    const pickerCheckOut = datepicker('#inputCheckOut');
</script>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>