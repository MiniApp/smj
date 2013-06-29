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

/**
 * A data access object (DAO) providing persistence and search support for
 * UserAddress entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.smj.orm.UserAddress
 * @author MyEclipse Persistence Tools
 */

public class UserAddressDaoImpl extends HibernateDaoSupport implements IUserAddressDao{
	private static final Log log = LogFactory.getLog(UserAddressDaoImpl.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String ADDRESS1 = "address1";
	public static final String ADDRESS2 = "address2";
	public static final String ADDRESS3 = "address3";
	public static final String ISDEFAULT = "isdefault";

	public void save(UserAddress transientInstance) {
		log.debug("saving UserAddress instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserAddress persistentInstance) {
		log.debug("deleting UserAddress instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserAddress findById(java.lang.Integer id) {
		log.debug("getting UserAddress instance with id: " + id);
		try {
			UserAddress instance = (UserAddress) getSession().get(
					"com.smj.orm.UserAddress", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserAddress instance) {
		log.debug("finding UserAddress instance by example");
		try {
			List results = getSession()
					.createCriteria("com.smj.orm.UserAddress")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding UserAddress instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UserAddress as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByAddress1(Object address1) {
		return findByProperty(ADDRESS1, address1);
	}

	public List findByAddress2(Object address2) {
		return findByProperty(ADDRESS2, address2);
	}

	public List findByAddress3(Object address3) {
		return findByProperty(ADDRESS3, address3);
	}

	public List findByIsdefault(Object isdefault) {
		return findByProperty(ISDEFAULT, isdefault);
	}

	public List findAll() {
		log.debug("finding all UserAddress instances");
		try {
			String queryString = "from UserAddress";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserAddress merge(UserAddress detachedInstance) {
		log.debug("merging UserAddress instance");
		try {
			UserAddress result = (UserAddress) getSession().merge(
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
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserAddress instance) {
		log.debug("attaching clean UserAddress instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}