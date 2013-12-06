package com.smj.util;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
public final class JavaCenterHome {
	public static final String JCH_CHARSET = "GBK";//编码
	public static final String JCH_VERSION = "1.0";//版本号
	public static String jchRoot = null;//系统跟路径
	public static Map<String, String> jchConfig = new HashMap<String, String>();//系统配置
	public static Map<String, String> sysDictionary = new HashMap<String, String>();//系统字典
	
	
	static{
		jchConfig.put("cookiePre", "smj");
        //jchConfig.put("cookiePath", "/");
        //jchConfig.put("cookieDomain",".5smj.com");
		jchConfig.put("KEY", "smj");
		jchConfig.put("emailHost","smtp.exmail.qq.com");
		jchConfig.put("emailPort", "25");
		jchConfig.put("emailUsername","service@sunbyway.com");
		jchConfig.put("emailPassword","6s8j3$KF9#sjGC");
	}	/**	 * 设置系统绝对路径	 */
	public static void setJchRoot(HttpServletRequest request) {
		jchRoot = request.getSession().getServletContext().getRealPath("/");
		if (jchRoot == null) {
			try {
				jchRoot = request.getSession().getServletContext().getResource("/").getPath();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//if (!jchRoot.endsWith("/"))jchRoot = jchRoot + "\\";
	}
}