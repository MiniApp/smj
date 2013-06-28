package com.smj.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.ICommdApprDao;
import com.smj.orm.CommdAppr;



/**
 * @author Lipw
 * @date Jun 27, 2013
 */

public class CommdApprDaoImpl extends HibernateDaoSupport implements ICommdApprDao {
	private static final Log log = LogFactory.getLog(CommdApprDaoImpl.class);

	public void save(CommdAppr transientInstance) {
		log.debug("saving CommdAppr instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CommdAppr persistentInstance) {
		log.debug("deleting CommdAppr instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CommdAppr findById(java.lang.Integer id) {
		log.debug("getting CommdAppr instance with id: " + id);
		try {
			CommdAppr instance = (CommdAppr) getHibernateTemplate().get(
					"com.smj.orm.CommdAppr", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}


	public List <?> findByProperty(String propertyName, Object value) {
		log.debug("finding CommdAppr instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CommdAppr as model where model."
					+ propertyName + "= ?";
			List <?> list = getHibernateTemplate().find(queryString,value);
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List <?> findAll() {
		log.debug("finding all CommdAppr instances");
		try {
			String queryString = "from CommdAppr";
			List <?> list = getHibernateTemplate().find(queryString);
			return list;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public void merge(CommdAppr detachedInstance) {
		log.debug("merging CommdAppr instance");
		try {
			getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
 
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	 
}