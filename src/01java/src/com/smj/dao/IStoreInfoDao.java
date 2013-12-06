package com.smj.dao;

import java.util.List;

import com.smj.orm.StoreInfo;
 

public interface IStoreInfoDao {
 
	public void save(StoreInfo transientInstance);

	public void delete(StoreInfo persistentInstance);

	public StoreInfo findById(java.lang.Integer id);

	public List findByProperty(String propertyName, Object value);


	public StoreInfo merge(StoreInfo detachedInstance) ;
}