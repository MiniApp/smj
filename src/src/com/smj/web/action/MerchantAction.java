package com.smj.web.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.smj.orm.UserAddress;
import com.smj.web.form.RegisterForm;

/**
 * 商户MerchantAction
 * <p/>
 * 功能描述：
 * <li>开通店铺-addStore</li>
 * <li>店铺信息-getStoreInfo</li>
 * <li>店铺信息修改-updateStoreInfo</li>
 * <li>商品管理-productManager</li>
 * <li>商品添加-addProduct</li>
 * <li>商品修改-updateProduct</li>
 * <li>商品删除-deleteProduct</li>
 * <li>订单管理-orderManager</li>
 * <li>订单查询-orderSearch</li>
 * <li>订单详细信息-getOrderDetail</li>
 * 
 * @author 苏皓
 * @since 2013-06-25
 * @修改日期:
 * @版本： 1.0
 * 
 */
public class MerchantAction extends BaseAction {
	private static final Log logger = LogFactory.getLog(MerchantAction.class);

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
		logger.debug("MerchantAction.getStoreInfo end");
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
		ActionForward forward = mapping.findForward("getStoreInfo");
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
		logger.debug("MerchantAction.productManager end");
		return forward;
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
		RegisterForm rg = (RegisterForm) form;
		rg.setCityname("成都锦江区");
		request.setAttribute("test", rg);
		logger.info("MerchantAction.orderManager end");
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
            // TODO Auto-generated catch block 
            e.printStackTrace(); 
        }
        logger.info("MerchantAction.getOrderDetail end");
        
        return null;
	}
}