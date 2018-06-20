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
<title>修改密码</title>
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
	function update() {
		//全局变量
		var name = document.getElementById("name_id").value;
		var sex = $('input:radio[name="sex"]:checked').val();
		var bir = document.getElementById("bir_id").value;
		var phone = document.getElementById("phone_id").value;
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

		//ajax校验
		//json数据
		var user = { 
				"name": name,
				"sex": sex ,
				"bir": bir,
				"phone": phone
			}; 
		$.ajax({
			url : "sign/update",
			type : "post",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(user),
			dataType : 'json',
			success : function(result) {
				if(result.code=="0"){
					alert("请等候管理员处理");
					history.go(-1);
				}else if(result.code=="-1"){
					alert("用户不存在，无法修改密码");
				}else{
					alert("信息填写错误");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
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
	};
	function birXMLDoc() {
		var bir = document.getElementById("bir_id").value;
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
				<span class="icon"></span>update<span class="sub">welcome to update password</span>
			</h1>
			</header>
			<div id="content">
				<h2>修改密码验证</h2>
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
					</form>
				</div>
				<div class="utilities">
					<a class="button right"
						onClick="history.go(-1);return true;">返回</a> 
					<a class="button right"
						onClick="update()">确认</a>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
</html>