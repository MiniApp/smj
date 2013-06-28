package com.smj.dao.impl;

import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.smj.dao.IAppriaseDao;
import com.smj.orm.Appriase;

/**
 * @author LIPW
 * @date Jun 27, 2013 
 */

public class AppriaseDaoImpl extends HibernateDaoSupport implements
		IAppriaseDao {

	public void save(Appriase transientInstance) {
		getHibernateTemplate().save(transientInstance);

	}

	public void delete(Appriase persistentInstance) {
		getHibernateTemplate().delete(persistentInstance);
	}

	public Appriase findById(java.lang.Integer id) {
		Appriase instance = (Appriase) getHibernateTemplate().get("com.smj.orm.Appriase",
				id);
		return instance;

	}

	public List <?> findByProperty(String propertyName, Object value) {
		String queryString = "from Appriase as model where model."
				+ propertyName + "= ?";
		List <?>list  = getHibernateTemplate().find(queryString,value);
		return list;

	}

	public List <?> findAll() {
		String queryString = "from Appriase";
		List <?>list = getHibernateTemplate().find(queryString);
		return list;

	}

	public void merge(Appriase detachedInstance) {
		getHibernateTemplate().merge(detachedInstance);

	}

}