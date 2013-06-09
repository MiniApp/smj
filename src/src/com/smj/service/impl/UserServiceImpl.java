package com.smj.service.impl;

import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.service.IUserService;
import com.smj.util.Common;
import com.smj.util.Serializer;
import com.smj.util.SessionFactory;

public class UserServiceImpl extends HibernateDaoSupport implements IUserService{
	private String[] cacheNames = {};
	private static final Log log = LogFactory.getLog(UserServiceImpl.class);
			
			
	public void updateCache() throws Exception {
		try {
			for (String cacheName : cacheNames) {
				Method method = this.getClass().getMethod(cacheName + "_cache");
				method.invoke(this);
			}
		} catch (Exception e) {
			String message = e.getMessage();
			if (message == null) {
				message = e.getCause().getMessage();
			}
			throw new Exception("All the cache update fails!<br>" + message);
		}
	}
	public void config_cache()  {
		 
			config_cache(true);
	 
	}
	public void config_cache(boolean updateData) {
		if (updateData) {
			String mail = Common.getData("mail");
			cache_write("cache_mail", "globalMail", Serializer.unserialize(mail, false));
		}
	}
	/**
	 * 添加/更新SESSION记录
	 */
	public void insertSession(HttpServletRequest request, HttpServletResponse response,
			Map<String, Object> sGlobal,Map user) {
		int timestamp = (Integer) sGlobal.get("timestamp");
//		dataBaseDao.executeUpdate("REPLACE INTO snack_session (id,username,password,lastactivity,ip,name,integral,rank) VALUES ("+user.get("id")+",'"+user.get("username")
//				+"','"+user.get("password")+"',"+timestamp+",'"+Common.getOnlineIP(request)+"','"+user.get("name")+"',"+user.get("integral")+","+user.get("rank")+")");
		sGlobal.put("sugu_uid", user.get("id"));
		sGlobal.put("sugu_name", user.get("name"));
		sGlobal.put("sugu_integral", user.get("integral"));
		sGlobal.put("sugu_rank", user.get("rank"));
	}
	/**
	 * 写JSP缓存文件
	 * @param fileName
	 * @param var
	 * @param values
	 */
	public void cache_write(String fileName, String var, Map values)  {
//		String cachePath = JavaCenterHome.jchRoot + "data/cache/" + fileName + ".jsp";
		StringBuffer cacheContent = new StringBuffer();
		cacheContent.append("<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"");
//		cacheContent.append(JavaCenterHome.JCH_CHARSET);
		cacheContent.append("\"%>\n");
		cacheContent.append("<%\n");
		cacheContent.append(arrayeval(var, values, 0));
		cacheContent.append("request.setAttribute(\"" + var + "\"," + var + ");\n");
		cacheContent.append("%>");
//		if (!FileHelper.writeFile(cachePath, cacheContent.toString())) {
//			throw new IOException("File: " + cachePath + " write error.");
//		}
	}
	public String arrayeval(String var, Map values, int level) {
		StringBuffer space = new StringBuffer();
		for (int i = 0; i < level; i++) {
			space.append("\t");
		}
		StringBuffer curdata = new StringBuffer();
		if (values instanceof LinkedHashMap) {
			curdata.append("Map " + var + "= new LinkedHashMap();\n");
		} else {
			curdata.append("Map " + var + "= new HashMap();\n");
		}
		Object keyTemp = null;
		String valTemp = null;
		Set<Object> keys = values.keySet();
		for (Object key : keys) {
			Object val = values.get(key);
			if (key instanceof String) {
				keyTemp = "\"" + key + "\"";
			} else {
				keyTemp = key;
			}
			boolean isMap = val instanceof Map;
			if (isMap) {
				String temp = key.toString();
				String varTemp = var + temp.substring(0, 1).toUpperCase() + temp.substring(1);
				curdata.append(space);
				curdata.append("\t");
				curdata.append(arrayeval(varTemp, (Map) val, level + 1));
				curdata.append(space);
				curdata.append(var + ".put(" + keyTemp + "," + varTemp + ");\n");
			} else {
				valTemp = val.toString();
//				if (!valTemp.matches("^\\-?\\d+$") || Common.strlen(valTemp) > 12) {
//					valTemp = Common.addSlashes(valTemp);
//					valTemp = valTemp.replaceAll("\r\n", "\\\\r\\\\n");
//					val = "\"" + valTemp + "\"";
//				}
				curdata.append(space);
				curdata.append(var + ".put(" + keyTemp + "," + val + ");\n");
			}
		}
		return curdata.toString();
	}
	
	 public List findByName(String instanceName, int value) {
 
	
		List list = null;
		try{
	
			String queryString = "from "+instanceName+" as model where model.userId = ?";
			Query query = this.getSession().createQuery(queryString);
			query.setParameter(0, value);
			
			list = query.list();
	
		}catch(Exception ex){
			
			log.error("在执行AdminServiceImpl类中的adminLogin方法时出错：\n");
			ex.printStackTrace();
		}
		return list;
	}
}
