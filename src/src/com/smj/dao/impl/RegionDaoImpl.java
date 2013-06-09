package com.smj.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.IRedionDao;
import com.smj.orm.Region;

public class RegionDaoImpl extends HibernateDaoSupport implements IRedionDao {
	private static final Log log = LogFactory.getLog(RegionDaoImpl.class);

	public Region findById(String id) {

			try {
				Region instance = (Region) getSession().get("com.smj.orm.Region",
						id);
				return instance;
			} catch (RuntimeException re) {
				log.error("get failed", re);
				throw re;
			}
		}
	
	public List <Region> findByPid(String pid){
		String sql = "from Region where parentId =?";
		return this.getHibernateTemplate().find(sql,pid);
	}

}
