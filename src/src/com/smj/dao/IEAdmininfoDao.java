package com.smj.dao;

import java.util.List;

import com.smj.orm.EAdmininfo;

public interface IEAdmininfoDao {

	public void save(EAdmininfo transientInstance);
	
	public void delete(EAdmininfo persistentInstance);
	
	public EAdmininfo findById(java.lang.Integer id);
	
	public List findAll();
	
	public EAdmininfo merge(EAdmininfo detachedInstance);
}
