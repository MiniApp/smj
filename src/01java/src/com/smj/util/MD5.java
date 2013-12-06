package com.smj.util;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @Title: MD5加密算法（不可逆）
 * @Company: 数谷科技
 * @author Fengyu
 */
public class MD5 {
	private static final Log log = LogFactory.getLog(MD5.class);
	/**
	 * 获得字符串MD5加密值
	 * @param _str 待加密字符串
	 * @return
	 */
	public final static String getMD5(String _str){
		if(_str==null || "".equals(_str.trim())) return "";
		char hexDigits[] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
		try {
			byte[] strTemp = _str.trim().getBytes(JavaCenterHome.JCH_CHARSET);
			MessageDigest mdTemp = MessageDigest.getInstance("MD5");
			mdTemp.update(strTemp);
			byte[] md = mdTemp.digest();
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
				str[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(str);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void main(String []args){   
		System.out.println(Common.getCurrentDate("yyyyMMddss"));
	}
}
