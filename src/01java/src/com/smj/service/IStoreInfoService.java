package com.smj.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;

import com.smj.orm.StoreInfo;
import com.smj.service.bean.EnterInfoBean;

 

public interface IStoreInfoService {
	 
	public void addStoreInfo(StoreInfo info);
	public List<StoreInfo> findStoreInfo(Map map);
	public Object find(String column, String propertyName,Object value);
	public void Merage(StoreInfo store);
	
}
