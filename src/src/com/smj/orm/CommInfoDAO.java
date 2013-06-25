package com.smj.orm;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 	* A data access object (DAO) providing persistence and search support for CommInfo entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smj.orm.CommInfo
  * @author MyEclipse Persistence Tools 
 */

public class CommInfoDAO extends BaseHibernateDAO  {
		 private static final Log log = LogFactory.getLog(CommInfoDAO.class);
		//property constants
	public static final String COMMD_NAME = "commdName";
	public static final String COMMD_LOGO = "commdLogo";
	public static final String IMG1 = "img1";
	public static final String IMG2 = "img2";
	public static final String IMG3 = "img3";
	public static final String ONE_DIMENSION = "oneDimension";
	public static final String TWO_DIMENSION = "twoDimension";
	public static final String _UID = "UId";
	public static final String COMMD_WEIGHT = "commdWeight";
	public static final String COMMD_LICENSE = "commdLicense";
	public static final String COMMD_CREA_DATE = "commdCreaDate";
	public static final String COMMD_PRODUCE_PLACE = "commdProducePlace";
	public static final String COMMD_SIZE = "commdSize";
	public static final String COMMD_DESCRIPTION = "commdDescription";
	public static final String AGORA_PRICE = "agoraPrice";
	public static final String USER_PRICE = "userPrice";
	public static final String SALE_PRICE = "salePrice";
	public static final String PROM_PRICE = "promPrice";
	public static final String TASTE = "taste";
	public static final String EQUIP = "equip";
	public static final String INTEGRAL = "integral";
	public static final String MIX_NUM = "mixNum";
	public static final String HAVE_NUM = "haveNum";
	public static final String QUALIFIED = "qualified";
	public static final String USES = "uses";
	public static final String NUMBER = "number";
	public static final String MEMO = "memo";
	public static final String REMARK1 = "remark1";
	public static final String REMARK2 = "remark2";
	public static final String REMARK3 = "remark3";
	public static final String REMARK4 = "remark4";
	public static final String REMARK5 = "remark5";



    
    public void save(CommInfo transientInstance) {
        log.debug("saving CommInfo instance");
        try {
            getSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(CommInfo persistentInstance) {
        log.debug("deleting CommInfo instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public CommInfo findById( com.smj.orm.CommInfoId id) {
        log.debug("getting CommInfo instance with id: " + id);
        try {
            CommInfo instance = (CommInfo) getSession()
                    .get("com.smj.orm.CommInfo", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(CommInfo instance) {
        log.debug("finding CommInfo instance by example");
        try {
            List results = getSession()
                    .createCriteria("com.smj.orm.CommInfo")
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
      log.debug("finding CommInfo instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from CommInfo as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByCommdName(Object commdName
	) {
		return findByProperty(COMMD_NAME, commdName
		);
	}
	
	public List findByCommdLogo(Object commdLogo
	) {
		return findByProperty(COMMD_LOGO, commdLogo
		);
	}
	
	public List findByImg1(Object img1
	) {
		return findByProperty(IMG1, img1
		);
	}
	
	public List findByImg2(Object img2
	) {
		return findByProperty(IMG2, img2
		);
	}
	
	public List findByImg3(Object img3
	) {
		return findByProperty(IMG3, img3
		);
	}
	
	public List findByOneDimension(Object oneDimension
	) {
		return findByProperty(ONE_DIMENSION, oneDimension
		);
	}
	
	public List findByTwoDimension(Object twoDimension
	) {
		return findByProperty(TWO_DIMENSION, twoDimension
		);
	}
	
	public List findByUId(Object UId
	) {
		return findByProperty(_UID, UId
		);
	}
	
	public List findByCommdWeight(Object commdWeight
	) {
		return findByProperty(COMMD_WEIGHT, commdWeight
		);
	}
	
	public List findByCommdLicense(Object commdLicense
	) {
		return findByProperty(COMMD_LICENSE, commdLicense
		);
	}
	
	public List findByCommdCreaDate(Object commdCreaDate
	) {
		return findByProperty(COMMD_CREA_DATE, commdCreaDate
		);
	}
	
	public List findByCommdProducePlace(Object commdProducePlace
	) {
		return findByProperty(COMMD_PRODUCE_PLACE, commdProducePlace
		);
	}
	
	public List findByCommdSize(Object commdSize
	) {
		return findByProperty(COMMD_SIZE, commdSize
		);
	}
	
	public List findByCommdDescription(Object commdDescription
	) {
		return findByProperty(COMMD_DESCRIPTION, commdDescription
		);
	}
	
	public List findByAgoraPrice(Object agoraPrice
	) {
		return findByProperty(AGORA_PRICE, agoraPrice
		);
	}
	
	public List findByUserPrice(Object userPrice
	) {
		return findByProperty(USER_PRICE, userPrice
		);
	}
	
	public List findBySalePrice(Object salePrice
	) {
		return findByProperty(SALE_PRICE, salePrice
		);
	}
	
	public List findByPromPrice(Object promPrice
	) {
		return findByProperty(PROM_PRICE, promPrice
		);
	}
	
	public List findByTaste(Object taste
	) {
		return findByProperty(TASTE, taste
		);
	}
	
	public List findByEquip(Object equip
	) {
		return findByProperty(EQUIP, equip
		);
	}
	
	public List findByIntegral(Object integral
	) {
		return findByProperty(INTEGRAL, integral
		);
	}
	
	public List findByMixNum(Object mixNum
	) {
		return findByProperty(MIX_NUM, mixNum
		);
	}
	
	public List findByHaveNum(Object haveNum
	) {
		return findByProperty(HAVE_NUM, haveNum
		);
	}
	
	public List findByQualified(Object qualified
	) {
		return findByProperty(QUALIFIED, qualified
		);
	}
	
	public List findByUses(Object uses
	) {
		return findByProperty(USES, uses
		);
	}
	
	public List findByNumber(Object number
	) {
		return findByProperty(NUMBER, number
		);
	}
	
	public List findByMemo(Object memo
	) {
		return findByProperty(MEMO, memo
		);
	}
	
	public List findByRemark1(Object remark1
	) {
		return findByProperty(REMARK1, remark1
		);
	}
	
	public List findByRemark2(Object remark2
	) {
		return findByProperty(REMARK2, remark2
		);
	}
	
	public List findByRemark3(Object remark3
	) {
		return findByProperty(REMARK3, remark3
		);
	}
	
	public List findByRemark4(Object remark4
	) {
		return findByProperty(REMARK4, remark4
		);
	}
	
	public List findByRemark5(Object remark5
	) {
		return findByProperty(REMARK5, remark5
		);
	}
	

	public List findAll() {
		log.debug("finding all CommInfo instances");
		try {
			String queryString = "from CommInfo";
	         Query queryObject = getSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public CommInfo merge(CommInfo detachedInstance) {
        log.debug("merging CommInfo instance");
        try {
            CommInfo result = (CommInfo) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(CommInfo instance) {
        log.debug("attaching dirty CommInfo instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(CommInfo instance) {
        log.debug("attaching clean CommInfo instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
}