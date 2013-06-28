package com.smj.dao;

import java.util.List;

import com.smj.orm.Appriase;

/**
 * 基础接口
 * @action 添加、修改、删除、查看、分页集合
 * 
 * */
public interface IBaseDao {

	/**
	 * 查看一条店铺评价
	 * */
	@SuppressWarnings("rawtypes")
	public Object find(Class clazz,Integer id);	
	
	/**
	 * 添加
	 * */
	@SuppressWarnings("rawtypes")
	public void save(Class clazz);
	
	/**
	 * 修改
	 * */
	@SuppressWarnings("rawtypes")
	public void merge(Class clazz);
	
	/**
	 * 删除
	 * */
	@SuppressWarnings("rawtypes")
	public void delete(Class clazz);
	
	/**
	 * 查询分页对象
	 * @param calssname 表名，id id号，s 外键名字， pageNo 分页页数，pageSize 每页多少条数据
	 * */
	
	@SuppressWarnings("rawtypes")
	public List findByIdList(String calssname,Integer id,String s,int pageNo,int pageSize);
}
