package com.smj.orm;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 	* A data access object (DAO) providing persistence and search support for CommdSaleTotal entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smj.orm.CommdSaleTotal
  * @author MyEclipse Persistence Tools 
 */

public class CommdSaleTotalDAO extends BaseHibernateDAO  {
		 private static final Log log = LogFactory.getLog(CommdSaleTotalDAO.class);
		//property constants
	public static final String COMMD_ID = "commdId";
	public static final String COMMD_SALE_NUM = "commdSaleNum";
	public static final String COMMD_SALE_AMT = "commdSaleAmt";



    
    public void save(CommdSaleTotal transientInstance) {
        log.debug("saving CommdSaleTotal instance");
        try {
            getSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(CommdSaleTotal persistentInstance) {
        log.debug("deleting CommdSaleTotal instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public CommdSaleTotal findById( java.lang.Integer id) {
        log.debug("getting CommdSaleTotal instance with id: " + id);
        try {
            CommdSaleTotal instance = (CommdSaleTotal) getSession()
                    .get("com.smj.orm.CommdSaleTotal", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(CommdSaleTotal instance) {
        log.debug("finding CommdSaleTotal instance by example");
        try {
            List results = getSession()
                    .createCriteria("com.smj.orm.CommdSaleTotal")
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
      log.debug("finding CommdSaleTotal instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from CommdSaleTotal as model where model." 
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
	
	public List findByCommdSaleNum(Object commdSaleNum
	) {
		return findByProperty(COMMD_SALE_NUM, commdSaleNum
		);
	}
	
	public List findByCommdSaleAmt(Object commdSaleAmt
	) {
		return findByProperty(COMMD_SALE_AMT, commdSaleAmt
		);
	}
	

	public List findAll() {
		log.debug("finding all CommdSaleTotal instances");
		try {
			String queryString = "from CommdSaleTotal";
	         Query queryObject = getSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public CommdSaleTotal merge(CommdSaleTotal detachedInstance) {
        log.debug("merging CommdSaleTotal instance");
        try {
            CommdSaleTotal result = (CommdSaleTotal) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(CommdSaleTotal instance) {
        log.debug("attaching dirty CommdSaleTotal instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(CommdSaleTotal instance) {
        log.debug("attaching clean CommdSaleTotal instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
}