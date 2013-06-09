package com.smj.dao;

import java.util.List;

import com.smj.orm.Region;

public interface IRedionDao {
	
	public Region findById(String id) ;
	
	public List  <Region> findByPid(String pid);
}
