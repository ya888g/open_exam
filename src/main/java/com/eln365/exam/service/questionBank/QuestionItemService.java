package com.eln365.exam.service.questionBank;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.eln365.exam.model.questionBank.QuestionItem;
import com.eln365.exam.model.questionBank.QuestionItemOptions;

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
	
	public void insertQuestionItem(QuestionItem qi,List<QuestionItemOptions> questionItemOptionsList) {
		StringBuilder sql = new StringBuilder();
		sql.append(" insert into questionitem values( ?,?,?,?,?,?,?,?,?,?,? ) ");
		jdbcTemplate.update(sql.toString(), qi.getId(), qi.getType(), qi.getCount(), qi.getQuestionBank(), qi.getScore()
				,qi.getDifficulty(),qi.getContent(),qi.getOptions(),qi.getStatus(),qi.getCreateTime(),qi.getUpdateTime());
		
		StringBuilder optionsSql= new StringBuilder();
		optionsSql.append(" insert into questionitemoptions values( ?,?,?,?,?,? ) ");
		for(QuestionItemOptions qio:questionItemOptionsList){
			jdbcTemplate.update(optionsSql.toString(),qio.getId(),qio.getOptions(),qio.getOptionsContent(),qio.getItemId(),qio.getCreateTime(),qio.getUpdateTime());
		}
		
	}
	
	public void updateQuestionItem(QuestionItem qi,List<QuestionItemOptions> questionItemOptionsList){
		StringBuilder updatesql = new StringBuilder();
		updatesql.append(" update questionitem set type =? ,count=? ,questionBank=? ,score=? ,difficulty=? ,content=? ,answer =? ,updateTime=? where id=? ");
		jdbcTemplate.update(updatesql.toString(), qi.getType(), qi.getCount(), qi.getQuestionBank(), qi.getScore()
				,qi.getDifficulty(),qi.getContent(),qi.getOptions(),qi.getUpdateTime(),qi.getId());
		
		jdbcTemplate.update(" delete from questionitemoptions where itemId=? ",qi.getId());
		
		StringBuilder optionsSql= new StringBuilder();
		optionsSql.append(" insert into questionitemoptions values( ?,?,?,?,?,? ) ");
		for(QuestionItemOptions qio:questionItemOptionsList){
			jdbcTemplate.update(optionsSql.toString(),qio.getId(),qio.getOptions(),qio.getOptionsContent(),qio.getItemId(),qio.getCreateTime(),qio.getUpdateTime());
		}
		
	}
	
	public void deleteItem(String id){
		jdbcTemplate.update(" delete from questionitemoptions where itemId=? ",id);
		jdbcTemplate.update(" delete from questionitem where id=? ",id);
	}
	
	public QuestionItem queryById(String id) {
		QuestionItem questionItem = null;
		List<QuestionItem> questionBankList = jdbcTemplate.query(" select * from questionitem where id = ? ", new Object[] { id }, new BeanPropertyRowMapper<QuestionItem>(QuestionItem.class));
	
		List<QuestionItemOptions> QuestionItemOptionsList = jdbcTemplate.query(" select * from questionitemoptions where itemId = ? ", new Object[] { id }, new BeanPropertyRowMapper<QuestionItemOptions>(QuestionItemOptions.class));
	
		if(questionBankList!=null && questionBankList.size()>0){
			questionItem = questionBankList.get(0);
			for(QuestionItemOptions questionItemOptions:QuestionItemOptionsList){
				if("A".equals(questionItemOptions.getOptions())){
					questionItem.setAnswerA(questionItemOptions.getOptionsContent());
				}else if("B".equals(questionItemOptions.getOptions())){
					questionItem.setAnswerB(questionItemOptions.getOptionsContent());
				}else if("C".equals(questionItemOptions.getOptions())){
					questionItem.setAnswerC(questionItemOptions.getOptionsContent());
				}else if("D".equals(questionItemOptions.getOptions())){
					questionItem.setAnswerD(questionItemOptions.getOptionsContent());
				}else if("E".equals(questionItemOptions.getOptions())){
					questionItem.setAnswerE(questionItemOptions.getOptionsContent());
				}else if("F".equals(questionItemOptions.getOptions())){
					questionItem.setAnswerF(questionItemOptions.getOptionsContent());
				}
			}
		}
		
		return questionItem;
	
	}
	
}
