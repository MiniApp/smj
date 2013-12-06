package com.smj.dao;

import java.util.List;

import com.smj.orm.UserSession;
import com.smj.orm.Users;

public interface IUserDao {
	

	public Users findById(java.lang.Integer id) ;
	
	public List findByProperty(String propertyName, Object value);

	public List findByName(Object name);
	
	public Users findByUsername(Object name);
	
	public void save(UserSession transientInstance);
	public int save(Users transientInstance);
	
	public Users merge(Users detachedInstance);
}
