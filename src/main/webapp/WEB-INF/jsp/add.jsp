<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="add">
	<div class="type">
		<div class="typeName left">科目:</div>
		<div class="typeMam left">
			<select id="subjects">
				<c:forEach var="subject" items="${subjects}">
					<option>${subject}</option>
				</c:forEach>
			</select>
		</div>
		<div class="typeName left">类型名:</div>
		<div class="typeMam left">
			<select id="types" onClick="typeChange()">
				<c:forEach var="type" items="${types}">
					<option>${type}</option>
				</c:forEach>
			</select>
		</div>
		<div class="typeSon left">
			<select id="sonType" onClick="typeChange()">
				<option>单选</option>
				<option>多选</option>
			</select>
		</div>
		<input type="button" onClick="upload(this);"
			value="导入"
			style="margin: 6px 0 0 0; float: right;" />
		<div align="center" id="commentListDiv" 
			style="width: 300px; height: 160px; border: solid 1px #a1bece; position: absolute; z-index: 10000; display: none; background-color: rgb(240, 240, 240, .8)">
			<span style="float:right;position: absolute;right: 10px;" onClick="hideThis();">x</span>
			<div style="margin: 0 auto;position: absolute;top: 25%;">
				<input type="button" onClick="downloadTemplate()" value="导出模板" />
				<form id="file_form">
	          		<div>
	            		<input type="file" name="file" id="file_input" style="width:58%">
	            		<input type="button" value="导入" class="file" onClick="uploadExcel()">
	        		</div>
	   			</form>
   			</div>
		</div>
	</div>
	<div class="question">
		<span class="title">${titleName}</span>
		<div class="questionArea top">
			<div class="questionName left mleft">题目:</div>
			<div class="questionContent">
				<textarea rows="5" cols="45" name="inputQuestion"
					id="question_value"></textarea>
			</div>
		</div>
		<div class="imgArea top">
			<div class="imgName mleft">
				图片: <input type="file" value="选择" class="imgPath" /> <input
					type="button" value="上传" class="uploading" />
			</div>
		</div>
		<%-- <c:if test="${html=='选择'}"> --%>
		<div class="chooseArea top">
			<div class="chooseName left mleft">选项:</div>
			<div class="chooseContent">
				<p>
					A.<input type="text" class="A" />
				</p>
				<p>
					B.<input type="text" class="B" />
				</p>
				<p>
					C.<input type="text" class="C" />
				</p>
				<p>
					D.<input type="text" class="D" />
				</p>
			</div>
		</div>
		<%-- </c:if> --%>
		<div class="answerArea top">
			<div class="answerName left mleft">答案:</div>
			<%-- <c:if test="${html=='选择'}">
			</c:if> --%>
			<div class="answerContent" id="answerText" style="display: none">
				<textarea rows="3" cols="45" name="inputAnswer" id="answer_text"></textarea>
			</div>
			<%-- <c:if test="${html=='选择'}"> --%>
			<div class="answerContent" id="answerSingle">
				<input type="radio" value="a" name="single" />A <input type="radio"
					value="b" name="single" />B <input type="radio" value="c"
					name="single" />C <input type="radio" value="d" name="single" />D
			</div>
			<%-- </c:if> --%>
			<div class="answerContent" style="display: none" id="answerLot">
				<input type="checkbox" value="a" name="lot" />A <input
					type="checkbox" value="b" name="lot" />B <input type="checkbox"
					value="c" name="lot" />C <input type="checkbox" value="d"
					name="lot" />D
			</div>
			<div class="answerContent" style="display: none" id="answerJudge">
				<input type="radio" value="yes" name="judge" />正确 <input
					type="radio" value="no" name="judge" />错误
			</div>
			<%-- <c:if test="${html=='选择'}">
			</c:if>
			<c:if test="${html=='选择'}">
			</c:if> --%>
		</div>
		<a class="button right" onClick="addQuestion()">确认</a>
	</div>
</div>