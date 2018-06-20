<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="create">
	<p id="c-p" style="color: #696969;"><label style="margin-right:10px">科目:</label>
				<select id="subjects">
					<c:forEach var="subject" items="${subjects}">
						<option>${subject}</option>
					</c:forEach>
				</select></p>
	<p id="c-testName"><label><strong>测试名</strong></label><input type="text" id="inputName"/></p>
	<div id="create-top">
		<span class="c-title">请选择</span>
		<c:forEach var="type" items="${types}">
			<div id="c-t">
				<input type="button" value='${type}' id="i-b${type}" title="${type}" onClick="createButton('${type}')" class="i-b">
				题数:<input type="text" id="i-t${type}" class="i-t">
				分值:<input type="text" id="i-f${type}" class="i-f">
			</div>
		</c:forEach>
	</div>
	<p style="color: #696969;">*所选题目类型详情</p>
	<hr style="width:80%">
	<div id="create-bottom"></div>
	<a class="button c-button1" onClick="create()">确认</a>
	<a class="button c-button2" onClick="create()">预览</a>
</div>