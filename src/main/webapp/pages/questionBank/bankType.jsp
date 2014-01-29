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
		
		alert(treeNode.id);
		alert(treeNode.name);
		
	}

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

	});
</script>
</head>
<body>
<div>
	<div style="float:left;width: 160;height:100%; border: 1px #ccc solid ">
	</div>
	<div style="float:left;">
		<div style="float:left;width: 140px;height:100%; ">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		
		<div style="float:left;">
			test
		</div>

	</div>

</div>


</body>

</html>