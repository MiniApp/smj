package com.smj.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.ICommInfoDao;
import com.smj.orm.CommInfo;
import com.smj.orm.CommInfoId;



/**
 * @author HP
 * @date Jun 27, 2013
 */
public class CommInfoDaoImpl extends HibernateDaoSupport implements ICommInfoDao {
	private static final Log log = LogFactory.getLog(CommInfoDaoImpl.class);

	public void save(CommInfo transientInstance) {
		log.debug("saving CommInfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CommInfo persistentInstance) {
		log.debug("deleting CommInfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CommInfo findById(CommInfoId id) {
		log.debug("getting CommInfo instance with id: " + id);
		try {
			CommInfo instance = (CommInfo) getHibernateTemplate().get(
					"com.smj.orm.CommInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List <?> findByProperty(String propertyName, Object value) {
		log.debug("finding CommInfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CommInfo as model where model."
					+ propertyName + "= ?";
			List <?> list = getHibernateTemplate().find(queryString,value);
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List <?> findAll() {
		log.debug("finding all CommInfo instances");
		try {
			String queryString = "from CommInfo";
			List <?> list = getHibernateTemplate().find(queryString);
			return list;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public void merge(CommInfo detachedInstance) {
		log.debug("merging CommInfo instance");
		try {
			getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	 
}