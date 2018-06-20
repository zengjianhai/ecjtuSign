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
<title>管理员</title>
<link rel="stylesheet" type="text/css" href="static/css/main.css">
<link rel="stylesheet" type="text/css" href="static/css/about-us.css">
<link rel="stylesheet" type="text/css" href="static/css/question.css">
<link rel="stylesheet" href="jqgrid/css/css/redmond/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script src='js/jquery-ui.js'></script>
<script src='js/set.js'></script>
<style type="text/css">
#main #content{
	height: 605px;
}
#main #content #content-left {
	background: url(static/images/1.PNG) no-repeat;
    background-position: right;
	position: relative;
	padding: 20px 5px 0 3px;
	width: 15%;
	float: left;
}
#main #content #content-left p{
	background: url(static/images/2.jpg) no-repeat;
    background-position: top;
	margin:0 auto;
	font-size: 16px;
	text-align:center;
}
#main #content #content-left .content-p:hover{
	background: #f0f0f0; 
}
#main #content #content-left .content-p:active {
	background: #e0e0e0; 
}
#main #content #content-right {
	position: relative;
	width: 84%;
	float: right;
}
#main #content .add {
	width: 80%;
	margin: 0 auto;
	padding: 50px 0 20px 0;
	font-size: 16px;
	color: #696969;
	line-height: 36px;
}
#add {
    width: 180px;
    height: 34px;
    padding: 0 8px;
    background: white;
    border: solid 1px #cdcdcd;
    outline: none;
    -moz-box-shadow: 0 3px 3px rgba(0,0,0,.05) inset;
    -webkit-box-shadow: 0 3px 3px rgba(0,0,0,.05) inset;
    box-shadow: 0 3px 3px rgba(0,0,0,.05) inset;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    font-size: 14px;
    color: #696969;
    -webkit-font-smoothing: antialiased;
    transition: all 0.3s ease-in-out;
    -webkit-transition: all 0.3s ease-in-out;
    -moz-transition: all 0.3s ease-in-out;
    -o-transition: all 0.3s ease-in-out;
    -ms-transition: all 0.3s ease-in-out;
}
</style>
<script type="text/javascript">
	var flg = ${html};
	window.onload=function(){ 
		/*主页左边菜单初始选中项，设定按中效果*/
		if(flg==3){
			$("add-p").style.background="#e0e0e0";
		}else if(flg==4){
			$("question-p").style.background="#e0e0e0";
		}
		
		/*主页左边菜单按钮效果设定*/
		function $(id){      
			return document.getElementById(id);     
		}
		$("add-p").onmouseover=function(){ 
			if(flg!=3){
			 	this.style.background="#f0f0f0";
			}
		} 
		$("add-p").onmouseout=function(){  
			if(flg!=3){
				this.style.background="url(static/images/2.jpg) no-repeat";
				this.style.backgroundPosition="top";
			}
		}
		$("question-p").onmouseover=function(){ 
			if(flg!=4){
			 	this.style.background="#f0f0f0";
			}
		} 
		$("question-p").onmouseout=function(){  
			if(flg!=4){
				this.style.background="url(static/images/2.jpg) no-repeat";
				this.style.backgroundPosition="top";
			}
		} 
		$("back-p").onmouseover=function(){ 
			if(flg!=0){
			 	this.style.background="#f0f0f0";
			}
		} 
		$("back-p").onmouseout=function(){  
			if(flg!=0){
				this.style.background="url(static/images/2.jpg) no-repeat";
				this.style.backgroundPosition="top";
			}
		} 
	};
	/*主页左边菜单按钮点击效果设定*/
	function htmlReturn(result) {
		$("#add-p").css("background",'url(static/images/2.jpg) no-repeat');
		$("#add-p").css("background-position",'top');
		$("#question-p").css("background",'url(static/images/2.jpg) no-repeat');
		$("#question-p").css("background-position",'top');
		$("#back-p").css("background",'url(static/images/2.jpg) no-repeat');
		$("#back-p").css("background-position",'top');
		if(result == 3){
			$("#add-p").css("background",'#e0e0e0');
		}else if(result == 4){
			$("#question-p").css("background",'#e0e0e0');
		}else{
			$("#back-p").css("background",'#e0e0e0');
			window.location.href = "sign/login";
		}
		flg = result;
		$.ajax({
			url : "login/html-handle",
			type : "post",
			data : {
				"html" : result
			},
			dataType : 'text',
			success : function() {
				/* window.location.href = "login/system?html="+result; */
				if(result == 3){
					$('#content-right').load("html/set");
				}else if(result == 4){
					$('#content-right').load("html/user_ask");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				console.log(errorThrown);
			}
		});
	};
	
	del = function(phone){
		$.ajax({
			url : "admin/delask?phone="+phone,
			type : "post",
			contentType : "application/text; charset=utf-8",
			success : function(result) {
				$('#show-record').load("html/ask_show");
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
	}
	delall = function(phone){
		$.ajax({
			url : "admin/delallask",
			type : "post",
			contentType : "application/text; charset=utf-8",
			success : function(result) {
				$('#show-record').load("html/ask_show");
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
	}

</script>
</head>
<body>
	<div id="wrapper">
		<a class="logo" href="login/main"></a>
		<div id="main">
			<header id="header">
			<h1>
				<span class="icon"></span>administrator<span class="sub">welcome to
					administrator</span>
			</h1>
			</header>
			<div id="content">
				<h2 id="h2">管理员</h2>
				<div id="content-left">
					<p class="content-p" id="add-p" onClick="htmlReturn(3)"><a>设置管理</a></p>
					<p class="content-p" id="question-p" onClick="htmlReturn(4)"><a>用户请求</a></p>
					<p class="content-p" id="back-p" onClick="htmlReturn(0)"><a>退出</a></p>
					<p></p>
					<img alt="#" src="static/images/3.jpeg" style="position:relative;right:-50px;bottom:-120px">
				</div>
				<div id="content-right">
					<c:choose>
						<c:when test="${html==3}">
							<%@ include file="set.jsp"%>
						</c:when>
						<c:when test="${html==4}">
							<%@ include file="user_ask.jsp"%>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<%@ include file="bottom.jsp"%>
		</div>
	</div>
</body>
</html>