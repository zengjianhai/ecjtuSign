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
<title>注册</title>
<link rel="stylesheet" type="text/css" href="static/css/main.css">
<link rel="stylesheet" type="text/css" href="static/css/register.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<style type="text/css">
.phone-validate{
	position:absolute;
	right:-22%;
	margin-top: 42%;
}
.bir-validate{
	position:absolute;
	right:-22%;
	margin-top: 35%;
}
</style>
<script type="text/javascript">
	var userIs = false;
	function register() {
		//如果手机注册了，就不进行下面的操作
		if(userIs){
			return;
		}
		//全局变量
		var name = document.getElementById("name_id").value;
		var sex = $('input:radio[name="sex"]:checked').val();
		var bir = document.getElementById("bir_id").value;
		var phone = document.getElementById("phone_id").value;
		var password = document.getElementById("password_id").value;
		var check_password = document.getElementById("check_password_id").value;
		var school = document.getElementById("school_id").value;
		var code_boolean = false;
		//输入框校验
		if (name.length <= 0) {
			alert("请输入用户名");
			return;
		}
		if (bir.length <= 0) {
			alert("请输入出生年月");
			return;
		}
		if (phone.length <= 0) {
			alert("请输入手机号");
			return;
		}
		if (password.length <= 0) {
			alert("请输入密码");
			return;
		}
		if (check_password.length <= 0) {
			alert("确认密码为空");
			return;
		}
		//确认密码校验
		if (password != check_password) {
			alert("确认密码错误");
			document.getElementById("check_password_id").value = "";
			return;
		} else {
			code_boolean = true;
		}

		//ajax校验
		//json数据
		var user = { 
				"name": name,
				"sex": sex ,
				"bir": bir,
				"phone": phone,
				"password": password,
				"school": school
			}; 
		$.ajax({
			url : "login/registerSuccess",
			type : "post",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(user),
			dataType : 'json',
			success : function(result) {
				console.log(result.code);
				if (result.code == '0' && code_boolean) {
					window.location.href = "login/main";
				}else if (result.code == '1' && code_boolean) {
					window.location.href = "sign/administrator?html=3";
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				console.log(XMLHttpRequest.status);
				console.log(XMLHttpRequest.readyState);
			}
		});
	};
	IsEmpty = function(val){
		if (val == "" || val == null || val == undefined) {
			return true;
		}else{
			return false;
		}
	};
	function loadXMLDoc() {
		userIs = false;
		var phone = document.getElementById("phone_id").value;
		console.log(phone);
		if (IsEmpty(phone)) {
			return;
		}
		if(!(/^1[3|5][0-9]\d{4,8}$/.test(phone))){ 
			document.getElementById("accDiv").innerHTML = "格式不正确";
			$("#accDiv").css("color",'red');
			return false;
		}else{
			document.getElementById("accDiv").innerHTML = "";
		}
		$.ajax({
			url : "validate/userValidate",
			type : "post",
			data : {
				"phone" : phone
			},
			dataType : 'json',
			success : function(result) {
				console.log(result.code);
				if(result.code=="0"){
					userIs = true;
					document.getElementById("accDiv").innerHTML = "用户已存在";
					$("#accDiv").css("color",'red');
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				console.log(XMLHttpRequest.status);
				console.log(XMLHttpRequest.readyState);
			}
		});
	};
	function birXMLDoc() {
		var bir = document.getElementById("bir_id").value;
		console.log(bir);
		if (IsEmpty(bir)) {
			return;
		}
		if(!(/^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$/.test(bir))){ 
			document.getElementById("bir-accDiv").innerHTML = "格式不正确";
			$("#bir-accDiv").css("color",'red');
			return false;
		}else{
			document.getElementById("bir-accDiv").innerHTML = "";
		}
	};
</script>
</head>
<body>
	<div id="wrapper">
		<a class="logo" href="/"></a>
		<div id="main">
			<header id="header">
			<h1>
				<span class="icon"></span>register<span class="sub">welcome to register</span>
			</h1>
			</header>
			<div id="content">
				<h2>注册</h2>
				<div class="register-main" >
					<form name="formsearch" action="/plus/search.php" id="formkeyword">
						<div class="input-user">
							<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
							<input type="text" class="right" name="q" size="24" id="name_id"/>
						</div>
						<div class="input-sex">
							<label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
							<input type="radio" value="男" checked ="checked" class="sex-girl" name="sex"><label>男</label>
							<input type="radio" value="女" name="sex" class="sex-girl"><label>女</label>
						</div>
						<div class="input-bir">
							<label>出生日期</label>
							<input type="text" class="right" name="q" size="24" id="bir_id" onblur="birXMLDoc()"/>
							<span id="bir-accDiv" class="bir-validate"></span>
						</div>
						<div class="input-phone">
							<label>手&nbsp;&nbsp;机&nbsp;&nbsp;号</label>
							<input type="text" class="right" name="phone" size="24" id="phone_id" onblur="loadXMLDoc()"/>
							<span id="accDiv" class="phone-validate"></span>
						</div>
						<div class="input-password">
							<label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
							<input type="password" class="right" name="q" size="24" id="password_id"/>
						</div>
						<div class="input-check">
							<label>确认密码</label>
							<input type="password" class="right" name="q" size="24" id="check_password_id"/>
						</div>
						<div class="input-school">
							<label>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校</label>
							<input type="text" class="right" name="q" size="24" id="school_id"/>
						</div>
					</form>
				</div>
				<div class="utilities">
					<a class="button right"
						onClick="history.go(-1);return true;">返回</a> 
					<a class="button right"
						onClick="register()">确认</a>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
</html>