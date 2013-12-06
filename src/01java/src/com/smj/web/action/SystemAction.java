package com.smj.web.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.util.StringUtils;
import com.smj.orm.Cateory;
import com.smj.service.IBillInfoService;

import com.smj.service.ICateoryService;
import com.smj.service.ICustomerService;
import com.smj.service.IEAdminInfoService;
import com.smj.service.IEnterInfoService;
import com.smj.service.bean.CustInfoBean;
import com.smj.service.bean.EnterInfoBean;
import com.smj.util.Common;
import com.smj.util.MD5;

import net.sf.json.JSONArray;;


public class SystemAction extends BaseAction {
	private static final Log logger = LogFactory.getLog(SystemAction.class);
	public static String jchRoot = null;//系统跟路径
	@Resource(name = "cusService")
	private ICustomerService cusService;
	// 商户管理
	@Resource(name = "IEnterInfoService")
	private IEnterInfoService enterservice;
	@Resource(name = "eadminService")
	private IEAdminInfoService eadminService;
	@Resource(name = "billInfoService")
	private IBillInfoService billInfoService;
	@Resource(name="cateService")
	private ICateoryService cateService;
	Common  common = new Common();
	
	/**
	 * systemAction功能方法描述
	 * <p/>
	 * 说明： 以下中文说明是对功能进行详细的描述，后面的方法实现对应页面上的中文名称
	 * 功能描述：
	 * <li>管理员登录页面-slogin</li>
	 * <li>系统设置登录-sindex</li>    
     * <li>系统设置_商户管理-merchant_manager</li>
     * <li>系统设置_查询商户列表-queryMerchant_ManagerList</li>
     * <li>系统设置_查询商户详细信息-getEnterDetail</li>
     * <li>系统设置_修改商户信息-updateEnterInfo</li>
     * <li>系统设置_新增商户信息-addEnterInfo</li>
     * <li>系统设置_删除商户信息-delEnterInfo</li>
     * <li>系统设置_商品种类管理-cateory_manager</li>
     * <li>系统设置_读取所有商品种类-find_Cateory</li>
     * <li>系统设置_根据TREE节点ID查询该节点最大ID-getMaxNodeId</li>
     * <li>系统设置_操作Tree节点（新增||删除）-OperCateNode</li>
     * <li>系统设置_顾客管理-customer_manager</li>
     * <li>系统设置_查询顾客列表-queryCustomerList</li>
     * <li>系统设置_获取顾客详细信息-getCustomerDetail</li>
     * <li>系统设置_更新顾客信息-updateCustomerInfo</li>
     * <li>系统设置_订单查询-find_bill</li>
     * <li>系统设置_查询订单信息列表-queryBillInfoList</li>
     * <li>系统设置_获取订单详细信息-getBillInfoDetail</li>
     * <li>退出系统设置-logout</li>
     * @author 陈文磊
     * @since 2013-06-25
     * @修改日期: 2013-10-09
     * @版本： 1.0
	 */
	
	/**
	 * 系统设置
	 */
	public ActionForward slogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.findForward("slogin");
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		return forward;
	}

	/**
	 * 系统设置登录
	 */
	@SuppressWarnings("rawtypes")
	public ActionForward sindex(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ActionForward forward = mapping.findForward("");
		int number = 0;

		String username = request.getParameter("username").trim();
		String userpwd = request.getParameter("password").trim();
		String secode = request.getParameter("seccode").trim();

		List schList = new ArrayList();

		// 拼接查询条件
		if (StringUtils.hasText(username)) {
			Map condition = new HashedMap();
			condition.put("condition", "eq");
			condition.put("field", "adminName");
			condition.put("value", username);
			schList.add(condition);
		}

		if (StringUtils.hasText(userpwd)) {
			Map condition = new HashedMap();
			condition.put("condition", "eq");
			condition.put("field", "adminPwd");
			condition.put("value", MD5.getMD5(userpwd.trim()));
			schList.add(condition);
		}

		Map map = new HashedMap();

		if (schList.size() > 0)
			map.put("schList", schList);

		number = eadminService.getCusCount(map);

		// 验证登录用户名和密码是否成功
		if (number == 1 && StringUtils.hasText(secode)) {
			forward = mapping.findForward("smjindex");
			session.setAttribute("adminName", username);
			showMessage(request,response,"0000","");
		} else {
			forward = mapping.findForward("slogin");
			showMessage(request,response,"0000","用户名或密码错误,请重新输入!");
		}

		System.out.println("number" + number);

		return forward;
	}

	/**
	 * 商户管理
	 */
	public ActionForward merchant_manager(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = mapping.findForward("mer_manager");
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		return forward;
	}

	/**
	 * 查询商户列表
	 * 
	 * */

	@SuppressWarnings("unchecked")
	public ActionForward queryMerchant_ManagerList(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json");
		int pages = Integer.valueOf(request.getParameter("page"));
		String nameSearch = request.getParameter("nameSearch");
		List schList = new ArrayList();// 存放查询字段及条件
		// 判断时候输入查询条件
		if (StringUtils.hasText(nameSearch)) {
			Map condition = new HashMap();
			condition.put("condition", "like");
			condition.put("field", "enterName");
			condition.put("value", nameSearch);
			schList.add(condition);
		}
		// 获取分页数据条数，及排序
		int rp = Integer.valueOf(request.getParameter("rp"));
		String sortname = request.getParameter("sortname");
		String sortorder = request.getParameter("sortorder");
		Map map = new HashedMap();
		if (schList.size() > 0) {
			map.put("schList", schList);
		}
		if (StringUtils.hasText(sortname) && StringUtils.hasText(sortorder)) {
			map.put("sortname", sortname);
			map.put("sortorder", sortorder);
		}
		// 查询数据
		List rows = enterservice.getEnterList(pages, rp, map);
		// 查询总数
		int total = enterservice.getEnterCount(map);
		// 转化成JSON格式
		String jsonData = enterservice.getJsonData(rows, pages, total);
		// 返回数据
		response.getWriter().write(jsonData);

		return null;
	}

	/**
	 * 查询商户详细信息
	 * 
	 * */

	public ActionForward getEnterDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setCharacterEncoding("UTF-8");
		String cid = request.getParameter("id");
		String json = enterservice.getEnterDetail(cid);
		try {
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 修改商户信息
	 * 
	 * */
	public ActionForward updateEnterInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String cid = request.getParameter("id");
		EnterInfoBean bean = new EnterInfoBean();
		bean.setEnterId(cid);
		bean.setEnterName(request.getParameter("enterName"));
		bean.setLegalReprId(request.getParameter("legalReprId"));
		bean.setLegalReprName(request.getParameter("legalReprName"));
		bean.setCertType(request.getParameter("certType"));
		bean.setCertId(request.getParameter("certId"));
		bean.setRegDate(request.getParameter("regDate"));
		bean.setEnterAddr(request.getParameter("enterAddr"));
		bean.setRespbPerson(request.getParameter("respbPerson"));
		bean.setTelNo(request.getParameter("telNo"));
		bean.setEnterBussLicenImg(request.getParameter("enterBussLicenImg"));
		bean.setEnterState(request.getParameter("enterState"));
		bean.setEnterBussLicen(request.getParameter("enterBussLicen"));
		enterservice.updateEnterInfo(bean);
		return null;
	}

	/**
	 * 新增商户信息
	 * 
	 * */
	public ActionForward addEnterInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		EnterInfoBean bean = new EnterInfoBean();
		bean.setEnterName(request.getParameter("enterName"));
		bean.setLegalReprId(request.getParameter("legalReprId"));
		bean.setLegalReprName(request.getParameter("legalReprName"));
		bean.setCertType(request.getParameter("certType"));
		bean.setCertId(request.getParameter("certId"));
		bean.setRegDate(request.getParameter("regDate"));
		bean.setEnterAddr(request.getParameter("enterAddr"));
		bean.setRespbPerson(request.getParameter("respbPerson"));
		bean.setTelNo(request.getParameter("telNo"));
		bean.setEnterBussLicenImg(request.getParameter("enterBussLicenImg"));
		bean.setEnterState(request.getParameter("enterState"));
		bean.setEnterBussLicen(request.getParameter("enterBussLicen"));
		enterservice.addEnterInfo(bean);
		return null;
	}

	/**
	 * 删除商户信息
	 * 
	 * */
	public ActionForward delEnterInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String cid = request.getParameter("id");
		enterservice.delEnterInfo(cid);
		return null;
	}

	/**
	 * 商品种类管理
	 */
	public ActionForward cateory_manager(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = mapping.findForward("cate_manager");
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");		
		return forward;
	}
	
	
	/*
	 *     读取所有商品种类
	 * */
    public ActionForward find_Cateory(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");		
		
	    List<Map<String, Object>>  lisCateContent = new ArrayList<Map<String, Object>>();
		
	    List lisCateRoot   = common.FindCateBaseRoot();
	    Map  maproot = new HashMap();
	    
	    if(lisCateRoot.size() > 0)
	    maproot.put("schList",lisCateRoot);
		
	    List<Cateory> lisCate   = cateService.findCateory(maproot);
	    
	    for(Cateory  c:  lisCate)
	    {
	    	Map<String, Object>  itemroot = new HashMap<String, Object>();
	    	itemroot.put("id",c.getClassId());
	    	itemroot.put("pId", c.getParentId());
	    	itemroot.put("name", c.getName());
	    	itemroot.put("open", true);
	    
	    	lisCateContent.add(itemroot);
	    }
	    
	    //拼接根据根节点查询子根节点
		List lisSubCateRoot = common.FindCateRoot();
	    Map mapsubroot = new HashMap();
	    
	    if(lisSubCateRoot.size() > 0)
	    	mapsubroot.put("schList", lisSubCateRoot);
	   
	    List <Cateory> lisSCate = cateService.findCateory(mapsubroot);
	    
		//循环取出1级子节点
		for(Cateory cate: lisSCate)
		{
			Map<String, Object>  item = new HashMap<String, Object>();
			item.put("id",cate.getClassId());
			item.put("pId", cate.getParentId());
			item.put("name", cate.getName());
			item.put("open", false);
			
		    Map mapsubcate = new HashMap();
			List lisSubCates = common.FindCateSubRoot(cate.getClassId());
		    if(lisSubCates.size() > 0)
		    	mapsubcate.put("schList",lisSubCates);
	
			List<Cateory> lisSubCate = cateService.findCateory(mapsubcate);
			
			//循环取出2级子节点
			for(Cateory subcate:  lisSubCate)
			{
				Map<String, Object>  itemValue = new HashMap<String, Object>();
				
				itemValue.put("id",subcate.getClassId());
				itemValue.put("pId", subcate.getParentId());
				itemValue.put("name", subcate.getName());
				itemValue.put("isParent", true);
				
				if(!lisCateContent.equals(itemValue))
				{
					 lisCateContent.add(itemValue);
				}
				//根据2级节点查询3级节点
				 Map mapsubcates  = new HashMap();
				List lisSubSubCates = common.FindCateSubRoot(subcate.getClassId());
			    if(lisSubSubCates.size() > 0)
			    	mapsubcates.put("schList",lisSubSubCates);
			    
			    List<Cateory> lisSubSubCate = cateService.findCateory(mapsubcates);
			    
			    //判断2级节点是否有3级节点
			    if(lisSubSubCate.size() > 0)
			    {
					    //循环取出3级子节点
					    for(Cateory  subscate: lisSubSubCate)
					    {
					    	Map<String, Object>  item2 = new HashMap<String, Object>();
					    	
							item2.put("id",subscate.getClassId());
							item2.put("pId", subscate.getParentId());
							item2.put("name", subscate.getName());		
							
							if(!lisCateContent.equals(item2))
							{
								 lisCateContent.add(item2);
							}
					    }
			    }
			}
			
			 lisCateContent.add(item);		
		}
		
		System.out.println("count" + lisCateContent.size());
		
		String resultStr = JSONArray.fromObject(lisCateContent).toString();
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().append(resultStr);
	
		return null;
    }
	
     /**
      * 
      *    根据TREE节点ID查询该节点最大ID 
      * */
    public ActionForward getMaxNodeId(ActionMapping  mapping,
    		ActionForm form, HttpServletRequest request,
    		HttpServletResponse response) throws Exception{
         String tmp = null;
    	 String treeId = request.getParameter("classId").trim();
    	 String condition = request.getParameter("condition").trim();
    	 int maxid = 0;
    	 
    	 System.out.println("condition" + condition); 
    	 System.out.println("treeId" + treeId);
    	 Object objtmp = null;
         List lisCondi = null;
    	 Map map = new HashMap();
    	 
    	 //判断是否传入的ID为根目录
    	 if(Integer.parseInt(treeId) == 0)
    	 {
             lisCondi = common.FindCateRoot();    		 
    	 }
    	 else if(Integer.parseInt(treeId)> 0)
    	 {
    		 lisCondi = common.FindCateSubRoot(Integer.parseInt(treeId));
    	 }
    		
    	 if(lisCondi.size() > 0)
    	 {
              map.put("schList",lisCondi);		 
    	 }
    	 Object obj = null;
    	 try
    	 {
    	     obj =  cateService.findMaxId(Cateory.class,condition, map);
    	 }
    	 catch(Exception e)
    	 {
    		  e.fillInStackTrace();
    	 }
    	 
    	 System.out.println("obj" + obj);
    	 
    	 if(objtmp == obj)
    	 {
    		  maxid = Integer.parseInt(treeId.toString() + treeId.toString() + "1");
    	 }
    	 else
         {
	    	 if(Integer.parseInt(treeId) == 0)
	    	 {
	    		 maxid = Integer.parseInt(obj.toString()) + 1;
	    	 }
	    	 else if(obj.toString().length() == 1 || obj.toString().length() == 2)
	    	 {
	    		 maxid = Integer.parseInt(obj.toString() + obj.toString() + "1");	 
	    	 }
	    	 else if (obj.toString().length() >= 3)
	    	 {
	    		 maxid=Integer.parseInt(obj.toString()) + 1;
	    	 }
         }
    	 System.out.println("maxid" + maxid);
    	 String resultStr = JSONArray.fromObject(maxid).toString();
 	     response.setCharacterEncoding("UTF-8");
 	     response.getWriter().append(resultStr);
 	    
    	  return null;
    }
      
       /*
        *        操作Tree节点（新增||删除）
        * */
      public ActionForward OperCateNode(ActionMapping mapping,
    		       ActionForm form,HttpServletRequest request,
                   HttpServletResponse response) throws Exception{
    	 
    	  int state = 0;
    	 int cateid = 0;
    	 String type = request.getParameter("type").trim();
    	 String parentId = request.getParameter("pid").trim();
    	 String name = request.getParameter("name").trim();
    	 String classId= request.getParameter("cid").trim();
    	 //String parentId = request.getParameter("parentId").trim();
    	 //String name = request.getParameter("nodename").trim(); 
         System.out.println("type" + type +  "classId"   +  classId + "parentId"  + parentId + "name"  +  name);
          
         if(type == "" && classId == "" && parentId == "" && name == "")
         {
        	    state = 0;
         }
         else
         {
             Cateory cate  = new Cateory();
		         //新增节点         
         	  if(Integer.parseInt(type) == 1)
		         {
		        	 cate.setClassId(Integer.parseInt(classId));
		        	 cate.setParentId(Integer.parseInt(parentId));
		        	 cate.setName(name);
		        	 cate.setDeleted(1);
		             
		        	 cateService.save(cate);
		        	 
		        	 state = 1;
		        	 
		         }
		         //删除节点
		         else if(Integer.parseInt(type) == 2)
		         {
		        	 List  lis = null;
		             lis = common.FindCateId(Integer.parseInt(classId),Integer.parseInt(parentId));
		             Map map = new HashMap();
		             map.put("schList",lis);
		             List<Cateory> liscate= cateService.findCateory(map);
		             
		             for(Cateory c: liscate)
		             {
		            	 cateid = c.getCateId(); 
		             }
                     		        	 
		        	 
		        	 cate.setCateId(cateid);
		        	 cate.setClassId(Integer.parseInt(classId));
		        	 cate.setParentId(Integer.parseInt(parentId));
		        	 cate.setName(name);
		        	 cate.setDeleted(1);
		        	 
		        	 cateService.delete(cate);
		        	 
		        	 state = 1;
		         }
         }    
      	 String resultStr = JSONArray.fromObject(state).toString();
 	     response.setCharacterEncoding("UTF-8");
 	     response.getWriter().append(resultStr);
         
         return null;
      }
      
    
    /**
	 * 顾客管理
	 */
	public ActionForward customer_manager(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = mapping.findForward("cus_manager");

		return forward;
	}

	/**    
	 * Method：	queryCustomerList
	 * 
	 * Description：	
	 *			查询顾客列表
	 * @since   
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionForward queryCustomerList(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json");
		int pages = Integer.valueOf(request.getParameter("page"));
		String nameSearch = request.getParameter("nameSearch");
		String nickNameSearch = request.getParameter("nickNameSearch");
		String accuSearch = request.getParameter("accuSearch");
		String accuCondition = request.getParameter("accuCondition");
		String regDateSearch = request.getParameter("regDateSearch");
		String regDateCondition = request.getParameter("regDateCondition");
		List schList = new ArrayList();// 存放查询字段及条件
		if (StringUtils.hasText(nameSearch)) {
			Map condition = new HashMap();
			condition.put("condition", "like");
			condition.put("field", "name");
			condition.put("value", nameSearch);
			schList.add(condition);
		}
		if (StringUtils.hasText(nickNameSearch)) {
			Map condition = new HashMap();
			condition.put("condition", "like");
			condition.put("field", "nick_name");
			condition.put("value", nickNameSearch);
			schList.add(condition);
		}
		if (StringUtils.hasText(accuSearch)) {
			Map condition = new HashMap();
			condition.put("condition", accuCondition);
			condition.put("field", "accu");
			condition.put("value", accuSearch);
			schList.add(condition);
		}
		if (StringUtils.hasText(regDateSearch)) {
			Map condition = new HashMap();
			condition.put("condition", regDateCondition);
			condition.put("field", "reg_date");
			condition.put("value", regDateSearch);
			schList.add(condition);
		}

		int rp = Integer.valueOf(request.getParameter("rp"));
		String sortname = request.getParameter("sortname");
		String sortorder = request.getParameter("sortorder");
		Map map = new HashedMap();
		if (schList.size() > 0) {
			map.put("schList", schList);
		}
		if (StringUtils.hasText(sortname) && StringUtils.hasText(sortorder)) {
			map.put("sortname", sortname);
			map.put("sortorder", sortorder);
		}
		List rows = cusService.getCustomerList(pages, rp, map);
		int total = cusService.getCusCount(map);
		String jsonData = cusService.getJsonData(rows, pages, total);
		System.out.println(jsonData);
		response.getWriter().write(jsonData);

		return null;
	}

	/**    
	 * Method：	getCustomerDetail
	 * 
	 * Description：	
	 *			获取顾客详细信息
	 * @since   
	 */
	public ActionForward getCustomerDetail(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		String cid = request.getParameter("id");
		String json = cusService.getCustomerDetail(cid);
		try {
			PrintWriter out = response.getWriter();
			System.out.println(json);
			out.print(json);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**    
	 * Method：	updateCustomerInfo
	 * 
	 * Description：	
	 *			更新顾客信息
	 * @since   
	 */
	public ActionForward updateCustomerInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String cid = request.getParameter("id");
		CustInfoBean bean = new CustInfoBean();
		bean.setCid(cid);
		bean.setName(request.getParameter("name"));
		bean.setNickName(request.getParameter("nickName"));
		bean.setMobile(request.getParameter("mobile"));
		bean.setIsCert(request.getParameter("isCert"));
		bean.setQq(request.getParameter("qq"));
		bean.setEmail(request.getParameter("email"));
		bean.setAccu(request.getParameter("accu"));
		bean.setIsValidate(request.getParameter("isValidate"));
		bean.setUserRank(request.getParameter("userRank"));
		bean.setRegDate(request.getParameter("regDate"));
		bean.setUserState(request.getParameter("userState"));
		cusService.updateCustomerInfo(bean);
		return null;
	}

	/**
	 * 订单查询
	 */
	@SuppressWarnings("unchecked")
	public ActionForward find_bill(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.findForward("find_bill");

		return forward;
	}

	/**    
	 * Method：	queryBillInfoList
	 * 
	 * Description：	
	 *			查询订单信息列表
	 * @since   
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ActionForward queryBillInfoList(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json");
		int pages = Integer.valueOf(request.getParameter("page"));
		String billDateBegin = request.getParameter("billDateBegin");
		String billDateEnd = request.getParameter("billDateEnd");
		String billState = request.getParameter("billState");
		List schList = new ArrayList();// 存放查询字段及条件
		if (StringUtils.hasText(billDateBegin)) {
			Map condition = new HashMap();
			condition.put("condition", "gt");
			condition.put("field", "bill_date");
			condition.put("value", billDateBegin);
			schList.add(condition);
		}
		if (StringUtils.hasText(billDateEnd)) {
			Map condition = new HashMap();
			condition.put("condition", "lt");
			condition.put("field", "bill_date");
			condition.put("value", billDateEnd);
			schList.add(condition);
		}
		if (StringUtils.hasText(billState)) {
			if (!"default".equals(billState)) {
				Map condition = new HashMap();
				condition.put("condition", "eq");
				condition.put("field", "bill_state");
				condition.put("value", billState);
				schList.add(condition);
			}
		}

		int rp = Integer.valueOf(request.getParameter("rp"));
		String sortname = request.getParameter("sortname");
		String sortorder = request.getParameter("sortorder");
		Map map = new HashedMap();
		if (schList.size() > 0) {
			map.put("schList", schList);
		}
		if (StringUtils.hasText(sortname) && StringUtils.hasText(sortorder)) {
			map.put("sortname", sortname);
			map.put("sortorder", sortorder);
		}
		List rows = billInfoService.getBillInfoList(pages, rp, map);
		int total = billInfoService.getCount(map);
		String jsonData = billInfoService.getJsonData(rows, pages, total);
		System.out.println(jsonData);
		response.getWriter().write(jsonData);

		return null;
	}

	/**    
	 * Method：	getBillInfoDetail
	 * 
	 * Description：	
	 *			获取订单详细信息
	 * @since   
	 */
	public ActionForward getBillInfoDetail(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		String cid = request.getParameter("id");
		String json = billInfoService.getBillInfoDetail(cid);
		try {
			PrintWriter out = response.getWriter();
			System.out.println(json);
			out.print(json);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 退出
	 */
	public ActionForward logout(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.findForward("slogin");
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		return forward;
	}

	/**
	 * Help Ajax 
	 */
	public ActionForward helpAjax(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String fileName = request.getParameter("filename");
		if(Common.empty(fileName)){
			return showMessage(request, response,"", "数据错误,请联系管理员!");
		}
//		String picpath = JavaCenterHome.jchConfig.get("picPath");
		setJchRoot(request);
		File file = new File(jchRoot+"data/html/"+fileName+".jsp");
		StringBuffer bf = new StringBuffer();
		try{
			if(file.exists()){//判断文件的存在性    
	            InputStreamReader read = new InputStreamReader(new FileInputStream(file),"utf-8");
	            BufferedReader ins = new BufferedReader(read);
	            int cc;
	            while((cc = ins.read()) > 0){
	            	bf.append(ins.readLine());
	            }
	            ins.close();
			}else{
            	return null;
            }
        }catch (Exception e){
            log.error("read Text File Error", e);
        }
        response.getWriter().print(bf.toString());
		return null;
	}
	
	public static void setJchRoot(HttpServletRequest request) {
		jchRoot = request.getSession().getServletContext().getRealPath("/");
		if (jchRoot == null) {
			try {
				jchRoot = request.getSession().getServletContext().getResource("/").getPath();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (!jchRoot.endsWith("/"))jchRoot = jchRoot + "/";
	}
	
}
