package com.smj.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.smj.orm.Affiche;
import com.smj.orm.Cateory;
import com.smj.orm.Comm_info;
import com.smj.orm.EAdmininfo;
import com.smj.orm.EnterInfo;
import com.smj.orm.StoreInfo;
import com.smj.orm.UserAddress;
import com.smj.service.IAfficheService;
import com.smj.service.ICommInfoService;
import com.smj.service.IEAdminInfoService;
import com.smj.service.IEnterInfoService;
import com.smj.service.IStoreInfoService;
import com.smj.service.IUserService;
import com.smj.service.bean.EnterInfoBean;
import com.smj.service.persist.PaginationSupport;
import com.smj.util.Base64;
import com.smj.util.Common;
import com.smj.util.ImgHelper;
import com.smj.util.DateUtil;
import com.smj.web.form.RegisterForm;
/**
 * 商户MerchantAction功能方法描述
 * <p/>
 * 说明： 以下中文说明是对功能进行详细的描述，后面的方法实现对应页面上的中文名称
 * 功能描述：
 * <li>跳转到商户注册页面-mregister</li>
 * <li>商户注册-register</li> 
 * <li>查询商户信息-getMerchantInfo</li>   
 * <li>修改商户信息-updateMerchantInfo</li> 
 * <li>检查商户管理员是否存在-checkUserName</li>   
 * <li>商户登录页面-login</li>
 * <li>商户管理主页-index</li>
 * <li>商户管理_订单管理-orderManager</li>
 * <li>商户管理_公告管理-getAnnounceList</li>
 * <li>商户管理_商品管理-productManager</li>
 * <li>店铺商品明显查询-queryCommInfo</li>
 * <li>商户管理_评价管理(针对顾客对订单进行评价)-appManager</li>
 * <li>商户管理_留言管理-leaveWordManager</li>
 * <li>商户管理_跳转到添加店铺页面-addStore</li>
 * <li>商户管理_开通店铺-subAddStore</li>
 * <li>商户管理_根据店铺ID查询店铺明细-findStoreinfo</li>
 * <li>商户管理_店铺信息管理-getStoreInfo</li>
 * <li>商户管理_店铺信息修改-updateStoreInfo</li>
 * <li>商户管理_商品添加-addProduct</li>
 * <li>商户管理_商品查询-queryProduct</li>
 * <li>商户管理_商品修改-updateProduct</li>
 * <li>商户管理_商品删除-deleteProduct</li>
 * <li>商户管理_订单查询-orderSearch</li>
 * <li>商户管理_订单详细信息-getOrderDetail</li>
 * <li>商户管理_订单核审-orderVerify</li>
 * <li>商户管理_商户信息-getMerchantInfo</li>
 * <li>商户管理_商户信息修改-updateMerchantInfo</li>
 * <li>商户管理_查询密码-getPassword</li>
 * <li>商户管理_修改密码-updatePassword</li>
 * <li>商户管理_发布公告-addAnnounce</li>
 * <li>商户管理_跳转到公告发布页面-addAnnounce1</li>
 * <li>商户管理_删除公告-operaf</li>
 * <li>退出商户管理页面-logout</li>
 * @author 苏皓
 * @since 2013-06-25
 * @修改日期: 2013-10-09
 * @版本： 1.0
 * 
 */
public class MerchantAction extends BaseAction {
	private static final Log logger = LogFactory.getLog(MerchantAction.class);
     
	@Resource(name = "IEnterInfoService")
	private IEnterInfoService enterservice;
	@Resource(name = "eadminService")
	private IEAdminInfoService adminservice;
	@Resource(name = "IStoreInfoService")
	private IStoreInfoService storeservice;
	@Resource(name = "eadminService")
	private IEAdminInfoService adminervice;
	@Resource(name = "IAfficheService")
	private IAfficheService  affiService;
	@Resource(name = "IUserService")
	private IUserService userService;
	@Resource(name = "ICommInfoService")
	private ICommInfoService commService;
	
	/**
	 * 商铺管理主页 
	 * 
	 * @author 陈文磊
	 * @since 2013-07-02
	 */
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("MerchantAction.login start");
		ActionForward forward = null;
		request.setAttribute("tag", "1");// 菜单样式
		String username = request.getParameter("username").trim();
		String userpwd  = request.getParameter("password").trim();
		HttpSession session = request.getSession();
		EAdmininfo  eadmin = null;
		try
		{ 
			eadmin   = (EAdmininfo)adminervice.getEAdmininfoByPro("adminName",username);
			System.out.println("eadmin"  + eadmin);
		}
		catch(NoSuchElementException ex){
			ex.printStackTrace();
		}
		
		if(eadmin == null){
			showMessage(request,response,"0000","用户名或密码错误!","errorMsg");	
		}
		else{
			session.setAttribute("enter_id",eadmin.getStoreId().toString());
			session.setAttribute("eadmininfo",eadmin);
			showMessage(request,response,"0000","success","errorMsg");				
		}
	    logger.debug("MerchantAction.login end");
	    
	    return forward;
	}
	
	public ActionForward index(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		logger.debug("MerchantAction.index start");
		request.setAttribute("tag", "1");// 菜单样式
		ActionForward forward = mapping.findForward("index");
		logger.debug("MerchantAction.index end");	
		return forward;
	}
	
	/**
	 * 超市加盟
	 * 
	 * @author 苏皓
	 * @since 2013-06-25
	 */
	public ActionForward mregister(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("MerchantAction.addStore start");
		request.setAttribute("tag", "1");// 菜单样式
		ActionForward forward = mapping.findForward("mregister");
		logger.debug("MerchantAction.addStore end");	
		return forward;
	}
	  
	/**
	 * 开通店铺
	 * 
	 * @author 苏皓
	 * @since 2013-06-25
	 */
	public ActionForward addStore(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("MerchantAction.addStore start");
		ActionForward forward = mapping.findForward("addStore");
		request.setAttribute("tag", "1");// 菜单样式
		HttpSession session = request.getSession();
		if(session.getAttribute("enter_id") == null){
			forward = mapping.findForward("mlogin");
		}
		logger.debug("MerchantAction.addStore end");
		return forward;
	}

	/**
	 * 店铺信息
	 * 
	 * @author 苏皓
	 * @since 2013-06-25
	 */
	public ActionForward getStoreInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("MerchantAction.getStoreInfo start");
		ActionForward forward = mapping.findForward("getStoreInfo");
		request.setAttribute("tag", "1");// 菜单样式
		HttpSession session = request.getSession();
		System.out.println("test");
		if(session.getAttribute("enter_id") == null)
		{
			 forward = mapping.findForward("mlogin");
		}
		else {
			try
			{
			    //判断商户是否开启商铺	
				Object obj = storeservice.find("storeId","enterId",session.getAttribute("enter_id").toString());
				if(obj == null)
				{
					forward = mapping.findForward("addStore"); 
				}
				else{
					Map map = new HashMap();
					List schList = new ArrayList();
					
					Map condition = new HashedMap();
					condition.put("condition", "eq");
					condition.put("field","enterId");
					condition.put("value",session.getAttribute("enter_id").toString());
					schList.add(condition);
					map.put("schList", schList);
					
					List<StoreInfo> lis  =  storeservice.findStoreInfo(map);
					System.out.println(lis.size());
				     
				    request.setAttribute("storeinfo",lis);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		logger.debug("MerchantAction.getStoreInfo end");
		return forward;
	}
    
	/*
	 *    根据店铺ID查询店铺明细
	 * 
	 * */
	public ActionForward findStoreinfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = mapping.findForward("storeinfos");
		String storeid = request.getParameter("storesid");
		//判断是否已经添加商铺
		if(storeid == null){
			forward = mapping.findForward("addStore");
		}
		else{
			System.out.println("getid"  + storeid);
			
			StoreInfo store = (StoreInfo) storeservice.find("*","storeId",storeid.toString());
			HttpSession session = request.getSession();
			session.setAttribute("store", store);
			session.setAttribute("storeid",store.getStoreId());
		}
		return forward;
		
	}
	
	/**
	 * 店铺信息修改
	 * 
	 * @author 苏皓
	 * @since 2013-06-25
	 */
	public ActionForward updateStoreInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug("MerchantAction.updateStoreInfo start");
		ActionForward forward = mapping.findForward("");
		HttpSession  session = request.getSession();
		if(session.getAttribute("enter_id") == null){
			forward = mapping.findForward("mlogin");
		}
		else{
			
			StoreInfo sInfo = new StoreInfo();
			
			try
			{
				//判断是否已经添加商铺
				if(session.getAttribute("storeid") == null){
				     forward = mapping.findForward("addStore");  	
				}
				else{
					System.out.println("getstoreid" + session.getAttribute("storeid"));
					
					sInfo.setEnterId(Integer.parseInt(session.getAttribute("enter_id").toString()));
					sInfo.setStoreId(Integer.parseInt(session.getAttribute("storeid").toString()));
					sInfo.setStoreName(request.getParameter("store_name").trim());
					sInfo.setStoreType(Integer.parseInt(Common.SysDictionary(request, request.getParameter("issend").trim())));
					sInfo.setStoreLevel(Integer.parseInt(Common.SysDictionary(request, request.getParameter("level").trim())));
					sInfo.setStoreRankAccu(Integer.parseInt(request.getParameter("rankaccu").trim()));
					sInfo.setStoreState(Integer.parseInt(request.getParameter("onoff").trim()));
					sInfo.setDeliverPrice(Double.parseDouble(request.getParameter("beginprice").trim()));
					sInfo.setRespTime(Integer.parseInt(request.getParameter("minutes").trim()));
					sInfo.setShippingFee(Double.parseDouble(request.getParameter("sendprice").trim()));
					sInfo.setContPerson(request.getParameter("username").trim());
					
					String phone = request.getParameter("telephone").trim();
					//判断商铺是否公开客服电话
					if(phone.equals("不公开"))
					{
						sInfo.setContTel("N");
					}
					else{
						sInfo.setContTel(request.getParameter("telephone").trim());
					}
					sInfo.setContQq(request.getParameter("qq").trim());
					sInfo.setStoreLogo(request.getParameter("logopath"));
					String sTime = request.getParameter("bewrite").split("-")[0];
					String eTime = request.getParameter("bewrite").split("-")[1];
					sInfo.setBusiStartHour(Time.valueOf(sTime));
					sInfo.setBusiEndHour(Time.valueOf(eTime));
					sInfo.setStoreAddr(request.getParameter("address").trim());
					sInfo.setService(request.getParameter("serve").trim());
					sInfo.setDeliverRange(request.getParameter("deliverRange").trim());
					sInfo.setRegDate(Common.strToDate(request.getParameter("regDate").toString(),"yyyy-MM-dd HH:mm"));	
					storeservice.Merage(sInfo);
					forward   = mapping.findForward("login");
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		logger.debug("MerchantAction.updateStoreInfo end");
		return forward;
	}
	
	/**
	 * 商品管理
	 * 
	 * @author 苏皓
	 * @since 2013-06-25
	 */
	public ActionForward productManager(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug("MerchantAction.productManager start");
		ActionForward forward = mapping.findForward("productManager");
		request.setAttribute("tag", "1");// 菜单样式
		HttpSession session = request.getSession();
		if(session.getAttribute("enter_id") == null){
			forward = mapping.findForward("mlogin");
		}
		logger.debug("MerchantAction.productManager end");
		return forward;
	}
	
	/*
	 *   查询店铺商品明显
	 * */
	public ActionForward queryCommInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String onedimension = "";
		try{
			onedimension = request.getParameter("onedimension").trim();
		}
		catch(java.lang.NullPointerException e){
		     e.fillInStackTrace();	
		}
		
		if(onedimension != ""){
			PaginationSupport<Comm_info>  lisCommInfo = commService.getCommInfo(onedimension,"",0,"0",Integer.parseInt(session.getAttribute("enter_id").toString()));
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
		else{		
			PaginationSupport<Comm_info>  lisCommInfo = commService.getCommInfo("","",0,"0",Integer.parseInt(session.getAttribute("enter_id").toString()));
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
	
	/**
	 * 商品查询
	 * 
	 * @author 苏皓
	 * @since 2013-06-26
	 */
	public ActionForward queryProduct(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug("MerchantAction.queryProduct start");
		ActionForward forward = mapping.findForward("productManager");
		logger.debug("MerchantAction.queryProduct end");
		return forward;
	}
	/**
	 * 商品添加
	 * 
	 * @author 苏皓
	 * @since 2013-06-26
	 */
	public ActionForward addProduct(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug("MerchantAction.addProduct start");
		ActionForward forward = mapping.findForward("addProduct");
		request.setAttribute("tag", "1");// 菜单样式
		logger.debug("MerchantAction.addProduct end");
		return forward;
	}
	
	/**
	 * 商品修改
	 * 
	 * @author 苏皓
	 * @since 2013-06-26
	 */
	public ActionForward updateProduct(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug("MerchantAction.updateProduct start");
		ActionForward forward = mapping.findForward("updateProduct");
		logger.debug("MerchantAction.updateProduct end");
		return forward;
	}
	
	/**
	 * 商品删除
	 * 
	 * @author 苏皓
	 * @since 2013-06-26
	 */
	public ActionForward deleteProduct(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug("MerchantAction.deleteProduct start");
		ActionForward forward = mapping.findForward("deleteProduct");
		logger.debug("MerchantAction.deleteProduct end");
		return forward;
	}
	
	/**
	 * 订单管理
	 * 
	 * @author 苏皓
	 * @since 2013-06-26
	 */
	public ActionForward orderManager(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("MerchantAction.orderManager start");
		ActionForward forward = mapping.findForward("orderManager");
		request.setAttribute("tag", "1");// 菜单样式
		HttpSession  session = request.getSession();
		if(session.getAttribute("enter_id") == null){
			forward = mapping.findForward("mlogin");
		}
		else{
			RegisterForm rg = (RegisterForm) form;
			rg.setCityname("成都锦江区");
			request.setAttribute("test", rg);
			logger.info("MerchantAction.orderManager end");
		}
		return forward;
	}
	
	/**
	 * 订单查询
	 * 
	 * @author 苏皓
	 * @since 2013-06-27
	 */
	public ActionForward orderSearch(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug("MerchantAction.orderSearch start");
		ActionForward forward = mapping.findForward("orderSearch");
		RegisterForm rg = (RegisterForm) form;
		rg.setCityname("成都成华区");
		request.setAttribute("test", rg);
		logger.debug("MerchantAction.orderSearch end");
		return forward;
	}
	
	/**
	 * 订单详细信息
	 * 
	 * @author 苏皓
	 * @since 2013-06-27
	 */
	public ActionForward getOrderDetail(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("MerchantAction.getOrderDetail start");

        response.setContentType("text/json; charset=utf-8"); //注意设置为json，如果为xml，则设为xml  
          
        UserAddress user1 = new UserAddress();  
        user1.setCustId(1);
        user1.setUserAdd("chengdu1");
        JSONObject json=JSONObject.fromObject(user1); 
        try { 
            PrintWriter out=response.getWriter(); 
            System.out.println(json); 
            out.print(json); 
            out.flush(); 
        } catch (IOException e) { 
            e.printStackTrace(); 
        }
        logger.info("MerchantAction.getOrderDetail end");
        
        return null;
	}
	
	/**
	 * 订单核审
	 * 
	 * @author 苏皓
	 * @since 2013-06-28
	 */
	public ActionForward orderVerify(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("MerchantAction.orderVerify start");

        response.setContentType("text/json; charset=utf-8"); //注意设置为json，如果为xml，则设为xml  
          
        UserAddress user1 = new UserAddress();  
        user1.setCustId(1);
        user1.setUserAdd("chengdu1");
        JSONObject json=JSONObject.fromObject(user1); 
        try { 
            PrintWriter out=response.getWriter(); 
            System.out.println(json); 
            out.print(json); 
            out.flush(); 
        } catch (IOException e) { 
            e.printStackTrace(); 
        }
        logger.info("MerchantAction.orderVerify end");
        
        return null;
	}
	
	/**
	 * 评价管理
	 * 
	 * @author 苏皓
	 * @since 2013-06-28
	 */
	public ActionForward appManager(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("MerchantAction.userAppManager start");
		ActionForward forward = mapping.findForward("userAppManager");
		request.setAttribute("tag", "1");// 菜单样式
		HttpSession session = request.getSession();
		if(session.getAttribute("enter_id") == null){
			forward = mapping.findForward("mlogin");
		}
		logger.info("MerchantAction.userAppManager end");
		return forward;
	}
	
	/**
	 * 查询商户信息
	 * 
	 * @author 苏皓
	 * @since 2013-06-28
	 */
	public ActionForward getMerchantInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("MerchantAction.getMerchantInfo start");
		ActionForward forward = mapping.findForward("getMerchantInfo");
		request.setAttribute("tag", "1");// 菜单样式
		HttpSession session = request.getSession();
		System.out.println("getsession" +  session.getAttribute("enter_id"));
		
		if(session.getAttribute("enter_id") == null)
		{
			 forward = mapping.findForward("mlogin");
		}
		else if(session.getAttribute("enter_id")!=null){
		        EnterInfo company = enterservice.getEnterInfoByPro("enterId",Integer.parseInt(session.getAttribute("enter_id").toString()));
		        request.setAttribute("company", company);
		}
		return forward;
	}
	
	/**
	 * 修改商户信息
	 * 
	 * @author 苏皓
	 * @since 2013-06-28
	 */
	public ActionForward updateMerchantInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("MerchantAction.updateMerchantInfo start");
		ActionForward forward = mapping.findForward("");
		HttpSession  session = request.getSession();
		if(session.getAttribute("enter_id") == null)
		{
			 forward = mapping.findForward("mlogin");
		}
		else if(session.getAttribute("enter_id")!=null){
			EnterInfo   enter = new EnterInfo();
			enter.setEnterId(Integer.parseInt(session.getAttribute("enter_id").toString()));
			enter.setEnterName(request.getParameter("companyName").toString());
			enter.setLegalReprName(request.getParameter("legalReprName"));
			enter.setCertType(Common.sysDirectory.get(request.getParameter("certType").toString()));
			enter.setCertId(request.getParameter("certid").toString());
			enter.setRespbPerson(request.getParameter("user").toString());
			enter.setTelNo(request.getParameter("telephone").toString());
			enter.setEnterAddr(request.getParameter("address").toString());
			enter.setEnterState(Integer.parseInt(Common.sysDirectory.get(request.getParameter("enterstate").toString())));
			enter.setRegDate(Common.strToDate(request.getParameter("regDate").toString(),"yyyy-MM-dd HH:mm"));
			enterservice.merge(enter);
			forward  = mapping.findForward("merchantinfo");
		}
		logger.info("MerchantAction.updateMerchantInfo end");
		return forward;
	}
	
	/**
	 * 留言管理
	 * 
	 * @author 苏皓
	 * @since 2013-06-28
	 */
	public ActionForward leaveWordManager(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("MerchantAction.leaveWordManager start");
		ActionForward forward = mapping.findForward("leaveWordManager");
		request.setAttribute("tag", "1");// 菜单样式
		HttpSession session = request.getSession();
		if(session.getAttribute("enter_id") == null){
			forward = mapping.findForward("mlogin");
		}
		logger.info("MerchantAction.leaveWordManager end");
		return forward;
	}
	
	/**
	 * 查询密码
	 * 
	 * @author 苏皓
	 * @since 2013-06-28
	 */
	public ActionForward getPassword(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("MerchantAction.getPassword start");
		ActionForward forward = mapping.findForward("getPassword");
		request.setAttribute("tag", "1");// 菜单样式
		HttpSession session=request.getSession();
		if(session.getAttribute("enter_id") == null){
			 forward = mapping.findForward("mlogin");
		}
		else {
			logger.info("MerchantAction.getPassword end");
		}
		return forward;
	}
	
	/**
	 * 修改密码
	 * 
	 * @author 苏皓
	 * @since 2013-06-28
	 */
	public ActionForward updatePassword(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("MerchantAction.updatePassword start");
		ActionForward forward = mapping.findForward("login");
		request.setAttribute("tag", "1");// 菜单样式
		HttpSession session=request.getSession();
		if(session.getAttribute("enter_id") == null){
			 forward = mapping.findForward("mlogin");
		}
		else {//newpasswd1
			String oldpwd = Base64.encryptStringBase64(request.getParameter("password").trim(),"mMu6CHXEy3MldhN2nl2AmObIkfgWOzJM");
			String newpwd = Base64.encryptStringBase64(request.getParameter("newpasswd1").trim(),"mMu6CHXEy3MldhN2nl2AmObIkfgWOzJM");
			
			try
			{
				EAdmininfo  oldadmin = (EAdmininfo)session.getAttribute("eadmininfo");
				EAdmininfo  newadmin = new EAdmininfo();
				//System.out.println(oldpwd.trim().equals(oldadmin.getAdminPwd().trim()));
				
				if(oldpwd.trim().equals(oldadmin.getAdminPwd().trim()))
				{
					newadmin.setAdminId(oldadmin.getAdminId());
					newadmin.setStoreId(newadmin.getStoreId());
					newadmin.setAdminName(oldadmin.getAdminName());
					newadmin.setAdminPwd(newpwd);
					newadmin.setAdminType(oldadmin.getAdminType());
					newadmin.setAdminState(oldadmin.getAdminState());
					newadmin.setRegDate(oldadmin.getRegDate());
					
					adminservice.merage(newadmin);
				}
				else{
					showMessage(request,response,"0000","旧密码输入错误!");
				}	
			}catch(Exception e){
		           e.printStackTrace();
			}
			
			logger.info("MerchantAction.updatePassword end");
		}
		return forward;
	}
	
	/*
	 *   跳转到公告发布页面
	 * */
	public ActionForward addAnnounce1(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = mapping.findForward("addAnnounce1");
		return forward;
	}
	
	
	/**
	 * 公告管理
	 * 
	 * @author 苏皓
	 * @since 2013-06-28
	 */
	public ActionForward getAnnounceList(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("MerchantAction.getAnnounceList start");
		ActionForward forward = mapping.findForward("getAnnounceList");
		request.setAttribute("tag", "1");// 菜单样式
		HttpSession session = request.getSession();
		if(session.getAttribute("enter_id") == null){
			forward = mapping.findForward("mlogin");
		}
		else{
			//affl
			List schList = new ArrayList();
			Map condition = new HashedMap();
			condition.put("condition", "eq");
			condition.put("field", "enterId");
			condition.put("value",session.getAttribute("enter_id"));
			schList.add(condition);
			
			Map  map = new HashMap();
			map.put("schList", schList);
			
			List<Affiche> affiche = affiService.findAffiche(map);
			session.setAttribute("affl",affiche);
			
		}
		logger.info("MerchantAction.getAnnounceList end");
		return forward;
	}
		
	/**
	 * 发布公告
	 * 
	 * @author 苏皓
	 * @since 2013-06-28
	 */
	public ActionForward addAnnounce(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("MerchantAction.addAnnounce start");
		ActionForward forward = null;
		HttpSession session  = request.getSession();
		request.setAttribute("tag", "1");// 菜单样式
		if(session.getAttribute("enter_id") == null)
		{
			forward = mapping.findForward("mlogin");
		}
		else{
			String action = request.getParameter("action");
			if ("save".equals(action)) {
				String title = request.getParameter("title").trim();
				String editor1 = request.getParameter("editor1").trim();
				
				Affiche affiche = new Affiche();
				affiche.setTitle(title);
				affiche.setContent(editor1);
				affiche.setDate(Common.getcurrentDate());
				affiche.setEnterId(Integer.parseInt(session.getAttribute("enter_id").toString()));
				
				affiService.add(affiche);
				
				forward = mapping.findForward("afficheinfo");
			} 
			
			logger.info("MerchantAction.addAnnounce end");
		}
		
		return forward;
	}
	
	/*
	 * 删除公告 
	 * 
	 * */
	public ActionForward operaf(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
             logger.debug("MerchantAction.operaf start");
             ActionForward forward = mapping.findForward("afficheinfo");
             HttpSession session  = request.getSession();
     		if(session.getAttribute("enter_id") == null)
     		{
     			forward = mapping.findForward("mlogin");
     		}
     		else{
     			try
     			{
     				String param1 = request.getParameter("st");
         			String affId = request.getParameter("id");
         			
         			if(param1 == null && affId == null){
         			     forward = mapping.findForward("getAnnounceList");	
         			}
         			else{
         				Affiche affiche = new Affiche();
         				affiche.setAffiId(Integer.parseInt(request.getParameter("id")));
        				affiche.setEnterId(Integer.parseInt(session.getAttribute("enter_id").toString()));
        				
        				affiService.del(affiche);

         			}
     			}
     			catch(Exception e){
     				e.printStackTrace();
     			}
     		}
             return forward;
	}
	
	
	
	/**
	 * 超市加盟提交信息
	 * 
	 * @author 龚涛
	 * @since 2013-08-12
	 */
	public ActionForward register(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("MerchantAction.addStore start");
		ActionForward forward = mapping.findForward("mlogin");
		String certType = "";
		EnterInfoBean bean = new EnterInfoBean();
		System.out.println("=============================");
		bean.setEnterName(request.getParameter("company_name").trim());
		bean.setLegalReprName(request.getParameter("user_name").trim());
		bean.setRegDate(DateUtil.dateToStr(new Date()));
		certType = request.getParameter("paper_type").trim();
		System.out.println("certType" + certType.equals("Y"));
		//小型小区超市办理不了营业执照，只有填写小区超市负责人身份证号码
		if(certType.equals("Y"))
		{
		    bean.setCertType(request.getParameter("paper_type").trim().toString());
		    bean.setCertId(request.getParameter("paper_no").trim().toString());
		}
		
		if(certType.equals("C"))
		{
			bean.setCertType(request.getParameter("paper_type").trim().toString());
		    bean.setLegalReprId(request.getParameter("paper_no").trim().toString());
		}
		
		bean.setEnterAddr(request.getParameter("address").trim());
		bean.setRespbPerson(request.getParameter("user").trim());
		bean.setTelNo(request.getParameter("telephone").trim());
		bean.setEnterState("1");
		System.out.println("action" + bean.getLegalReprId() + bean.getCertType());
		enterservice.addEnterInfo(bean);
	    EnterInfo enterInfo = enterservice.getEnterInfoByPro("enterName", request.getParameter("company_name").trim());
	    System.out.println(enterInfo.getEnterId());
		EAdmininfo info = new EAdmininfo();
		info.setStoreId(enterInfo.getEnterId());
		info.setAdminName(request.getParameter("username").trim());
		info.setAdminPwd(Base64.encryptStringBase64(request.getParameter("password").trim(),"mMu6CHXEy3MldhN2nl2AmObIkfgWOzJM"));
		info.setAdminType(1);
		info.setAdminState("S");		
		info.setRegDate(Common.getcurrentDate());
		adminservice.addAdmin(info);
		logger.debug("MerchantAction.addStore end");
		return forward;
	}
	
	/**
	 * 开通店铺
	 * 
	 * @author gongtao
	 * @throws Throwable 
	 * @throws  
	 * @since 2013-08-14
	 */
	public ActionForward subAddStore(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
		 {
		logger.debug("MerchantAction.addStore start");
		ActionForward forward = mapping.findForward("addSotreSucc");
		HttpSession session = request.getSession();
		if(session.getAttribute("enter_id") == null)
		{
				 forward = mapping.findForward("mlogin");
		}
			else{
				System.out.println(request.getParameter("store_name"));
				System.out.println("filepath" + request.getParameter("filepath"));
				
			    Map map = ImgHelper.picUpload(request,request.getParameter("filepath"),512);
				String value = map.get("uploadState").toString();
				System.out.println("value"  + value);
				
				if(value.equals("0")){
				    showMessage(request,response, "0000","LOGO文件已存在，请重新上传LOGO");
				    forward = mapping.findForward("addSotre");
				}
				
				//判断上传LOGO是否大于512
				if(value.equals("1")){
				    showMessage(request,response, "0000","文件大小大于512KB，请重新上传LOGO");
				    forward = mapping.findForward("addSotre");
				}
				//判断上传LOGO文件类型是否真确
				if(value.equals("2")){
					showMessage(request,response, "0000","文件类型只能为|gif|png|jpg|jpeg|bmp|，请重新上传LOGO");
					forward = mapping.findForward("addSotre");
				}
				
				System.out.println("logourl" +   map.get("targetFile").toString());
				
				//判断店铺LOGO是否上传成功
				if(value.equals("3"))
				{
				    System.out.println("value" + value);
					System.out.println("store_name" + request.getParameter("store_name").trim());
					//获取管理员信息
					StoreInfo sInfo = new StoreInfo();
					try
					{
						sInfo.setEnterId(Integer.parseInt(session.getAttribute("enter_id").toString()));
						sInfo.setStoreName(request.getParameter("store_name").trim());
						sInfo.setStoreType(Integer.parseInt(request.getParameter("issends").trim()));
						sInfo.setStoreLevel(Integer.parseInt(request.getParameter("level").trim()));
						sInfo.setStoreState(Integer.parseInt(request.getParameter("onoff").trim()));
						sInfo.setDeliverPrice(Double.parseDouble(request.getParameter("beginprice").trim()));
						sInfo.setRespTime(Integer.parseInt(request.getParameter("resptime").trim()));
						sInfo.setShippingFee(Double.parseDouble(request.getParameter("sendprice").trim()));
						sInfo.setContPerson(request.getParameter("username").trim());
						
						String phone = request.getParameter("telephone").trim();
						//判断商铺是否公开客服电话
						if(phone.equals("不公开"))
						{
							sInfo.setContTel("N");
						}
						else{
							sInfo.setContTel(request.getParameter("telephone").trim());
						}
						sInfo.setContQq(request.getParameter("qq").trim());
						sInfo.setStoreLogo(map.get("targetFile").toString().trim());
						String sTime = request.getParameter("bewrite").split("-")[0]+":00";
						String eTime = request.getParameter("bewrite").split("-")[1]+":00";
						sInfo.setBusiStartHour(Time.valueOf(sTime));
						sInfo.setBusiEndHour(Time.valueOf(eTime));
						sInfo.setStoreAddr(request.getParameter("address").trim());
						sInfo.setService(request.getParameter("serve").trim());
						sInfo.setDeliverRange(request.getParameter("range").trim());
						//新开商铺信用积分默认设置为0
						sInfo.setStoreRankAccu(0);
						sInfo.setRegDate(Common.getcurrentDate());
						
			             storeservice.addStoreInfo(sInfo);
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
				}
			}
		logger.debug("MerchantAction.addStore end");
		return forward;
	}

	/**
	 *  检查用户是否存在
	 * 
	 * @author gongtao
	 * @since 2013-08-16
	 */
	public ActionForward checkUserName(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.debug("MerchantAction.checkUserName start");
		Document returnXml = DocumentHelper.createDocument();
		Element result = returnXml.addElement("result");
		response.setContentType("text/html;charset=UTF-8");
		EAdmininfo aInfo = null;
		//获取管理员信息
		try {
			aInfo = (EAdmininfo)adminervice.getEAdmininfoByPro("adminName", request.getParameter("username"));
		}catch(Exception e) {
			aInfo = null;
		}
		
		if (aInfo != null) { 
			result.addAttribute("state", "Y");
			System.out.println("================"+result.toString());
		} else {
			System.out.println("xxxxxxxxxxxxxxxxxxxx");
			result.addAttribute("state", "success");
		}
		response.getWriter().write(result.asXML());
		logger.debug("MerchantAction.checkUserName end");
		return null;
	}
	
	/**
	 * 退出商户管理页面
	 * 
	 * @author chenwenlei
	 * @since 2013-08-30
	 */
	public ActionForward logout(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		ActionForward forward = mapping.findForward("mlogin");
		HttpSession session = request.getSession();
		session.removeAttribute("enter_id");
		request.setAttribute("tag", "1");// 菜单样式
		showMessage(request,response,"0000"," ","errorMsg");	
		return forward;
	}
}