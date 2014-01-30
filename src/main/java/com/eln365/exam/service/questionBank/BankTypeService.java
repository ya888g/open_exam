package com.eln365.exam.service.questionBank;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.eln365.exam.model.Tree;
import com.eln365.exam.model.QuestionBank.BankType;
import com.eln365.exam.utils.ExamUtils;

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
		List<BankType> bankTypeList = jdbcTemplate.query(" select * from questiontype order by typeStr ", new Object[] {}, new BeanPropertyRowMapper<BankType>(BankType.class));
		return bankTypeList;
	}

	public BankType queryById(String id) {
		List<BankType> bankTypeList = jdbcTemplate.query(" select * from questiontype where id = ? ", new Object[] { id }, new BeanPropertyRowMapper<BankType>(BankType.class));
		return bankTypeList.size() > 0 ? bankTypeList.get(0) : null;
	}

	public void insert(BankType bankType) {
		StringBuilder sql = new StringBuilder();
		sql.append(" insert into questiontype values( ?,?,?,? ) ");
		jdbcTemplate.update(sql.toString(), bankType.getId(), bankType.getNo(), bankType.getName(),bankType.getTypeStr());
	}

	public void update(BankType bankType) {
		StringBuilder sql = new StringBuilder();
		sql.append(" update questiontype set no=? ,name=?,typeStr=? where id= ? ");
		jdbcTemplate.update(sql.toString(), bankType.getNo(), bankType.getName(), bankType.getTypeStr(), bankType.getId());
	}

	public String generateToTree() {
		List<BankType> bankTypeList = queryBankTypeList();

		ArrayDeque<Tree> stack = new ArrayDeque<Tree>();
		BankType bankType = bankTypeList.get(0);
		Tree treeFirst = new Tree();
		treeFirst.setId(bankType.getId());
		treeFirst.setName(bankType.getName());
		stack.push(treeFirst);
		while (!stack.isEmpty()) {
			Tree tree = stack.pop();
			List<Tree> childTreeList = getChildList(bankTypeList, tree.getId());
			tree.setChildren(childTreeList);
			int childListSize = childTreeList.size();
			for (int i = 0; i < childListSize; i++) {
				stack.push(childTreeList.get(childListSize - i - 1));
			}
		}

		return JSONObject.fromObject(treeFirst).toString();
	}

	public List<Tree> getChildList(List<BankType> bankTypeList, String parentId) {
		List<Tree> childList = new ArrayList<Tree>();
		String[] currentTypeStr = null;
		for (int i = 1; i < bankTypeList.size(); i++) {
			BankType bankType = bankTypeList.get(i);
			currentTypeStr = bankType.getTypeStr().split("\\.");
			if (currentTypeStr[currentTypeStr.length - 2].equals(parentId)) {
				Tree tree = new Tree();
				tree.setId(bankType.getId());
				tree.setName(bankType.getName());
				childList.add(tree);
			}

		}
		return childList;
	}

	public static void main(String args[]) {
		new BankTypeService().generateToTree();
	}

}
