package com.smj.dao;

import java.util.List;

import com.smj.orm.BillInfo;

public interface IBillInfoDao {
 
	public void save(BillInfo transientInstance);

	public void delete(BillInfo persistentInstance);

	public BillInfo findById(java.lang.String id) ;

	public List <?> findByProperty(String propertyName, Object value) ;

	public List <?> findAll() ;

	public void merge(BillInfo detachedInstance) ;


}