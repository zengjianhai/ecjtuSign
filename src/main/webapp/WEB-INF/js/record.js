function recordSearch() {
	var subject = $("#subject option:selected").val();
	var page = $("#pageInput").val();
	var date = $("#date").val();
	/* 添加的题目对象 */
	var searchInfo = {
		"subject" : subject,
		"date" : date,
		"page" : page
	};
	$.ajax({
		url : "record/search",
		type : "post",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify(searchInfo),
		dataType : 'json',
		success : function(result) {
			console.log("成功");
			$('#show-record').load("record/show");
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			console.log(XMLHttpRequest.status);
			console.log(XMLHttpRequest.readyState);
		}
	});
}
preview = function(result) {
	console.log(result);
	var res = result.split(',');
	var testName=res[1].split('=')[1];
	var subject = res[2].split('=')[1];
	var userName = res[5].split('=')[1];
	var titlesScore = res[6].split('=')[1];
	var titles = res[7].split('=')[1];
	console.log(titlesScore);
	console.log(titles);
	var recordInfo={
			'testName':testName,
			'subject':subject,
			'userName':userName,
			'titlesScore':titlesScore,
			'titles':titles
	};
	$.ajax({
		url : "record/preview",
		type : "post",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify(recordInfo),
		dataType : 'json',
		success : function(result) {
			if (result.code == '0') {
				window.location.href = "create/preview";
			} 
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			console.log(XMLHttpRequest.status);
			console.log(XMLHttpRequest.readyState);
		}
	});
}