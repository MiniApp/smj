package com.smj.dao;

import java.util.List;

import com.smj.orm.Leaveword;


public interface ILeavewordDao   {
 
	public void save(Leaveword transientInstance) ;

	public void delete(Leaveword persistentInstance) ;

	public Leaveword findById(java.lang.Integer id) ; 

	public List findAll() ;

	public Leaveword merge(Leaveword detachedInstance);

	
}