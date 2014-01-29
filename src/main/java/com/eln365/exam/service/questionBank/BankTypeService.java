package com.eln365.exam.service.questionBank;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.eln365.exam.model.Tree;
import com.eln365.exam.model.QuestionBank.BankType;

/**
 * 
 * @email: ya888g@163.com @company: eln365.com
 * 
 * @author: 时光倒流 @date：2014-1-25下午11:40:11
 */
public class BankTypeService {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<BankType> queryBankTypeList() {
		List<BankType> bankTypeList = jdbcTemplate.query(
				" select * from questiontype order typeStr ", new Object[] {},
				new BeanPropertyRowMapper<BankType>(BankType.class));
		return bankTypeList;
	}

	public String generateToTree() {
		List<BankType> bankTypeList = queryBankTypeList();
		List<Tree> treeList = new ArrayList<Tree>();
		Tree tree = null;
		for(BankType bankType:bankTypeList){
			tree = new Tree();
			tree.setId(id);
			tree.setName(name);
			tree.addChild(ct);
			tree.setChildren(children);
		}

		return null;
	}

	public List<Tree> getChildList(List<BankType> bankTypeList, BankType parentBankType) {
		List<Tree> childList = new ArrayList<Tree>();
		String[] parentTypeStr = parentBankType.getTypeStr().split("\\.");
		String[] currentTypeStr = null;
		for (BankType bankType : bankTypeList) {
			currentTypeStr = bankType.getTypeStr().split("\\.");
			if(parentTypeStr.length>=currentTypeStr.length)
				break;
			if(currentTypeStr[currentTypeStr.length-2]==parentTypeStr[parentTypeStr.length-1]){
				Tree tree = new Tree();
				tree.setId(id);
				tree.setName(name);
				
			}
				childList.add(bankType);
		}
	}

}
