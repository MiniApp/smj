package com.smj.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;

import com.smj.orm.Cateory;
import com.smj.orm.Cust_info;
import com.smj.orm.Leaveword;
import com.smj.orm.Region;
import com.smj.orm.UserAddress;
import com.smj.orm.UserSession;

 

public interface IUserService {
	 
 
	public void updateCache() throws Exception ;
	public void config_cache() ;
	public void config_cache(boolean updateData) ;
	/**
	 * 添加/更新SESSION记录
	 */
	public void insertSession(HttpServletRequest request, HttpServletResponse response,
			Map<String, Object> sGlobal,Map user) ;
 
	public void cache_write(String fileName, String var, Map values);
	public String arrayeval(String var, Map values, int level);
	public Object findByName(Map map);
	public List findByName(String proertyName,int value);
	public Object findByName(String proertyName,String value);
	public Object findUserAddress(String column,String proertyName,int value);
	@SuppressWarnings("rawtypes")
	public List<Region> findByPid(Map map);
	@SuppressWarnings("rawtypes")
	public Object find(String column, String propertyName,Object value);
	public Object find(Map map);
	public void Add(Cust_info user);
	public void AddUserAddress(UserAddress user);
	public void AddUserSession(UserSession usession);
	public void delUserSession(UserSession usession);
	public List FindUserAddress(String propertyName,int value);
	public void update(Map  mapcondition,Map map);
	public void setdefaultaddress(Map  mapcondition,Map map);
    public List<Cateory> findCateory();
    public List<Cateory> findSubCateory(Object field, Object value,String condition);
    public void AddLeave(Leaveword leave);
    public List<Leaveword> findAllLeave();
    public void replayLevel(Map mapCondition,Map map);
}
