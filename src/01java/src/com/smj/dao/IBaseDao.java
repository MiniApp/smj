package com.smj.dao;

import java.util.List;
import java.util.Map;

import com.smj.orm.Affiche;
import com.smj.orm.Brand;
import com.smj.orm.Cateory;
import com.smj.orm.Comm_info;
import com.smj.orm.CommdAppr;
import com.smj.orm.CommdArchives;
import com.smj.orm.Leaveword;
import com.smj.orm.Region;
import com.smj.orm.StoreInfo;


/**
 * 基础接口
 * 
 * @action 添加、修改、删除、查看、分页集合
 * 
 * */
public interface IBaseDao {

	/**
	 * 查看一条记录
	 * */
	@SuppressWarnings("rawtypes")
	public Object find(Class clazz, Integer id);
	
	/**
	 *  根据条件查询制定的值
	 *  clazz 表名  column 属性名  propertyName 查询条件  value查询值
	 * */
	@SuppressWarnings("rawtypes")
	public Object find(Class clazz,String column,String propertyName, Object value);
	
	/**
	 * 添加
	 * */
	@SuppressWarnings("rawtypes")
	public void save(Object po);

	/**
	 * 修改
	 * */
	@SuppressWarnings("rawtypes")
	public void merge(Object po);

	/**
	 * 删除
	 * */
	@SuppressWarnings("rawtypes")
	public void delete(Object po);

	/**
	 * 查询分页对象
	 * 
	 * @param calssname
	 *            表名，id id号，s 外键名字， pageNo 分页页数，pageSize 每页多少条数据
	 * */

	@SuppressWarnings("rawtypes")
	public List findByIdList(String calssname, Integer id, String s,
			int pageNo, int pageSize);

	/**
	 * 查询分页对象
	 * 
	 * @param Class clazz, int pageNo, int pageSize
	 * 
	 **/
	@SuppressWarnings("rawtypes")
	public List<?> findPaginated(Class clazz, int pageNo, int pageSize, Map map);
	
	@SuppressWarnings("rawtypes")
	public Object findObjectByField(Class clazz, Object field, Object value);
	
	@SuppressWarnings("rawtypes")
	public Object findObjectByField(Class clazz,Map map);
	
	/**
	 * 获取大小
	 * 
	 * @param Class clazz
	 * 
	 **/
	@SuppressWarnings("rawtypes")
	public Integer getCount(Class clazz, Map map);
	
	/**
	 *  查询商品种类--用于构造树
	 * 
	 * @param Class clazz
	 *  Map 查询条件
	 **/
	@SuppressWarnings("rawtypes")
	public List<Cateory> findCateory(Map map) ;
	
	/**
	 * 查询最大值--如种类编号，订单编号
	 * 
	 *  @param clazz 表名  column   map
	 * */
	@SuppressWarnings("rawtypes")
	public Object findMaxId(Class clazz,String column,Map map);
	
	/*
	 *     
	 * */
	@SuppressWarnings("rawtypes")
	public List<StoreInfo> findStoreInfo(Map map);
	
	@SuppressWarnings("rawtypes")
	public List<Affiche> findAfficeInfo(Map map);
	
	@SuppressWarnings("rawtypes")
	public List<Region> findRegion(Map map);
	
	@SuppressWarnings("rawtypes")
	public List findByName(Class clazz,String proertyName, int value);
	
	@SuppressWarnings("rawtypes")
	public void update(Class clazz,Map mapCondition,Map map);

	@SuppressWarnings("rawtypes")
	public List<Comm_info> findCommInfo(Map  map);
	
	@SuppressWarnings("rawtypes")
	public List<Cateory> findCateory(Object field,Object value,String condition);
    
	@SuppressWarnings("rawtypes")
	public List<Brand>  findBrand(Object field,Object value,String condition);
	
	@SuppressWarnings("rawtypes")
	public List<Leaveword> findAllLeave();
	
	@SuppressWarnings("rawtypes")
	public List<CommdAppr> findCommdAppr(Map map);
	
	@SuppressWarnings("rawtypes")
	public List<CommdArchives> findCommdArchives(Map map);
	
}
