package com.smj.service.persist;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import com.smj.service.ICommInfoService;

@Service("persist")
public class IPersistServiceImpl implements IPersistService{

	@Resource(name = "ICommInfoService")
	private ICommInfoService commService;

	@Override
	public PaginationSupport<?> findPaginatedBySqlMap(String id,
			String commdName, int cateId, String brandId, int storeId) {
		// TODO Auto-generated method stub
		
		// TODO Auto-generated method stub
		Map map = new HashMap();
		List schList = new ArrayList();
		Map condition = new HashedMap();
		condition.put("condition", "eq");
		condition.put("field","id.storeId");
		condition.put("value",storeId);
		schList.add(condition);
		if(cateId != 0){
				Map condition1 = new HashedMap();
				condition1.put("condition", "eq");
				condition1.put("field","cateId");
				condition1.put("value",cateId);
				schList.add(condition1);
		}
		if(brandId != "0"){
				Map condition2= new HashedMap();
				if(brandId.indexOf(",") == -1){
					condition2.put("condition", "eq");
				}
				else{
					condition2.put("condition", "other");
				}
				condition2.put("field","brandId");
				condition2.put("value",brandId);
				schList.add(condition2);
		}
		if(commdName != ""){
			Map condition3 = new HashedMap();
			condition3.put("condition", "eq");
			condition3.put("field","commdName");
			condition3.put("value",commdName);
			schList.add(condition3);
		}
		if(id != ""){
			Map condition4 = new HashedMap();
			condition4.put("condition", "eq");
			condition4.put("field","oneDimension");
			condition4.put("value",id);
			schList.add(condition4);
		}
		map.put("schList", schList);
		return commService.findCommInfo(0,0,map);
	}

	@Override
	public PaginationSupport<?> findPaginatedBySqlMap(int commdId) {
		// TODO Auto-generated method stub
		
		Map map = new HashMap();
		List schList = new ArrayList();
		Map condition = new HashedMap();
		condition.put("condition", "eq");
		condition.put("field","commdId");
		condition.put("value",commdId);
		schList.add(condition);
		map.put("schList", schList);
		return commService.findCommdAppr(0,0,map);
	   
	}
	


}
