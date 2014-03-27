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
	            	var selectedId = getselectedId();
	            	if(!selectedId)
	            		return;
	            	edit(selectedId);
	            }  
	        }, '-',{
	            text: '删除',  
	            iconCls: 'icon-remove',  
	            handler: function(){
	            	var selectedId = getselectedId();
	            	if(!selectedId)
	            		return;
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
	var type="";
	var count="";
	var questionBank="";
	var difficulty="";
	var content="";
	var options = "";
	var answerA="";
	var answerB="";
	var answerC="";
	var answerD="";
	if(id){
		var url = __ctxPath + "/questionItemqueryById.jhtml";
		$.ajax({
			type : "POST",
			url : url,
			async : false,
			data : {
				'questionItem.id':id
			},
			dataType : "json",
			success : function(msg) {
				$("#id").val(msg.id);
				type = msg.type;
				count = msg.count;
				questionBank = msg.questionBank;
				$("#score").val(msg.score);
				difficulty = msg.difficulty;
				content = msg.content;
				$("#options").val();
				options= msg.answer;
				answerA = msg.answerA;
				answerB = msg.answerB;
				answerC = msg.answerC;
				answerD = msg.answerD;
			}
		});
	}else{
	}
	loadEasyUISelect(type,count,questionBank,difficulty);
	appoptionsContent();
	$("#content").val(content);
	var optionArray = options.split(",");
	for(var i=0;i<optionArray.length;i++){
		$("#"+optionArray[i]).attr("checked",true);
	}
	$("#answerA").val(answerA);
	$("#answerB").val(answerB);
	$("#answerC").val(answerC);
	$("#answerD").val(answerD);
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

<div id="dlg" class="easyui-dialog" title="考试管理-->设置题库" data-options="iconCls:'icon-save',closed: true" style="width:600px;height:600px;padding:10px;top:30px;">
	    <form method="post">
	    	<input type="hidden" id="id" name="id" >
	    	<table style="font-size: 12px;line-height: 30px;">
	    		<tr>
	    			<td width="100px;">试题类型:</td>
	    			<td><select class="easyui-combobox" id="type" name="type" style="width:200px;"></select></td>
	    		</tr>
	    		<tr>
	    			<td>选项个数:</td>
	    			<td><select class="easyui-combobox" id="count" name="count" style="width:200px;"></select></td>
	    		</tr>
	    		<tr>
	    			<td>题库名称:</td>
	    			<td><select class="easyui-combobox" id="questionBank" name="questionBank" style="width:200px;"></select></td>
	    		</tr>
	    		<tr>
	    			<td>分数:</td>
	    			<td><input type="text" id="score" name="score" style="width:200px;"></input></td>
	    		</tr>
	    		<tr>
	    			<td>难度:</td>
	    			<td><select class="easyui-combobox" id="difficulty" name="difficulty" style="width:200px;"></select></td>
	    		</tr>
	    		<tr style="line-height:45px;">
	    			<td>内容:</td>
	    			<td><textarea id="content" name="content" style="height:40px;width: 400px;"></textarea></td>
	    		</tr>
	    		<tr>
	    			<td id="optionsTitleId"></td>
	    			<td id="optionsId">
	    			</td>
	    		</tr>
	    		
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="do_submit()">提 交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">取 消</a>
	    </div>
</div>
<script type="text/javascript">
	selectMenu('questionSettingId');
	function loadEasyUISelect(type,count,questionBank,difficulty){
		if(!type)
			type =1;
		if(!count)
			count =4;
		if(!difficulty)
			difficulty =1;
		
		$('#type').combobox({
			  url:__ctxPath + "/questionItemqueryCombobox.jhtml?comboboxPara=questionItemType",
			  valueField:'value',  
			  textField:'text',
			  editable:false,
			  value:type,
			  onChange:appoptionsContent
		}); 
		$('#count').combobox({
			  url:__ctxPath + "/questionItemqueryCombobox.jhtml?comboboxPara=questionItemCount",
			  valueField:'value',  
			  textField:'text',
			  editable:false,
			  value:count,
			  onChange:appoptionsContent
		});
		$('#questionBank').combobox({
			  url:__ctxPath + "/questionBankqueryBankCombobox.jhtml",
			  valueField:'value',  
			  textField:'text',
			  editable:false,
			  value:questionBank
		});
		
		$('#difficulty').combobox({
			  url:__ctxPath + "/questionItemqueryCombobox.jhtml?comboboxPara=difficulty",
			  valueField:'value',  
			  textField:'text',
			  editable:false,
			  value:difficulty
		});	
	}
	
	
	function appoptionsContent(){
		var type=$("#type").combobox('getValue');
		var count=$("#count").combobox('getValue');
		var temp=getOptionsContent(type,count);
		$("#optionsId").html(temp);
	}
	function getOptionsContent(type,count){
		var temp='';
		if(type==1 || type == 2){
			$("#optionsTitleId").html("候选项:");
			var buttonStr = 'radio';
			if(type==2)
				buttonStr = 'checkbox';
			for(var i=0;i<count;i++){
				var sequenceNo = getSequenceNo(i);
				temp=temp+ '<div><input type="'+buttonStr+'" id="'+sequenceNo+'" name="options">'+sequenceNo+'</div>';
				temp = temp+'<textarea id="answer'+sequenceNo+'" name="answer'+sequenceNo+'" style="height:40px;width: 400px;"></textarea>';
			}
		}else if(type == 3){
			$("#optionsTitleId").html("参考答案:");
			temp='<input type="radio" name="options"> 正确 <input type="radio" name="options"> 错误 ';
		}
		
		return temp;
	}
	
	function getSequenceNo(index){
		var sequenceNo="";
		if(index==0){
			sequenceNo = "A";
		}else if(index==1){
			sequenceNo = "B";
		}else if(index==2){
			sequenceNo = "C";
		}else if(index==3){
			sequenceNo = "D";
		}else if(index==4){
			sequenceNo = "E";
		}else if(index==5){
			sequenceNo = "F";
		}
		return sequenceNo;
	}
	
	function do_submit(){
		var check = $('input[name=options]:checked');
		var checkStr='';
		check.each(function(i){
			if(i==0){
				checkStr = $(this).attr("id");
			}else{
				checkStr = checkStr+','+$(this).attr("id");
			}
			});
		var url = __ctxPath + "/questionItemeditGo.jhtml";
		$.ajax({
			type : "POST",
			url : url,
			async : false,
			data : {
				'questionItem.id':$("#id").val(),
				'questionItem.type':$("#type").combobox('getValue'),
				'questionItem.count':$("#count").combobox('getValue'),
				'questionItem.questionBank':$("#questionBank").combobox('getValue'),
				'questionItem.score':$("#score").val(),
				'questionItem.difficulty':$("#difficulty").combobox('getValue'),
				'questionItem.content':$("#content").val(),
				'questionItem.options':checkStr,
				'questionItem.answerA':$("#answerA").val(),
				'questionItem.answerB':$("#answerB").val(),
				'questionItem.answerC':$("#answerC").val(),
				'questionItem.answerD':$("#answerD").val(),
				'questionItem.answerE':$("#answerE").val(),
				'questionItem.answerF':$("#answerF").val()
				
			},
			dataType : "json",
			success : function(msg) {
				var result = msg.result;
				var resultArray = result.split(",,");
				//updateTree(resultArray[1],resultArray[2]);
				alert(resultArray[0]);
				selectMenu('questionSettingId','${ctxPath}/questionItemqueryList.do');
			}
		});
	}
	
	function questionBankdelete(id){
		
		var url = __ctxPath + "/questionItemdelete.jhtml";
		$.ajax({
			type : "POST",
			url : url,
			async : false,
			data : {
				'questionItem.id':id
			},
			dataType : "json",
			success : function(msg) {
				var result = msg.result;
				alert(result);
				selectMenu('questionSettingId','${ctxPath}/questionItemqueryList.do');
			}
		});
	}
	
</script>
</body>
</html>