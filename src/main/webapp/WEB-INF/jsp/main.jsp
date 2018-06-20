<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- base基准网址标记  -->
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自动出题系统</title>
<link rel="stylesheet" type="text/css" href="static/css/main.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<style type="text/css">
#main {
	padding-top: 5%;
}

#main #content .utilities .button {
	height: 100px;
	width: 100px;
	margin-right: 90px;
	margin-top: 20px;
	margin-bottom: 20px;
	font-size: 24px;
	line-height: 100px;
	text-align: center;
}
</style>
<script type="text/javascript">
	function link(result) {
		window.location.href = "login/system?html="+result;
	};
</script>
</head>
<body>
	<p>
		<a href="login/about"
			style="float: right; margin-top: 25px; margin-right: 50px">关于我们</a>
	</p>
	<div id="wrapper">
		<a class="logo" href="/"></a>
		<div id="main">
			<header id="header">
			<h1>
				<span class="icon"></span>main<span class="sub">welcome to
					system</span>
			</h1>
			</header>
			<div id="content">
				<div class="utilities">
					<a class="button right" onClick="link(1)">记录</a> <a
						class="button right" onClick="link(2)">出题</a> <a
						class="button right" onClick="link(3)">添题</a> <a
						class="button right" onClick="link(4)">题库</a>
					<div class="clear"></div>
				</div>
			</div>
			<%@ include file="bottom.jsp"%>
		</div>
	</div>
</body>
</html>