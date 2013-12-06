package com.smj.service.impl;

import javax.annotation.Resource;

import com.smj.dao.IBaseDao;
/**    
 *         
 * 类名称：AbstractService    
 * 类描述：抽象服务类,提供公用服务注入   
 * 创建人：suhao    
 * 创建时间：2013-7-24 下午7:51:41    
 * 修改人：suhao    
 * 修改时间：2013-7-24 下午7:51:41    
 * 修改备注：    
 * @version     
 *     
 */
public class AbstractService {
	@Resource(name="dao") 
	private IBaseDao dao;// 持久服务

	public IBaseDao getDao() {
		return dao;
	}

	public void setDao(IBaseDao dao) {
		this.dao = dao;
	}
}
