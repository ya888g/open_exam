<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/pages/common/taglibs.jsp"%>
<html>
<head>
<script type="text/javascript">
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

	function onClick(event, treeId, treeNode, clickFlag) {
		view(treeNode.id);
	}
	
	function view(id){
		var url = __ctxPath + "/bankTypequeryById.jhtml?bankType.id=" +id;
		$.ajax({
			type : "POST",
			url : url,
			async : false,
			data : "",
			dataType : "json",
			success : function(msg) {
				$("#parentId").val(msg.id);
				$("#id").val(msg.id);
				$("#viewno").html(msg.no);
				$("#viewname").html(msg.name);
				
				$("#edit").css("display", "none");
				$("#view").css("display", "block");
				$("#opt").css("display", "block");
			}
		});
		
	}

	//var test1 = {"children":[{"children":[],"id":"2","isDir":false,"name":"test2","open":false},{"children":[{"children":[],"id":"31","isDir":false,"name":"test31","open":false}],"id":"3","isDir":false,"name":"test3","open":false}],"id":"1","isDir":false,"name":"test1","open":false}

	$(document).ready(function() {
		 $( "#menu" ).menu();
		initTree();
	});
	
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

		$("#edit").css("display", "none");
		$("#view").css("display", "none");
		$("#opt").css("display", "none");
	}

	function edit(flag) {
		$("#id").val("");
		$("#no").val("");
		$("#name").val("");
		if (flag == "2") {
			var url = __ctxPath + "/bankTypequeryById.jhtml?bankType.id="
					+ $("#parentId").val();
			$.ajax({
				type : "POST",
				url : url,
				async : false,
				data : "",
				dataType : "json",
				success : function(msg) {
					$("#id").val(msg.id);
					$("#no").val(msg.no);
					$("#name").val(msg.name);
				}
			});
		}else{
			$("#no").val(getNowString());
		}
		$("#view").css("display", "none");
		$("#edit").css("display", "block");
		$("#opt").css("display", "block");
	}

	function editGo() {
		
		var url = __ctxPath + "/bankTypeeditGo.jhtml";
		$.ajax({
			type : "POST",
			url : url,
			async : false,
			data : {
				'parentId':$("#parentId").val(), 
				'bankType.id':$("#id").val(),
				'bankType.no':$("#no").val(),
				'bankType.name':$("#name").val()
			},
			dataType : "json",
			success : function(msg) {
				var result = msg.result;
				var resultArray = result.split(",,");
				//updateTree(resultArray[1],resultArray[2]);
				initTree();
				view(resultArray[1]);
				alert(resultArray[0]);
			}
		});
		
	}
	
	//废除
	function updateTree(id,name){
		var zTree = $.fn.zTree.getZTreeObj("questionBankTree");
		var node = zTree.getNodesByParam("id", id)[0];
		node.name = name;
		zTree.updateNode(node);
	}
	
	function questionTypedelete(){
		var url = __ctxPath + "/bankTypedelete.jhtml?bankType.id="+$("#id").val();
		$.ajax({
			type : "POST",
			url : url,
			async : false,
			data : "",
			dataType : "json",
			success : function(msg) {
				var result = msg.result;
				alert(result);
				initTree();
			}
		});
	}
	
	function testmenu(){
		initTree();
	}
	
</script>
</head>
<body>
	<div>
		<!--
		 <div style="float:left; width: 12%; margin-top: 5px;margin-left:3px; padding-left: 2px;">
			<div class="easyui-panel" title="菜单">
			<ul id="verticalMenu">
				<li id="bankTypeId" class="current"><a href="#" onclick="selectMenu('bankTypeId');">题库类型</a></li>
	  			<li id="bankSettingId"><a href="#" onclick="selectMenu('bankSettingId');" >设置题库</a></li>
	  			<li id="questionSettingId"><a href="#" onclick="selectMenu('questionSettingId');">设置试题</a></li>
	  			<li id="questionImportId"><a href="#" onclick="selectMenu('questionImportId');">试题导入</a></li>
			</ul>
			</div>
		</div>
		 -->
		<%@ include file="/pages/common/menuLeft.jsp" %>
		<div style="float: right; margin-top: 5px;width: 83%;margin-right: 10px;">
			<div style="float: left; width: 140px;">
				<ul id="questionBankTree" class="ztree"></ul>
			</div>
			<div style="float: left;width: 83%;height: 50%">
			
			<div class="easyui-panel" title="题库管理-->题库类型"  fit="true" >
				<div style="padding:10px 0 10px 60px">
					<table id="view" style="font-size: 12px;line-height: 30px;">
					<tr>
						<td>题库编号:</td>
						<td id="viewno"></td>
					</tr>
					<tr>
						<td>题库名称:</td>
						<td id="viewname"></td>
					</tr>
				</table>
				<form action="bankTypeeditGo.jhtml" method="post">
					<input type="hidden" id="parentId" name="parentId"> 
					<input type="hidden" id="id" name="bankType.id">
				<div id="edit">
						<table style="font-size: 12px;line-height: 30px;">
							<tr>
								<td>题库编号:</td>
								<td><input type="text" id="no" name="bankType.no" size="20" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td>题库名称:</td>
								<td><input type="text" id="name" name="bankType.name" size="20">
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="button" name="save" value="保 存" onclick="editGo();">
									<input	type="button" name="cancel" value="取 消">
								</td>
							</tr>
						</table>
					
				</div>
				<table id="opt" style="padding-top: 10px;">
					<tr>
						<td colspan="2">
							<input type="button" name="add"	value="新增子类别" onclick="edit(1);">
							<input type="button" name="update" value="修改本类别" onclick="edit(2);">
							<input type="button" name="delete" value="删除本类别" onclick="questionTypedelete();"></td>
					</tr>
				</table>
				</form>
				
				
				</div>
			</div>
			
			
				
			</div>

		</div>
	</div>
<script type="text/javascript">
	selectMenu('bankTypeId');
</script>
</body>
</html>