<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:forEach var="info" items="${updatePasswordInfos}" varStatus="status">
					<tr>
						<th scope="row">${status.index+1}</th>
						<td>${info.name}</td>
						<td>${info.phone}</td>
						<td>${info.createTime}</td>
						<td><a onClick="del('${info.phone}')">修改</a></td>
					</tr>
				</c:forEach>