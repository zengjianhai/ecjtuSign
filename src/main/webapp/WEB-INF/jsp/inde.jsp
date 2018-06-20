<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<title>Insert title here</title>
<link href="../static/css/jquery.idcode.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/jquery.idcode.js"></script>
</head>
<body>
	<h3>普通验证码</h3>
	<div id="mpanel1"></div>
	<h1>say Hello</h1>
	<h2>${phone}</h2>
	<center>
		<br>
		<br> <input type="text" id="Txtidcode" class="txtVerification"><span
			id="idcode"></span> <input type="button" id="butn" value="提交">
	</center>
	<script>
	$.idcode.setCode(); //加载生成验证码方法
	$("#butn").click(function() {
		var IsBy = $.idcode.validateCode() //调用返回值，返回值结果为true或者false
		if (IsBy) {
			alert("验证码输入正确")
		} else {
			alert("请重新输入")
		}
	})
</script>
</body>
</html>
