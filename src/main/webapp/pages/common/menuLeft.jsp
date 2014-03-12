<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<div style="float:left; width: 12%; margin-top: 5px;margin-left:3px; padding-left: 2px;">
			<div class="easyui-panel" title="菜单">
			<ul id="verticalMenu">
				<li id="bankTypeId"><a href="#" onclick="selectMenu('bankTypeId','${ctxPath}/bankTypequery.do');">题库类型</a></li>
	  			<li id="bankSettingId"><a href="#" onclick="selectMenu('bankSettingId','${ctxPath}/questionBankqueryList.do');" >设置题库</a></li>
	  			<li id="questionSettingId"><a href="#" onclick="selectMenu('questionSettingId','${ctxPath}/bankTypequery.do');">设置试题</a></li>
	  			<li id="questionImportId"><a href="#" onclick="selectMenu('questionImportId','${ctxPath}/bankTypequery.do');">试题导入</a></li>
			</ul>
			</div>
		</div>