package com.smj.dao;

import java.util.List;

import com.smj.orm.Region;

/**
 * A data access object (DAO) providing persistence and search support for
 * Region entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.smj.orm.Region
 * @author MyEclipse Persistence Tools
 */

public interface IRegionDao{
 
	public void save(Region transientInstance) ;

	public void delete(Region persistentInstance);

	public Region findById(java.lang.Integer id) ;
	
	public List findAll() ;

	public Region merge(Region detachedInstance);

	
}