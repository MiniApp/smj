package com.smj.web.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONArray;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.smj.orm.Brand;
import com.smj.orm.Cateory;
import com.smj.orm.Comm_info;
import com.smj.orm.CommdAppr;
import com.smj.orm.Cust_info;
import com.smj.orm.Leaveword;
import com.smj.orm.Region;
import com.smj.orm.StoreInfo;
import com.smj.orm.UserAddress;
import com.smj.orm.CommdArchives;
import com.smj.orm.UserSession;
import com.smj.service.ICommInfoService;
import com.smj.service.IStoreInfoService;
import com.smj.service.IUserService;
import com.smj.service.persist.PaginationSupport;
import com.smj.util.Common;
import com.smj.util.CookieHelper;
import com.smj.util.JavaCenterHome;
import com.smj.util.MD5;
import com.smj.util.Mail;

/**
 * userAction功能方法描述
 * <p/>
 * 说明： 以下中文说明是对功能进行详细的描述，后面的方法实现对应页面上的中文名称
 * 功能描述： 
 * <li>送每家首页-index</li>
 * <li>商品列表(商铺主页)-commdsInfo</li>
 * <li>商品明细-commodity</li>
 * <li>根据商铺查询商品-queryCommInfo(仿京东UI专用)</li>
 * <li>根据商品ID查询商品评价-queryCommAppr(仿京东UI专用)</li>
 * <li>留言板-leavewordList</li>
 * <li>商户登录-mlogin</li>
 * <li>顾客登录-login</li>
 * <li>顾客订单-userOrderList</li>
 * <li>顾客个人信息-userinfo</li>
 * <li>顾客收藏-favorite</li>
 * <li>顾客评价-userAppList</li>
 * <li>顾客送货地址管理-userAddress</li>
 * <li>顾客留言管理-userLeaveWordList</li>
 * <li>增加顾客留言-addUserLeave</li>
 * <li>回复留言--replayUserLevel</li>
 * <li>跳转到用户注册页面--register</li>
 * <li>用户注册-registe</li>
 * <li>用户注册验证-validate</li>
 * <li>判断顾客是否存在-checkusername</li>
 * <li>忘记密码-forgotpwd</li>
 * <li>修改密码-upPassword</li>
 * <li>顾客退出-loginOut</li>
 * <li>跳转到添加新送货地址页面-addUserAddress</li>
 * <li>添加新送货地址-addAddresss</li>
 * <li>产生随机码-seccode</li> 
 * <li>友情链接-friendlinks</li>
 * @author 陈文磊
 * @since 2013-06-25
 * @修改日期: 2013-10-09
 * @版本： 1.0
 */
public class UserAction extends BaseAction {
	private static final Log logger = LogFactory.getLog(UserAction.class);    
	
	@Resource(name = "IUserService")
	private IUserService userService;
	@Resource(name = "IStoreInfoService")
	private IStoreInfoService storeservice;
	@Resource(name = "ICommInfoService")
	private ICommInfoService commService;
	
	private Integer page;
	public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    private Integer pageSize;

	/**
	 *    首页
	 */
	public ActionForward index(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.getInputForward();
		request.setAttribute("tag", "6");// 菜单样式
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		JavaCenterHome.setJchRoot(request);
		File cacheFile = new File(JavaCenterHome.jchRoot + "data\\cache\\cache_goodstores.txt");
		long cacheTime = (int) (cacheFile.lastModified() / 1000);
		HttpSession session = request.getSession();
		session.removeAttribute("errorMsg");
		Map map = new HashMap();
		List schList = new ArrayList();
		
		Map condition = new HashedMap();
		condition.put("condition", "eq");
		condition.put("field","parentId");
		condition.put("value","0001");
		schList.add(condition);
		map.put("schList", schList);
		
		//查询区域信息
		List<Region> lisRegion = userService.findByPid(map);
		session.setAttribute("province", lisRegion);
	    
		
		//test
		//List<Comm_info> lisComminfo = commService.findCommInfo(mapmap);
		
		/*
		//诚信排行缓存（每天更新）
		cacheFile = new File(JavaCenterHome.jchRoot + "data/cache/cache_stores.txt");
		cacheTime = (int) (cacheFile.lastModified() / 1000);
		List<Map<String, Object>> stores = null;
		if ((Integer) sGlobal.get("timestamp") - cacheTime > 864) {
			stores = dataBaseService.executeQuery("SELECT id,store_name FROM snack_store WHERE store_state='Y' ORDER BY rank DESC LIMIT 0,10");
			FileHelper.writeFile(cacheFile, Serializer.serialize(stores));
		} else {
			stores = Serializer.unserialize(FileHelper.readFile(cacheFile));
		}
		request.setAttribute("stores", stores);
		//推荐店铺缓存（每天更新）
		cacheFile = new File(JavaCenterHome.jchRoot + "data/cache/cache_goodstores.txt");
		cacheTime = (int) (cacheFile.lastModified() / 1000);
		List<Map<String, Object>> goodstores = null;
		if ((Integer) sGlobal.get("timestamp") - cacheTime > 864) {
			goodstores = 
			dataBaseService.executeQuery("SELECT id,store_name FROM snack_store WHERE store_state='Y' and store_type=1 LIMIT 0,10");
			FileHelper.writeFile(cacheFile, Serializer.serialize(goodstores));
		} else {
			goodstores = Serializer.unserialize(FileHelper.readFile(cacheFile));
		}
		request.setAttribute("goodstores", goodstores);
		*/
		
		// sGlobal.put("sugu_uid", 0);		
		return forward;
	}	
	/**
	 *    商品列表
	 * */
	public ActionForward commdsInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.findForward("commdInfo");
		request.setAttribute("tag", "4");// 菜单样式
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		
		//获取商铺ID查询商铺信息
		String storeId = "1";
		
		Map map = new HashMap();
		List schList = new ArrayList();
		
		Map condition = new HashedMap();
		condition.put("condition", "eq");
		condition.put("field","storeId");
		condition.put("value",Integer.parseInt(storeId));
		schList.add(condition);
		map.put("schList", schList);
		
		//查询商品类别信息
	   	List<Cateory> lisCate = userService.findCateory();
    	request.setAttribute("cateory", lisCate);
    	
    	List<Cateory> lisSubCate = userService.findSubCateory("parentId","0",">");
    	request.setAttribute("subcateory", lisSubCate);
		
		List<StoreInfo> lis  =  storeservice.findStoreInfo(map);	     
	    HttpSession session = request.getSession();
	    session.setAttribute("store_info",lis);
		
		//根据商品类别查询品牌
	       List<Brand> lisBrand = commService.findBrand("cateId","");
		   request.getSession().setAttribute("brand", lisBrand);
	    
		// sGlobal.put("sugu_uid", 0);		
		return forward;
	}
	
	/*
	 *   查询商品明细
	 * 
	 * */
    public ActionForward queryCommInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
    	//String storeId = request.getParameter("store_id").trim();

    	String storeId = "1";
    	String cateId = "";
    	String brandId  = "";
    	String commdName = "";
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	try{
			cateId = request.getParameter("cateid").trim();
			brandId = request.getParameter("id").trim();
			commdName = request.getParameter("commdName").trim();
			//commdName = java.net.URLDecoder.decode(commdName,"UTF-8").toString();
		}
		catch(java.lang.NullPointerException e){
		     e.fillInStackTrace();	
		}
		
		System.out.println("getcommdname" + commdName);
			
	    System.out.println(cateId + "|" + brandId);	    
	    //根据类别或者品牌查询
    	if(cateId != "" || brandId != "" && commdName ==""){
    		PaginationSupport<Comm_info>  lisCommInfos = commService.getCommInfo("","",Integer.parseInt(cateId),brandId,Integer.parseInt(storeId));
    		try{
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				JSONArray jsontmp = JSONArray.fromObject(lisCommInfos);
				out.println(jsontmp.toString().substring(1,jsontmp.toString().length()-1));
				out.flush();
				out.close();
			}catch(IOException e){
				e.printStackTrace();
			}	
    	}
    	//根据商品名称查询
    	else if(commdName != ""){
    		PaginationSupport<Comm_info>  lisCommInfos = commService.getCommInfo("",commdName,0,brandId,Integer.parseInt(storeId));
    		try{
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				JSONArray jsontmp = JSONArray.fromObject(lisCommInfos);
				out.println(jsontmp.toString().substring(1,jsontmp.toString().length()-1));
				out.flush();
				out.close();
			}catch(IOException e){
				e.printStackTrace();
			}
    	}
    	else{
			PaginationSupport<Comm_info>  lisCommInfo = commService.getCommInfo("","",0,"0",Integer.parseInt(storeId));
			try{
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				JSONArray jsontmp = JSONArray.fromObject(lisCommInfo);
				out.println(jsontmp.toString().substring(1,jsontmp.toString().length()-1));
				out.flush();
				out.close();
			}catch(IOException e){
				e.printStackTrace();
			}	
		}	
    	return null;
    	
    }
	
    /*
     *     根据类别查询商品明细
     * */
	public ActionForward findCateory(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		ActionForward forward = mapping.findForward("commdInfo");
		String cateid = "";
		String classId = "";
		try{
			cateid = request.getParameter("cateid").trim();
		    classId = request.getParameter("classId").trim();
		}catch(java.lang.NullPointerException e){
		     e.fillInStackTrace();	
		}
		
		if(cateid == "" && classId == ""){
			List<Brand> lisBrand = commService.findBrand("cateId","");
			   request.getSession().setAttribute("brand", lisBrand);
		}
		else{
		//根据商品类别查询品牌
		   List<Brand> lisBrand = commService.findBrand("cateId",classId);
		   request.getSession().setAttribute("brand", lisBrand);
		}
		
		return forward;
	}
	
	/**
	 *    留言板
	 * */
	public ActionForward leavewordList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.findForward("leavewordList");
		request.setAttribute("tag", "3");// 菜单样式
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		
		List<Leaveword> lisLeave = userService.findAllLeave();
		request.setAttribute("leavewords",lisLeave);
		// sGlobal.put("sugu_uid", 0);		
		return forward;
	}
	
	/**
	 *    店铺明细
	 * */
	public ActionForward mlogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.findForward("mlogin");
		request.setAttribute("tag", "1");// 菜单样式
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		// sGlobal.put("sugu_uid", 0);		
		return forward;
	}
	
	/**
	 *    商品明细
	 * */
	public ActionForward commodity(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.findForward("commodity");
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		request.setAttribute("tag", "4");// 菜单样式
		String commdId = request.getParameter("commidityId").trim();	
		if(commdId == null){
			forward = mapping.findForward("index");
		}
		else{
			//根据商品ID查询商品明细
			Map map = new HashMap();
			List schList = new ArrayList();
			
			Map condition = new HashedMap();
			condition.put("condition", "eq");
			condition.put("field","id.commdId");
			condition.put("value",commdId);
			schList.add(condition);
			map.put("schList", schList);
			
			List<Comm_info> lisCommInfo  =  commService.findCommInfo(map);
			request.setAttribute("commodity",lisCommInfo);		
			
			
			Map map1 = new HashMap();
			
			List schList1 = new ArrayList();
			
			Map condition1 = new HashedMap();
			condition1.put("condition", "eq");
			condition1.put("field","commdId");
			condition1.put("value",Integer.parseInt(commdId));
			schList1.add(condition1);
			map1.put("schList", schList1);
			
			List<CommdArchives> lisCommdArchives = commService.findCommdArchives(map1);
			request.setAttribute("commimage",lisCommdArchives);
		}
		// sGlobal.put("sugu_uid", 0);		
		return forward;
	}
	
	/*
	 *        查询客户评价
	 * */
	public ActionForward queryCommAppr(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		String commdId=request.getParameter("commdId").trim();
		PaginationSupport<CommdAppr>  lisCommdAppr =  commService.getCommdAppr(Integer.parseInt(commdId));
		try{
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			JSONArray jsontmp = JSONArray.fromObject(lisCommdAppr);
			out.println(jsontmp.toString().substring(1,jsontmp.toString().length()-1));
			out.flush();
			out.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		
		return null;
	}
		
	/**
	 *    根据购物车生成订单（临时）
	 * */
	public ActionForward createbill(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.findForward("createbill");
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		
		String path = "commimage/img/8932932_img1.jpg";
		String price = "16.5";
		
		CookieHelper.setCookie(request, response, "path",path);
		CookieHelper.setCookie(request, response, "price",price);
		
		Map<String, String> map  = CookieHelper.getCookies(request);
		System.out.println(map.get("path").toString());
		
		
		// sGlobal.put("sugu_uid", 0);		
		return forward;
	}
    
	/**
	 *  我的订单
	 * 
	 * @author 苏皓
	 * @since 2013-06-29
	 */
	public ActionForward userOrderList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("UserAction.getUserOrderList start");
		ActionForward forward = mapping.findForward("userOrderList");
		logger.debug("UserAction.getUserOrderList end");
		return forward;
	}
	
	/**
	 * 我的评价
	 * 
	 * @author 苏皓
	 * @since 2013-06-29
	 */
	public ActionForward userAppList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("UserAction.userAppList start");
		ActionForward forward = mapping.findForward("userAppList");
		logger.debug("UserAction.userAppList end");
		return forward;
	}
	
	/**
	 * 我的收藏
	 * 
	 * @author 苏皓
	 * @since 2013-06-29
	 */
	public ActionForward favorite(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("UserAction.favorite start");
		ActionForward forward = mapping.findForward("favorite");
		logger.debug("UserAction.favorite end");
		return forward;
	}

	/**
	 * 收货地址
	 * 
	 * @author 苏皓
	 * @since 2013-06-29
	 */
	public ActionForward userAddress(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("UserAction.userAddress start");
		ActionForward forward = mapping.findForward("userAddress");
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null){
		    forward = mapping.findForward("login");	
		}
		try{
			UserSession  user = (UserSession)session.getAttribute("user");
			List lis = userService.FindUserAddress("custId",user.getId());
			List<UserAddress> lisAdd = lis;
			session.setAttribute("address",lisAdd);
		}catch(NoSuchElementException e){
			e.printStackTrace();
		}
		logger.debug("UserAction.userAddress end");
		return forward;
	}
	
	/**
	 * 跳转到增加顾客收货地址页面
	 * 
	 * @author 苏皓
	 * @since 2013-06-29
	 */
	public ActionForward addUserAddress(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("UserAction.addUserAddress start");
		ActionForward forward = mapping.findForward("addUserAddress");
		logger.debug("UserAction.addUserAddress end");
		return forward;
	}
	
	/*
	 *   添加顾客送货地址
	 * 
	  * @author 陈文磊
	 * */
	public ActionForward addAddresss(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		logger.debug("UserAction.addAddress start");
		ActionForward forward = mapping.findForward("userinfo");
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null){
			forward = mapping.findForward("login");
		}
		else{
			UserSession  user = (UserSession)session.getAttribute("user");
			String address = request.getParameter("address").trim();
			String isDefault = request.getParameter("isdefault");
			System.out.println(address + isDefault);
			UserAddress add = new UserAddress();
			add.setCustId(user.getId());
			add.setUserAdd(address);
			add.setIsDefault(isDefault);
			userService.AddUserAddress(add);
		}
		logger.debug("UserAction.addAddress end");
		return forward;
	}
	
	/*
	 *  设置用户选中的地址为默认送货地址
	 *  
	 * @author 陈文磊
	 * @since 2013-10-08
	 * */
    public ActionForward setDefaultAddress(ActionMapping mapping,ActionForm form,
    		HttpServletRequest request, HttpServletResponse response)
	throws Exception {
    	
    	String addrId = request.getParameter("addrid");
    	String custId = request.getParameter("cust_id");
    	
    	//去掉默认地址
    	Map  mapcondition = new HashMap();
	    List sconList = new ArrayList();
	    Map condition = new HashedMap();
		condition.put("condition", "eq");
		condition.put("field","isDefault");
		condition.put("value","N");
		sconList.add(condition);
		mapcondition.put("sconList", sconList);
	    
		Map map = new HashMap();
		List schList = new ArrayList();
		Map condition5 = new HashedMap();
		condition5.put("condition", "eq");
		condition5.put("field","custId");
		condition5.put("value",Integer.parseInt(custId));
		schList.add(condition5);
		map.put("schList",schList);
	    userService.setdefaultaddress(mapcondition, map);
    	
		//设置新的默认地址
		Map  mapconditions = new HashMap();
	    List sconsList = new ArrayList();
	    Map conditions = new HashedMap();
		conditions.put("condition", "eq");
		conditions.put("field","isDefault");
		conditions.put("value","Y");
		sconsList.add(conditions);
		mapconditions.put("sconList", sconsList);
	    
		Map maps = new HashMap();
		List schsList = new ArrayList();
		Map condition0 = new HashedMap();
		condition0.put("condition", "eq");
		condition0.put("field","id");
		condition0.put("value",Integer.parseInt(addrId));
		schsList.add(condition0);
		maps.put("schList",schsList);
    	
		userService.setdefaultaddress(mapconditions, maps);
		
    	return null;
    }
    
   
	/**
	 * 我的留言
	 * 
	 * @author 苏皓
	 * @since 2013-06-29
	 */
	public ActionForward userLeaveWordList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("UserAction.userLeaveWordList start");
		ActionForward forward = mapping.findForward("userLeaveWordList");
		logger.debug("UserAction.userLeaveWordList end");
		return forward;
	}
	
	/*
	 *   增加用户留言 
	 * */
    public ActionForward addUserLeave(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
    	ActionForward forward = mapping.findForward("leavewordList");
    	Map<String, Object> sGlobal = (Map<String, Object>) request
		.getAttribute("sGlobal");
    	request.setAttribute("tag", "3");// 菜单样式
    	int smj_uid = (Integer) sGlobal.get("smj_userid");
    	if(smj_uid == 0){
    		forward = mapping.findForward("login");
    	}
    	else{
    		//留言给本站点,商铺ID为0
    		String ask = request.getParameter("ask").trim();
    		Leaveword leave = new Leaveword();
    		leave.setStoreId(0);
    		leave.setCustId(smj_uid);
    		leave.setCustName(sGlobal.get("smj_username").toString());
    		leave.setLeavContent(ask);
    		leave.setLeavTime(Common.getcurrentDate());
    		userService.AddLeave(leave);
    		
    		List<Leaveword> lisLeave = userService.findAllLeave();
    		request.setAttribute("leavewords",lisLeave);
    		
    	}
    	return forward;
    }
	
    /*
     *     回复留言
     * 
     * */
    public ActionForward replayUserLevel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
    	
    	String levelId = request.getParameter("levelId").trim();
    	String replyTxt = request.getParameter("replyTxt").trim();
        
    	//拼接更改字段
    	Map mapCondition = new HashMap();
    	List sconList = new ArrayList();
    	Map condition = new HashedMap();
    	condition.put("condition", "eq");
		condition.put("field","ansContent");
		condition.put("value",replyTxt);
		sconList.add(condition);
		Map condition1 = new HashedMap();
    	condition1.put("condition", "eq");
		condition1.put("field","ansTime");
		condition1.put("value",Common.getCurrentDate("yyyy-MM-dd HH:mm:ss"));
		sconList.add(condition1);
		Map condition2 = new HashedMap();
    	condition2.put("condition", "eq");
		condition2.put("field","ansUser");
		condition2.put("value",0);
		sconList.add(condition2);
		mapCondition.put("sconList",sconList);
		
    	Map map = new HashMap();
    	List schList = new ArrayList();
		Map condition5 = new HashedMap();
		condition5.put("condition", "eq");
		condition5.put("field","leavId");
		condition5.put("value",levelId);
		schList.add(condition5);
		map.put("schList",schList);
    	
		userService.replayLevel(mapCondition, map);
		
    	return null;
    }
    
	
	/*
	 *  忘记密码
	 * 
	 * @author 陈文磊
	 * */
	public ActionForward forgotpwd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("UserAction.forgotPwd start");
		ActionForward forward = mapping.findForward("forgotpwd");
		Cust_info custinfo = null;
		String type = request.getParameter("type");
		if(type==null || "".equals(type.trim())){
			request.setAttribute("type", "sendemail");
		}
		else if("sendemail".equals(type.trim())){//发送验证码邮件
				request.setAttribute("type", "checkcode");
				String username = request.getParameter("username");
				
		try{
				custinfo = (Cust_info)userService.findByName("nick_name",username);
				if(custinfo.getCust_id() == null){
						showMessage(request,response,"0000","用户名不存在,请重新输入!","errorMsg");
				}
				else{
					String email = custinfo.getEmail();
					String checkcode = Common.getRandStr(6, false);
					request.getSession().setAttribute("pwd_checkcode", checkcode);
					request.getSession().setAttribute("pwd_username", username);
					
					//发送验证邮件
					Mail mail = new Mail(request, response);
					StringBuffer message = new StringBuffer();
					message.append("您好！感谢您使用送每家网，祝您生活愉快！<br/>您正在进行密码找回操作，请在校验码输入框中输入：<font color=red>");
					message.append(checkcode);
					message.append("</font>，以完成操作。<br/><font color=red>注意：</font>此操作可能会修改您的密码，工作人员不会向您索取此校验码，请勿泄漏！");
					System.out.println("message" + message.toString());
					mail.sendMessage(null, email.trim(), "密码找回验证", message.toString());
					String ename = email.substring(0, email.indexOf("@"));
					StringBuffer e = new StringBuffer();
					if(ename.length()<=4){
						e.append(email.substring(0,1));
						for(int i=0;i<ename.length()-1;i++){e.append("*");}
						e.append(email.substring(email.indexOf("@")));
					}else{
						e.append(email.substring(0,2));
						for(int i=0;i<ename.length()-4;i++){e.append("*");}
						e.append(email.substring(email.indexOf("@")-2));	
				   }
					
					request.setAttribute("email", e);
			   }
			}catch(java.util.NoSuchElementException e){
					e.printStackTrace();
			} 
	    }
        else if("checkcode".equals(type.trim())){
        	request.setAttribute("type", "changepwd");
			String checkcode = request.getParameter("checkcode");
			if(checkcode==null || !request.getSession().getAttribute("pwd_checkcode").equals(checkcode.trim())){
				request.getSession().removeAttribute("pwd_checkcode");
				request.getSession().removeAttribute("pwd_username");
				showMessage(request,response,"0000","输入验证码错误！","errorMsg");
				forward = mapping.findForward("forgotpwd");
			}
			request.getSession().removeAttribute("pwd_checkcode");
			request.getSession().setAttribute("pwd_ischeck", "Y");    	
		}
        else if("changepwd".equals(type.trim())){
        	String password = request.getParameter("password1");
        	String pwdstr = Common.getRandStr(4, false);
        	
        	//更改顾客新密码
			Map  mapcondition = new HashMap();
		    List sconList = new ArrayList();
		    Map condition = new HashedMap();
			condition.put("condition", "eq");
			condition.put("field","pwd");
			condition.put("value",MD5.getMD5(MD5.getMD5(password.trim()).trim()+pwdstr).trim());
			sconList.add(condition);
			Map condition1 = new HashedMap();
			condition1.put("condition", "eq");
			condition1.put("field","radom_str1");
			condition1.put("value",pwdstr);
			sconList.add(condition1);
			mapcondition.put("sconList", sconList);
		    
			Map map = new HashMap();
			List schList = new ArrayList();
			Map condition5 = new HashedMap();
			condition5.put("condition", "eq");
			condition5.put("field","nick_name");
			condition5.put("value",request.getSession().getAttribute("pwd_username"));
			schList.add(condition5);
			map.put("schList",schList);
			userService.update(mapcondition, map);
        	request.getSession().removeAttribute("pwd_username");
        	request.getSession().removeAttribute("pwd_ischeck");
        	
        	forward = mapping.findForward("index");
        }
		logger.debug("UserAction.forgotPwd end");
		return forward;
	}	
	
	/*
	 *    修改密码
	 *  
	 * */
	public ActionForward upPassword(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		ActionForward  forward = mapping.findForward("userinfo");
		Map<String, Object> sGlobal = (Map<String, Object>) request
		.getAttribute("sGlobal");
		int sugu_uid = (Integer) sGlobal.get("smj_userid");
        System.out.println("updatesugu"+sugu_uid);
		if (sugu_uid <= 0)
			forward = mapping.findForward("login");
		else{
			String password = request.getParameter("password");
			String password1 = request.getParameter("newpasswd1");
       	    String pwdstr = Common.getRandStr(4, false);
            System.out.println("pwdstr"+pwdstr);
        	//更改顾客新密码
			Map  mapcondition = new HashMap();
		    List sconList = new ArrayList();
		    Map condition = new HashedMap();
			condition.put("condition", "eq");
			condition.put("field","pwd");
			condition.put("value",MD5.getMD5(MD5.getMD5(password1.trim()).trim()+pwdstr).trim());
			sconList.add(condition);
			Map condition1 = new HashedMap();
			condition1.put("condition", "eq");
			condition1.put("field","radom_str1");
			condition1.put("value",pwdstr);
			sconList.add(condition1);
			mapcondition.put("sconList", sconList);
		    
			Map map = new HashMap();
			List schList = new ArrayList();
			Map condition5 = new HashedMap();
			condition5.put("condition", "eq");
			condition5.put("field","cust_id");
			condition5.put("value",sugu_uid);
			schList.add(condition5);
			map.put("schList",schList);
			userService.update(mapcondition, map);
		}
		return forward;
	}
	
	/*
	 *    跳转到用户注册页面
	 * */
	public ActionForward register(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		logger.debug("register is start");
		ActionForward  forward = mapping.findForward("register");
		logger.debug("register is end");
		return forward;
	}
	
	
	/**
	 * 用户注册
	 */
	public ActionForward registe(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("registe is start");
		ActionForward  forward = mapping.findForward("message");
		HttpSession session = request.getSession();
		int userid = 0;
		int userInteger = 0;
		try{
			Cust_info user = new Cust_info();
			String pwdstr = Common.getRandStr(4,false).trim();
			String emailstr = Common.getRandStr(4,true).trim();
		
	        Object count = userService.find("userId","username",request.getParameter("name").trim());
	        if(count == null){
    	        user.setName(request.getParameter("name").trim());
    	        System.out.println("getname" + user.getName());
    	        
    	        user.setNick_name(request.getParameter("username").trim().toString());
    	        user.setMobile(request.getParameter("mobile").trim());
    	        user.setPhone(request.getParameter("telephone").trim());
    	        user.setEmail(request.getParameter("email").trim());
    	        user.setQq(request.getParameter("qq").trim());
    	        user.setPwd(MD5.getMD5(MD5.getMD5(request.getParameter("password").trim())+pwdstr).trim());
    	        user.setAccu(0);
    	        user.setUser_rank(100);
    	        user.setReg_date(Common.getcurrentDate());
    	        user.setRadom_str1(pwdstr);
    	        user.setRadom_str2(emailstr);
    	        user.setUser_state("Y");
    	        
    	        userService.Add(user); 
    	        userid = user.getCust_id();
    	        userInteger = user.getAccu();
	    	    UserAddress address = new UserAddress();
	    	        
	    	    address.setCustId(user.getCust_id());
	    	    address.setUserAdd(request.getParameter("address").trim());
	    	    address.setIsDefault("Y");
	    	           
	    	        userService.AddUserAddress(address);
	    	        
	        }
	        else if(Integer.parseInt(count.toString()) > 0){
	    		showMessage(request,response,"0000","该帐号已存在,请重新输入!","errorMsg");
	    	}
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	      	
		// 发送验证邮件
		try {
			Mail mail = new Mail(request, response);
			StringBuffer message = new StringBuffer();
			message.append("Hi,&nbsp;&nbsp;");
			message.append(request.getParameter("name").trim());
			message.append("<br/>");
			message.append("&nbsp;&nbsp;&nbsp;&nbsp;送每家网欢迎您的加入，祝您购物愉快！<br/>请点击下面链接验证：（<font color=red>*&nbsp;如非您本人注册，请勿点击</font>）<br/><a href=\"");
			message.append(Common.getSiteUrl(request));
			message.append("reigsterAction.do?method=validate&vstr=");
			message.append(userid);
			/*message.append("\">");
			message.append(Common.getSiteUrl(request));
			message.append("reigsterAction.do?method=validate&vstr=");
			message.append(Base648.encode(user.getUserId() + "&&&" + emailstr, "UTF8"));*/
			message.append("</a>");
			
			System.out.println(message);
			
			boolean is = mail.sendMessage(null, request.getParameter("email").trim(), "注册用户验证",
					message.toString());
			showMessage(request,response,"0000","恭喜您，注册成功！<br/>请到您的邮箱" + "<a>" + request.getParameter("email").trim() + "中点击连接验证您的账号！</a>");
			Map<String, Object> sGlobal = (Map<String, Object>) request.getAttribute("sGlobal");
			sGlobal.put("smj_userid", userid);
			sGlobal.put("smj_name", request.getParameter("name").trim());
			sGlobal.put("smj_integral",userInteger);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("registe is end");
		return forward;
	}
    	
	/**
	 * 顾客注册验证
	 */
	public ActionForward validate(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward  forward = null;
		HttpSession session = request.getSession();
		int i = 0;
		String vstr = request.getParameter("vstr");
		if (Common.empty(vstr)){
			showMessage(request, response, "0000","参数异常，请勿非法访问！","errorMsg");
			i = 0;
		}
		else{	
			try{
				Cust_info user =  (Cust_info) session.getAttribute("user");
				Cust_info newUser = new Cust_info();
					
				newUser.setCust_id(Integer.parseInt(vstr));
				newUser.setName(user.getName());
				newUser.setNick_name(user.getNick_name());
				newUser.setMobile(user.getMobile());
				newUser.setPhone(user.getPhone());
				newUser.setEmail(user.getEmail());
				newUser.setQq(user.getQq());
				newUser.setPwd(user.getPwd());
				newUser.setAccu(0);
				newUser.setUser_rank(100);
				newUser.setReg_date(user.getReg_date());
				newUser.setRadom_str1(user.getRadom_str1());
				newUser.setIs_validate(1);
	    	     
				i = 1;
			}
			catch(Exception e){
			     e.printStackTrace();	
			}
		}	
			
			if(i > 0){
			    showMessage(request,response,"0000","验证通过，请登录！","errorMsg");
			    forward = mapping.findForward("login");
			}
			else{
				showMessage(request,response,"0000","验证失败，如有疑问请与客服联系！","errorMsg");
				forward = mapping.findForward("");
			}
			return forward;
	}
	
	
	/**
	 * 用户登录
	 * author:陈文磊
	 */
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		ActionForward forward = mapping.findForward("index");
		request.setAttribute("tag", "6");// 菜单样式
		String usernames = "";
		String password  = "";
		try{
		    usernames = request.getParameter("usernames").trim();
		    password = request.getParameter("password").trim();
		}catch(Exception ex){
			ex.fillInStackTrace();
		}
		
		Map  map = new HashMap();
		List schList=new ArrayList();
		Map condition = new HashedMap();
		condition.put("condition", "eq");
		condition.put("field","nick_name");
		condition.put("value",usernames);
		Map condition1 = new HashedMap();
		condition1.put("condition", "eq");
		condition1.put("field","is_validate");
		condition1.put("value",1);
		Map condition2 = new HashedMap();
		condition2.put("condition", "eq");
		condition2.put("field","user_state");
		condition2.put("value","Y");
		schList.add(condition);
		schList.add(condition1);
		schList.add(condition2);
		map.put("schList", schList);
		
		Cust_info user = null;
		
		try
		{
			 user = (Cust_info) userService.find(map);
		}catch(NoSuchElementException e){
			e.printStackTrace();
		}
		
		 if(user == null){
			 showMessage(request,response,"0000","用户不存在,请重新输入!","errorMsg");
		 }
		 else if(!user.getPwd().equals((MD5.getMD5(MD5.getMD5(password)+user.getRadom_str1())))){
			 showMessage(request,response,"0000","用户名或密码错误，请重新输入!","errorMsg");
		 }
		 else{
			 
			 //删除SESSION表中已存在的记录
			 UserSession oldsu = new UserSession();
				oldsu.setId(user.getCust_id());	 
			 
			userService.delUserSession(oldsu);
			 
			int cookieTime = Common.intval(request.getParameter("cookietime"));
			
			UserSession su = new UserSession();
			su.setId(user.getCust_id());
			su.setUserName(user.getName());
			su.setName(user.getNick_name());
			su.setUserPwd(user.getPwd());
			su.setMobile(user.getMobile());
			su.setTelephone(user.getPhone());
			su.setQq(user.getQq());
			su.setIntegral(user.getAccu());
			su.setUserRank(user.getUser_rank().toString());
			su.setIp(Common.getOnlineIP(request));
			userService.AddUserSession(su);
			
			sGlobal.put("smj_userid", user.getCust_id());
			sGlobal.put("smj_username", Common.addSlashes(usernames));
			sGlobal.put("smj_name", user.getName());
			sGlobal.put("smj_integral", user.getAccu());
			sGlobal.put("smj_rank", user.getUser_rank());
			
			Object useraddress = userService.findUserAddress("userAdd","custId",user.getCust_id());
			sGlobal.put("smj_address",useraddress);
			
			CookieHelper.setCookie(request, response, "smj", Common.authCode(user.getPwd()
					+ "\t" + user.getCust_id(), "ENCODE", null, 0), cookieTime == 0 ? -1 : cookieTime);
			CookieHelper.setCookie(request, response, "loginuser", (String) user.getNick_name(), 31536000);
			CookieHelper.removeCookie(request, response, "_refer");
			
			showMessage(request,response,"0000","","errorMsg");
		 }
		return forward;
		
	}
	
	/**
	 * 生成随机码
	 * @author 陈文磊
	 * @since  20130709
	 */
	public ActionForward seccode(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String seccode = com.smj.taglib.Function.mkSeccode();
		request.getSession().setAttribute("seccode", seccode);//session淇濆瓨鍊?
		int width = 100, height = 30;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		g.setColor(com.smj.taglib.Function.getRandColor(200, 235));
		g.fillRect(0, 0, width, height);
		g.setFont(new Font("Times New Roman", Font.BOLD, 22)); 
		for (int i = 0; i < 4; i++) {
			g.setColor(new Color(20 + Common.rand(110), 20 + Common.rand(110), 20 + Common.rand(110)));
			int x = Common.rand(width);
			int y = Common.rand(height);
			int xl = Common.rand(width);
			int yl = Common.rand(height);
			g.drawLine(x, y, x + xl, y + yl);
		}
		for (int i = 0; i < 4; i++) {
			char rand = seccode.charAt(i);
			g.setColor(com.smj.taglib.Function.getRandColor(10, 150));
			g.drawString(String.valueOf(rand), 24 * i + Common.rand(4), 22 + Common.rand(6));
		}
		g.dispose(); 
		try {
			response.setContentType("image/JPEG"); 
			ImageIO.write(image, "JPEG", response.getOutputStream()); 
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ActionForward findUser(ActionMapping mapping,ActionForm form,
			 HttpServletRequest request,HttpServletResponse responsn)
	{   
		ActionForward forward = mapping.findForward("");
		Map<String, Object> sGlobal = (Map<String,Object>) 
		request.getAttribute("sGlobal");
	   
		String userId = request.getParameter("");
		if(userId ==  "1")
		{
			
		}		
		else if(userId == "2")
		{
			
		}
	       return null;	
	}
	
	/*
	 *   检测用户是否存在
	 *   author:陈文磊
	 * */
	public ActionForward checkusername(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("checkusername  is start");
		String username  = "";
		try{
		     username = request.getParameter("username");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		String type;
		Document returnXml = DocumentHelper.createDocument();
		Element result = returnXml.addElement("result");
		response.setContentType("text/html;charset=UTF-8");
		if (username == null || "".equals(username.trim())) {
			result.addAttribute("state", "ERR");
			response.getWriter().write(result.asXML());
			return null;
		}
		Object user = null;
	    //判断用户是否存在
		try{
			Map map = new HashMap();
			List schList = new ArrayList();
			
			Map condition = new HashedMap();
			condition.put("condition", "eq");
			condition.put("field","nick_name");
			condition.put("value",username);
			schList.add(condition);
			map.put("schList", schList);
			
			user = userService.findByName(map);
	    	
	    }catch(NoSuchElementException e){
	    	e.printStackTrace();
	    }
		//0为不存在  1为存在
		if (Integer.parseInt(user.toString()) == 0){
			result.addAttribute("state", "YES");
		    type = "YES";
		}
		else{
			result.addAttribute("state", "NO");
			type = "NO";
		}
		response.getWriter().write(result.asXML());
		logger.debug("checkusername is end!");
		return null;
	}
	
	
	/**
	 *    个人信息中心
	 */
	public ActionForward userinfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.findForward("userInfo");
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		return forward;
	}
	
	
	/**
	 * 个人资料查询、修改
	 */
	public ActionForward updateuser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		ActionForward forward = mapping.findForward("userInfo");
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		
		int sugu_uid = (Integer) sGlobal.get("smj_userid");
		if (sugu_uid <= 0)
			forward = mapping.findForward("login");
		else{
			
		HttpSession session = request.getSession();
			
		String type = request.getParameter("type");
		UserSession user = new UserSession();
		    
		    String name = request.getParameter("name").trim();
		    String nickname = request.getParameter("nickname").trim();
		    String telephone = request.getParameter("telephone").trim();
			String mobile = request.getParameter("mobile").trim();
			String qq = request.getParameter("qq").trim();
            
			user.setId(sugu_uid);
			user.setName(name);
			user.setUserName(nickname);
			user.setTelephone(telephone);
			user.setMobile(mobile);
			user.setQq(qq);
			
			Map  mapcondition = new HashMap();
		    List sconList = new ArrayList();
		    Map condition = new HashedMap();
			condition.put("condition", "eq");
			condition.put("field","mobile");
			condition.put("value",mobile);
			sconList.add(condition);
			Map condition1 = new HashedMap();
			condition1.put("condition", "eq");
			condition1.put("field","phone");
			condition1.put("value",telephone);
			sconList.add(condition1);
			Map condition2 = new HashedMap();
			condition2.put("condition", "eq");
			condition2.put("field","qq");
			condition2.put("value",qq);
			sconList.add(condition2);
			mapcondition.put("sconList", sconList);
		    
			Map map = new HashMap();
			List schList = new ArrayList();
			Map condition5 = new HashedMap();
			condition5.put("condition", "eq");
			condition5.put("field","cust_id");
			condition5.put("value",sugu_uid);
			schList.add(condition5);
			map.put("schList",schList);
			userService.update(mapcondition, map);
			
			request.getSession().setAttribute("user",user);
			
			System.out.println(user.getMobile() + user.getTelephone());
		}
		return null;
	}

	/**
	 *    退出
	 */
	public ActionForward loginOut(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.findForward("index");
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		sGlobal.remove("smj_userid");
		request.getSession().removeAttribute("errorMsg");
		showMessage(request,response,"0000","1","type");
		return forward;
	}	
	
	/*
	 *     购物车管理---(添加商品,删除商品,获取商品,设置商品)
	 * 
	 * */
	public ActionForward shopCardManager(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String action = request.getParameter("action").trim();
		
		
		System.out.println(action);
		
		if(action == "Add"){
			//CookieHelper.setCookie(request, response,"commdImg","",31536000);
			//CookieHelper.setCookie(request, response,"commdId","",31536000);
			//CookieHelper.setCookie(request, response,"number","5",31536000);
	        //CookieHelper.setCookie(request, response,"price","",31536000);
	        
	        //Map<String,String> cookieMap = CookieHelper.  (request);
	        //System.out.println("cookie"  + cookieMap.get("number"));
	        
		     Cookie username = new Cookie("username","cwl");
		     Cookie userpwd = new Cookie("userpwd","123456");
		     response.addCookie(username);
		     response.addCookie(userpwd);
		     
		     Cookie[] cookies = request.getCookies();
		     
		     
			
		}
		else if(action == "Get"){
			CookieHelper.setCookie(request, response,"commdImg","");
			CookieHelper.setCookie(request, response,"commdId",request.getParameter("pid").trim());
			CookieHelper.setCookie(request, response,"number",request.getParameter("pcount").trim());
		}
		else if(action == "Set"){
			
		}
		else if(action == "Remove"){
			
		}
		return null;
	}
	
	/*
	 *   友情链接
	 * */
	public ActionForward friendlinks(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
	    return null;
	}
	
	
	
}