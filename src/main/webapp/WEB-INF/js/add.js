function addQuestion() {
	var subject = $("#subjects option:selected").val();
	var type = $("#types option:selected").val();
	var sonType = $("#sonType option:selected").val();
	var question = $("#question_value").val();
	var img = $(".imgPath").val();
	var answer;
	var answerText = $("#answer_text").val();
	var answerSingle = $("input[name='single']:checked").val();
	var answerLot = "";
	$("input[name='lot']:checked").each(function() {
		answerLot += $(this).val();
	});
	var answerJudge = $("input[name='judge']:checked").val();
	var optionValue = "";
	if (type == '选择题') {
		optionValue = "A." + $(".A").val() + "\r\nB." + $(".B").val()
				+ "\r\nC." + $(".C").val() + "\r\nD." + $(".D").val();
		if (sonType == "单选") {
			answer = answerSingle;
		} else {
			answer = answerLot;
		}
	} else {
		sonType = "";
		optionValue = "";
		if (type == '判断题') {
			answer = answerJudge;
		} else {
			answer = answerText;
		}
	}
	/*
	 * 问题答案空不能添加
	 */
	if (question == "" || question == null) {
		alert("题目不能为空");
		return;
	}
	if (answer == "" || answer == null) {
		alert("答案不能为空");
		return;
	}
	console.log(sonType);
	/* 添加的题目对象 */
	var examination_questions = {
		"subject" : subject,
		"types" : type,
		"question" : question,
		"questionImg" : img,
		"answer" : answer,
		"extend" : sonType,
		"extend2" : optionValue
	};
	$.ajax({
		url : "add/addQuestion",
		type : "post",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify(examination_questions),
		dataType : 'json',
		success : function(result) {
			if (result.code == '1') {
				console.log("成功");
				alert("添加成功");
				/**
				 * 1.添加成功就置空数据，就有可以重新添加了
				 */
			} else {
				alert("题目已存在");
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			console.log(XMLHttpRequest.status);
			console.log(XMLHttpRequest.readyState);
		}
	});
}
/**
 * ajax异步提交表单中excel
 */
uploadExcel = function(){
	var formData = new FormData($("#file_form")[0]);
	$.ajax({
		url : "excel/upload",
		type : "post",
		data: formData,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
		success : function(result) {
			if (result.code == '0') {
				alert("导入题目成功");
				$("#commentListDiv").hide();
			} else {
				alert(result.value);
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			console.log(XMLHttpRequest.status);
			console.log(XMLHttpRequest.readyState);
		}
	});
}
downloadTemplate = function() {
	window.location.href = "excel/downloadTemplate"
}
/*
 * typeChange是类型选择器 2.做出了相应的选择时，add页面的布局作出变化
 */
function typeChange() {
	var type = $("#types option:selected").val();
	var sonType = $("#sonType option:selected").val();
	if (type == '选择题') {
		$("#sonType").css("display", "inline");
		$(".chooseArea").css("display", "inline");
		$("#answerText").css("display", "none");
		$("#answerJudge").css("display", "none");
		if (sonType == "单选") {
			$("#answerSingle").css("display", "inline");
			$("#answerLot").css("display", "none");
		} else {
			$("#answerSingle").css("display", "none");
			$("#answerLot").css("display", "inline");
		}
	} else {
		$("#sonType").css("display", "none");
		$(".chooseArea").css("display", "none");
		$("#answerSingle").css("display", "none");
		$("#answerLot").css("display", "none");
		if (type == '判断题') {
			$("#answerText").css("display", "none");
			$("#answerJudge").css("display", "inline");
		} else {
			$("#answerText").css("display", "inline");
			$("#answerJudge").css("display", "none");
		}
	}
}
function upload(obj) {
	var top = $(obj).offset().top;
	var left = $(obj).width() + 200;
	console.log($(obj).width());
	$("#commentListDiv").css({
		'top' : top + "px",
		'left' : left + "px"
	}).show("slow");H
}

/* 隐藏浮动框 */
function hideThis() {
	$("#commentListDiv").hide();
}
// 获取选中的评语
function getValue(obj) {
	var selectId = obj.value;
	var selectTitle = obj.title;
}
