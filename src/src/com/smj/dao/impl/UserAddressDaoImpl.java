package com.smj.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.IUserAddressDao;
import com.smj.orm.UserAddress;

 
public class UserAddressDaoImpl extends HibernateDaoSupport implements IUserAddressDao {
	private static final Log log = LogFactory.getLog(UserAddressDaoImpl.class);

	public void save(UserAddress transientInstance) {
		log.debug("saving UserAddress instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserAddress persistentInstance) {
		log.debug("deleting UserAddress instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserAddress findById(java.lang.Integer id) {
		log.debug("getting UserAddress instance with id: " + id);
		try {
			UserAddress instance = (UserAddress) getHibernateTemplate().get(
					"com.smj.orm.UserAddress", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}



	public List findByProperty(String propertyName, Object value) {
		log.debug("finding UserAddress instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UserAddress as model where model."
					+ propertyName + "= ?";
			List list = getHibernateTemplate().find(queryString,value);
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all UserAddress instances");
		try {
			String queryString = "from UserAddress";
			List list = getHibernateTemplate().find(queryString);
			return list;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserAddress merge(UserAddress detachedInstance) {
		log.debug("merging UserAddress instance");
		try {
			UserAddress result = (UserAddress) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserAddress instance) {
		log.debug("attaching dirty UserAddress instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	 
}