package com.smj.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.IBillDetailDao;
import com.smj.orm.BillDetail;

/**
 * @author Lipw
 * @date Jun 27, 2013
 */
public class BillDetailDaoImpl extends HibernateDaoSupport implements
		IBillDetailDao {

	public void save(BillDetail transientInstance) {
		getHibernateTemplate().save(transientInstance);

	}

	public void delete(BillDetail persistentInstance) {
		getHibernateTemplate().delete(persistentInstance);

	}

	public BillDetail findById(com.smj.orm.BillDetailId id) {
		BillDetail instance = (BillDetail) getHibernateTemplate().get(
				"com.smj.orm.BillDetail", id);
		return instance;

	}

	public List <?> findByProperty(String propertyName, Object value) {
		String queryString = "from BillDetail as model where model."
				+ propertyName + "= ?";
		List <?> list = getHibernateTemplate().find(queryString, value);
		return list;

	}

	public List <?> findAll() {
		String queryString = "from BillDetail";
		List <?> list = getHibernateTemplate().find(queryString);
		return list;

	}

	public void merge(BillDetail detachedInstance) {
		getHibernateTemplate().merge(detachedInstance);

	}

}