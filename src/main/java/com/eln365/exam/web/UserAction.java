package com.eln365.exam.web;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author yangqinglei E-mail: yangqinglei@gw.com.cn
 * @version 创建时间：2014-1-10 下午3:28:39 类说明
 */
@SuppressWarnings("serial")
public class UserAction extends ActionSupport {
	public String login() {
		return "login";
	}
	
	public String index() {

		return "index";
	}
}
