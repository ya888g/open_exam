<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/pages/common/taglibs.jsp"%>
<html>
<head>
<script>
$(document).ready(function() {
	loadData();
});


function loadData(typeId){
	 $('#list_data').datagrid({
	        width: 700,  
	        height: 'auto',  
	        nowrap: false,  
	        striped: true,  
	        border: true,  
	        collapsible:false,//是否可折叠的  
	        fit: true,//自动大小  
	        url:'${ctxPath}/questionItemqueryListJson.jhtml',  
	        //sortName: 'code',  
	        //sortOrder: 'desc',  
	        remoteSort:false,   
	        singleSelect:false,//是否单选  
	        pagination:true,//分页控件  
	        rownumbers:true,//行号  
	        queryParams:{
	        	typeId:typeId
	        },
	        toolbar: [{
	            text: '添加',
	            iconCls: 'icon-add',
	            handler: function() {
	            	edit();
	            }
	        }, '-', {  
	            text: '修改',  
	            iconCls: 'icon-edit',  
	            handler: function() {
	            	edit(selectedId);
	            }  
	        }, '-',{
	            text: '删除',  
	            iconCls: 'icon-remove',  
	            handler: function(){
	            	questionBankdelete(selectedId);
	            }  
	        }], 
	        
	    });  
	    //设置分页控件
	    var p = $('#list_data').datagrid('getPager');
	    $(p).pagination({
	        pageSize: 10,//每页显示的记录条数，默认为10  
	        pageList: [5,10,15],//可以设置每页记录条数的列表
	        beforePageText: '第',//页数文本框前显示的汉字
	        afterPageText: '页    共 {pages} 页',
	        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',  
	        /*onBeforeRefresh:function(){ 
	            $(this).pagination('loading'); 
	            alert('before refresh'); 
	            $(this).pagination('loaded'); 
	        }*/ 
	    });  
}

function getselectedId(){
	var row = $('#list_data').datagrid('getSelections');
	if(row.length!=1){
		alert("请正确选择一行!");
		return;
	}
	return row[0].id;
}

function edit(id) {
	if(id){
		var url = __ctxPath + "/questionItemqueryById.jhtml";
		$.ajax({
			type : "POST",
			url : url,
			async : false,
			data : {
				'questionBank.id':id
			},
			dataType : "json",
			success : function(msg) {
				$("#id").val(msg.id);
				$("#no").val(msg.no);
				$("#name").val(msg.name);
				$("#description").val(msg.description);
			}
		});
	}else{
		$("#id").val("");
		$("#no").val("");
		$("#name").val("");
		$("#description").val("");
	}
	$('#dlg').dialog('open');
}


</script>
</head>
<body>
<%@ include file="/pages/common/menuLeft.jsp" %>
<div style="float: left; margin-top: 5px;margin-left:10px;  width: 80%;height:60%; margin-right: 10px;">
	<table id="list_data" title="题库管理-->试题列表" >
	    <thead>
	        <tr>
	            <th data-options="field:'type'" >试题类型</th>
	            <th data-options="field:'questionBank'">题库</th>
	            <th data-options="field:'content'">试题内容</th>
	            <th data-options="field:'difficulty'">难度</th>
	            <th data-options="field:'score'">分数</th>
	        </tr>
	    </thead>
	</table>
</div>

<div id="dlg" class="easyui-dialog" title="考试管理-->设置题库" data-options="iconCls:'icon-save',closed: true" style="width:400px;height:300px;padding:10px;top:100px;">
	    <form method="post">
	    	<input type="hidden" id="id" name="id" >
	    	<table style="font-size: 12px;line-height: 30px;">
	    		<tr>
	    			<td>试题类型:</td>
	    			<td><select class="easyui-combobox" id="type" name="type" style="width:200px;"></select></td>
	    		</tr>
	    		<tr>
	    			<td>题库名称:</td>
	    			<td><input type="text" id="name" name="name" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>描述:</td>
	    			<td><textarea id="description" name="description" style="height:60px;"></textarea></td>
	    		</tr>
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="question_sumit()">提 交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">取 消</a>
	    </div>
</div>
<script type="text/javascript">
	selectMenu('questionSettingId');
	$('#type').combobox({
		  url:__ctxPath + "/questionItemqueryCombobox.jhtml",
		  valueField:'value',  
		  textField:'text',
		  editable:false,
		  value:1
	}); 
</script>
</body>
</html>