<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>预览</title>
<link rel="stylesheet" type="text/css" href="static/css/main.css">
<link rel="stylesheet" type="text/css" href="static/css/about-us.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/FileSaver.js"></script>
<script type="text/javascript" src="js/jquery.wordexport.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
<style type="text/css">
#user_content {
	width: 100%;
	padding: 30px 0 30px 0;
	font-size: 16px
}

#user_content div {
	width: 24%;
	float: left;
	text-align: center;
}

#main #content #preview_types {
	font-size: 16px;
	color: #000;
}

#main #content #preview_question {
	color: #000;
}

#export_word {
	margin: 20px;
}
</style>
<script type="text/javascript">
	function exportWord(testName) {
		$("#content").wordExport(testName + "测试");
	}
	function exportPdf(testName) {
		html2canvas($('#content'), {
			onrendered : function(canvas) {
				var imgData = canvas.toDataURL('img/notice/png');
				var doc = new jsPDF('p', 'px', 'a4');
				//第一列 左右边距  第二列上下边距  第三列是图片左右拉伸  第四列 图片上下拉伸 
				doc.addImage(imgData, 'PNG', 0, 0, 0, 0);
				doc.save(testName + '.pdf');
			}
		});
		/* var pdf = new jsPDF('p', 'pt', 'a4');  
		pdf.internal.scaleFactor = 1;  
		var options = {  
		    pagesplit: true  
		};  
		pdf.addHTML($("#content"), options, function() {  
		    pdf.save(testName+'.pdf');  
		});  */
	}
	function change(obj) {
		var top = $(obj).offset().top;
		var left = $(obj).width() + 200;
		console.log($(obj).width());
		$("#commentListDiv").show("slow");
	}

	/* 隐藏浮动框 */
	function hideThis() {
		$("#commentListDiv").hide();
	}
</script>
</head>
<body>
	<div id="wrapper">
		<a class="logo" href="login/main"></a>
		<div id="main" style="width: 60%;">
			<header id="header">
			<h1>
				<span class="icon" title='返回主页' onClick="goBack()"></span>us<span
					class="sub">welcome to us</span>
			</h1>
			</header>
			<div id="content">
				<h2 style="text-align: center">${test.testName}(${test.subject})</h2>
				<div id="user_content">
					<div>姓名:</div>
					<div>班级:</div>
					<div>学校:</div>
					<div>学号:</div>
				</div>
				<hr>
				<c:forEach items="${test.map}" var="entry" varStatus="mapStatus">
					<h3 id="preview_types">
						${mapStatus.index+1}.
						<c:out value="${entry.key}" />
						(共${test.scoreAndCount[entry.key].count}道,每道${test.scoreAndCount[entry.key].score}分)
					</h3>
					<c:forEach var="item" items="${entry.value}" varStatus="listStatus">
						<p id="preview_question">
							(${listStatus.index+1}).
							<c:out value="${item.question}" />
							.()
						</p>
						<c:if test="${not empty item.extend2}">
							<p id="preview_question">
								<c:out value="${item.extend2}" />
							</p>
						</c:if>
						<p id="preview_question">
							答案：
							<c:out value="${item.answer}" />
						</p>
					</c:forEach>
				</c:forEach>
				<input id="export_word" type="button" onClick="change(this);"
					value="导出选择">
			</div>
			<div align="center" id="commentListDiv"
				style="width: 300px; height: 160px; border: solid 1px #a1bece; position: absolute; top: 30%; right: 30%; z-index: 10000; display: none; background-color: rgb(240, 240, 240, .8)">
				<span style="float: right; position: absolute; right: 10px; top: 3%"
					onClick="hideThis();">x</span>
				<div style="margin: 0 auto; position: absolute; top: 25%;width: 100%;">
					<input id="export_word" type="button"
						onClick="exportWord('${test.testName}');" value="导出word">
					<input id="export_word" type="button"
						onClick="exportPdf('${test.testName}');" value="导出pdf">
				</div>
			</div>
			<%@ include file="bottom.jsp"%>
		</div>
	</div>
</body>
</html>