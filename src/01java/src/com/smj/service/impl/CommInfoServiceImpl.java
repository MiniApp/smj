package com.smj.service.impl;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.smj.orm.Brand;
import com.smj.orm.Comm_info;
import com.smj.orm.CommdAppr;
import com.smj.orm.CommdArchives;
import com.smj.service.ICommInfoService;
import com.smj.service.persist.IPersistServiceImpl;
import com.smj.service.persist.PaginationSupport;

@Service("ICommInfoService")
public class CommInfoServiceImpl extends AbstractService implements ICommInfoService{
	
	@Resource(name = "persist")
	private IPersistServiceImpl  persist;
	
	@Override
	@SuppressWarnings("rawtypes")
	public PaginationSupport<?> findCommInfo(int pageNo, int pageSize,Map map) {
		//List<Comm_info>  lisComm  = (List<Comm_info>)this.getDao().findPaginated(Comm_info.class,pageNo,pageSize,map);
		List<Comm_info>  lisComm  = this.getDao().findCommInfo(map);
		//判断查询是否为空
		if(lisComm.size() == 0){
			return new PaginationSupport(new LinkedList(), 0);
		}
			
		return new PaginationSupport(lisComm,lisComm.size());
	}

	

	@Override
	@SuppressWarnings("rawtypes")
	public List<Comm_info> findCommInfo(Map map) {
		// TODO Auto-generated method stub
		return this.getDao().findCommInfo(map);
	}

	@Override
	@SuppressWarnings("rawtypes")
	public List<Brand> findBrand(Object field, Object value) {
		// TODO Auto-generated method stub
		return this.getDao().findBrand(field, value,"in");
	}



	@Override
	public PaginationSupport<Comm_info> getCommInfo(String id,
			String commdName, int cateId, String brandId, int storeId) {
		// TODO Auto-generated method stub
		PaginationSupport<Comm_info> lisCommInfo = (PaginationSupport<Comm_info>)persist.findPaginatedBySqlMap(id, commdName, cateId, brandId, storeId);
		return lisCommInfo;
	}
	
	@Override
	public PaginationSupport<CommdAppr> getCommdAppr(int commdId) {
		// TODO Auto-generated method stub
		PaginationSupport<CommdAppr> lisCommdAppr =(PaginationSupport<CommdAppr>)persist.findPaginatedBySqlMap(commdId); 
		return lisCommdAppr;
	}
	
	@Override
	public PaginationSupport<?> findCommdAppr(int pageNo, int pageSize, Map map) {
		// TODO Auto-generated method stub
		List<CommdAppr>  lisCommAppr  = this.getDao().findCommdAppr(map);
		//判断查询是否为空
		if(lisCommAppr.size() == 0){
			return new PaginationSupport(new LinkedList(), 0);
		}
			
		return new PaginationSupport(lisCommAppr,lisCommAppr.size());
	}



	@Override
	@SuppressWarnings("rawtypes")
	public List<CommdArchives> findCommdArchives(Map map) {
		// TODO Auto-generated method stub
		return this.getDao().findCommdArchives(map);
	}
}
