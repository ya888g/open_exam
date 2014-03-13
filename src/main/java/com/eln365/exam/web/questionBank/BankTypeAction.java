package com.eln365.exam.web.questionBank;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;

import com.eln365.exam.model.questionBank.BankType;
import com.eln365.exam.service.questionBank.BankTypeService;
import com.eln365.exam.utils.ExamUtils;
import com.eln365.exam.web.BaseAction;

/**
 * 
 * @email: ya888g@163.com @company: eln365.com
 * 
 * @author: 时光倒流 @date：2014-1-25下午11:07:48
 */
public class BankTypeAction extends BaseAction {
	private static final long serialVersionUID = 153184035173927370L;
	private BankType bankType;
	private BankTypeService bankTypeService;
	private String parentId;

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public BankType getBankType() {
		return bankType;
	}

	public void setBankType(BankType bankType) {
		this.bankType = bankType;
	}

	public BankTypeService getBankTypeService() {
		return bankTypeService;
	}

	public void setBankTypeService(BankTypeService bankTypeService) {
		this.bankTypeService = bankTypeService;
	}

	public String query() {
		return "bankType";
	}

	public void generateTree() {

		writeToRespone(bankTypeService.generateToTree());
	}

	public void queryById() {
		String json = JSONObject.fromObject(bankTypeService.queryById(bankType.getId())).toString();
		writeToRespone(json);
	}

	public void editGo() {
		
		if (StringUtils.isEmpty(bankType.getId())) {
			BankType parentBankType = bankTypeService.queryById(parentId);
			bankType.setId(ExamUtils.getUUID());
			bankType.setTypeStr(appengTreeLeafStr(parentBankType.getTypeStr(), bankType.getId()));
			bankTypeService.insert(bankType);
		} else {
			BankType bankTypeDB = bankTypeService.queryById(bankType.getId());
			bankType.setTypeStr(bankTypeDB.getTypeStr());
			bankTypeService.update(bankType);
		}

		writeToRespone(generateSingleJson("success"+",,"+bankType.getId()+",,"+bankType.getName()));

	}
	
	public void delete(){
		
		bankTypeService.delete(bankType.getId());
		
		writeToRespone(generateSingleJson(null));
	}

}
