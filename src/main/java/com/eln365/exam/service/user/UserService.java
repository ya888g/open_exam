package com.eln365.exam.service.user;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.eln365.exam.model.user.User;

/**
 * 
 * @email: ya888g@163.com @company: eln365.com
 * 
 * @author: 时光倒流 @date：2014-1-11上午12:32:28
 */
public class UserService {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public User getUser(String userName,String password){
		List<User> UserList = jdbcTemplate.query(" select * from user where userName=? AND password=? ", new Object[]{userName, password}, new BeanPropertyRowMapper<User>(User.class));
		return UserList.size()>0?UserList.get(0):null;
	}

	public void saveUser(User user) {
		StringBuilder sql = new StringBuilder();
		sql.append(" insert into user values( ?,?,?,?,?,?,?,? ) ");
		jdbcTemplate.update(sql.toString(), user.getId(), user.getPassword(), user.getUserName(), user.getRealName(), user.getSex(), user.getBirthday(), user.getEmail(), user.getMobile());
	
	}
}
