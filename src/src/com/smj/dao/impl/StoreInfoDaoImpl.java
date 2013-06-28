package com.smj.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.IStoreInfoDao;
import com.smj.orm.StoreInfo;

 

public class StoreInfoDaoImpl extends HibernateDaoSupport implements IStoreInfoDao {
	private static final Log log = LogFactory.getLog(StoreInfoDaoImpl.class);

	public void save(StoreInfo transientInstance) {
		log.debug("saving StoreInfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(StoreInfo persistentInstance) {
		log.debug("deleting StoreInfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StoreInfo findById(java.lang.Integer id) {
		log.debug("getting StoreInfo instance with id: " + id);
		try {
			StoreInfo instance = (StoreInfo) getHibernateTemplate().get(
					"com.smj.orm.StoreInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

 

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding StoreInfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from StoreInfo as model where model."
					+ propertyName + "= ?";
			List list = getHibernateTemplate().find(queryString,value);
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all StoreInfo instances");
		try {
			String queryString = "from StoreInfo";
			List list  = getHibernateTemplate().find(queryString);
			return list;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StoreInfo merge(StoreInfo detachedInstance) {
		log.debug("merging StoreInfo instance");
		try {
			StoreInfo result = (StoreInfo) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	 

	 
}