package com.smj.web.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForward;
import org.apache.struts.actions.DispatchAction;

import com.smj.util.Common;
import com.smj.util.FrameErrorHelper;
public class BaseAction extends DispatchAction {
    
	/**
	 * 信息提示
	 * @param message 提示信息
	 * @param forwardURL 跳转路径 如：/index.jsp
	 * @return
	 */
	protected ActionForward showMessage1(HttpServletRequest request, HttpServletResponse response, String message, String forwardURL) {
		request.setAttribute("url_forward", forwardURL);
		request.setAttribute("message", message);
		include(request, response, "/commons/showmessage.jsp");
		return null;
	}
	
	
	/**
	 * 信息提示
	 * @param message 提示信息
	 * @return
	 */
	protected ActionForward showMessage(HttpServletRequest request, HttpServletResponse response, String key,String errorName) {
		try {
			   new FrameErrorHelper(request,key,errorName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 信息提示
	 * @param message 提示信息
	 * @return
	 */
	protected ActionForward showMessage(HttpServletRequest request, HttpServletResponse response, String key,String value,String errorName) {
		try {
			System.out.println("base" + key + value);
			new FrameErrorHelper(request,key,value,errorName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 信息提示
	 * @param message 提示信息
	 * @return
	 */
	protected ActionForward showMessage(HttpServletRequest request, HttpServletResponse response, String[] key,String errorName) {
		try {
			new FrameErrorHelper(request,key,errorName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 信息提示
	 * @param message 提示信息
	 * @return
	 */
	protected ActionForward showMessage(HttpServletRequest request, HttpServletResponse response, Map<String, String> maps,String errorName) {
		try {
			new FrameErrorHelper(request,maps,errorName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 信息提示
	 * @param message 提示信息
	 * @return
	 */
	protected ActionForward test(HttpServletRequest request, HttpServletResponse response) {
		try {
			   new FrameErrorHelper(request);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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