package com.smj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.smj.orm.Cateory;
import com.smj.service.ICateoryService;

@Service("cateService")
public class CateoryServiceImpl extends AbstractService implements ICateoryService{

	
	@Override
	@SuppressWarnings("rawtypes")
	public Object find(int id) {
		// TODO Auto-generated method stub
		return this.getDao().find(Cateory.class, id);
	}

	@Override
	@SuppressWarnings("rawtypes")
	public List<Cateory> getCateoryList(int pageNo, int pageSize, Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@SuppressWarnings("rawtypes")
	public Integer getCusCount(Map map) {
		// TODO Auto-generated method stub
		return this.getDao().getCount(Cateory.class, map);
	}

	@Override
	public String getCustomerDetail(String cid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getJsonData(List rows, int pages, int total) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@SuppressWarnings("rawtypes")
	public List<Cateory> findCateory(Map map)  {
		// TODO Auto-generated method stub
		 return this.getDao().findCateory(map);
	}

	@Override
	@SuppressWarnings("rawtypes")
	public Object findMaxId(Class clazz, String column, Map map) {
		// TODO Auto-generated method stub
		return this.getDao().findMaxId(clazz, column, map);
	}

	@Override
	@SuppressWarnings("rawtypes")
	public void delete(Cateory po) {
		// TODO Auto-generated method stub
	    this.getDao().delete(po);
	}

	@Override
	@SuppressWarnings("rawtypes")
	public void merge(Cateory po) {
		// TODO Auto-generated method stub
		this.getDao().merge(po);
	}

	@Override
	@SuppressWarnings("rawtypes")
	public void save(Cateory po) {
		// TODO Auto-generated method stub
	    this.getDao().save(po);	
	}
}
