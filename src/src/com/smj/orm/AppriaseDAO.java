package com.smj.orm;

import java.sql.Timestamp;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 	* A data access object (DAO) providing persistence and search support for Appriase entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smj.orm.Appriase
  * @author MyEclipse Persistence Tools 
 */

public class AppriaseDAO extends BaseHibernateDAO  {
		 private static final Log log = LogFactory.getLog(AppriaseDAO.class);
		//property constants
	public static final String STORE_ID = "storeId";
	public static final String APPRI_CONTENT = "appriContent";
	public static final String SPEED = "speed";
	public static final String INTEGRITY = "integrity";
	public static final String SERVICE = "service";
	public static final String IS_VALIDATE = "isValidate";
	public static final String IS_ASK = "isAsk";



    
    public void save(Appriase transientInstance) {
        log.debug("saving Appriase instance");
        try {
            getSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Appriase persistentInstance) {
        log.debug("deleting Appriase instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Appriase findById( java.lang.Integer id) {
        log.debug("getting Appriase instance with id: " + id);
        try {
            Appriase instance = (Appriase) getSession()
                    .get("com.smj.orm.Appriase", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Appriase instance) {
        log.debug("finding Appriase instance by example");
        try {
            List results = getSession()
                    .createCriteria("com.smj.orm.Appriase")
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
      log.debug("finding Appriase instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Appriase as model where model." 
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
	
	public List findByAppriContent(Object appriContent
	) {
		return findByProperty(APPRI_CONTENT, appriContent
		);
	}
	
	public List findBySpeed(Object speed
	) {
		return findByProperty(SPEED, speed
		);
	}
	
	public List findByIntegrity(Object integrity
	) {
		return findByProperty(INTEGRITY, integrity
		);
	}
	
	public List findByService(Object service
	) {
		return findByProperty(SERVICE, service
		);
	}
	
	public List findByIsValidate(Object isValidate
	) {
		return findByProperty(IS_VALIDATE, isValidate
		);
	}
	
	public List findByIsAsk(Object isAsk
	) {
		return findByProperty(IS_ASK, isAsk
		);
	}
	

	public List findAll() {
		log.debug("finding all Appriase instances");
		try {
			String queryString = "from Appriase";
	         Query queryObject = getSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Appriase merge(Appriase detachedInstance) {
        log.debug("merging Appriase instance");
        try {
            Appriase result = (Appriase) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Appriase instance) {
        log.debug("attaching dirty Appriase instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Appriase instance) {
        log.debug("attaching clean Appriase instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
}