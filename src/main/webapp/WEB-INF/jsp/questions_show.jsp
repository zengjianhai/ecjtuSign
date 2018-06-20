<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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