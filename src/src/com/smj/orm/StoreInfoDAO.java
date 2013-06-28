package com.smj.orm;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 	* A data access object (DAO) providing persistence and search support for StoreInfo entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smj.orm.StoreInfo
  * @author MyEclipse Persistence Tools 
 */

public class StoreInfoDAO extends BaseHibernateDAO  {
		 private static final Log log = LogFactory.getLog(StoreInfoDAO.class);
		//property constants
	public static final String ENTER_ID = "enterId";
	public static final String STORE_NAME = "storeName";
	public static final String STORE_LEVEL = "storeLevel";
	public static final String STORE_ADDR = "storeAddr";
	public static final String CONT_PERSON = "contPerson";
	public static final String CONT_TEL = "contTel";
	public static final String CONT_QQ = "contQq";
	public static final String STORE_LOGO = "storeLogo";
	public static final String SERVICE = "service";
	public static final String DELIVER_PRICE = "deliverPrice";
	public static final String SHIPPING_FEE = "shippingFee";
	public static final String RESP_TIME = "respTime";
	public static final String STORE_STATE = "storeState";
	public static final String STORE_TYPE = "storeType";
	public static final String STORE_RANK_ACCU = "storeRankAccu";
	public static final String STORE_RANK = "storeRank";
	public static final String STORE_CREDIT = "storeCredit";
	public static final String ORDER_NUM = "orderNum";
	public static final String ACCESS_NUM = "accessNum";
	public static final String DELIVER_RANGE = "deliverRange";



    
    public void save(StoreInfo transientInstance) {
        log.debug("saving StoreInfo instance");
        try {
            getSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(StoreInfo persistentInstance) {
        log.debug("deleting StoreInfo instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public StoreInfo findById( java.lang.Integer id) {
        log.debug("getting StoreInfo instance with id: " + id);
        try {
            StoreInfo instance = (StoreInfo) getSession()
                    .get("com.smj.orm.StoreInfo", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(StoreInfo instance) {
        log.debug("finding StoreInfo instance by example");
        try {
            List results = getSession()
                    .createCriteria("com.smj.orm.StoreInfo")
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
      log.debug("finding StoreInfo instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from StoreInfo as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByEnterId(Object enterId
	) {
		return findByProperty(ENTER_ID, enterId
		);
	}
	
	public List findByStoreName(Object storeName
	) {
		return findByProperty(STORE_NAME, storeName
		);
	}
	
	public List findByStoreLevel(Object storeLevel
	) {
		return findByProperty(STORE_LEVEL, storeLevel
		);
	}
	
	public List findByStoreAddr(Object storeAddr
	) {
		return findByProperty(STORE_ADDR, storeAddr
		);
	}
	
	public List findByContPerson(Object contPerson
	) {
		return findByProperty(CONT_PERSON, contPerson
		);
	}
	
	public List findByContTel(Object contTel
	) {
		return findByProperty(CONT_TEL, contTel
		);
	}
	
	public List findByContQq(Object contQq
	) {
		return findByProperty(CONT_QQ, contQq
		);
	}
	
	public List findByStoreLogo(Object storeLogo
	) {
		return findByProperty(STORE_LOGO, storeLogo
		);
	}
	
	public List findByService(Object service
	) {
		return findByProperty(SERVICE, service
		);
	}
	
	public List findByDeliverPrice(Object deliverPrice
	) {
		return findByProperty(DELIVER_PRICE, deliverPrice
		);
	}
	
	public List findByShippingFee(Object shippingFee
	) {
		return findByProperty(SHIPPING_FEE, shippingFee
		);
	}
	
	public List findByRespTime(Object respTime
	) {
		return findByProperty(RESP_TIME, respTime
		);
	}
	
	public List findByStoreState(Object storeState
	) {
		return findByProperty(STORE_STATE, storeState
		);
	}
	
	public List findByStoreType(Object storeType
	) {
		return findByProperty(STORE_TYPE, storeType
		);
	}
	
	public List findByStoreRankAccu(Object storeRankAccu
	) {
		return findByProperty(STORE_RANK_ACCU, storeRankAccu
		);
	}
	
	public List findByStoreRank(Object storeRank
	) {
		return findByProperty(STORE_RANK, storeRank
		);
	}
	
	public List findByStoreCredit(Object storeCredit
	) {
		return findByProperty(STORE_CREDIT, storeCredit
		);
	}
	
	public List findByOrderNum(Object orderNum
	) {
		return findByProperty(ORDER_NUM, orderNum
		);
	}
	
	public List findByAccessNum(Object accessNum
	) {
		return findByProperty(ACCESS_NUM, accessNum
		);
	}
	
	public List findByDeliverRange(Object deliverRange
	) {
		return findByProperty(DELIVER_RANGE, deliverRange
		);
	}
	

	public List findAll() {
		log.debug("finding all StoreInfo instances");
		try {
			String queryString = "from StoreInfo";
	         Query queryObject = getSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public StoreInfo merge(StoreInfo detachedInstance) {
        log.debug("merging StoreInfo instance");
        try {
            StoreInfo result = (StoreInfo) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(StoreInfo instance) {
        log.debug("attaching dirty StoreInfo instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(StoreInfo instance) {
        log.debug("attaching clean StoreInfo instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
}