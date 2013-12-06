package com.smj.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.smj.orm.Cust_info;
import com.smj.service.ICustomerService;
import com.smj.service.bean.CustInfoBean;
import com.smj.util.Common;
import com.smj.util.DateUtil;
import com.smj.util.JSONUtil;

/**    
 *         
 * Class Name：
 *			CustomerServiceImpl    
 * Description：    
 *			描述
 * Author：	Administrator    
 * Date：	2013-7-31 上午10:57:16    
 * @version	
 *     
 */
@Service("cusService")
public class CustomerServiceImpl extends AbstractService implements
		ICustomerService {
	/**
	 * 方法： getCustomerList 功能： 获取顾客列表
	 * 
	 * @param int pageNo, int pageSize
	 * @return List<CustInfo>
	 * @since
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Cust_info> getCustomerList(int pageNo, int pageSize, Map map) {
		List<Cust_info> list = (List<Cust_info>) this.getDao().findPaginated(
				Cust_info.class, pageNo, pageSize, map);
		List dataList = new ArrayList();
		for (Cust_info po : list) {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("name", po.getName());
			dataMap.put("nickName", po.getNick_name());
			dataMap.put("id", po.getCust_id());
			dataMap.put("accu", po.getAccu());
			dataMap.put("regDate", DateUtil.dateToStr(po.getReg_date()));

			String cid = Common.url(po.getCust_id().toString(), 1);
			dataMap.put("id", cid);
			dataList.add(dataMap);
		}
		return dataList;
	}

	/**
	 * 方法： getCustomerDetail 功能： 查询顾客详细信息
	 * 
	 * @param String
	 *            cid
	 * @return String JSONObject对象
	 * @since
	 */
	public String getCustomerDetail(String cid) {
		String scid = Common.url(cid, 2);
		Integer id = Integer.parseInt(scid);
		Cust_info po = (Cust_info) this.getDao().find(Cust_info.class, id);
		JSONObject jsonObj = JSONObject.fromObject(po);
		jsonObj.remove("custId");
		jsonObj.element("id", cid);
		return jsonObj.toString();
	}
	
	public void updateCustomerInfo(CustInfoBean bean) {
		String scid = Common.url(bean.getCid(), 2);
		Integer id = Integer.parseInt(scid);
		Cust_info po = (Cust_info) this.getDao().find(Cust_info.class, id);
		po.setName(bean.getName());
		po.setNick_name(bean.getNickName());
		po.setMobile(bean.getMobile());
		po.setIs_cert(bean.getIsCert());
		po.setQq(bean.getQq());
		po.setEmail(bean.getEmail());
		po.setAccu(Integer.parseInt(bean.getAccu()));
		po.setIs_validate(Integer.parseInt(bean.getIsValidate()));
		po.setUser_rank(Integer.parseInt(bean.getUserRank()));
		po.setReg_date(DateUtil.strToDate(bean.getRegDate()));
		po.setUser_state(bean.getUserState());
		
		this.getDao().merge(po);
	}

	/**
	 * 方法： getCusCount 功能： 获取顾客总数
	 * 
	 * @param
	 * @return Integer
	 * @since
	 */
	@SuppressWarnings("rawtypes")
	public Integer getCusCount(Map map) {
		return this.getDao().getCount(Cust_info.class, map);
	}
	
	

	/**
	 * 方法： getJsonData 功能： 获取JSON格式数据
	 * 
	 * @param List
	 *            rows, int pages, int total
	 * @return String DOM对象
	 * @since
	 */
	@SuppressWarnings("rawtypes")
	public String getJsonData(List rows, int pages, int total) {
		return JSONUtil.ListToJsonString(rows, pages, total);
	}
}
