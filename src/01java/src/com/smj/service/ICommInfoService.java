package com.smj.service;

import java.util.List;
import java.util.Map;

import com.smj.orm.Brand;
import com.smj.orm.Comm_info;
import com.smj.orm.CommdAppr;
import com.smj.orm.CommdArchives;
import com.smj.service.persist.PaginationSupport;

public interface ICommInfoService {
      public PaginationSupport<?> findCommInfo(int pageNo, int pageSize,Map map);
      public PaginationSupport<?> findCommdAppr(int pageNo, int pageSize,Map map);
      public List<Comm_info> findCommInfo(Map map);
      public PaginationSupport<Comm_info> getCommInfo(String id,String commdName, int cateId, String brandId, int storeId); 
      public List<Brand> findBrand(Object field, Object value);
      public PaginationSupport<CommdAppr> getCommdAppr(int commdId);
      public List<CommdArchives> findCommdArchives(Map map);
}
