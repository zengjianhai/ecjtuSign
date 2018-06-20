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
<title>登陆</title>
<link rel="stylesheet" type="text/css" href="static/css/main.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<style type="text/css">
#main #content .form-main form div .code {
	margin-left: 23px;
	font-family: Arial;
	font-style: italic;
	color: blue;
	font-size: 24px;
	border: 0;
	padding: 2px 3px;
	letter-spacing: 3px;
	font-weight: bolder;
	float: left;
	cursor: pointer;
	width: 80px;
	height: 32px;
	line-height: 32px;
	text-align: center;
	vertical-align: middle;
}
/*ajax验证,显示样式*/
.validate{
	position:absolute;
	right:-22%;
	margin-top:12px;
}
</style>
<script type="text/javascript" src="js/create-code.js"></script>
<script type="text/javascript">
	function login() {
		//全局变量
		var inputCode = document.getElementById("inputCode").value;
		var phone = document.getElementById("phone_id").value;
		var password = document.getElementById("password_id").value;
		var code_boolean = false;
		//输入框校验
		if (phone.length <= 0) {
			alert("请输入用户名");
			return;
		}
		if (password.length <= 0) {
			alert("请输入密码");
			return;
		}
		if (inputCode.length <= 0) {
			alert("请输入验证码");
			return;
		}
		//验证码校验
		if (inputCode.toUpperCase() != code.toUpperCase()) {
			alert("验证码错误");
			createCode();
			document.getElementById("inputCode").value = "";
			return;
		} else {
			code_boolean = true;
		}

		//ajax校验
		$.ajax({
			url : "validate/userSuccess",
			type : "post",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify({
				"phone" : phone,
				"password" : password
			}),
			dataType : 'json',
			success : function(result) {
				console.log(result.code);
				if (result.code == '0' && code_boolean) {
					window.location.href = "login/main";
				}else if (result.code == '1' && code_boolean) {
					window.location.href = "sign/administrator?html=3";
				}else{
					alert("密码错误");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				// 状态码
				console.log(XMLHttpRequest.status);
				// 状态
				console.log(XMLHttpRequest.readyState);
				// 错误信息   
				console.log(textStatus);
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
		var phone = document.getElementById("phone_id").value;
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
				if(result.code=="-1"){
					document.getElementById("accDiv").innerHTML = "用户不存在";
					$("#accDiv").css("color",'red');
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				console.log(XMLHttpRequest.status);
				console.log(XMLHttpRequest.readyState);
			}
		});
	};
	updatePassword = function(){
		window.location.href = "sign/update.password";
	}
</script>
</head>
<body onload="createCode()">
	<div id="wrapper">
		<a class="logo" href="/"></a>
		<div id="main">
			<header id="header">
			<h1>
				<span class="icon"></span>login<span class="sub">welcome to
					login</span>
			</h1>
			</header>
			<div id="content">
				<h2>登录</h2>
				<div class="form-main">
					<form name="form_name_login" id="form_id_login" method="post">
						<div class="input-username">
							<label>用户名</label> <input type="text" class="right" name="phone"
								onblur="loadXMLDoc()" size="24" id="phone_id" placeholder="手机号" />
								<span id="accDiv" class="validate"></span>
						</div>
						<div class="input-password">
							<label>密&nbsp;&nbsp;&nbsp;码</label> <input type="password"
								class="right" name="password" size="24" id="password_id" />
						</div>
						<div class="input-code">
							<label>验证码</label>
							<div class="code" id="checkCode" onclick="createCode()"></div>
							<input type="text" class="right" id="inputCode" size="24"
								style="width: 100px" />
						</div>
					</form>
				</div>
				<div class="utilities">
					<a class="button right" href="sign/register"
						onClick="history.go(-1);return true;">注册</a> <a
						class="button right" onClick="login()">确认</a>
					<a class="right" style="line-height:36px" onClick="updatePassword()">忘记密码</a>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>