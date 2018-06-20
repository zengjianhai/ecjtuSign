<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="record">
	<div class="search">
		<div class="search-condition">
			<p style="color: #696969;">
				<label style="margin-right:10px">科目:</label>
				<select style="margin-right:10px" id="subject" onClick="recordSearch()">
					<c:forEach var="subject" items="${subjects}">
						<option>${subject}</option>
					</c:forEach>
				</select> 
				<label style="margin-right:10px">选择年份:</label>
				<select id="date" onClick="recordSearch()">
					<c:forEach var="i" begin="${startTime}" end="${endTime}">
						<option>${i}</option>
					</c:forEach>
				</select>
			</p>
		</div>
	</div>
	<hr style="width:64%;background:#317dc1">
	<div class="content">
		<table id="content-table">
			<thead>
				<tr>
					<th>序号</th>
					<th scope="col" abbr="Starter">测试名</th>
					<th scope="col" abbr="Deluxe">科目</th>
					<th scope="col" abbr="Medium">出题人</th>
					<th scope="col" abbr="Deluxe">总分值</th>
					<th scope="col" abbr="Business">出题日期</th>
					<th scope="col" abbr="Dign">操作</th>
				</tr>
			</thead>
			<tbody id="show-record">
				<c:forEach var="record" items="${records}" varStatus="status">
					<tr>
						<th scope="row">${status.index+1}</th>
						<td>${record.testName}</td>
						<td>${record.subject}</td>
						<td>${record.userName}</td>
						<td>${record.score}</td>
						<td>${record.createTime}</td>
						<td><a onClick="preview('${record}')">详细</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="page">
		<section class="pagination" role="navigation">
			<div id="pageSliderDescription">Pagination: "Arrow" keys to
				move between pages, "Enter" to go to selected page. (ctrl+arrow
				skips 10).</div>
			<div class="pageSlider long"></div>
			<form class="pageForm" action="#">
				<label class="pageLabel" for="pageInput"> Page number you'd
					like to go to. (Max of 30) </label> <a class="pagePrev pageSkip"
					href="#?page=6" title="Previous Page (6)">Previous Page</a> <input
					id="pageInput" class="pageInput" type="text" maxlength="3"
					placeholder="#"> <a class="pageNext pageSkip"
					href="#?page=8" title="Next Page (8)">Next Page</a>
				<button class="pageButton" title="Go to chosen page of results">Go</button>

			</form>
		</section>
	</div>
</div>