package com.smj.orm;

import java.sql.Timestamp;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 	* A data access object (DAO) providing persistence and search support for Users entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smj.orm.Users
  * @author MyEclipse Persistence Tools 
 */

public class UsersDAO extends BaseHibernateDAO  {
		 private static final Log log = LogFactory.getLog(UsersDAO.class);
		//property constants
	public static final String NAME = "name";
	public static final String USERNAME = "username";
	public static final String IS_CERT = "isCert";
	public static final String MOBILE = "mobile";
	public static final String EMAIL = "email";
	public static final String QQ = "qq";
	public static final String USER_PWD = "userPwd";
	public static final String INTEGRAL = "integral";
	public static final String IS_VALIDATE = "isValidate";
	public static final String USER_RANK = "userRank";
	public static final String RADOM_STR1 = "radomStr1";
	public static final String RADOM_STR2 = "radomStr2";
	public static final String USER_STATE = "userState";



    
    public void save(Users transientInstance) {
        log.debug("saving Users instance");
        try {
            getSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Users persistentInstance) {
        log.debug("deleting Users instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Users findById( java.lang.Integer id) {
        log.debug("getting Users instance with id: " + id);
        try {
            Users instance = (Users) getSession()
                    .get("com.smj.orm.Users", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Users instance) {
        log.debug("finding Users instance by example");
        try {
            List results = getSession()
                    .createCriteria("com.smj.orm.Users")
                    .add(Example.create(instance))
            .list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding Users instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Users as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByName(Object name
	) {
		return findByProperty(NAME, name
		);
	}
	
	public List findByUsername(Object username
	) {
		return findByProperty(USERNAME, username
		);
	}
	
	public List findByIsCert(Object isCert
	) {
		return findByProperty(IS_CERT, isCert
		);
	}
	
	public List findByMobile(Object mobile
	) {
		return findByProperty(MOBILE, mobile
		);
	}
	
	public List findByEmail(Object email
	) {
		return findByProperty(EMAIL, email
		);
	}
	
	public List findByQq(Object qq
	) {
		return findByProperty(QQ, qq
		);
	}
	
	public List findByUserPwd(Object userPwd
	) {
		return findByProperty(USER_PWD, userPwd
		);
	}
	
	public List findByIntegral(Object integral
	) {
		return findByProperty(INTEGRAL, integral
		);
	}
	
	public List findByIsValidate(Object isValidate
	) {
		return findByProperty(IS_VALIDATE, isValidate
		);
	}
	
	public List findByUserRank(Object userRank
	) {
		return findByProperty(USER_RANK, userRank
		);
	}
	
	public List findByRadomStr1(Object radomStr1
	) {
		return findByProperty(RADOM_STR1, radomStr1
		);
	}
	
	public List findByRadomStr2(Object radomStr2
	) {
		return findByProperty(RADOM_STR2, radomStr2
		);
	}
	
	public List findByUserState(Object userState
	) {
		return findByProperty(USER_STATE, userState
		);
	}
	

	public List findAll() {
		log.debug("finding all Users instances");
		try {
			String queryString = "from Users";
	         Query queryObject = getSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Users merge(Users detachedInstance) {
        log.debug("merging Users instance");
        try {
            Users result = (Users) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Users instance) {
        log.debug("attaching dirty Users instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Users instance) {
        log.debug("attaching clean Users instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
}