package com.smj.dao;

import java.util.List;

import com.smj.orm.CommdSaleTotal;

public interface ICommdSaleTotalDao {
 
	public void save(CommdSaleTotal transientInstance);

	public void delete(CommdSaleTotal persistentInstance);

	public CommdSaleTotal findById(java.lang.Integer id) ;

	public List <?> findByProperty(String propertyName, Object value) ;

	public List <?> findAll() ;

	public void merge(CommdSaleTotal detachedInstance) ;


}