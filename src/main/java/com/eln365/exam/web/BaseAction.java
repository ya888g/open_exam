package com.eln365.exam.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.eln365.exam.model.user.User;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @email: ya888g@163.com @company: eln365.com
 * @author: 时光倒流 @date：2014-1-11上午12:32:28
 */
public class BaseAction extends ActionSupport implements ServletRequestAware, ServletResponseAware {

	private static final long serialVersionUID = 6522444180007032632L;

	protected HttpServletRequest request;
	protected HttpServletResponse response;

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}


	public HttpServletRequest getRequest() {
		return request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public User getSessionUser() {
		return (User) request.getSession().getAttribute("gwuser");
	}

	// public Map getSession() {
	// return session;
	// }

}
