package com.eln365.exam.service.questionBank;

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
	
	public List<BankType> queryBankTypeList(){
		List<BankType> bankTypeList = jdbcTemplate.query(" select * from questiontype order typeStr ", new Object[]{}, new BeanPropertyRowMapper<BankType>(BankType.class));
		return bankTypeList;
	}
	
	public String generateToTree(){
		List<BankType> bankTypeList = queryBankTypeList();
		BankType bankType =bankTypeList.get(0);
		Tree tree = new Tree();
		tree.setId(bankType.getId());
		tree.setName(bankType.getName());
		generateTree(tree, bankType.getTypeStr().split("\\.").length, bankTypeList);
		
		return null;
	}
	
	public void generateTree(Tree tree,int strLength,List<BankType> bankTypeList){
		
	}
	
	
}
