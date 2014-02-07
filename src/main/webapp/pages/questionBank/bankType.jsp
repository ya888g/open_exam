<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
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
		var url = __ctxPath + "/bankTypegenerateTree.jhtml";
		$.ajax({
			type : "POST",
			url : url,
			async : false,
			data : "",
			dataType : "json",
			success : function(msg) {
				$.fn.zTree.init($("#treeDemo"), setting, msg);
			}
		});

		$("#edit").css("display", "none");
		$("#view").css("display", "none");
		$("#opt").css("display", "none");
	});

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
		}
		$("#view").css("display", "none");
		$("#edit").css("display", "block");
		$("#opt").css("display", "block");
	}

	function editGo() {
		
		var url = __ctxPath + "/bankTypeeditGo.jhtml?parentId="+ $("#parentId").val()+"&bankType.id="+$("#id").val()+"&bankType.no="+$("#no").val()+"&bankType.name="+$("#name").val();
		$.ajax({
			type : "POST",
			url : url,
			async : false,
			data : "",
			dataType : "json",
			success : function(msg) {
				var result = msg.result;
				alert(result.split(",,")[1]);
				view(result.split(",,")[0]);
			}
		});
		
	}
</script>
</head>
<body>
	<div>
		<div
			style="float: left; width: 160; height: 100%; border: 1px #ccc solid">
		</div>
		<div style="float: left; margin-top: 10px;">
			<div style="float: left; width: 140px; height: 100%;">
				<ul id="treeDemo" class="ztree"></ul>
			</div>

			<div style="float: left;">
				<table id="view">
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
				<div id="edit">
						<input type="hidden" id="parentId" name="parentId"> 
						<input type="hidden" id="id" name="bankType.id">
						<table>
							<tr>
								<td>题库编号:</td>
								<td><input type="text" id="no" name="bankType.no" size="20">
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
				<table id="opt">
					<tr>
						<td colspan="2">
							<input type="button" name="add"	value="新增子类别" onclick="edit(1);">
							<input type="button" name="update" value="修改本类别" onclick="edit(2);"> 
							<input type="button" name="delete" value="删除本类别"></td>
					</tr>
				</table>
				</form>
			</div>

		</div>

	</div>


</body>

</html>