package com.smj.dao;

import java.util.List;

import com.smj.orm.BillDetail;

 

public interface IBillDetailDao {
 
	public void save(BillDetail transientInstance);

	public void delete(BillDetail persistentInstance);

	public BillDetail findById(com.smj.orm.BillDetailId id);

	public List <?> findByProperty(String propertyName, Object value);

	public List <?> findAll() ;

	public void merge(BillDetail detachedInstance);

 
}