package com.smj.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.IEAdmininfoDao;
import com.smj.orm.EAdmininfo;

/**
 * A data access object (DAO) providing persistence and search support for
 * EAdmininfo entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.smj.orm.EAdmininfo
 * @author MyEclipse Persistence Tools
 */

public class EAdmininfoDaoImpl extends HibernateDaoSupport implements IEAdmininfoDao {
	private static final Log log = LogFactory.getLog(EAdmininfoDaoImpl.class);

	public void save(EAdmininfo transientInstance) {
		log.debug("saving EAdmininfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(EAdmininfo persistentInstance) {
		log.debug("deleting EAdmininfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public EAdmininfo findById(java.lang.Integer id) {
		log.debug("getting EAdmininfo instance with id: " + id);
		try {
			EAdmininfo instance = (EAdmininfo) getHibernateTemplate().get(
					"com.smj.orm.EAdmininfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

 

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding EAdmininfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from EAdmininfo as model where model."
					+ propertyName + "= ?";
			List list = getHibernateTemplate().find(queryString,value);
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all EAdmininfo instances");
		try {
			String queryString = "from EAdmininfo";
			List list = getHibernateTemplate().find(queryString);
			return list;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public EAdmininfo merge(EAdmininfo detachedInstance) {
		log.debug("merging EAdmininfo instance");
		try {
			EAdmininfo result = (EAdmininfo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

 

	 
}