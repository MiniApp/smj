package com.smj.web.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForward;
import org.apache.struts.actions.DispatchAction;

import com.smj.util.Common;
/**
 * 基础Action类
 * @author Fengyu
 */
public class BaseAction extends DispatchAction {
 
	/**
	 * 信息提示
	 * @param message 提示信息
	 * @return
	 */
	protected ActionForward showMessage(HttpServletRequest request, HttpServletResponse response, String message) {
		return showMessage(request,response,message,null);
	}
	/**
	 * 信息提示
	 * @param message 提示信息
	 * @param forwardURL 跳转路径 如：/index.jsp
	 * @return
	 */
	protected ActionForward showMessage(HttpServletRequest request, HttpServletResponse response, String message, String forwardURL) {
		request.setAttribute("url_forward", forwardURL);
		request.setAttribute("message", message);
		include(request, response, "/commons/showmessage.jsp");
		return null;
	}
	/**
	 * 请求转发
	 */
	protected ActionForward include(HttpServletRequest request, HttpServletResponse response, String pageName) {
		String tpl = null;
		try {
			tpl = Common.template(pageName);
			request.getRequestDispatcher(tpl).include(request, response);
		} catch (Exception e) {
			try {
				response.getWriter().write("Template file : " + tpl + " Not found or have no access!<br>");
				response.getWriter().write("Message : " + e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		return null;
	}
	/**
	 * 生成表单令牌
	 * @param request
	 * @return
	 */
	protected String getTokenStr(HttpServletRequest request){
		String token = Common.getRandStr(5,false);
		request.getSession().setAttribute("token", token);
		return token;
	}
}