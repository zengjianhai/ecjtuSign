<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="record">
	<hr style="width:64%;background:#317dc1">
	<div class="content"  style="height:400px">
		<table id="content-table">
			<thead>
				<tr>
					<th>序号</th>
					<th scope="col" abbr="Starter">用户名</th>
					<th scope="col" abbr="Deluxe">手机号</th>
					<th scope="col" abbr="Business">出题日期</th>
					<th scope="col" abbr="Dign">操作</th>
				</tr>
			</thead>
			<tbody id="show-record">
				<c:forEach var="info" items="${updatePasswordInfos}" varStatus="status">
					<tr>
						<th scope="row">${status.index+1}</th>
						<td>${info.name}</td>
						<td>${info.phone}</td>
						<td>${info.createTime}</td>
						<td><a onClick="del('${info.phone}')">修改</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<button class="pageButton" style="text-align: center;position: absolute;left: 18%;" onclick="delall()">修改所有</button>
</div>