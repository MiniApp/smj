package com.smj.orm;

import java.sql.Timestamp;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 	* A data access object (DAO) providing persistence and search support for CommdAppr entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smj.orm.CommdAppr
  * @author MyEclipse Persistence Tools 
 */

public class CommdApprDAO extends BaseHibernateDAO  {
		 private static final Log log = LogFactory.getLog(CommdApprDAO.class);
		//property constants
	public static final String COMMD_ID = "commdId";
	public static final String STORE_ID = "storeId";
	public static final String INTEGRAL = "integral";
	public static final String TASTE = "taste";
	public static final String CONTENT = "content";



    
    public void save(CommdAppr transientInstance) {
        log.debug("saving CommdAppr instance");
        try {
            getSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(CommdAppr persistentInstance) {
        log.debug("deleting CommdAppr instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public CommdAppr findById( java.lang.Integer id) {
        log.debug("getting CommdAppr instance with id: " + id);
        try {
            CommdAppr instance = (CommdAppr) getSession()
                    .get("com.smj.orm.CommdAppr", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(CommdAppr instance) {
        log.debug("finding CommdAppr instance by example");
        try {
            List results = getSession()
                    .createCriteria("com.smj.orm.CommdAppr")
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
      log.debug("finding CommdAppr instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from CommdAppr as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByCommdId(Object commdId
	) {
		return findByProperty(COMMD_ID, commdId
		);
	}
	
	public List findByStoreId(Object storeId
	) {
		return findByProperty(STORE_ID, storeId
		);
	}
	
	public List findByIntegral(Object integral
	) {
		return findByProperty(INTEGRAL, integral
		);
	}
	
	public List findByTaste(Object taste
	) {
		return findByProperty(TASTE, taste
		);
	}
	
	public List findByContent(Object content
	) {
		return findByProperty(CONTENT, content
		);
	}
	

	public List findAll() {
		log.debug("finding all CommdAppr instances");
		try {
			String queryString = "from CommdAppr";
	         Query queryObject = getSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public CommdAppr merge(CommdAppr detachedInstance) {
        log.debug("merging CommdAppr instance");
        try {
            CommdAppr result = (CommdAppr) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(CommdAppr instance) {
        log.debug("attaching dirty CommdAppr instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(CommdAppr instance) {
        log.debug("attaching clean CommdAppr instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
}