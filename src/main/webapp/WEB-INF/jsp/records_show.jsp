<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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