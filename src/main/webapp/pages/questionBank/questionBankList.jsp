<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/pages/common/taglibs.jsp"%>
<html>
<head>
<script type="text/javascript">
$(document).ready(function() {
	initTree();
});
var setting = {
		view : {
			showLine : false
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			onClick : onClick
		}
	};
function initTree(){
	var url = __ctxPath + "/bankTypegenerateTree.jhtml";
	$.ajax({
		type : "POST",
		url : url,
		async : false,
		data : "",
		dataType : "json",
		success : function(msg) {
			$.fn.zTree.init($("#questionBankTree"), setting, msg);
		}
	});

}

</script>
</head>
<body>
<%@ include file="/pages/common/menuLeft.jsp" %> 
<div style="float: left; margin-top: 5px;margin-left:10px;  width: 80%;margin-right: 10px;">
	<div style="float: left; width: 140px;height: 100%">
		<ul id="questionBankTree" class="ztree"></ul>
	</div>
	<div style="float: left;">
	<div class="easyui-panel" title="题库管理-->设置题库" style="width:700px;margin-bottom: 10px;">
		<div style="padding:10px 0 10px 60px">
	    <form method="post">
	    	<table style="font-size: 12px;line-height: 30px;">
	    		<tr>
	    			<td>题库编号:</td>
	    			<td><input type="text" name="name" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>题库名称:</td>
	    			<td><input type="text" name="email" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>描述:</td>
	    			<td><textarea name="message" style="height:60px;"></textarea></td>
	    		</tr>
	    	</table>
	    </form>
	    </div>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
	    </div>
	</div>
	<table  class="easyui-datagrid"  data-options="fitColumns:true,singleSelect:true" style="width:700px;">
	    <thead>
	        <tr>
	            <th data-options="field:'code'" >Code</th>
	            <th data-options="field:'name'">Name</th>
	            <th data-options="field:'price'">Price</th>
	        </tr>
	    </thead>
	    <tbody>
	        <tr>
	            <td>001</td><td>name1</td><td>2323</td>
	        </tr>
	        <tr>
	            <td>002</td><td>name2</td><td>4612</td>
	        </tr>
	    </tbody>
	</table>
	<div class="easyui-pagination" data-options="total:114" style="height: 30px;width:700px;"></div>
	</div>
</div>

<script type="text/javascript">
	selectMenu('bankSettingId');
</script>

</body>
</html>
