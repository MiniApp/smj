package com.smj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.smj.orm.EAdmininfo;
import com.smj.orm.EnterInfo;
import com.smj.service.IEAdminInfoService;




/**
 * 
 * 类名称： 类描述： 创建人：suhao 创建时间：2013-7-24 下午7:34:12 修改人：suhao
 * 修改时间：2013-7-24 下午7:34:12 修改备注：
 * 
 * @version
 * 
 */
@Service("eadminService")
public class EAdminInfoServiceImpl extends AbstractService  implements
    IEAdminInfoService{

	@SuppressWarnings("rawtypes")
	public Integer getCusCount(Map map) {
		// TODO Auto-generated method stub
		return  this.getDao().getCount(EAdmininfo.class, map);
	}

	public String getCustomerDetail(String cid) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<EAdmininfo> getCustomerList(int pageNo, int pageSize, Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	public String getJsonData(List rows, int pages, int total) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object find() {
		// TODO Auto-generated method stub
		
		Integer id = 1;
		return this.getDao().find(EAdmininfo.class, id);
	}

	@Override
	public void addAdmin(EAdmininfo info) {
		this.getDao().save(info);
	}

	@Override
	@SuppressWarnings("rawtypes")
	public  Object getEAdmininfoByPro(String propertyName, Object value) {
		return this.getDao().findObjectByField(EAdmininfo.class, propertyName, value);
	}

	@Override
	@SuppressWarnings("rawtypes")
	public Object find(String column, String propertyName,
			Object value) {
		// TODO Auto-generated method stub
		return this.getDao().find(EAdmininfo.class, column, propertyName, value);
	}

	@Override
	public void merage(EAdmininfo info) {
		// TODO Auto-generated method stub
		this.getDao().merge(info);
	}

	
	
	
}
