package com.smj.orm;

import java.sql.Timestamp;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 	* A data access object (DAO) providing persistence and search support for EAdmininfo entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smj.orm.EAdmininfo
  * @author MyEclipse Persistence Tools 
 */

public class EAdmininfoDAO extends BaseHibernateDAO  {
		 private static final Log log = LogFactory.getLog(EAdmininfoDAO.class);
		//property constants
	public static final String STORE_ID = "storeId";
	public static final String ADMIN_NAME = "adminName";
	public static final String ADMIN_PWD = "adminPwd";
	public static final String ADMIN_TYPE = "adminType";
	public static final String ADMIN_STATE = "adminState";
	public static final String ERROR_COUNT = "errorCount";



    
    public void save(EAdmininfo transientInstance) {
        log.debug("saving EAdmininfo instance");
        try {
            getSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(EAdmininfo persistentInstance) {
        log.debug("deleting EAdmininfo instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public EAdmininfo findById( java.lang.Integer id) {
        log.debug("getting EAdmininfo instance with id: " + id);
        try {
            EAdmininfo instance = (EAdmininfo) getSession()
                    .get("com.smj.orm.EAdmininfo", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(EAdmininfo instance) {
        log.debug("finding EAdmininfo instance by example");
        try {
            List results = getSession()
                    .createCriteria("com.smj.orm.EAdmininfo")
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
      log.debug("finding EAdmininfo instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from EAdmininfo as model where model." 
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
	
	public List findByAdminName(Object adminName
	) {
		return findByProperty(ADMIN_NAME, adminName
		);
	}
	
	public List findByAdminPwd(Object adminPwd
	) {
		return findByProperty(ADMIN_PWD, adminPwd
		);
	}
	
	public List findByAdminType(Object adminType
	) {
		return findByProperty(ADMIN_TYPE, adminType
		);
	}
	
	public List findByAdminState(Object adminState
	) {
		return findByProperty(ADMIN_STATE, adminState
		);
	}
	
	public List findByErrorCount(Object errorCount
	) {
		return findByProperty(ERROR_COUNT, errorCount
		);
	}
	

	public List findAll() {
		log.debug("finding all EAdmininfo instances");
		try {
			String queryString = "from EAdmininfo";
	         Query queryObject = getSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public EAdmininfo merge(EAdmininfo detachedInstance) {
        log.debug("merging EAdmininfo instance");
        try {
            EAdmininfo result = (EAdmininfo) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(EAdmininfo instance) {
        log.debug("attaching dirty EAdmininfo instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(EAdmininfo instance) {
        log.debug("attaching clean EAdmininfo instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
}