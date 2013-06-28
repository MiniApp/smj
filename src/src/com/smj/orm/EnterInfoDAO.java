package com.smj.orm;

import java.sql.Timestamp;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 	* A data access object (DAO) providing persistence and search support for EnterInfo entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smj.orm.EnterInfo
  * @author MyEclipse Persistence Tools 
 */

public class EnterInfoDAO extends BaseHibernateDAO  {
		 private static final Log log = LogFactory.getLog(EnterInfoDAO.class);
		//property constants
	public static final String ENTER_NAME = "enterName";
	public static final String LEGAL_REPR_ID = "legalReprId";
	public static final String LEGAL_REPR_NAME = "legalReprName";
	public static final String CERT_TYPE = "certType";
	public static final String CERT_ID = "certId";
	public static final String ENTER_ADDR = "enterAddr";
	public static final String RESPB_PERSON = "respbPerson";
	public static final String TEL_NO = "telNo";
	public static final String ENTER_STATE = "enterState";
	public static final String ENTER_BUSS_LICEN = "enterBussLicen";
	public static final String ENTER_BUSS_LICEN_IMG = "enterBussLicenImg";



    
    public void save(EnterInfo transientInstance) {
        log.debug("saving EnterInfo instance");
        try {
            getSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(EnterInfo persistentInstance) {
        log.debug("deleting EnterInfo instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public EnterInfo findById( java.lang.Integer id) {
        log.debug("getting EnterInfo instance with id: " + id);
        try {
            EnterInfo instance = (EnterInfo) getSession()
                    .get("com.smj.orm.EnterInfo", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(EnterInfo instance) {
        log.debug("finding EnterInfo instance by example");
        try {
            List results = getSession()
                    .createCriteria("com.smj.orm.EnterInfo")
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
      log.debug("finding EnterInfo instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from EnterInfo as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByEnterName(Object enterName
	) {
		return findByProperty(ENTER_NAME, enterName
		);
	}
	
	public List findByLegalReprId(Object legalReprId
	) {
		return findByProperty(LEGAL_REPR_ID, legalReprId
		);
	}
	
	public List findByLegalReprName(Object legalReprName
	) {
		return findByProperty(LEGAL_REPR_NAME, legalReprName
		);
	}
	
	public List findByCertType(Object certType
	) {
		return findByProperty(CERT_TYPE, certType
		);
	}
	
	public List findByCertId(Object certId
	) {
		return findByProperty(CERT_ID, certId
		);
	}
	
	public List findByEnterAddr(Object enterAddr
	) {
		return findByProperty(ENTER_ADDR, enterAddr
		);
	}
	
	public List findByRespbPerson(Object respbPerson
	) {
		return findByProperty(RESPB_PERSON, respbPerson
		);
	}
	
	public List findByTelNo(Object telNo
	) {
		return findByProperty(TEL_NO, telNo
		);
	}
	
	public List findByEnterState(Object enterState
	) {
		return findByProperty(ENTER_STATE, enterState
		);
	}
	
	public List findByEnterBussLicen(Object enterBussLicen
	) {
		return findByProperty(ENTER_BUSS_LICEN, enterBussLicen
		);
	}
	
	public List findByEnterBussLicenImg(Object enterBussLicenImg
	) {
		return findByProperty(ENTER_BUSS_LICEN_IMG, enterBussLicenImg
		);
	}
	

	public List findAll() {
		log.debug("finding all EnterInfo instances");
		try {
			String queryString = "from EnterInfo";
	         Query queryObject = getSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public EnterInfo merge(EnterInfo detachedInstance) {
        log.debug("merging EnterInfo instance");
        try {
            EnterInfo result = (EnterInfo) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(EnterInfo instance) {
        log.debug("attaching dirty EnterInfo instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(EnterInfo instance) {
        log.debug("attaching clean EnterInfo instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
}