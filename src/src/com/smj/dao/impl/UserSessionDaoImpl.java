package com.smj.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.IUserSessionDao;
import com.smj.orm.UserSession;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserLoginSession entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.smj.orm.UserSession
 * @author MyEclipse Persistence Tools
 */

public class UserSessionDaoImpl extends HibernateDaoSupport implements IUserSessionDao {
	private static final Log log = LogFactory.getLog(UserSessionDaoImpl.class);
	// property constants
	public static final String NAME = "name";
	public static final String USER_NAME = "userName";
	public static final String EMAIL = "email";
	public static final String TELEPHONE = "telephone";
	public static final String QQ = "qq";
	public static final String USER_PWD = "userPwd";
	public static final String INTEGRAL = "integral";
	public static final String ISVALIDATE = "isvalidate";
	public static final String USER_RANK = "userRank";
	public static final String IP = "ip";

	public void save(UserSession transientInstance) {
		log.debug("saving UserLoginSession instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserSession persistentInstance) {
		log.debug("deleting UserLoginSession instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserSession findById(java.lang.Integer id) {
		log.debug("getting UserLoginSession instance with id: " + id);
		try {
			UserSession instance = (UserSession) getSession().get(
					"com.smj.orm.UserLoginSession", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserSession instance) {
		log.debug("finding UserLoginSession instance by example");
		try {
			List results = getSession()
					.createCriteria("com.smj.orm.UserLoginSession")
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
		log.debug("finding UserLoginSession instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserLoginSession as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByUserName(Object userName) {
		return findByProperty(USER_NAME, userName);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByTelephone(Object telephone) {
		return findByProperty(TELEPHONE, telephone);
	}

	public List findByQq(Object qq) {
		return findByProperty(QQ, qq);
	}

	public List findByUserPwd(Object userPwd) {
		return findByProperty(USER_PWD, userPwd);
	}

	public List findByIntegral(Object integral) {
		return findByProperty(INTEGRAL, integral);
	}

	public List findByIsvalidate(Object isvalidate) {
		return findByProperty(ISVALIDATE, isvalidate);
	}

	public List findByUserRank(Object userRank) {
		return findByProperty(USER_RANK, userRank);
	}

	public List findByIp(Object ip) {
		return findByProperty(IP, ip);
	}

	public List findAll() {
		log.debug("finding all UserLoginSession instances");
		try {
			String queryString = "from UserLoginSession";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserSession merge(UserSession detachedInstance) {
		log.debug("merging UserLoginSession instance");
		try {
			UserSession result = (UserSession) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserSession instance) {
		log.debug("attaching dirty UserLoginSession instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserSession instance) {
		log.debug("attaching clean UserLoginSession instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}