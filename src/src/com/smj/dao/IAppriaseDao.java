package com.smj.dao;

import java.util.List;
import com.smj.orm.Appriase;

public interface IAppriaseDao {
 
	public void save(Appriase transientInstance);

	public void delete(Appriase persistentInstance);

	public Appriase findById(java.lang.Integer id) ;

	public List <?> findByProperty(String propertyName, Object value) ;

	public List <?> findAll() ;

	public void merge(Appriase detachedInstance) ;


}