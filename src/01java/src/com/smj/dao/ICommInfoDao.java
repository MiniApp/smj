package com.smj.dao;

import java.util.List;

import com.smj.orm.CommInfo;
import com.smj.orm.CommInfoId;

public interface ICommInfoDao {
 
	public void save(CommInfo transientInstance);

	public void delete(CommInfo persistentInstance);

	public CommInfo findById(CommInfoId id) ;

	public List <?> findByProperty(String propertyName, Object value) ;

	public List <?> findAll() ;

	public void merge(CommInfo detachedInstance) ;


}