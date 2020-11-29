<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-admin-menu.jspf"%>

<!-- My page Bar -->
			<div class="menu-center collapse navbar-collapse"
				style="margin-left: 3em;">
				<ul class="ttr_menu_items nav navbar-nav ">
					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 8em; height: 3em;"><a
						href="/adminMain" class="ttr_menu_items_parent_link"
						style="position: relative; right: 2em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>회원 관리</a>
						<hr class="horiz_separator" /></li>
					<li class="ttr_menu_items_parent dropdown active"
						style="border-style: inset; width: 7em; height: 3em;"><a
						href="/adminMatch" class="ttr_menu_items_parent_link_active"
						style="position: relative; right: 2.8em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>매칭관리</a>
						<hr class="horiz_separator" /></li>
					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 7em; height: 3em;"><a
						href="/adminBoard"
						class="ttr_menu_items_parent_link"
						style="position: relative; right: 2.8em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>게시판 관리</a>
						<hr class="horiz_separator" /></li>
					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 7em; height: 3em;"><a
						href="/adminServer" class="ttr_menu_items_parent_link"
						style="position: relative; right: 2.8em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>서버 관리</a>
						<hr class="horiz_separator" /></li>
				</ul>
			</div>



<!-- 매칭 정보 -->
	<div style="height: 850px; border-top: solid;">
		<div style="text-align: center; margin-top: 2em; position: relative; right:28em">
			<span style="font-weight: bold; font-size: 1.5em;">매칭 관리</span>
		</div>
		<div align="center" style="margin-top: 1em;">
			<div style="position: relative; left: 30em; border: solid; width:28em; height: 2.4em; border-radius: 12px">			
				<span style="margin-right: 0.7em; line-height: 200%">예약 신청</span>
				<span style="margin-right: 0.7em;">예약 완료</span>
				<span style="margin-right: 0.7em;">진행 대기</span>
				<span style="margin-right: 0.7em;">진행 중</span>
				<span style="margin-right: 0.7em;">진행 종료</span>		
			</div>
		</div>

		<!-- 매칭 리스트 -->
		<div align="center" style="margin-top: 1em; margin-bottom: 2em">
			<table
				style="width: 80em; height: 40em; text-align: center; border-style: solid;">
				<tr class="title">
					<th scope="row" style="width: 3em; height: 3em">번호</th>
					<th style="width: 18em">제목</th>
					<th style="width: 18em">지역</th>
					<th style="width: 4.5em">펫시터</th>
					<th style="width: 7em">등급</th>
					<th style="width: 4.5em">회원</th>
					<th style="width: 15em">일정</th>
					<th style="width: 8em">반려동물 수</th>
					<th style="width: 5em">금액</th>
					<th style="width: 6em">진행 단계</th>
					<th style="width: 6em">입금 여부</th>
				</tr>
				<tr class="t_col">
					<td>1</td>
					<td>믿고 맡겨 주세요!</td>
					<td>서울 영등포구 당산동</td>
					<td>오*호</td>
					<td>프로펫시터</td>
					<td>신*연</td>
					<td>20/01/28 ~ 20/01/30</td>
					<td>2</td>
					<td>150,000</td>
					<td>예약 완료</td>
					<td>대기</td>
				</tr>
				<tr class="tt_col">
					<td>2</td>
					<td>믿고 맡겨 주세요!</td>
					<td>서울 영등포구 당산동</td>
					<td>오*호</td>
					<td>프로펫시터</td>
					<td>신*연</td>
					<td>20/01/28 ~ 20/01/30</td>
					<td>2</td>
					<td>150,000</td>
					<td>예약 완료</td>
					<td>대기</td>
				</tr>
				<tr class="t_col">
					<td>3</td>
					<td>믿고 맡겨 주세요!</td>
					<td>서울 영등포구 당산동</td>
					<td>오*호</td>
					<td>프로펫시터</td>
					<td>신*연</td>
					<td>20/01/28 ~ 20/01/30</td>
					<td>2</td>
					<td>150,000</td>
					<td>진행중</td>
					<td>대기</td>
				</tr>
				<tr class="tt_col">
					<td>4</td>
					<td>믿고 맡겨 주세요!</td>
					<td>서울 영등포구 당산동</td>
					<td>오*호</td>
					<td>프로펫시터</td>
					<td>신*연</td>
					<td>20/01/28 ~ 20/01/30</td>
					<td>2</td>
					<td>150,000</td>
					<td>예약 취소</td>
					<td>취소</td>
				</tr>
				<tr class="t_col">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="tt_col">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="t_col">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="tt_col">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="t_col">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="tt_col">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<div align="center" style="margin-top: 1em; position: relative; right:20em">
				<div style="position: relative; left: 1em">
	
					 <select
						name="job" style="width: 7em">
						<option value="이름">제목</option>
						<option value="주소">지역</option>
						<option value="연락처">펫시터</option>
						<option value="이용 횟수">등급</option>
						<option value="회원 구분">회원</option>
						<option value="회원 구분">일정</option>
						<option value="회원 구분">금액</option>			
					</select>				
					<input type="text" placeholder="Search.." style="width:14em; margin-left: 1em;"/>
					<button style=" position: relative; top:0.4em; right: 0.2em"><img src="images/search.png" style="width:2em;"></button>
				</div>
			</div>
		</div>

		<!--페이징 영역 -->
		<div align="center" style="text-align:center; margin-top: em; margin:0 auto; width: 37em; position: relative; left: 15em; bottom: 4.2em; ">
			<ul class="paging">
				<li class="paging_item"><a class="paging_item1" href="#">&lt;&lt;</a></li>
				<li class="paging_item"><a class="paging_item1" href="#">&lt;</a></li>
				<li class="paging_item"><a class="paging_item1" href="#">1</a></li>
				<li class="paging_item"><a class="paging_item1" href="#">2</a></li>
				<li class="paging_item"><a class="paging_item1" href="#">3</a></li>
				<li class="paging_item"><a class="paging_item1" href="#">4</a></li>
				<li class="paging_item"><a class="paging_item1" href="#">5</a></li>
				<li class="paging_item"><a class="paging_item1" href="#">6</a></li>
				<li class="paging_item"><a class="paging_item1" href="#">7</a></li>
				<li class="paging_item"><a class="paging_item1" href="#">8</a></li>
				<li class="paging_item"><a class="paging_item1" href="#">9</a></li>
				<li class="paging_item"><a class="paging_item1" href="#">10</a></li>

				<li class="paging_item"><a href="#">&gt;</a></li>
				<li class="paging_item"><a href="#">&gt;&gt;</a></li>
			</ul>
		</div>
	</div>

<style>

/*테이블 css*/
table {
	border-collapse: collapse;
	width: 100%;
	border-style: solid;
	border: 1px solid #444444;
	line-height: 1.5;
	border-bottom: 3px solid #036;
	padding-left: 1em;
	padding-right: 1em;
	padding-bottom: 1em;
	background-color: #436AB3;
	border-bottom: 1px solid;
	border-radius: 18px;
	-moz-border-radius: 18px;
	border-spacing: 0px;
	border-collapse: separate;
	-webkit-border-radius: 15px;
	background-color: #436AB3
}

th {
	text-align: center;
	background-color: #436AB3;
	color: #ffffff;
	padding-top: 1.5em;
	padding-bottom: 1em;
}

.al_col {
	background-color: white;
}

.t_col {
	border-bottom: 1px solid;
	text-align: center;
	background-color: #ffffff;
}

.tt_col {
	background-color: #EDEDEE;
	bord
}

.title {
	padding-bottom: 2em;
	padding-top: 2em;
	padding-left: 1em;
	padding-right: 1em;
}

/*페이징 css*/
.paging {
	width:50em;
	height:2em;
	float: left; 
	text-align : center;
	list-style: none;
	display: inline;
	text-align: center;
}

.paging_item,  .paging_item1{
	
	float: left;
	margin-right: 3px;
	font: bold 12px tahoma;
	text-align: center;
	text-decoration: none;
	font-size: 1.2em;
	border: 1px solid #f7f7f7;
	height:35px; width:35px;
}

.paging_iemt1 a:hover,
.paging_iemt1 a:active,
.paging_iemt1 a:focus {
		border: 1px solid #4c8500;
}
</style>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>