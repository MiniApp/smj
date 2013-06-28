package com.smj.dao;

import java.util.List;

import com.smj.orm.Cateory;

public interface ICateoryDao {
 
	public void save(Cateory transientInstance);

	public void delete(Cateory persistentInstance);

	public Cateory findById(java.lang.Integer id) ;

	public List <?> findByProperty(String propertyName, Object value) ;

	public List <?> findAll() ;

	public void merge(Cateory detachedInstance) ;


}