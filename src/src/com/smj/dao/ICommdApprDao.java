package com.smj.dao;

import java.util.List;

import com.smj.orm.CommdAppr;

public interface ICommdApprDao {
 
	public void save(CommdAppr transientInstance);

	public void delete(CommdAppr persistentInstance);

	public CommdAppr findById(java.lang.Integer id) ;

	public List <?> findByProperty(String propertyName, Object value) ;

	public List <?> findAll() ;

	public void merge(CommdAppr detachedInstance) ;


}