package com.smj.dao;

import java.util.List;

import com.smj.orm.EnterInfo;

/**
 * @author User
 *
 */
public interface IEnterInfoDao {
 
	public void save(EnterInfo transientInstance) ;

	public void delete(EnterInfo persistentInstance) ;

	public EnterInfo findById(java.lang.Integer id) ; 

	public List <?> findAll() ;

	public EnterInfo merge(EnterInfo detachedInstance);

	public List findByProperty(String propertyName, Object value);
	
}