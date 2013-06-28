package com.smj.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.IUnitDao;
import com.smj.orm.Unit;

 

public class UnitDaoImpl extends HibernateDaoSupport implements IUnitDao {
	private static final Log log = LogFactory.getLog(UnitDaoImpl.class);

	public void save(Unit transientInstance) {
		log.debug("saving Unit instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Unit persistentInstance) {
		log.debug("deleting Unit instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Unit findById(java.lang.Integer id) {
		log.debug("getting Unit instance with id: " + id);
		try {
			Unit instance = (Unit) getHibernateTemplate().get("com.smj.orm.Unit", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
 

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Unit instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Unit as model where model."
					+ propertyName + "= ?";
			List list = getHibernateTemplate().find(queryString,value);
 
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Unit instances");
		try {
			String queryString = "from Unit";
			List list = getHibernateTemplate().find(queryString);
			return list;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Unit merge(Unit detachedInstance) {
		log.debug("merging Unit instance");
		try {
			Unit result = (Unit) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Unit instance) {
		log.debug("attaching dirty Unit instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

 
}