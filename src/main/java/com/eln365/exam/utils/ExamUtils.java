package com.eln365.exam.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
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

	public static List<String> generateRandomList(List<String> idList, int randomCount) {
		if (randomCount >= idList.size())
			return idList;

		List<String> randomList = new ArrayList<String>();

		Map<Integer, Integer> indexMap = new HashMap<Integer, Integer>();
		int idListSize = idList.size();
		for (int i = 0; i < idListSize; i++) {
			indexMap.put(i, i);
		}
		Random random = new Random(System.currentTimeMillis());
		for (int i = 0; i < randomCount; i++) {
			randomList.add(generateRandom(indexMap, idList, random));
		}

		return randomList;
	}

	public static String convertINpara(List<String> idList) {
		return "('" + StringUtils.join(idList.toArray(new String[] {}), "','") + "')";
	}

	private static String generateRandom(Map<Integer, Integer> indexMap, List<String> idList, Random random) {
		int randomInt = random.nextInt(idList.size());
		if (indexMap.get(randomInt) == null) {
			return generateRandom(indexMap, idList, random);
		} else {
			indexMap.remove(randomInt);
		}
		return idList.get(randomInt);
	}
	
	
	public static String getCurrentDateStr(){
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		return format.format(new Date());
	}
	
	
	public static void main(String args[]){
		System.out.println(getCurrentDateStr());
	}

}
