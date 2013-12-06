package com.smj.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import net.sf.json.JSONObject;

import com.smj.orm.EnterInfo;
import com.smj.service.IEnterInfoService;
import com.smj.service.bean.EnterInfoBean;
import com.smj.util.Common;
import com.smj.util.DateUtil;
import com.smj.util.JSONUtil;

/**    
 *         
 * Class Name：
 *			EnterInfoServiceImpl    
 * Description：    
 *			描述
 * Author：	lilong  
 * Date：	2013-8-9 上午10:57:16    
 * @version	
 *     
 */
@Service("IEnterInfoService")
public class EnterInfoServiceImpl extends AbstractService implements IEnterInfoService{

	@SuppressWarnings("unchecked")
	/**
	 * 方法： getEnterCount 功能： 获取总数
	 * 
	 * @param String cid
	 * @return string
	 * @since
	 */
	@Override
	public Integer getEnterCount(Map map) {
		return this.getDao().getCount(EnterInfo.class, map);
	}
	/**
	 * 方法： getEnterDetail 功能： 获取商户详细信息
	 * 
	 * @param String cid
	 * @return string
	 * @since
	 */
	@Override
	public String getEnterDetail(String cid) {
		String scid = Common.url(cid, 2);
		Integer id = Integer.parseInt(scid);
		EnterInfo po = (EnterInfo) this.getDao().find(EnterInfo.class, id);
		JSONObject jsonObj = JSONObject.fromObject(po);
		jsonObj.remove("enterId");
		jsonObj.element("id", cid);

		return jsonObj.toString();
	}
	/**
	 * 方法： getEnterList 功能： 获取商户列表
	 * 
	 * @param int pageNo, int pageSize
	 * @return List<EnterInfo>
	 * @since
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<EnterInfo> getEnterList(int pageNo, int pageSize, Map map) {
		List<EnterInfo> enlist=(List<EnterInfo>)this.getDao().findPaginated(
				EnterInfo.class, pageNo, pageSize, map);
		List dataList = new ArrayList();
		for (EnterInfo po : enlist) {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("enterName", po.getEnterName());
			dataMap.put("legalReprId", po.getLegalReprId());
			dataMap.put("legalReprName", po.getLegalReprName());
			dataMap.put("respbPerson", po.getRespbPerson());

			String cid = Common.url(po.getEnterId().toString(), 1);
			dataMap.put("id", cid);
			dataList.add(dataMap);
		}
		
		return dataList;
	}
	/**
	 * 方法： getJsonData 功能： 转换格式
	 * 
	 * @param String cid
	 * @return string
	 * @since
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String getJsonData(List rows, int pages, int total) {
		return JSONUtil.ListToJsonString(rows, pages, total);
	}
	/**
	 * 方法： updateEnterInfo 功能： 更新商户信息
	 * 
	 * @param String cid
	 * @return 
	 * @since
	 */
	@Override
	public void updateEnterInfo(EnterInfoBean bean) {
		String scid = Common.url(bean.getEnterId(), 2);
		Integer id = Integer.parseInt(scid);
		EnterInfo po = (EnterInfo) this.getDao().find(EnterInfo.class, id);
		po.setEnterName(bean.getEnterName());
		po.setLegalReprId(bean.getLegalReprId());
		po.setLegalReprName(bean.getLegalReprName());
		po.setCertType(bean.getCertType());
		po.setCertId(bean.getCertId());
		if(StringUtils.hasText(bean.getRegDate())){
			po.setRegDate(DateUtil.strToDate(bean.getRegDate()));
		}else{
			po.setRegDate(new Date());
		}
		
		po.setEnterAddr(bean.getEnterAddr());
		po.setRespbPerson(bean.getRespbPerson());
		po.setTelNo(bean.getTelNo());
		if(StringUtils.hasText(bean.getEnterState())){
			po.setEnterState(Integer.parseInt(bean.getEnterState()));
		}else{
			po.setEnterState(null);
		}
		po.setEnterBussLicen(bean.getEnterBussLicen());
		po.setEnterBussLicenImg(bean.getEnterBussLicenImg());
		
		
		this.getDao().merge(po);
		
	}
	/**
	 * 方法： addEnterInfo 功能：新增商户信息
	 * 
	 * @param String cid
	 * @return 
	 * @since
	 */
	@Override
	public void addEnterInfo(EnterInfoBean bean) {
		EnterInfo po=new EnterInfo();
		po.setEnterName(bean.getEnterName());
		po.setLegalReprId(bean.getLegalReprId());
		po.setLegalReprName(bean.getLegalReprName());
		po.setCertType(bean.getCertType());
		po.setCertId(bean.getCertId());
		if(StringUtils.hasText(bean.getRegDate())){
			po.setRegDate(DateUtil.strToDate(bean.getRegDate()));
		}else{
			po.setRegDate(new Date());
		}
		po.setEnterAddr(bean.getEnterAddr());
		po.setRespbPerson(bean.getRespbPerson());
		po.setTelNo(bean.getTelNo());
		if(StringUtils.hasText(bean.getEnterState())){
			po.setEnterState(Integer.parseInt(bean.getEnterState()));
		}else{
			po.setEnterState(null);
		}
		
		po.setEnterBussLicen(bean.getEnterBussLicen());
		po.setEnterBussLicenImg(bean.getEnterBussLicenImg());
		this.getDao().save(po);
	}
	/**
	 * 方法： delEnterInfo 功能：删除商户信息
	 * 
	 * @param String cid
	 * @return 
	 * @since
	 */
	@Override
	public void delEnterInfo(String cid) {
		String scid = Common.url(cid, 2);
		Integer id = Integer.parseInt(scid);
		EnterInfo po = (EnterInfo) this.getDao().find(EnterInfo.class, id);
		this.getDao().delete(po);
	}
	@Override
	@SuppressWarnings("unchecked")
	public EnterInfo getEnterInfoByPro(String propertyName, Object value) {
		System.out.println("serviceimp");
		return (EnterInfo)this.getDao().findObjectByField(EnterInfo.class, propertyName, value);
	}
	@Override
	public void merge(EnterInfo e) {
		// TODO Auto-generated method stub
	    this.getDao().merge(e);
	}

}
