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
<title>关于我们</title>
<link rel="stylesheet" type="text/css" href="static/css/main.css">
<link rel="stylesheet" type="text/css" href="static/css/about-us.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	function goBack() {
		window.location.href = "login/main";
	};
</script>
</head>
<body>
	<div id="wrapper">
		<a class="logo" href="login/main"></a>
		<div id="main">
			<header id="header">
			<h1>
				<span class="icon" title='返回主页' onClick="goBack()"></span>us<span class="sub">welcome to us</span>
			</h1>
			</header>
			<div id="content">
				<h2>关于我们</h2>
				<h3>1.出题</h3>
				<p>（1）在这个功能中，您可以选择总分值，然后可以选择要出的题目类型。（题目类型：选择，填空，简答，判断等类似的）</p>
				<p>（2）每个题目类型对应的数目，分值。</p>
				<p>（3）最后根据选择的条件自动生成测试卷</p>
				<h3>2.题库</h3>
				<p>（1）在这个功能中，您可以选择总分值，然后可以选择要出的题目类型。（题目类型：选择，填空，简答，判断等类似的）</p>
				<p>（2）每个题目类型对应的数目，分值。</p>
				<p>（3）最后根据选择的条件自动生成测试卷</p>
				<h3>3.记录</h3>
				<p>（1）在这个功能中，您可以选择总分值，然后可以选择要出的题目类型。（题目类型：选择，填空，简答，判断等类似的）</p>
				<p>（2）每个题目类型对应的数目，分值。</p>
				<p>（3）最后根据选择的条件自动生成测试卷</p>
				<h3>4.添题</h3>
				<p>（1）在这个功能中，您可以选择总分值，然后可以选择要出的题目类型。（题目类型：选择，填空，简答，判断等类似的）</p>
				<p>（2）每个题目类型对应的数目，分值。</p>
				<p>（3）最后根据选择的条件自动生成测试卷</p>
			</div>
			<%@ include file="bottom.jsp" %>
		</div>
	</div>
</body>
</html>