package com.smj.service;

import java.util.List;
import java.util.Map;

import com.smj.orm.Cateory;;

public interface ICateoryService {
	@SuppressWarnings("rawtypes")
	public List<Cateory> getCateoryList(int pageNo, int pageSize, Map map);
	@SuppressWarnings("rawtypes")
	public Integer getCusCount(Map map);
	@SuppressWarnings("rawtypes")
	public String getJsonData(List rows, int pages, int total);
	public String getCustomerDetail(String cid);
	@SuppressWarnings("rawtypes")
	public Object find(int id);
	@SuppressWarnings("rawtypes")
	public List<Cateory> findCateory(Map map);
	@SuppressWarnings("rawtypes")
	public Object findMaxId(Class clazz,String id, Map map);
	@SuppressWarnings("rawtypes")
	public void save(Cateory transientInstance);
	@SuppressWarnings("rawtypes")
	public void delete(Cateory persistentInstance);
	@SuppressWarnings("rawtypes")
	public void merge(Cateory detachedInstance) ;
}
