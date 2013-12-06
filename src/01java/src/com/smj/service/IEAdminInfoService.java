package com.smj.service;

import java.util.List;
import java.util.Map;

import com.smj.orm.EAdmininfo;


public interface IEAdminInfoService {
	@SuppressWarnings("rawtypes")
	public List<EAdmininfo> getCustomerList(int pageNo, int pageSize, Map map);
	@SuppressWarnings("rawtypes")
	public Integer getCusCount(Map map);
	@SuppressWarnings("rawtypes")
	public String getJsonData(List rows, int pages, int total);
	public String getCustomerDetail(String cid);
	@SuppressWarnings("rawtypes")
	public Object find();
	@SuppressWarnings("rawtypes")
	public Object find(String column,String propertyName, Object value);
	@SuppressWarnings("rawtypes")
	public void addAdmin(EAdmininfo info);
	public Object getEAdmininfoByPro(String propertyName, Object value);
	public void merage(EAdmininfo info);
}  
