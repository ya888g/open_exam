package com.eln365.exam.web.questionBank;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;

import com.eln365.exam.model.questionBank.QuestionItem;
import com.eln365.exam.model.questionBank.QuestionItemOptions;
import com.eln365.exam.service.questionBank.QuestionItemService;
import com.eln365.exam.utils.ExamUtils;
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
	private String comboboxPara;
	private QuestionItem questionItem;
	
	public void setQuestionItemService(QuestionItemService questionItemService) {
		this.questionItemService = questionItemService;
	}
	
	public String queryList() {
		return "questionItemList";
	}
	public void queryById() {
		String json = JSONObject.fromObject(questionItemService.queryById(questionItem.getId())).toString();
		writeToRespone(json);
	}
	
	public void queryListJson() {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", questionItemService.queryQuestionItemList());
		jsonMap.put("rows", questionItemService.queryQuestionItemList(page, rows));
		JSONObject jsonObject = JSONObject.fromObject(jsonMap);
		writeToRespone(jsonObject.toString());
	}
	
	public void queryCombobox(){
		writeToRespone(queryEasyUICombobox(comboboxPara));
	}

	public void editGo() {
		List<QuestionItemOptions> questionItemOptionsList = new ArrayList<QuestionItemOptions>();
		Date dateTime  = new Date();
		questionItemOptionsList = converSetProperties(dateTime);
		if (StringUtils.isEmpty(questionItem.getId())) {
			questionItem.setId(ExamUtils.getUUID());
			questionItem.setCreateTime(dateTime);
			questionItem.setUpdateTime(dateTime);
			questionItem.setStatus(1);
			questionItemService.insertQuestionItem(questionItem, questionItemOptionsList);
		}else{
			questionItem.setUpdateTime(dateTime);
			questionItemService.updateQuestionItem(questionItem, questionItemOptionsList);
		}
		writeToRespone(generateSingleJson("success" + ",," + questionItem.getId() + ",," + questionItem.getContent()));
	}
	
	
	private List<QuestionItemOptions> converSetProperties(Date dateTime){
		List<QuestionItemOptions> questionItemOptionsList = new ArrayList<QuestionItemOptions>();
		if(StringUtils.isNotEmpty(questionItem.getAnswerA())){
			QuestionItemOptions questionItemOptionsA = new QuestionItemOptions();
			questionItemOptionsA.setId(ExamUtils.getUUID());
			questionItemOptionsA.setItemId(questionItem.getId());
			questionItemOptionsA.setOptions("A");
			questionItemOptionsA.setOptionsContent(questionItem.getAnswerA());
			questionItemOptionsA.setCreateTime(dateTime);
			questionItemOptionsA.setUpdateTime(dateTime);
			questionItemOptionsList.add(questionItemOptionsA);
		}
		
		if(StringUtils.isNotEmpty(questionItem.getAnswerB())){
			QuestionItemOptions questionItemOptionsB = new QuestionItemOptions();
			questionItemOptionsB.setId(ExamUtils.getUUID());
			questionItemOptionsB.setItemId(questionItem.getId());
			questionItemOptionsB.setOptions("B");
			questionItemOptionsB.setOptionsContent(questionItem.getAnswerB());
			questionItemOptionsB.setCreateTime(dateTime);
			questionItemOptionsB.setUpdateTime(dateTime);
			questionItemOptionsList.add(questionItemOptionsB);
		}
		
		if(StringUtils.isNotEmpty(questionItem.getAnswerC())){
			QuestionItemOptions questionItemOptionsC = new QuestionItemOptions();
			questionItemOptionsC.setId(ExamUtils.getUUID());
			questionItemOptionsC.setItemId(questionItem.getId());
			questionItemOptionsC.setOptions("C");
			questionItemOptionsC.setOptionsContent(questionItem.getAnswerC());
			questionItemOptionsC.setCreateTime(dateTime);
			questionItemOptionsC.setUpdateTime(dateTime);
			questionItemOptionsList.add(questionItemOptionsC);
		}
		
		if(StringUtils.isNotEmpty(questionItem.getAnswerD())){
			QuestionItemOptions questionItemOptionsD = new QuestionItemOptions();
			questionItemOptionsD.setId(ExamUtils.getUUID());
			questionItemOptionsD.setItemId(questionItem.getId());
			questionItemOptionsD.setOptions("D");
			questionItemOptionsD.setOptionsContent(questionItem.getAnswerD());
			questionItemOptionsD.setCreateTime(dateTime);
			questionItemOptionsD.setUpdateTime(dateTime);
			questionItemOptionsList.add(questionItemOptionsD);
		}
		
		if(StringUtils.isNotEmpty(questionItem.getAnswerE())){
			QuestionItemOptions questionItemOptionsE = new QuestionItemOptions();
			questionItemOptionsE.setId(ExamUtils.getUUID());
			questionItemOptionsE.setItemId(questionItem.getId());
			questionItemOptionsE.setOptions("E");
			questionItemOptionsE.setOptionsContent(questionItem.getAnswerE());
			questionItemOptionsE.setCreateTime(dateTime);
			questionItemOptionsE.setUpdateTime(dateTime);
			questionItemOptionsList.add(questionItemOptionsE);
		}
		
		if(StringUtils.isNotEmpty(questionItem.getAnswerF())){
			QuestionItemOptions questionItemOptionsF = new QuestionItemOptions();
			questionItemOptionsF.setId(ExamUtils.getUUID());
			questionItemOptionsF.setItemId(questionItem.getId());
			questionItemOptionsF.setOptions("F");
			questionItemOptionsF.setOptionsContent(questionItem.getAnswerF());
			questionItemOptionsF.setCreateTime(dateTime);
			questionItemOptionsF.setUpdateTime(dateTime);
			questionItemOptionsList.add(questionItemOptionsF);
		}
		return questionItemOptionsList;
	}
	
	public void delete(){
		questionItemService.deleteItem(questionItem.getId());
		writeToRespone(generateSingleJson(null));
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

	public String getComboboxPara() {
		return comboboxPara;
	}

	public void setComboboxPara(String comboboxPara) {
		this.comboboxPara = comboboxPara;
	}

	public QuestionItem getQuestionItem() {
		return questionItem;
	}

	public void setQuestionItem(QuestionItem questionItem) {
		this.questionItem = questionItem;
	}
	
	
}
