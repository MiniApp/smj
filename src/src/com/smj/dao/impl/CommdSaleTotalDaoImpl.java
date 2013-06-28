package com.smj.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.ICommdSaleTotalDao;
import com.smj.orm.CommdSaleTotal;


public class CommdSaleTotalDaoImpl extends HibernateDaoSupport implements ICommdSaleTotalDao {
	private static final Log log = LogFactory.getLog(CommdSaleTotalDaoImpl.class);

	public void save(CommdSaleTotal transientInstance) {
		log.debug("saving CommdSaleTotal instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CommdSaleTotal persistentInstance) {
		log.debug("deleting CommdSaleTotal instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CommdSaleTotal findById(java.lang.Integer id) {
		log.debug("getting CommdSaleTotal instance with id: " + id);
		try {
			CommdSaleTotal instance = (CommdSaleTotal) getHibernateTemplate().get(
					"com.smj.orm.CommdSaleTotal", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

 

	public List <?> findByProperty(String propertyName, Object value) {
		log.debug("finding CommdSaleTotal instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from CommdSaleTotal as model where model."
					+ propertyName + "= ?";
			List <?> list = getHibernateTemplate().find(queryString,value);
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List <?> findAll() {
		log.debug("finding all CommdSaleTotal instances");
		try {
			String queryString = "from CommdSaleTotal";
			List <?> list = getHibernateTemplate().find(queryString);
			return list;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public void merge(CommdSaleTotal detachedInstance) {
		log.debug("merging CommdSaleTotal instance");
		try {
			getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	 
}