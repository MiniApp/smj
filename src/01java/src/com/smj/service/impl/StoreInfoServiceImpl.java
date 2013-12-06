package com.smj.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import com.smj.orm.StoreInfo;
import com.smj.service.IStoreInfoService;

/**    
 *         
 * Class Name：
 *			StoreInfoServiceImpl    
 * Description：    
 *			描述
 * Author：	gongtao  
 * Date：	2013-8-13 上午10:57:16    
 * @version	
 *     
 */
@Service("IStoreInfoService")
public class StoreInfoServiceImpl extends AbstractService implements IStoreInfoService{

	
	/**
	 * 方法： addStoreInfo 功能：新增店铺信息
	 * 
	 * @param StoreInfo info
	 * @return 
	 * @since
	 */
	@Override
	public void addStoreInfo(StoreInfo info) {
		this.getDao().save(info);
	}

	

	@Override
	public Object find(String column, String propertyName, Object value) {
	  // TODO Auto-generated method stub
		return  this.getDao().find(StoreInfo.class, column, propertyName, value);
	}



	@Override
	public List<StoreInfo> findStoreInfo(Map map) {
		// TODO Auto-generated method stub
		return this.getDao().findStoreInfo(map);
	}



	@Override
	public void Merage(StoreInfo store) {
		// TODO Auto-generated method stub
		this.getDao().merge(store);
	}

	
}
