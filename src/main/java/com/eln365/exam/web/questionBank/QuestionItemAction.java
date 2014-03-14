package com.eln365.exam.web.questionBank;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.eln365.exam.service.questionBank.QuestionItemService;
import com.eln365.exam.web.BaseAction;

/**
 * 
 * @email: ya888g@163.com @company: eln365.com
 * 
 * @author: 时光倒流 @date：2014-1-25下午11:07:48
 */
public class QuestionItemAction extends BaseAction{
	private static final long serialVersionUID = 8146873477390606908L;
	
	private Integer page;
	private Integer rows;
	private QuestionItemService questionItemService;
	
	public void setQuestionItemService(QuestionItemService questionItemService) {
		this.questionItemService = questionItemService;
	}
	
	public String queryList() {
		return "questionItemList";
	}
	
	public void queryListJson() {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", questionItemService.queryQuestionItemList());
		jsonMap.put("rows", questionItemService.queryQuestionItemList(page, rows));
		JSONObject jsonObject = JSONObject.fromObject(jsonMap);
		writeToRespone(jsonObject.toString());
	}
	
	public void queryCombobox(){
		writeToRespone(queryEasyUICombobox());
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
	
	
}
