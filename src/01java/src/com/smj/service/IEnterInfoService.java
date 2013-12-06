package com.smj.service;

import java.util.List;
import java.util.Map;

import com.smj.orm.EnterInfo;
import com.smj.service.bean.EnterInfoBean;

public interface IEnterInfoService {
	@SuppressWarnings("unchecked")
	public List<EnterInfo> getEnterList(int pageNo, int pageSize, Map map);
	@SuppressWarnings("unchecked")
	public Integer getEnterCount(Map map);
	@SuppressWarnings("unchecked")
	public String getJsonData(List rows, int pages, int total);
	public String getEnterDetail(String cid);
	public void updateEnterInfo(EnterInfoBean bean);
	public void addEnterInfo(EnterInfoBean bean);
	public void delEnterInfo(String cid);
	public EnterInfo getEnterInfoByPro(String propertyName, Object value);
	public void merge(EnterInfo e);
}
