package com.smj.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.IBillInfoDao;
import com.smj.orm.BillInfo;

public class BillInfoDaoImpl extends HibernateDaoSupport implements IBillInfoDao {
	 

	public void save(BillInfo transientInstance) {
		getHibernateTemplate().save(transientInstance);

	}

	public void delete(BillInfo persistentInstance) {
		getHibernateTemplate().delete(persistentInstance);

	}

	public BillInfo findById(java.lang.String id) {
		BillInfo instance = (BillInfo) getHibernateTemplate().get("com.smj.orm.BillInfo",
				id);
		return instance;

	}

	public List <?> findByProperty(String propertyName, Object value) {
		String queryString = "from BillInfo as model where model."
				+ propertyName + "= ?";
		List <?> list = getHibernateTemplate().find(queryString,value);
		return list;

	}

	public List <?> findAll() {
		String queryString = "from BillInfo";
		List <?> list = getHibernateTemplate().find(queryString);
		return list;

	}

	public void merge(BillInfo detachedInstance) {
		getHibernateTemplate().merge(detachedInstance);

	}

}