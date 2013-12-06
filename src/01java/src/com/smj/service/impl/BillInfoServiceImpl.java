package com.smj.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.smj.orm.BillInfo;
import com.smj.service.IBillInfoService;
import com.smj.service.bean.BillInfoBean;
import com.smj.util.DateUtil;
import com.smj.util.JSONUtil;

/**    
 *         
 * Class Name：
 *			BillInfoServiceImpl    
 * Description：    
 *			描述
 * @Author：	suhao    
 * @Date：	2013-8-9 上午11:24:20    
 * @version	
 *     
 */
@Service("billInfoService")
public class BillInfoServiceImpl extends AbstractService implements
		IBillInfoService {

	/**    
	 * Method：	getBillInfoList
	 *
	 * Description：	
	 *			获取订单信息列表
	 * @param  	pageNo
	 *			当前页
	 * @param  	pageSize
	 *			列表每页显示数据
	 * @param  	map
	 *			查询条件
	 * @return	List<CustInfo>    
	 * @since   
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<BillInfoBean> getBillInfoList(int pageNo, int pageSize, Map map) {
		List<BillInfo> list = (List<BillInfo>) this.getDao().findPaginated(
				BillInfo.class, pageNo, pageSize, map);
		List dataList = new ArrayList();
		for (BillInfo po : list) {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("custName", po.getCustName());
			dataMap.put("billDate", DateUtil.dateToStr(po.getBillDate()));
			dataMap.put("custTel", po.getCustTel());
			dataMap.put("deliverTime", DateUtil.dateToStr(po.getDeliverTime()));
			dataMap.put("id", po.getBillId());
			dataList.add(dataMap);
		}
		return dataList;
	}

	/**    
	 * Method：	getBillInfoDetail
	 *
	 * Description：	
	 *			获取订单详细信息
	 * @param  	cid
	 *			订单ID
	 * @return	String DOM对象    
	 * @since   
	 */
	public String getBillInfoDetail(String cid) {
		BillInfo po = (BillInfo) this.getDao().findObjectByField(
				BillInfo.class, "bill_id", cid);
		JSONObject jsonObj = JSONObject.fromObject(po);
		jsonObj.element("id", cid);

		return jsonObj.toString();
	}

	/**    
	 * Method：	getCount
	 *
	 * Description：	
	 *			获取订单总数
	 * @param  	map
	 *			查询条件 
	 * @return	Integer
	 * @since   
	 */
	@SuppressWarnings("rawtypes")
	public Integer getCount(Map map) {
		return this.getDao().getCount(BillInfo.class, map);
	}

	/**    
	 * Method：	getJsonData
	 *
	 * Description：	
	 *			 获取JSON格式数据
	 * @param  	rows
	 *			查询结果
	 * @param  	pages
	 *			当前页
	 * @param  	total
	 *			总数
	 * @return	String 
	 * @since   
	 */
	@SuppressWarnings("rawtypes")
	public String getJsonData(List rows, int pages, int total) {
		return JSONUtil.ListToJsonString(rows, pages, total);
	}
}
