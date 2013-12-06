package com.smj.dao;

import java.util.List;

import com.smj.orm.UserAddress;

 

public interface IUserAddressDao {
 
	public void save(UserAddress transientInstance) ;
	
	public void delete(UserAddress persistentInstance);

	public UserAddress findById(java.lang.Integer id) ; 

	public List findByProperty(String propertyName, Object value);

	public List findAll() ;

	public UserAddress merge(UserAddress detachedInstance);

	
}