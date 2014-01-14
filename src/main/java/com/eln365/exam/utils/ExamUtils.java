package com.eln365.exam.utils;

import java.util.UUID;

import org.springframework.util.DigestUtils;

/**
 * 
 * @email: ya888g@163.com @company: eln365.com
 * 
 * @author: 时光倒流 @date：2014-1-11上午12:32:28
 */

public class ExamUtils {
	public synchronized static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}

	public static String getMd5Str(String para) {
		return DigestUtils.md5DigestAsHex(para.getBytes());
	}

}
