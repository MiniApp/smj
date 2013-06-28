package com.smj.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.ICateoryDao;
import com.smj.orm.Cateory;

 

public class CateoryDaoImpl extends HibernateDaoSupport implements ICateoryDao {
	private static final Log log = LogFactory.getLog(CateoryDaoImpl.class);

	public void save(Cateory transientInstance) {
		log.debug("saving Cateory instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Cateory persistentInstance) {
		log.debug("deleting Cateory instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Cateory findById(java.lang.Integer id) {
		log.debug("getting Cateory instance with id: " + id);
		try {
			Cateory instance = (Cateory) getHibernateTemplate().get(
					"com.smj.orm.Cateory", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

 

	public List <?> findByProperty(String propertyName, Object value) {
		log.debug("finding Cateory instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Cateory as model where model."
					+ propertyName + "= ?";
			List <?> list = getHibernateTemplate().find(queryString,value);
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List <?> findAll() {
		log.debug("finding all Cateory instances");
		try {
			String queryString = "from Cateory";
			List <?> list = getHibernateTemplate().find(queryString);
			return list;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public void merge(Cateory detachedInstance) {
		log.debug("merging Cateory instance");
		try {
			getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
	 
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}


}