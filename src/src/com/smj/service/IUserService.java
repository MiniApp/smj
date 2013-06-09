package com.smj.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;

 

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
	
	public List findByName(String instanceName, int value);
}
