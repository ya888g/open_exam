package com.eln365.exam.web.questionBank;

import com.eln365.exam.service.questionBank.BankTypeService;
import com.eln365.exam.web.BaseAction;

/**
 * 
 * @email: ya888g@163.com @company: eln365.com
 * 
 * @author: 时光倒流 @date：2014-1-25下午11:07:48
 */
public class BankTypeAction extends BaseAction {
	private static final long serialVersionUID = 153184035173927370L;

	private BankTypeService bankTypeService;

	public BankTypeService getBankTypeService() {
		return bankTypeService;
	}

	public void setBankTypeService(BankTypeService bankTypeService) {
		this.bankTypeService = bankTypeService;
	}

	public String query() {

		return "bankType";
	}
}
