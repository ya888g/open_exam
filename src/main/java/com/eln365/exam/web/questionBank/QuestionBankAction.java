package com.eln365.exam.web.questionBank;

import com.eln365.exam.service.questionBank.QuestionBankService;
import com.eln365.exam.web.BaseAction;

/**
 * 
 * @email: ya888g@163.com @company: eln365.com
 * 
 * @author: 时光倒流 @date：2014-1-25下午11:07:48
 */
public class QuestionBankAction extends BaseAction {

	private static final long serialVersionUID = -84693275739493432L;

	private QuestionBankService questionBankService;
	
	public void setQuestionBankService(QuestionBankService questionBankService) {
		this.questionBankService = questionBankService;
	}
	
	public String queryList() {
		return "questionBankList";
	}
}
