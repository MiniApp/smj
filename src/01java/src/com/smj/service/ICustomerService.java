package com.smj.service;

import java.util.List;
import java.util.Map;

import com.smj.orm.Cust_info;
import com.smj.service.bean.CustInfoBean;

public interface ICustomerService {
	@SuppressWarnings("rawtypes")
	public List<Cust_info> getCustomerList(int pageNo, int pageSize, Map map);
	@SuppressWarnings("rawtypes")
	public Integer getCusCount(Map map);
	@SuppressWarnings("rawtypes")
	public String getJsonData(List rows, int pages, int total);
	public String getCustomerDetail(String cid);
	public void updateCustomerInfo(CustInfoBean bean);
}
