function create() {
	var subject = $("#subjects option:selected").val();
	var testName = $("#inputName").val();
	var createInfo = {
		"subject" : subject,
		"testName" : testName,
		"map" : map
	};

	$.ajax({
		url : "create/create-test",
		type : "post",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify(createInfo),
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
