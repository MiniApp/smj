package com.smj.dao;

import java.util.List;

import com.smj.orm.Unit;

 
public interface IUnitDao  {
 
	public void save(Unit transientInstance);

	public void delete(Unit persistentInstance);
	
	public Unit findById(java.lang.Integer id);
	


	public List findByProperty(String propertyName, Object value);
	
	public List findAll(); 

	public Unit merge(Unit detachedInstance);

	
}