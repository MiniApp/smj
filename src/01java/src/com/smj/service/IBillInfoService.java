package com.smj.service;

import java.util.List;
import java.util.Map;

import com.smj.service.bean.BillInfoBean;

public interface IBillInfoService {
	@SuppressWarnings("rawtypes")
	public List<BillInfoBean> getBillInfoList(int pageNo, int pageSize, Map map);
	@SuppressWarnings("rawtypes")
	public Integer getCount(Map map);
	@SuppressWarnings("rawtypes")
	public String getJsonData(List rows, int pages, int total);
	public String getBillInfoDetail(String cid);
}
