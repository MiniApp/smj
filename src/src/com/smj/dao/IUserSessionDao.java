package com.smj.dao;

import com.smj.orm.UserSession;

public interface IUserSessionDao {
	
	public void save(UserSession transientInstance);
	public UserSession findById(java.lang.Integer id);
}
