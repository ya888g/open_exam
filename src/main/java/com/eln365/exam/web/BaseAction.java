package com.eln365.exam.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.eln365.exam.model.EasyUICombobox;
import com.eln365.exam.model.user.User;
import com.opensymphony.xwork2.ActionContext;
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
		HttpServletResponse response = (HttpServletResponse) ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
		return response;
	}

	public User getSessionUser() {
		return (User) request.getSession().getAttribute("gwuser");
	}

	public void writeToRespone(String jsonStr) {
		HttpServletResponse response = getResponse();

		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(jsonStr.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null)
				out.close();
		}

	}

	public String appengTreeLeafStr(String parentStr, String currentId) {
		return parentStr + currentId + ".";
	}

	public String generateSingleJson(String str) {
		if (StringUtils.isEmpty(str))
			str = "success";
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", str);
		return jsonObject.toString();
	}
	
	public String generateJson(Object object){
		String json = JSONObject.fromObject(object).toString();
		return json;
	}
	
	public String queryEasyUICombobox(){
		String questionItem = "[{\"value\":\"1\",\"text\":\"单选题\"},{\"value\":\"2\",\"text\":\"多选题\"}]";
		return questionItem;
	}
	

	// public Map getSession() {
	// return session;
	// }

}
