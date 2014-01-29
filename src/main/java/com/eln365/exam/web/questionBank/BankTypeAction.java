package com.eln365.exam.web.questionBank;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.eln365.exam.model.Tree;
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
	
	
	public void generateTree(){
		List<Tree> treeList = new ArrayList<Tree>();
		
		Tree tree1 = new Tree();
		
		tree1.setId("1");
		tree1.setName("test1");
		tree1.setIsDir(true);
		
		Tree tree2 = new Tree();
		tree2.setId("2");
		tree2.setName("test2");
		tree2.addChild(tree1);
		treeList.add(tree2);
		
		JSONArray json = JSONArray.fromObject(treeList);
		
		writeToRespone(json.toString());
	}
}
