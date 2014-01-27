<%@ include file="/pages/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"  %>
<html>
	<title><decorator:title default="监控首页" /></title>
    <head>
 		<link rel="stylesheet" href="${ctxPath}/resources/css/common.css" />
 		<script src="${ctxPath}/resources/js/jquery-1.8.3.js"></script>
	</head>
    
  <body>	
  <div class="pagenav">
		<div class="navbar_default clearfix">
		<ul>
		            <li class="leftround"></li>
				    <li class="mouseover">
		            	<a id="hylIndex0" href="${ctxPath}/bankTypequery.do" onMouseOver="showNavDescribe( 1 , '')" onMouseOut="showNavDescribe()" target="_self">题库管理</a>  </li>
		            <li class="seperate">&nbsp;</li>
						        				
				    <li>
		            	<a id="hylIndex0" href="${ctxPath}/examquery.do" onMouseOver="showNavDescribe( 2 , '')" onMouseOut="showNavDescribe()" target="_self">考试管理</a>  </li>
		            <li class="seperate">&nbsp;</li>
		            <li class="rightround"></li>
		</ul>
		<div class="navdescribe">
		          <div class="describetext" id="navDescribeBg"><div class="textitem" id="navDescribe"></div></div>
		        </div>
		</div>
  </div>
  <decorator:body />
   <!--  <div style="margin:auto;margin: 0px;" align="center">监控平台 copyright：2013</div> -->
   </body>
</html>