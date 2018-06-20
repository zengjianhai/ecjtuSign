<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="question">
	<div class="search">
		<div class="question-search">
			<input type="text" class="left" name="q" size="24" id="inputString"
				placeholder="搜索" />
			<button id="search" onClick="search()"></button>
		</div>
		<div class="question-condition">
			<p style="color: #696969;">
				<label style="margin-right: 10px">科目:</label> <select id="subjects"
					style="margin-right: 10px" onClick="search()">
					<c:forEach var="subject" items="${subjects}">
						<option>${subject}</option>
					</c:forEach>
				</select> <label style="margin-right: 10px">选择年份:</label> <select id="date"
					style="margin-right: 10px" onClick="search()">
					<c:forEach var="i" begin="${startTime}" end="${endTime}">
						<option>${i}</option>
					</c:forEach>
				</select> <label style="margin-right: 10px">题目类型:</label> <select id="types"
					onClick="search()">
					<c:forEach var="type" items="${types}">
						<option>${type}</option>
					</c:forEach>
				</select> <input type="button" onClick="excel()" value="导出"
					style="float: right; position: absolute; right: -12.5%" /> <input
					type="button" onClick="upload(this)" value="导入"
					style="float: right; position: absolute; right: -3.5%" />
			</p>
			<div align="center" id="commentListDiv"
				style="width: 300px; height: 160px; border: solid 1px #a1bece; position: absolute; z-index: 10000; display: none; background-color: rgb(240, 240, 240, .8)">
				<span style="float: right; position: absolute; right: 10px;"
					onClick="hideThis();">x</span>
				<div style="margin: 0 auto; position: absolute; top: 25%;">
					<input type="button" onClick="downloadTemplate()" value="导出模板" />
					<form id="file_form">
						<div>
							<input type="file" name="file" id="file_input" style="width: 58%">
							<input type="button" value="导入" class="file"
								onClick="uploadExcel()">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<hr style="width: 64%; background: #317dc1">
	<div class="content">
		<!-- <table id="questionList"></table> 
		<div id="questionPager"></div> -->
		<table id="content-table">
			<thead>
				<tr>
					<th>序号</th>
					<th scope="col" abbr="Deluxe">科目</th>
					<th scope="col" abbr="Business">类型</th>
					<th scope="col" abbr="Starter">题目</th>
					<th scope="col" abbr="Medium">答案</th>
					<th scope="col" abbr="Deluxe">出题次数</th>
					<th scope="col" abbr="Deluxe">创建日期</th>
					<th scope="col" abbr="Dign">操作</th>
				</tr>
			</thead>
			<tbody id="show-question">
				<c:forEach var="ques" items="${questions}" varStatus="status">
					<tr>
						<th scope="row">${status.index+1}</th>
						<td>${ques.subject}</td>
						<td>${ques.types}</td>
						<td>${ques.question}</td>
						<td>${ques.answer}</td>
						<td>${ques.changeRecord}</td>
						<td>${ques.createTime}</td>
						<td><a onClick="update('${ques}')">修改</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="center" id="questionUpdate"
			style="width: 500px; border: solid 1px #a1bece; position: absolute; z-index: 10000; display: none; background-color: rgb(240, 240, 240, .8)">
			<span style="float: right; position: absolute; right: 10px;"
				onClick="hideUpdate();">x</span>
			<div style="margin: 0 auto;">
				<div style="width: 60%;padding: 20px 0 0 0;">
					<div>
						<div style="float: left;padding:7px;">题目:</div>
						<div style="float: left;padding:5px">
							<textarea rows="3" cols="40" name="inputQuestion"
								id="question_text"></textarea>
						</div>
					</div>
				</div>
				<div style="width: 60%;">
					<div>
						<div style="float: left;padding:7px;">答案:</div>
						<div style="float: left;padding:5px 0 15px 5px">
							<textarea rows="2" cols="40" name="inputAnswer" id="answer_text"></textarea>
						</div>
					</div>
				</div>
				<input type="hidden" id="question_id"/>
			</div>
			<input type="button" onClick="yesUpdate()" value="确认" style="margin: 0 20px 15px 50px;float: right;"/>
		</div>
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