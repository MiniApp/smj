package com.smj.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.ICustInfoDao;
import com.smj.orm.CustInfo;

 

/**
 * @author Lipw
 * @date Jun 27, 2013
 */
public class CustInfoDaoImpl extends HibernateDaoSupport implements ICustInfoDao {
	private static final Log log = LogFactory.getLog(CustInfoDaoImpl.class);

	public void save(CustInfo transientInstance) {
		log.debug("saving CustInfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CustInfo persistentInstance) {
		log.debug("deleting CustInfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CustInfo findById(java.lang.Integer id) {
		log.debug("getting CustInfo instance with id: " + id);
		try {
			CustInfo instance = (CustInfo) getHibernateTemplate().get(
					"com.smj.orm.CustInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}


	public List <?> findByProperty(String propertyName, Object value) {
		log.debug("finding CustInfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CustInfo as model where model."
					+ propertyName + "= ?";
			List <?> list = getHibernateTemplate().find(queryString,value);
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List <?> findAll() {
		log.debug("finding all CustInfo instances");
		try {
			String queryString = "from CustInfo";
			List <?> list = getHibernateTemplate().find(queryString);
			return list;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public void merge(CustInfo detachedInstance) {
		log.debug("merging CustInfo instance");
		try {
			getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");

		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	 
}