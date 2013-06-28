package com.smj.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.ILeavewordDao;
import com.smj.orm.Leaveword;

 

public class LeavewordDaoImpl extends HibernateDaoSupport implements ILeavewordDao  {
	private static final Log log = LogFactory.getLog(LeavewordDaoImpl.class);

	public void save(Leaveword transientInstance) {
		log.debug("saving Leaveword instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Leaveword persistentInstance) {
		log.debug("deleting Leaveword instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Leaveword findById(java.lang.Integer id) {
		log.debug("getting Leaveword instance with id: " + id);
		try {
			Leaveword instance = (Leaveword) getHibernateTemplate().get(
					"com.smj.orm.Leaveword", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

 

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Leaveword instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Leaveword as model where model."
					+ propertyName + "= ?";
			List list = getHibernateTemplate().find(queryString,value);
 
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Leaveword instances");
		try {
			String queryString = "from Leaveword";
			List list = getHibernateTemplate().find(queryString);
			return list;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Leaveword merge(Leaveword detachedInstance) {
		log.debug("merging Leaveword instance");
		try {
			Leaveword result = (Leaveword) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Leaveword instance) {
		log.debug("attaching dirty Leaveword instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Leaveword instance) {
		log.debug("attaching clean Leaveword instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}