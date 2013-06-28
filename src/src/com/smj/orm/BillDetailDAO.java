package com.smj.orm;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 	* A data access object (DAO) providing persistence and search support for BillDetail entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smj.orm.BillDetail
  * @author MyEclipse Persistence Tools 
 */

public class BillDetailDAO extends BaseHibernateDAO  {
		 private static final Log log = LogFactory.getLog(BillDetailDAO.class);
		//property constants
	public static final String COMMD_ID = "commdId";
	public static final String COMMD_NUM = "commdNum";



    
    public void save(BillDetail transientInstance) {
        log.debug("saving BillDetail instance");
        try {
            getSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(BillDetail persistentInstance) {
        log.debug("deleting BillDetail instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public BillDetail findById( com.smj.orm.BillDetailId id) {
        log.debug("getting BillDetail instance with id: " + id);
        try {
            BillDetail instance = (BillDetail) getSession()
                    .get("com.smj.orm.BillDetail", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(BillDetail instance) {
        log.debug("finding BillDetail instance by example");
        try {
            List results = getSession()
                    .createCriteria("com.smj.orm.BillDetail")
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
      log.debug("finding BillDetail instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from BillDetail as model where model." 
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
	
	public List findByCommdNum(Object commdNum
	) {
		return findByProperty(COMMD_NUM, commdNum
		);
	}
	

	public List findAll() {
		log.debug("finding all BillDetail instances");
		try {
			String queryString = "from BillDetail";
	         Query queryObject = getSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public BillDetail merge(BillDetail detachedInstance) {
        log.debug("merging BillDetail instance");
        try {
            BillDetail result = (BillDetail) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(BillDetail instance) {
        log.debug("attaching dirty BillDetail instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(BillDetail instance) {
        log.debug("attaching clean BillDetail instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
}