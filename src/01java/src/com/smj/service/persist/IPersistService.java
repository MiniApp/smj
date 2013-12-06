package com.smj.service.persist;


public interface IPersistService {

	/**
	 * 通过SQL Mapping工具从映射文件中根据给定的查询名称ID进行查询.并返回映射后的分页结果对象
	 * 
	 * @param id
	 *            在SQL Mapping映射文件中定义的查询名称
	 * @param commdName
	 *            商品名称
	 * @param cateId
	 *            类别ID
	 * @param brandId
	 *            品牌ID
	 * 
	 * @return 返回分页结果对象
	 */
	public abstract PaginationSupport<?> findPaginatedBySqlMap(String id, String commdName, int cateId, String brandId,int storeId);
	public abstract PaginationSupport<?> findPaginatedBySqlMap(int commdId);
}
