<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="add">
	<div class="question">
		<div class="questionArea">
			<div class="questionContent" style="text-align: center;">
				增加:<input type="text" id="add"/>
				<input type="button" onClick="addST(0);"
					value="科目" style="margin: 6px 0 0 0;" />
				<input type="button" onClick="addST(1);"
					value="类型" style="margin: 6px 0 0 0;" />
			</div>
		</div>
		<div class="answerArea top" style="padding-top:50px;">
			<div class="answerName" style="float: left;">选择显示科目:</div>
			<div class="answerContent" id="subjectLot">
				<c:forEach var="subject" items="${subjects}">
					<input type="checkbox" value="${subject}" name="slot" checked/>${subject} 
				</c:forEach>
			</div>
		</div>
		<div class="answerArea top">
			<div class="answerName" style="float: left;">选择显示类型:</div>
			<div class="answerContent" id="typeLot">
				<c:forEach var="type" items="${types}">
					<input type="checkbox" value="${type}" name="tlot" checked/>${type} 
				</c:forEach>
			</div>
		</div>
		<input type="button" onClick="setSubjectAndType();" value="确认" style="position:absolute;bottom: -10%;"/>
	</div>
</div>