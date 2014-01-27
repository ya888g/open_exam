package com.eln365.exam.web.exam;

import com.eln365.exam.service.exam.ExamService;

/**
 * @email: ya888g@163.com @company: eln365.com
 * @author: 时光倒流 @date：2014-1-25下午11:40:52 类说明
 */
public class ExamAction {
	private ExamService examService;

	public ExamService getExamService() {
		return examService;
	}

	public void setExamService(ExamService examService) {
		this.examService = examService;
	}

	public String query() {
		return "query";
	}

}
