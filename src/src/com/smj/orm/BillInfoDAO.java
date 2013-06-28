package com.smj.orm;

import java.sql.Timestamp;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 	* A data access object (DAO) providing persistence and search support for BillInfo entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smj.orm.BillInfo
  * @author MyEclipse Persistence Tools 
 */

public class BillInfoDAO extends BaseHibernateDAO  {
		 private static final Log log = LogFactory.getLog(BillInfoDAO.class);
		//property constants
	public static final String CUST_ID = "custId";
	public static final String BILL_TYPE = "billType";
	public static final String CUST_NAME = "custName";
	public static final String CUST_TEL = "custTel";
	public static final String CUST_ADDR = "custAddr";
	public static final String ACCU = "accu";
	public static final String IS_INVOICE = "isInvoice";
	public static final String IS_VINTEGRAL = "isVintegral";
	public static final String AMT = "amt";
	public static final String BILL_STATE = "billState";
	public static final String PAY_TYPE = "payType";
	public static final String REJECT_FLG = "rejectFlg";
	public static final String REJECT_CAUSE = "rejectCause";
	public static final String DELIVER_FEE = "deliverFee";
	public static final String BILL_APPR = "billAppr";
	public static final String USER_APPR = "userAppr";
	public static final String MEMO = "memo";



    
    public void save(BillInfo transientInstance) {
        log.debug("saving BillInfo instance");
        try {
            getSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(BillInfo persistentInstance) {
        log.debug("deleting BillInfo instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public BillInfo findById( java.lang.String id) {
        log.debug("getting BillInfo instance with id: " + id);
        try {
            BillInfo instance = (BillInfo) getSession()
                    .get("com.smj.orm.BillInfo", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(BillInfo instance) {
        log.debug("finding BillInfo instance by example");
        try {
            List results = getSession()
                    .createCriteria("com.smj.orm.BillInfo")
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
      log.debug("finding BillInfo instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from BillInfo as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByCustId(Object custId
	) {
		return findByProperty(CUST_ID, custId
		);
	}
	
	public List findByBillType(Object billType
	) {
		return findByProperty(BILL_TYPE, billType
		);
	}
	
	public List findByCustName(Object custName
	) {
		return findByProperty(CUST_NAME, custName
		);
	}
	
	public List findByCustTel(Object custTel
	) {
		return findByProperty(CUST_TEL, custTel
		);
	}
	
	public List findByCustAddr(Object custAddr
	) {
		return findByProperty(CUST_ADDR, custAddr
		);
	}
	
	public List findByAccu(Object accu
	) {
		return findByProperty(ACCU, accu
		);
	}
	
	public List findByIsInvoice(Object isInvoice
	) {
		return findByProperty(IS_INVOICE, isInvoice
		);
	}
	
	public List findByIsVintegral(Object isVintegral
	) {
		return findByProperty(IS_VINTEGRAL, isVintegral
		);
	}
	
	public List findByAmt(Object amt
	) {
		return findByProperty(AMT, amt
		);
	}
	
	public List findByBillState(Object billState
	) {
		return findByProperty(BILL_STATE, billState
		);
	}
	
	public List findByPayType(Object payType
	) {
		return findByProperty(PAY_TYPE, payType
		);
	}
	
	public List findByRejectFlg(Object rejectFlg
	) {
		return findByProperty(REJECT_FLG, rejectFlg
		);
	}
	
	public List findByRejectCause(Object rejectCause
	) {
		return findByProperty(REJECT_CAUSE, rejectCause
		);
	}
	
	public List findByDeliverFee(Object deliverFee
	) {
		return findByProperty(DELIVER_FEE, deliverFee
		);
	}
	
	public List findByBillAppr(Object billAppr
	) {
		return findByProperty(BILL_APPR, billAppr
		);
	}
	
	public List findByUserAppr(Object userAppr
	) {
		return findByProperty(USER_APPR, userAppr
		);
	}
	
	public List findByMemo(Object memo
	) {
		return findByProperty(MEMO, memo
		);
	}
	

	public List findAll() {
		log.debug("finding all BillInfo instances");
		try {
			String queryString = "from BillInfo";
	         Query queryObject = getSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public BillInfo merge(BillInfo detachedInstance) {
        log.debug("merging BillInfo instance");
        try {
            BillInfo result = (BillInfo) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(BillInfo instance) {
        log.debug("attaching dirty BillInfo instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(BillInfo instance) {
        log.debug("attaching clean BillInfo instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
}