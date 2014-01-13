package com.eln365.exam.utils;

import java.util.UUID;

/** 
 * @author yangqinglei E-mail: yangqinglei@gw.com.cn
 * @version 创建时间：2014-1-13 下午2:50:51 
 * 类说明
 */
public class ExamUtils {
	public synchronized static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
}
