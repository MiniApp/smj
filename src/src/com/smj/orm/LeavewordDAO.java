package com.smj.orm;

import java.sql.Timestamp;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 	* A data access object (DAO) providing persistence and search support for Leaveword entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smj.orm.Leaveword
  * @author MyEclipse Persistence Tools 
 */

public class LeavewordDAO extends BaseHibernateDAO  {
		 private static final Log log = LogFactory.getLog(LeavewordDAO.class);
		//property constants
	public static final String STORE_ID = "storeId";
	public static final String CUST_ID = "custId";
	public static final String LEAV_CONTENT = "leavContent";
	public static final String ANS_CONTENT = "ansContent";
	public static final String ANS_USER = "ansUser";



    
    public void save(Leaveword transientInstance) {
        log.debug("saving Leaveword instance");
        try {
            getSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Leaveword persistentInstance) {
        log.debug("deleting Leaveword instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Leaveword findById( java.lang.Integer id) {
        log.debug("getting Leaveword instance with id: " + id);
        try {
            Leaveword instance = (Leaveword) getSession()
                    .get("com.smj.orm.Leaveword", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Leaveword instance) {
        log.debug("finding Leaveword instance by example");
        try {
            List results = getSession()
                    .createCriteria("com.smj.orm.Leaveword")
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
      log.debug("finding Leaveword instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Leaveword as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByStoreId(Object storeId
	) {
		return findByProperty(STORE_ID, storeId
		);
	}
	
	public List findByCustId(Object custId
	) {
		return findByProperty(CUST_ID, custId
		);
	}
	
	public List findByLeavContent(Object leavContent
	) {
		return findByProperty(LEAV_CONTENT, leavContent
		);
	}
	
	public List findByAnsContent(Object ansContent
	) {
		return findByProperty(ANS_CONTENT, ansContent
		);
	}
	
	public List findByAnsUser(Object ansUser
	) {
		return findByProperty(ANS_USER, ansUser
		);
	}
	

	public List findAll() {
		log.debug("finding all Leaveword instances");
		try {
			String queryString = "from Leaveword";
	         Query queryObject = getSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Leaveword merge(Leaveword detachedInstance) {
        log.debug("merging Leaveword instance");
        try {
            Leaveword result = (Leaveword) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Leaveword instance) {
        log.debug("attaching dirty Leaveword instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Leaveword instance) {
        log.debug("attaching clean Leaveword instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
}