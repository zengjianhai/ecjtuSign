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
<title>系统</title>
<link rel="stylesheet" href="jqgrid/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" href="static/css/main.css">
<link rel="stylesheet" type="text/css" href="static/css/about-us.css">
<link rel="stylesheet" type="text/css" href="static/css/index.css">
<link rel="stylesheet" type="text/css" href="static/css/create.css">
<link rel="stylesheet" type="text/css" href="static/css/question.css">
<link rel="stylesheet" href="jqgrid/css/css/redmond/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script src='js/jquery-ui.js'></script>
<script src="js/index.js"></script>
<script src="js/add.js"></script>
<script type="text/javascript" src="jqgrid/js/jquery.jqGrid.src.js"></script>
<script src="js/question.js"></script>
<script src="js/create.js"></script>
<script src="js/record.js"></script>
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
/*选择类型*/
#main #content .add {
	width: 80%;
	margin: 0 auto;
	font-size: 16px;
	color: #696969;
	line-height: 36px;
}

#main #content .add .type {
	width: 80%;
	height: 50px;
	padding-top: 20px;
	margin: 0 auto;
}

#main #content .add .type .typeName{
	font-size: 14px;
}
#main #content .add .type select {
	font-size: 14px;
	color: #75a7cf;
	line-height: 36px;
	margin-top: 7px;
}

.left {
	margin-right: 15px;
}
/*选择问题*/
#main #content .add .question {
	/* 	background:#123456;
 */
	width: 80%;
	height: 435px;
	margin: 0 auto;
	/*边框文字*/
	position: relative;
	border: 1px solid #ccc;
	padding: 20px;
	box-sizing: border-box;
	/*边框文字*/
}
/*边框文字*/
#main #content .add .question .title {
	position: absolute;
	top: -13px;
	left: 10%;
	line-height: 2em;
	padding: 0 1em;
	background-color: #fff;
}
/*边框文字*/
#main #content .add .question .questionArea {
	width: 100%;
}

.top {
	margin-top: 15px;
}

.mleft {
	margin-left: 70px;
}

#main #content .add .question .answerArea {
	width: 100%;
	float: left;
}

#main #content .add .question .imgArea {
	width: 100%;
	float: left;
}

.imgPath {
	width: 35%;
	margin-left: 15px;
}

#main #content .add .question .chooseArea {
	width: 100%;
	float: left;
	height: 96px;
}

#main #content .add .question .chooseArea p {
	padding: 0;
	margin-top: 2px;
}

#main #content .add .question .chooseArea input {
	width: 65%;
	border-color: #878787;
	border-style: solid;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 1px;
	border-left-width: 0px
}

.chooseName {
	height: 96px;
}

.chooseContent {
	width: 70%;
}

#main #content .add .question div div textarea {
	padding: 0 8px;
	background: white;
	border: solid 1px #cdcdcd;
	outline: none;
	-moz-box-shadow: 0 3px 3px rgba(0, 0, 0, .05) inset;
	-webkit-box-shadow: 0 3px 3px rgba(0, 0, 0, .05) inset;
	box-shadow: 0 3px 3px rgba(0, 0, 0, .05) inset;
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
.button {
	position: absolute;
	bottom: 25px;
	right: 3%;
	display: inline-block;
	height: 34px;
	margin: 0 0 0 6px;
	padding: 0 18px;
	background: #006db0;
	background-image: linear-gradient(bottom, #0062a6 0%, #0079bb 100%);
	background-image: -o-linear-gradient(bottom, #0062a6 0%, #0079bb 100%);
	background-image: -moz-linear-gradient(bottom, #0062a6 0%, #0079bb 100%);
	background-image: -webkit-linear-gradient(bottom, #0062a6 0%, #0079bb 100%);
	background-image: -ms-linear-gradient(bottom, #0062a6 0%, #0079bb 100%);
	-moz-box-shadow: 0 0 0 1px #003255, 0 1px 3px rgba(0, 50, 85, 0.5), 0
		1px #00acd8 inset;
	-webkit-box-shadow: 0 0 0 1px #003255, 0 1px 3px rgba(0, 50, 85, 0.5), 0
		1px #00acd8 inset;
	box-shadow: 0 0 0 1px #003255, 0 1px 3px rgba(0, 50, 85, 0.5), 0 1px
		#00acd8 inset;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	font-size: 14px;
	line-height: 34px;
	color: white;
	font-weight: bold;
	text-shadow: 0 -1px #00385a;
	text-decoration: none;
}

.button:hover {
	background: #0081c6;
	background-image: linear-gradient(bottom, #006fbb 0%, #008dce 100%);
	background-image: -o-linear-gradient(bottom, #006fbb 0%, #008dce 100%);
	background-image: -moz-linear-gradient(bottom, #006fbb 0%, #008dce 100%);
	background-image: -webkit-linear-gradient(bottom, #006fbb 0%, #008dce 100%);
	background-image: -ms-linear-gradient(bottom, #006fbb 0%, #008dce 100%);
	-moz-box-shadow: 0 0 0 1px #003255, 0 1px 3px rgba(0, 50, 85, 0.5), 0
		1px #00c1e4 inset;
	-webkit-box-shadow: 0 0 0 1px #003255, 0 1px 3px rgba(0, 50, 85, 0.5), 0
		1px #00c1e4 inset;
	box-shadow: 0 0 0 1px #003255, 0 1px 3px rgba(0, 50, 85, 0.5), 0 1px
		#00c1e4 inset;
}

.button:active {
	background: #0081c6;
	background-image: linear-gradient(bottom, #008dce 0%, #006fbb 100%);
	background-image: -o-linear-gradient(bottom, #008dce 0%, #006fbb 100%);
	background-image: -moz-linear-gradient(bottom, #008dce 0%, #006fbb 100%);
	background-image: -webkit-linear-gradient(bottom, #008dce 0%, #006fbb 100%);
	background-image: -ms-linear-gradient(bottom, #008dce 0%, #006fbb 100%);
	-moz-box-shadow: 0 0 0 1px #003255, 0 1px 3px rgba(0, 50, 85, 0.5), 0
		1px #00c1e4 inset;
	-webkit-box-shadow: 0 0 0 1px #003255, 0 1px 3px rgba(0, 50, 85, 0.5), 0
		1px #00c1e4 inset;
	box-shadow: 0 0 0 1px #003255, 0 1px 3px rgba(0, 50, 85, 0.5), 0 1px
		#00c1e4 inset;
}
</style>
<script type="text/javascript">
	var flg = ${html};
	var flig = false;
	window.onload=function(){ 
		/*主页左边菜单初始选中项，设定按中效果*/
		if(flg==1){
			$("record-p").style.background="#e0e0e0";
		}else if(flg==2){
			$("create-test-p").style.background="#e0e0e0";
		}else if(flg==3){
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
		$("record-p").onmouseover=function(){ 
			if(flg!=1){
			 	this.style.background="#f0f0f0";
			}
		} 
		$("record-p").onmouseout=function(){  
			if(flg!=1){
				this.style.background="url(static/images/2.jpg) no-repeat";
				this.style.backgroundPosition="top";
			}
		} 
		$("create-test-p").onmouseover=function(){ 
			if(flg!=2){
			 	this.style.background="#f0f0f0";
			}
		} 
		$("create-test-p").onmouseout=function(){  
			if(flg!=2){
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
	function htmlReturn(result,titleName) {
		$('#h2').html(titleName);
		//点击其他，清空出题页面样式
		if(result!=2){
			str = "";
			arr = [];
			count = 0;
		}
		//
		if(result == '${html}'){
			flig = true;
		}
		$("#add-p").css("background",'url(static/images/2.jpg) no-repeat');
		$("#add-p").css("background-position",'top');
		$("#question-p").css("background",'url(static/images/2.jpg) no-repeat');
		$("#question-p").css("background-position",'top');
		$("#record-p").css("background",'url(static/images/2.jpg) no-repeat');
		$("#record-p").css("background-position",'top');
		$("#create-test-p").css("background",'url(static/images/2.jpg) no-repeat');
		$("#create-test-p").css("background-position",'top');
		$("#back-p").css("background",'url(static/images/2.jpg) no-repeat');
		$("#back-p").css("background-position",'top');
		if(result == 3){
			$("#add-p").css("background",'#e0e0e0');
		}else if(result == 4){
			$("#question-p").css("background",'#e0e0e0');
		}else if(result == 1){
			$("#record-p").css("background",'#e0e0e0');
		}else if(result == 2){
			$("#create-test-p").css("background",'#e0e0e0');
		}else{
			$("#back-p").css("background",'#e0e0e0');
			window.location.href = "sign/login";
		}
		flg = result;
		console.log(result);
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
					$('#content-right').load("html/add");
				}else if(result == 4){
					$('#content-right').load("html/question");
				}else if(result == 1){
					$('#content-right').load("html/record");
				}else if(result == 2){
					$('#content-right').load("html/create-test");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				console.log(errorThrown);
			}
		});
	};
	/*map存放出题时选择的类型及对应的数目*/
	var map={};
	/*出题的js*/
	var str = "";
	var arr = [];
	var count = 0;
	function createButton(result){
		//点击按钮输入框只能读
		document.getElementById('i-t'+result).readOnly = true;
		document.getElementById('i-f'+result).readOnly = true;
		//点击变颜色
		document.getElementById('i-b'+result).style.background='#e0e0e0';
		//
		var lo = false;
		for(var i=0;i<arr.length;i++){
			if(arr[i]==result){
				lo = true;
			}
		}
		arr[count] = result;
		count++;
		var i_b = document.getElementById("i-b"+result).value;
		var i_t = document.getElementById("i-t"+result).value;
		var i_f = document.getElementById("i-f"+result).value;
		//初始化
		if(i_t==null || i_t==""){
			i_t = 0;
		}
		if(i_f==null || i_f==""){
			i_f = 0;
		}
		//加载#create-bottom中的html
		var str_html="";
		if(!lo){
			//map存入
			map[i_b] = i_t+","+i_f; 
			//map存入
			str_html = "<div id='c-b'><span>"+i_b+"</span><span>"+i_t+"道</span><span>总分"+(i_f*i_t)+"分</span></div>";
		}else{
			//map移除
			var value = map[i_b];
			var has = i_b in map;
			delete map[i_b];
			//map移除
			//释放只可读
			document.getElementById('i-t'+result).readOnly = false;
			document.getElementById('i-f'+result).readOnly = false;
			//去除背景颜色
			document.getElementById('i-b'+result).style.background='#f7f7f7';
			//移除
			var str_htmlCopy="<div id='c-b'><span>"+i_b+"</span><span>"+i_t+"道</span><span>总分"+(i_f*i_t)+"分</span></div>";
			var val = str.split(str_htmlCopy);
			str_htmlCopy="";
			for(var i=0;i<val.length;i++){
				str_htmlCopy = str_htmlCopy + val[i];
			}
			str = str_htmlCopy;
			//移除数组中元素
			for(var i=0;i<arr.length;i++){
				if(arr[i]==result){
					arr.remove(i);
				}
			}
			console.log("移除后："+arr);
		}
		str = str + str_html;
		$('#create-bottom').html(str);
		//
	};
	//移除数组中元素
	Array.prototype.remove = function(dx) 
	{ 
	  if(isNaN(dx)||dx>this.length){return false;} 
	  this.splice(dx,1); 
	}
</script>
</head>
<body>
	<div id="wrapper">
		<a class="logo" href="login/main"></a>
		<div id="main">
			<header id="header">
			<h1>
				<span class="icon"></span>system<span class="sub">welcome to
					system</span>
			</h1>
			</header>
			<div id="content">
				<h2 id="h2">${titleName}</h2>
				<div id="content-left">
					<p class="content-p" id="add-p" onClick="htmlReturn(3,'添题')"><a>添题</a></p>
					<p class="content-p" id="question-p" onClick="htmlReturn(4,'题库')"><a>题库</a></p>
					<p class="content-p" id="record-p" onClick="htmlReturn(1,'记录')"><a>记录</a></p>
					<p class="content-p" id="create-test-p" onClick="htmlReturn(2,'出题')"><a>出题</a></p>
					<p class="content-p" id="back-p" onClick="htmlReturn(0)"><a>退出</a></p>
					<p></p>
					<img alt="#" src="static/images/3.jpeg" style="position:relative;right:-50px;bottom:-120px">
				</div>
				<div id="content-right">
					<c:choose>
						<c:when test="${html==3}">
							<%@ include file="add.jsp"%>
						</c:when>
						<c:when test="${html==1}">
							<%@ include file="record.jsp"%>
						</c:when>
						<c:when test="${html==2}">
							<%@ include file="create-test.jsp"%>
						</c:when>
						<c:when test="${html==4}">
							<%@ include file="question.jsp"%>
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