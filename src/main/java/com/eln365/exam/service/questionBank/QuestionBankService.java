package com.eln365.exam.service.questionBank;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.eln365.exam.model.questionBank.QuestionBank;

/**
 * 
 * @email: ya888g@163.com @company: eln365.com
 * 
 * @author: 时光倒流 @date：2014-1-25下午11:40:11
 */
public class QuestionBankService {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public Integer queryQuestionBankList(String typeId) {
		List<Object> paraList = new ArrayList<Object>();
		StringBuilder sql = new StringBuilder();
		sql.append(" select count(*) from questionBank where 1=1 ");
		if (StringUtils.isNotEmpty(typeId)) {
			sql.append("  and typeId = ? ");
			paraList.add(typeId);
		}

		return jdbcTemplate.queryForInt(sql.toString(), paraList.toArray());
	}

	public List<QuestionBank> queryQuestionBankList(String typeId, Integer page, Integer rows) {
		List<Object> paraList = new ArrayList<Object>();
		StringBuilder sql = new StringBuilder();
		sql.append(" select *  from questionBank where 1=1   ");
		if (StringUtils.isNotEmpty(typeId)) {
			sql.append("  and typeId = ? ");
			paraList.add(typeId);
		}
		sql.append("  limit ? , ? ");
		paraList.add((page-1)*rows);
		paraList.add(rows);

		return jdbcTemplate.query(sql.toString(), paraList.toArray(), new BeanPropertyRowMapper<QuestionBank>(QuestionBank.class));
	}

	public QuestionBank queryById(String id) {
		List<QuestionBank> questionBankList = jdbcTemplate.query(" select * from questionBank where id = ? ", new Object[] { id }, new BeanPropertyRowMapper<QuestionBank>(QuestionBank.class));
		return questionBankList.size() > 0 ? questionBankList.get(0) : null;
	}

	public void insert(QuestionBank questionBank) {
		StringBuilder sql = new StringBuilder();
		sql.append(" insert into questionBank values( ?,?,?,?,? ) ");
		jdbcTemplate.update(sql.toString(), questionBank.getId(), questionBank.getNo(), questionBank.getName(), questionBank.getDescription(), questionBank.getTypeId());
	}

	public void update(QuestionBank questionBank) {
		StringBuilder sql = new StringBuilder();
		sql.append(" update questionBank set no=? ,name=?,description=?,typeId=? where id= ? ");
		jdbcTemplate.update(sql.toString(), questionBank.getNo(), questionBank.getName(), questionBank.getDescription(), questionBank.getTypeId(), questionBank.getId());
	}
	
	public void delete(String id){
		StringBuilder sql = new StringBuilder();
		sql.append(" delete from questionBank where id= ? ");
		jdbcTemplate.update(sql.toString(), id);
	}

}
