package com.smj.dao;

import java.util.List;

import com.smj.orm.CustInfo;

public interface ICustInfoDao {
 
	public void save(CustInfo transientInstance);

	public void delete(CustInfo persistentInstance);

	public CustInfo findById(java.lang.Integer id) ;

	public List <?> findByProperty(String propertyName, Object value) ;

	public List <?> findAll() ;

	public void merge(CustInfo detachedInstance) ;


}