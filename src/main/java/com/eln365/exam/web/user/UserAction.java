package com.eln365.exam.web.user;

import java.util.Date;

import javax.servlet.http.HttpSession;

import com.eln365.exam.model.user.User;
import com.eln365.exam.service.user.UserService;
import com.eln365.exam.utils.ExamUtils;
import com.eln365.exam.web.BaseAction;

/**
 * 
 * @email: ya888g@163.com @company: eln365.com
 * 
 * @author: 时光倒流 @date：2014-1-11上午12:32:28
 */
@SuppressWarnings("serial")
public class UserAction extends BaseAction {
	public static final String USER_SESSION_KEY = "gwuser";
	private User user;
	private UserService userService;

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String login() {
		String userName = user.getUserName();
		String password = user.getPassword();

		User user = userService.getUser(userName, password);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute(USER_SESSION_KEY, user);
			return "main";
		} else {
			request.setAttribute("message", "用户名或密码不正确！");
			return "login";
		}

	}

	public String index() {
		User user = new User();

		user.setId(ExamUtils.getUUID());
		user.setPassword(ExamUtils.getMd5Str("123456"));
		user.setRealName("时光倒流");
		user.setUserName("ya888g");
		user.setBirthday(new Date());
		user.setEmail("ya888g@163.com");
		user.setMobile("13816960246");
		user.setSex(1);

		userService.saveUser(user);
		return "index";
	}
}
