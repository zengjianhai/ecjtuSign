function setSubjectAndType() {
	var subjectLot = "";
	var typeLot = "";
	$("input[name='slot']").not("input:checked").each(function() {
		subjectLot += $(this).val() + ",";
	});
	$("input[name='tlot']").not("input:checked").each(function() {
		typeLot += $(this).val() + ",";
	});
	$.ajax({
		url : "admin/delst?subjects="+subjectLot+"&types="+typeLot,
		type : "post",
		contentType : "application/text; charset=utf-8",
		success : function(result) {
			$('#subjectLot').load("html/subject_show");
			$('#typeLot').load("html/type_show");
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
		}
	});
}
function addST(count) {
	var st = $("#add").val();
	var subject = "";
	var type = "";
	var flag = false;
	console.log(st);
	if (count == 0) {
		$("input[name='slot']").each(function() {
			var this_st= $(this).val();
			if(st==this_st){
				alert("已存在");
				flag = true;
			}
		});
		subject = st;
	} else {
		$("input[name='tlot']").each(function() {
			var this_st= $(this).val();
			if(st==this_st){
				alert("已存在");
				flag = true;
			}
		});
		type = st;
	}
	if(flag){
		return;
	}
	$.ajax({
		url : "admin/addst?subject="+subject+"&type="+type,
		type : "post",
		contentType : "application/text; charset=utf-8",
		success : function(result) {
			alert("添加成功");
			if(count==0){
				$('#subjectLot').load("html/subject_show");
			}else{
				$('#typeLot').load("html/type_show");
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
		}
	});
}
