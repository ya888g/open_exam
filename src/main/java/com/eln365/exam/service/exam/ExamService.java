package com.eln365.exam.service.exam;

import org.springframework.jdbc.core.JdbcTemplate;

/**
 * @email: ya888g@163.com @company: eln365.com
 * @author: 时光倒流 @date：2014-1-25下午11:40:52
 * 类说明
 */
public class ExamService {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
}
