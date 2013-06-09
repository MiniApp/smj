package com.smj.web.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.smj.orm.Users;
import com.smj.service.impl.UserServiceImpl;
import com.smj.util.Common;
import com.smj.util.CookieHelper;


public class CommonFilter implements Filter {
 

	
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> sGlobal = new HashMap<String, Object>();//全局参数
		long currentTime = System.currentTimeMillis();//时间戳
		int timestamp = (int) (currentTime / 1000);//秒数
		sGlobal.put("timestamp", timestamp);
		sGlobal.put("starttime", currentTime);
		request.setAttribute("sGlobal", sGlobal);
		Map<String, String> sCookie = CookieHelper.getCookies(request);//cookie信息
		request.setAttribute("sCookie", sCookie);
//		String jchRoot = JavaCenterHome.jchRoot;
//		try {
//			File configFile = new File(jchRoot + "data/cache/cache_config.jsp");
//			if (!configFile.exists()) {
//				userService.updateCache();
//			}
//			//request.getRequestDispatcher("/data/cache/cache_config.jsp").include(request, response);
//		} catch (Exception e) {
//			response.getWriter().write(e.getMessage());
//			return;
//		}
//		Map<String, String> jchConfig = JavaCenterHome.jchConfig;
//		request.setAttribute("picUrl", jchConfig.get("picUrl"));
		//if (SessionFactory.getSessionFactory() == null) {
			//SessionFactory.buildSessionFactory();
		//}
//		Map<String, String> sysDictionary = JavaCenterHome.sysDictionary;//系统字典
//		if (sysDictionary.isEmpty()) {
//			try {
//				List<Map<String, Object>> dictionarys = dataBaseService.executeQuery("SELECT keyname,value FROM snack_dictionary");
//				for(Map<String, Object> dic:dictionarys){
//					String key = dic.get("keyname").toString();
//					String value = dic.get("value").toString();
//					sysDictionary.put(key, value);
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//				return;
//			}
//		}

		checkAuth(request, response, sGlobal, sCookie);
		chain.doFilter(req, res);
	}
	@SuppressWarnings("unchecked")
	private void checkAuth(HttpServletRequest request, HttpServletResponse response, Map<String, Object> sGlobal, Map<String, String> sCookie){
		String username = null;
		String name = null;
		Integer integral = 0;
		String smj = sCookie.get("smj");
//		Users user = (Users)request.getSession().getAttribute("user");
//		if(user==null){
			if (smj!=null && smj.length()>0) {
				String[] values = Common.authCode(smj, "DECODE", null, 0).split("\t");
				if (values.length > 1) {
					String password = values[0];
					int userid = Common.intval(values[1]);
					if (password.length() > 0 && userid > 0) {
						int timestamp = (Integer) sGlobal.get("timestamp");
						ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
						UserServiceImpl userService = (UserServiceImpl)ac.getBean("userService");
						List list = userService.findByName("Users", userid);
						if(list.size()>0){					
							Users user =  (Users)list.get(0);
							if (((String) user.getUserPwd()).equals(password)) {
								username =   user.getUsername();
								name =  user.getName();
								integral =  user.getIntegral();
								sGlobal.put("smj_username", Common.addSlashes(username));
								sGlobal.put("smj_name", name);
								if(integral!=null)
								sGlobal.put("smj_integral", integral.intValue());
								sGlobal.put("smj_rank",user.getUserRank());			
								request.getSession().setAttribute("user", user);
							} else {
								userid = 0;
							}
						}
					} else {
						userid = 0;
					}
					sGlobal.put("smj_userid", userid);
				}
			}
//		}else{
//			sGlobal.put("smj_userid",user.getUserId());
//			username =   user.getUsername();
//			name =  user.getName();
//			integral =  user.getIntegral();
//			sGlobal.put("smj_username", Common.addSlashes(username));
//			sGlobal.put("smj_name", name);
//			if(integral!=null)
//			sGlobal.put("smj_integral", integral.intValue());
//			sGlobal.put("smj_rank",user.getUserRank());
////			request.getSession().setAttribute("user", user);
//			
//		}
		if (Common.empty(sGlobal.get("smj_userid"))) {
			CookieHelper.clearCookie(request, response);
		} 
	}
	public void destroy(){}
	public void init(FilterConfig filterConfig) throws ServletException {}
}