package com.smj.service.impl;

import java.lang.reflect.Method;
import java.util.ArrayList;
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
import org.springframework.stereotype.Service;

import com.smj.orm.Cateory;
import com.smj.orm.Cust_info;
import com.smj.orm.Leaveword;
import com.smj.orm.Region;
import com.smj.orm.UserAddress;
import com.smj.orm.UserSession;
import com.smj.orm.Leaveword;
import com.smj.service.IUserService;
import com.smj.util.Common;
import com.smj.util.Serializer;
import com.smj.util.SessionFactory;

@Service("IUserService")
public class UserServiceImpl extends AbstractService implements IUserService{
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
	@Override
	public List<Region> findByPid(Map map) {
		// TODO Auto-generated method stub
	   List<Region> lisReg =  this.getDao().findRegion(map);
	   return lisReg;
	}
	@Override
	public Object find(String column, String propertyName,Object value) {
		// TODO Auto-generated method stub
		return this.getDao().find(Cust_info.class,column,propertyName,value);
	}
	@Override
	public void Add(Cust_info user) {
		// TODO Auto-generated method stub
		this.getDao().save(user);
	}
	@Override
	public void AddUserAddress(UserAddress user) {
		// TODO Auto-generated method stub
		this.getDao().save(user);
	}
	@Override
	public Object findByName(Map map) {
		// TODO Auto-generated method stub
		return this.getDao().getCount(Cust_info.class, map);
	}
	@Override
	public List findByName(String proertyName, int value) {
		// TODO Auto-generated method stub
		System.out.println("getuserid"  + value);
		return this.getDao().findByName(UserSession.class, proertyName, value);
	}
	@Override
	public Object findByName(String proertyName, String value) {
		// TODO Auto-generated method stub
		return this.getDao().findObjectByField(Cust_info.class, proertyName, value);
	}
	@Override
	public void AddUserSession(UserSession usession) {
		// TODO Auto-generated method stub
		this.getDao().save(usession);
	}
	@Override
	public Object find(Map map) {
		// TODO Auto-generated method stub
		return this.getDao().findObjectByField(Cust_info.class, map);
	}
	@Override
	public Object findUserAddress(String column,String proertyName, int value) {
		// TODO Auto-generated method stub
		return this.getDao().find(UserAddress.class, column, proertyName, value);
	}
	@Override
	public void delUserSession(UserSession usession) {
		// TODO Auto-generated method stub
		this.getDao().delete(usession);
	}
	@Override
	public List FindUserAddress(String propertyName,int value) {
		// TODO Auto-generated method stub
		return this.getDao().findByName(UserAddress.class,propertyName,value);
	}
	@Override
	public void update(Map mapcondition, Map map) {
		// TODO Auto-generated method stub
		this.getDao().update(Cust_info.class, mapcondition, map);
	}
	@Override
	public void setdefaultaddress(Map mapcondition, Map map) {
		// TODO Auto-generated method stub
		this.getDao().update(UserAddress.class,mapcondition,map);
	}
	@Override
	public List<Cateory> findCateory() {
		// TODO Auto-generated method stub
		return this.getDao().findCateory("parentId","0","=");
	}
	@Override
	public List<Cateory> findSubCateory(Object field, Object value,String condition) {
		// TODO Auto-generated method stub
		return this.getDao().findCateory(field,value,condition);
	}
	@Override
	public void AddLeave(Leaveword leave) {
		// TODO Auto-generated method stub
		 this.getDao().save(leave);
	}
	@Override
	public List<Leaveword> findAllLeave() {
		// TODO Auto-generated method stub
		return this.getDao().findAllLeave();
	}
	@Override
	public void replayLevel(Map mapCondition, Map map) {
		// TODO Auto-generated method stub
		this.getDao().update(Leaveword.class, mapCondition, map);
	}

}
