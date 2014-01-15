package com.eln365.exam.web;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * 
 * @email: ya888g@163.com @company: eln365.com
 * 
 * @author: 时光倒流 @date：2014-1-11上午12:32:28
 */
public class OpenExamPerRquestFilter extends OncePerRequestFilter {
	public static final String USER_SESSION_KEY = "openExamUser";
	private static final Logger logger = Logger.getLogger(OpenExamPerRquestFilter.class);

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
		StringBuffer URL = request.getRequestURL();
		if (URL.indexOf("/login.jsp") >= 0 || URL.indexOf("/login.jhtml") >= 0 || URL.indexOf("/logout.jhtml") >= 0) {
			filterChain.doFilter(request, response);
			return;
		}

		HttpSession session = request.getSession();
		if (session == null || session.getAttribute(USER_SESSION_KEY) == null) {
			String requestType = request.getHeader("X-Requested-With");
			if (!StringUtils.isEmpty(requestType) && requestType.equalsIgnoreCase("XMLHttpRequest")) {
				response.setHeader("sessionstatus", "timeout");
				response.sendError(518, "session timeout.");
				logger.error("login timeout, logout.....");
				return;
			} else {
				response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
				return;
			}
		}

		filterChain.doFilter(request, response);
		return;
	}
}
