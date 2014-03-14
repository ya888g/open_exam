package com.eln365.exam.service.questionBank;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.eln365.exam.model.questionBank.QuestionItem;

/**
 * 
 * @email: ya888g@163.com @company: eln365.com
 * 
 * @author: 时光倒流 @date：2014-1-25下午11:40:11
 */
public class QuestionItemService {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public Integer queryQuestionItemList() {
		List<Object> paraList = new ArrayList<Object>();
		StringBuilder sql = new StringBuilder();
		sql.append(" select count(*) from questionItem where 1=1 ");
		/*if (StringUtils.isNotEmpty(typeId)) {
			sql.append("  and typeId = ? ");
			paraList.add(typeId);
		}*/

		return jdbcTemplate.queryForInt(sql.toString(), paraList.toArray());
	}

	public List<QuestionItem> queryQuestionItemList( Integer page, Integer rows) {
		List<Object> paraList = new ArrayList<Object>();
		StringBuilder sql = new StringBuilder();
		sql.append(" select *  from questionItem where 1=1   ");
		/*if (StringUtils.isNotEmpty(typeId)) {
			sql.append("  and typeId = ? ");
			paraList.add(typeId);
		}*/
		sql.append("  limit ? , ? ");
		paraList.add((page-1)*rows);
		paraList.add(rows);

		return jdbcTemplate.query(sql.toString(), paraList.toArray(), new BeanPropertyRowMapper<QuestionItem>(QuestionItem.class));
	}
	
}
