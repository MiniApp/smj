package com.smj.util;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * @Title: Base64加密算法（可逆）
 * @Company: 数谷科技
 * @author Fengyu
 */
public class Base64{
	private static final Log log = LogFactory.getLog(Base64.class);
	/**
	 * 字符串Base64加密
	 * @param _str 待加密字符串
	 * @param _base64Key 密钥
	 * @return
	 */
	public static String encryptStringBase64(String _str, String _base64Key) {
	    try {
	    	BASE64Decoder dec = new BASE64Decoder();
	    	byte[] key = dec.decodeBuffer(_base64Key);
	    	SecretKeySpec k = new SecretKeySpec(key, "DESede");
	    	Cipher cp = Cipher.getInstance("DESede");
	    	cp.init(Cipher.ENCRYPT_MODE, k);
	    	byte[] b = _str.getBytes("UTF8");
	    	byte[] b2 = cp.doFinal(b);
	    	BASE64Encoder enc = new BASE64Encoder();
	    	return enc.encodeBuffer(b2);
	    }catch(Exception e) {
	    	log.error("字符串Base64加密异常");
	    	e.printStackTrace();
	    	return null;
	    }
	}
	/**
	 * 字符串Base64解密
	 * @param _base64Str 待解密字符串
	 * @param _base64Key 密钥
	 * @return
	 */
	public static String decryptStringBase64(String _base64Str, String _base64Key) {
	    try {
	    	BASE64Decoder dec = new BASE64Decoder();
	    	byte[] kb = dec.decodeBuffer(_base64Key);
	    	SecretKeySpec k = new SecretKeySpec(kb, "DESede");
	    	Cipher cp = Cipher.getInstance("DESede");
	    	cp.init(Cipher.DECRYPT_MODE, k);
	    	byte[] c = dec.decodeBuffer(_base64Str);
	    	byte[] b = cp.doFinal(c);
	    	return new String(b, "UTF8");
	    }catch(Exception e) {
	    	log.error("字符串Base64解密异常");
	    	e.printStackTrace();
	    	return null;
	    }
	 }
	
	public static void main(String[]args){
		System.out.println(Base64.encryptStringBase64("12345", "mMu6CHXEy3MldhN2nl2AmObIkfgWOzJM"));
		System.out.println(Base64.decryptStringBase64("Zns7c9V3UnY=", "mMu6CHXEy3MldhN2nl2AmObIkfgWOzJM"));
	}
}
