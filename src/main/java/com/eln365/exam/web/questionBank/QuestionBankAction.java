package com.eln365.exam.web.questionBank;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;

import com.eln365.exam.model.questionBank.QuestionBank;
import com.eln365.exam.service.questionBank.QuestionBankService;
import com.eln365.exam.utils.ExamUtils;
import com.eln365.exam.web.BaseAction;

/**
 * 
 * @email: ya888g@163.com @company: eln365.com
 * 
 * @author: 时光倒流 @date：2014-1-25下午11:07:48
 */
public class QuestionBankAction extends BaseAction {

	private static final long serialVersionUID = -84693275739493432L;

	private Integer rows;
	private Integer page;

	private QuestionBank questionBank;

	private String typeId;

	private QuestionBankService questionBankService;

	public void setQuestionBankService(QuestionBankService questionBankService) {
		this.questionBankService = questionBankService;
	}

	public String queryList() {
		return "questionBankList";
	}

	public void queryListJson() {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", questionBankService.queryQuestionBankList(typeId));
		jsonMap.put("rows", questionBankService.queryQuestionBankList(typeId, page, rows));
		JSONObject jsonObject = JSONObject.fromObject(jsonMap);
		writeToRespone(jsonObject.toString());
	}
	
	public void queryById() {
		String json = JSONObject.fromObject(questionBankService.queryById(questionBank.getId())).toString();
		writeToRespone(json);
	}

	public void editGo() {
		if (StringUtils.isEmpty(questionBank.getId())) {
			questionBank.setId(ExamUtils.getUUID());
			questionBankService.insert(questionBank);
		} else {
			questionBankService.update(questionBank);
		}
		writeToRespone(generateSingleJson("success" + ",," + questionBank.getId() + ",," + questionBank.getName()));
	}
	
	public void queryBankCombobox(){
		JSONArray json = JSONArray.fromObject(questionBankService.queryBankComboboxList());
		writeToRespone(json.toString());
	}
	
	public void delete(){
		questionBankService.delete(questionBank.getId());
		writeToRespone(generateSingleJson(null));
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public QuestionBank getQuestionBank() {
		return questionBank;
	}

	public void setQuestionBank(QuestionBank questionBank) {
		this.questionBank = questionBank;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

}
