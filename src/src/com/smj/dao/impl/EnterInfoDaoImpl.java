package com.smj.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.IEnterInfoDao;
import com.smj.orm.EnterInfo;


public class EnterInfoDaoImpl extends HibernateDaoSupport implements IEnterInfoDao {
	private static final Log log = LogFactory.getLog(EnterInfoDaoImpl.class);

	public void save(EnterInfo transientInstance) {
		log.debug("saving EnterInfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(EnterInfo persistentInstance) {
		log.debug("deleting EnterInfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public EnterInfo findById(java.lang.Integer id) {
		log.debug("getting EnterInfo instance with id: " + id);
		try {
			EnterInfo instance = (EnterInfo) getHibernateTemplate().get(
					"com.smj.orm.EnterInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	 

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding EnterInfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from EnterInfo as model where model."
					+ propertyName + "= ?";
			List list = getHibernateTemplate().find(queryString,value);

			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all EnterInfo instances");
		try {
			String queryString = "from EnterInfo";
			List list = getHibernateTemplate().find(queryString);
			return list;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public EnterInfo merge(EnterInfo detachedInstance) {
		log.debug("merging EnterInfo instance");
		try {
			EnterInfo result = (EnterInfo) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(EnterInfo instance) {
		log.debug("attaching dirty EnterInfo instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	 
}