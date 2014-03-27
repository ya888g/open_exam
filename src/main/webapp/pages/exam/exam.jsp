<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/pages/common/taglibs.jsp"%>
<html>
<head>
<script>
function query(){
	var url = __ctxPath + "/questionItemqueryRandList.jhtml";
	$.ajax({
		type : "POST",
		url : url,
		async : false,
		data : {
		},
		dataType : "json",
		success : function(msg) {
			var questionsStr = "";
			$.each(msg, function(i,data){
				questionsStr = questionsStr + "<div style='padding:2px;margin-top:8px;border:1px #ccc solid;'>";
				questionsStr = questionsStr + (i+1) +" .  " +data.content;
				questionsStr = questionsStr + "<div style='padding:2px;margin-top:5px;border:1px #ccc solid;height:20px;'>";
				$.each(data.questionItemOptionsList,function(j,options){
					questionsStr = questionsStr + " <input type='radio' name='options"+i+"' > " + options.options + " . " + options.optionsContent;
				});
				questionsStr = questionsStr + "</div>";
				
				questionsStr = questionsStr + "</div>";
			});
			
			$("#examContentId").html(questionsStr);
			$('#dlg').dialog('open');
		}
	});
}

</script>
</head>
<body>
<div id="dlg" class="easyui-dialog" title="考试管理-->参加考试" style="width:1000px;height:700px;padding:10px"
			data-options="
				
				buttons: [{
					text:'保存答案',
					iconCls:'icon-ok',
					handler:function(){
						alert('ok');
					}
				},{
					text:'完成提交',
					iconCls:'icon-ok',
					handler:function(){
						alert('cancel');;
					}
				}],closed:true
			">
			<div id="examContentId"></div>
	</div>
examQuery

<a href="javascript:void(0)" class="easyui-linkbutton" onclick="query();">参加考试</a>
</body>
</html>