package com.eln365.exam.web.user;

import java.util.Collection;
import java.util.Date;

import com.eln365.exam.model.user.User;
import com.eln365.exam.service.user.UserService;
import com.eln365.exam.utils.ExamUtils;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author yangqinglei E-mail: yangqinglei@gw.com.cn
 * @version 创建时间：2014-1-10 下午3:28:39 类说明
 */
@SuppressWarnings("serial")
public class UserAction extends ActionSupport {
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String login() {
		return "login";
	}

	public String index() {
		User user = new User();

		user.setId(ExamUtils.getUUID());
		user.setPassword(ExamUtils.getMd5Str("123456"));
		user.setRealName("杨庆雷");
		user.setUserName("ya888g");
		user.setBirthday(new Date());
		user.setEmail("ya888g@163.com");
		user.setMobile("13816960246");
		user.setSex(1);

		userService.saveUser(user);
		return "index";
	}
}
