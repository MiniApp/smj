package com.smj.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * COOKIE操作类
 */
public class CookieHelper {
	/**
	 * 获得客户端COOKIE信息
	 * @param request
	 * @return
	 */
	public static Map<String, String> getCookies(HttpServletRequest request) {
		Map<String, String> sCookie = new HashMap<String, String>();
		Cookie[] cookies = request.getCookies();//获得客户端cookie
		if (cookies != null) {
			Map<String, String> jchConfig = JavaCenterHome.jchConfig;
			String cookiePre = jchConfig.get("cookiePre");//cookie头
			if(cookiePre!=null){
			int prelength = Common.strlen(cookiePre);
			for (Cookie cookie : cookies) {
				String name = cookie.getName();
				if (name.startsWith(cookiePre)) {//是否本站cookie
					sCookie.put(name.substring(prelength), Common.urlDecode(Common.addSlashes(cookie.getValue())));
				}
			}
			}
		}
		return sCookie;
	}
	/**
	 * 移除COOKIE信息
	 */
	public static void removeCookie(HttpServletRequest request, HttpServletResponse response, String key) {
		setCookie(request, response, key, "", 0);
	}
	/**
	 * 设置当前COOKIE信息
	 */
	public static void setCookie(HttpServletRequest request, HttpServletResponse response, String key,
			String value) {
		setCookie(request, response, key, value, -1);
	}
	/**
	 * cookie信息写到客户端
	 */
	public static void setCookie(HttpServletRequest request, HttpServletResponse response, String key,
			String value, int maxAge) {
		Map<String, String> jchConfig = JavaCenterHome.jchConfig;
		Cookie cookie = new Cookie(jchConfig.get("cookiePre") + key, Common.urlEncode(value));
		cookie.setMaxAge(maxAge);
		cookie.setPath(jchConfig.get("cookiePath"));
		if (!Common.empty(jchConfig.get("cookieDomain"))) {
			cookie.setDomain(jchConfig.get("cookieDomain"));
		}
		cookie.setSecure(request.getServerPort() == 443 ? true : false);
		response.addCookie(cookie);
	}
	/**
	 * 清除cookie信息
	 */
	public static void clearCookie(HttpServletRequest request, HttpServletResponse response) {
		removeCookie(request, response, "smj");
		Map<String, Object> sGlobal = (Map<String, Object>) request.getAttribute("sGlobal");
		sGlobal.put("smj_userid", 0);
	}
}
