<%@ include file="/pages/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<html>
<title><decorator:title default="监控首页" /></title>
<head>
<link rel="stylesheet" href="${ctxPath}/resources/css/common.css" />
<script src="${ctxPath}/resources/js/jquery-1.8.3.js"></script>
<script src="${ctxPath}/resources/js/jquery.cookie.min.js"></script>

</head>

<body>
	<div class="pagenav">
		<div class="navbar_default clearfix">
			<ul id="menuId">
				<li class="leftround"></li>
				<li id="questionBankId"><a
					href="#" onclick="showNavDescribe('questionBankId','${ctxPath}/bankTypequery.do')" target="_self">题库管理</a>
				</li>
				<li class="seperate">&nbsp;</li>

				<li id="examId"><a 
					href="#" onclick="showNavDescribe('examId','${ctxPath}/examquery.do')"  target="_self">考试管理</a></li>
				<li class="seperate">&nbsp;</li>
				<li class="rightround"></li>
			</ul>
		</div>
	</div>
	<decorator:body />
	<!--  <div style="margin:auto;margin: 0px;" align="center">监控平台 copyright：2013</div> -->
</body>
<script type="text/javascript">
	function showNavDescribe(menuId,url) {
		window.location.href=url;
		$.cookie('currentMenuId', menuId); 
	}
	
	function test(){
		$($("#menuId").children("li")).each(function (){
			$(this).removeClass("mouseover");
		});
		var currentMenuId = $.cookie('currentMenuId');
		if(currentMenuId  == undefined)
			currentMenuId="questionBankId";
		$("#"+currentMenuId).addClass("mouseover");
	}
	test();
</script>
</html>