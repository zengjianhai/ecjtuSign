function search() {
	var subject = $("#subjects option:selected").val();
	var type = $("#types option:selected").val();
	var question = $("#inputString").val();
	var page = $("#pageInput").val();
	var date = $("#date").val();
	console.log(question);
	/* 添加的题目对象 */
	var searchInfo = {
		"subject" : subject,
		"types" : type,
		"question" : question,
		"date" : date,
		"page" : page
	};
	/*
	 * $("#questionList").jqGrid('setGridParam', { url : "question/search",
	 * mtype : "post", postData : searchInfo, // 发送数据 page : 1
	 * }).trigger("reloadGrid"); // 重新载入
	 */
	console.log("成功");
	$.ajax({
		url : "question/search",
		type : "post",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify(searchInfo),
		dataType : 'json',
		success : function(result) {
			console.log("成功");
			$('#show-question').load("question/show");
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			console.log(XMLHttpRequest.status);
			console.log(XMLHttpRequest.readyState);
		}
	});

};
excel = function() {
	window.location.href = "excel/export"
}
var old_question="";
var old_answer="";
update = function(question) {
	var res = question.split(',');
	var id = res[0].split('=')[1];
	var question = res[3].split('=')[1];
	var answer = res[5].split('=')[1];
	old_question = question;
	old_answer = answer;
	$("#question_text").val(question);
	$("#answer_text").val(answer);
	$("#question_id").val(id);
	$("#questionUpdate").show("slow");
	
}
yesUpdate = function(){
	var id = $("#question_id").val();
	var question = $("#question_text").val();
	var answer = $("#answer_text").val();
	if(answer==old_answer&&old_question==question){
		alert("没有进行修改");
		return;
	}
	var questions = {
			"id" : id,
			"question" : question,
			"answer" : answer
		};
		$.ajax({
			url : "question/update",
			type : "post",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(questions),
			dataType : 'json',
			success : function(result) {
				if (result.code == '0') {
					search();
					$("#questionUpdate").hide();
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				console.log(XMLHttpRequest.status);
				console.log(XMLHttpRequest.readyState);
			}
		});
}
/* 隐藏浮动框 */
function hideUpdate() {
	$("#questionUpdate").hide();
}
/*
 * $(function() { // 页面加载完成之后执行 pageInit(); }); function pageInit() { var
 * subject = $("#subjects option:selected").val(); var type = $("#types
 * option:selected").val(); var question = $("#inputString").val(); var date =
 * $("#date").val(); console.log(date); 添加的题目对象 var searchInfo = { "subject" :
 * subject, "types" : type, "question" : question, "date" : date }; //
 * 创建jqGrid组件 $("#questionList").jqGrid({ url : 'question/search', mtype :
 * "POST", contentType : "application/json; charset=utf-8", postData :
 * JSON.stringify(searchInfo), datatype : "json", colNames : [ '科目', '类型', '题目',
 * '答案', '出题次数', '创建日期' ], colModel : [ { name : 'subject', index : 'subject',
 * width : 55, align : "center" }, { name : 'types', index : 'types', width :
 * 55, align : "center" }, { name : 'question', index : 'question asc, invdate',
 * width : 100 }, { name : 'answer', index : 'answer', width : 80 }, { name :
 * 'changeRecord', index : 'changeRecord', width : 55, align : "center" }, {
 * name : 'createTime', index : 'createTime', width : 80, sortable : false } ],
 * jsonReader : { repeatitems : false }, viewrecords : true, rowNum : 20,
 * rowList : [ 1, 20, 50 ], pager : "#questionPager", altRows : true, toppager :
 * false, multiselect : true, beforeRequest : function() { var table = this;
 * setTimeout(function() { updatePagerIcons(table); enableTooltips(table); },
 * 0); }, loadComplete : function() { return_chalenght_up({ id : grid_selector
 * }); var table = this; setTimeout(function() { updatePagerIcons(table);
 * enableTooltips(table); }, 0); }, caption : '题库', autowidth : true }); }
 * function updatePagerIcons(table) { var replacement = { 'ui-icon-seek-first' :
 * 'icon-double-angle-left bigger-140', 'ui-icon-seek-prev' : 'icon-angle-left
 * bigger-140', 'ui-icon-seek-next' : 'icon-angle-right bigger-140',
 * 'ui-icon-seek-end' : 'icon-double-angle-right bigger-140' };
 * $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon')
 * .each(function() { var icon = $(this); var $class =
 * $.trim(icon.attr('class').replace('ui-icon', '')); if ($class in replacement)
 * icon.attr('class', 'ui-icon ' + replacement[$class]); }); }
 * 
 * function enableTooltips(table) { $('.navtable .ui-pg-button').tooltip({
 * container : 'body' }); $(table).find('.ui-pg-div').tooltip({ container :
 * 'body' }); }
 */