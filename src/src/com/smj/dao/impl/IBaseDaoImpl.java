package com.smj.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.smj.dao.IBaseDao;
import com.smj.orm.Appriase;
/**
 * IAppriaseDao接口实现类
 * 
 * */
public class IBaseDaoImpl extends HibernateDaoSupport implements IBaseDao{
	@Resource
	HibernateTemplate ht;
	/**
	 * 查询
	 * */
	@SuppressWarnings("rawtypes")
	public Object find(Class clazz,Integer id) {
		return ht.get(clazz, id);
	}
	/**
	 * 新增
	 * */
	@SuppressWarnings("rawtypes")
	public void save(Class clazz) {
		try{
			ht.save(clazz);
		}catch(RuntimeException e){
			throw e;
		}
	}
	/**
	 * 修改
	 * 
	 * 
	 * */
	@SuppressWarnings("rawtypes")
	public void merge(Class clazz) {
		try{
			ht.merge(clazz);
		}catch(RuntimeException e){
			throw e;
		}
	}
	/**
	 * 删除
	 * 
	 * 
	 * */
	@SuppressWarnings("rawtypes")
	public void delete(Class clazz) {
		try{
			ht.delete(clazz);
		}catch(RuntimeException e){
			throw e;
		}
	}
	/**
	 * 根据对象名，外键名，id查询分页对象
	 * 
	 * 
	 * */

	@SuppressWarnings("rawtypes")
	public List findByIdList(String calssname,Integer id,String s,int pageNo,int pageSize) {
		final String name=calssname;
		final String ss=s;
		final int pNo=pageNo;
		final int PS=pageSize;
		final Integer i=id;
		List list=ht.executeFind(new HibernateCallback() {
			
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query queryObject=session.createQuery(
						"FROM "+name+" as a WHERE "+ss+" =:p1");
				queryObject.setInteger("p1", i);
				//设置页数
				queryObject.setFirstResult((pNo-1)*PS);
				//设置每页数据
				queryObject.setMaxResults(PS);
				return queryObject.list();
			}
		});
		return list;
	}

}
