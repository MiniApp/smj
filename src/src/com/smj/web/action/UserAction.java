package com.smj.web.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.smj.dao.IRedionDao;
import com.smj.dao.IUserDao;
import com.smj.orm.UserSession;
import com.smj.orm.Users;
import com.smj.util.Common;
import com.smj.util.CookieHelper;
import com.smj.util.MD5;
import com.smj.web.form.UserLoginForm;

/**
 * 用户Action
 * 
 * @author Fengyu
 */
public class UserAction extends BaseAction {
	private static final Log logger = LogFactory.getLog(UserAction.class);

	private IUserDao userDao;
	private IRedionDao regionDao;

	public IRedionDao getRegionDao() {
		return regionDao;
	}

	public void setRegionDao(IRedionDao regionDao) {
		this.regionDao = regionDao;
	}

	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	public ActionForward index(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.getInputForward();
		request.setAttribute("tag", "6");// 菜单样式
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		// sGlobal.put("sugu_uid", 0);
		return forward;
	}

	/**
	 * 用户登录
	 */
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");

		// int sugu_uid = (Integer) sGlobal.get("sugu_uid");
		// if (sugu_uid > 0) {
		// return include(request, response, "/userAction.do?method=index");
		// }
		UserLoginForm userForm = (UserLoginForm) form;

		String username = userForm.getUsername();
		// if (Common.empty(username)) {
		// return showMessage(request,response,"用户名不能为空！","/user/login.jsp");
		// }
		String password = userForm.getPassword();
		// String cookietime = userForm.getCookietime();
		int cookieTime = Common.intval(userForm.getCookietime());
		ActionForward forward = mapping.getInputForward();
		ActionMessages msgs = new ActionMessages();

		Users user = userDao.findByUsername(username);
		// List<Map<String, Object>> users =
		// dataBaseService.executeQuery("SELECT * FROM snack_users WHERE username = '"
		// + username + "' or  email = '" + username + "' or mobile = '" +
		// username + "'  AND isemail='Y'");
		if (user == null) {
			forward = mapping.getInputForward();
			msgs.add("loginError", new ActionMessage("user.nousername"));
			saveErrors(request, msgs);
			return forward;
			// return showMessage(request,response,"该用户不存在！","/user/index.jsp");
		}
		request.getSession().setAttribute("user", user);
		password = MD5.getMD5(
				MD5.getMD5(password.trim()).trim() + user.getRadomStr1())
				.trim();
		if (!password.equals(user.getUserPwd())) {

			msgs.add("loginError", new ActionMessage("user.wrongusername"));
			saveErrors(request, msgs);
			return forward;
			// return
			// showMessage(request,response,"密码错误，请重新登录！","/user/login.jsp");
		}
		// IUserSessionDao userSessionDao = new UserSessionDaoImpl();
		UserSession su = new UserSession();
		su.setUserId(user.getUserId());
		su.setUserName(user.getUsername());
		su.setUserPwd(user.getUserPwd());
		su.setName(user.getName());
		su.setIntegral(user.getIntegral());
		// su.setUserRank(user.getUserRank());
		su.setIp(Common.getOnlineIP(request));
		// userDao.save(su);
		sGlobal.put("smj_userid", user.getUserId());
		sGlobal.put("sugu_username", Common.addSlashes(username));
		sGlobal.put("sugu_name", user.getName());
		sGlobal.put("sugu_integral", user.getIntegral());
		sGlobal.put("sugu_rank", user.getUserRank());
		String authCode = Common.authCode(
				user.getUserPwd() + "\t" + user.getUserId(), "ENCODE", null, 0);
		if (cookieTime != 0) {
			CookieHelper.setCookie(request, response, "smj", authCode,
					cookieTime == 0 ? -1 : cookieTime);
			CookieHelper.setCookie(request, response, "loginuser",
					(String) user.getUsername(), 31536000);
		}
		CookieHelper.removeCookie(request, response, "_refer");
		return forward;
		// return include(request, response, "/userAction.do?method=index");
	}

	public ActionForward logout(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = mapping.getInputForward();
		CookieHelper.clearCookie(request, response);
		return forward;
	}

	/**
	 * 个人资料查询、修改
	 */
	public ActionForward user(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> sGlobal = (Map<String, Object>) request
				.getAttribute("sGlobal");
		int sugu_uid = (Integer) sGlobal.get("smj_userid");
		if (sugu_uid <= 0)
			return showMessage(request, response, "您还未登录！", "/user/login.jsp");
		String type = request.getParameter("type");
		Users user = null;
		if (type != null && "Y".equals(type.trim())) {
			String name = request.getParameter("name");
			String telephone = request.getParameter("telephone");
			String mobile = request.getParameter("mobile");
			String qq = request.getParameter("qq");
			if (mobile == null || "".equals(mobile.trim()))
				return showMessage(request, response, "手机未填写！",
						"/userAction.do?method=user");
			user = userDao.findById(sugu_uid);
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE snack_users SET ");
			if (name != null && !"".equals(name.trim())) {
				sql.append(" name='");
				sql.append(name.trim());
				sql.append("',");
				user.setUsername(name.trim());
			}
			sql.append("mobile='");
			sql.append(mobile.trim());
			if (telephone != null && !"".equals(telephone.trim())) {
				sql.append("',telephone='");
				sql.append(telephone.trim());
				user.setMobile(telephone.trim());
			}
			if (qq != null) {
				sql.append("',qq='");
				sql.append(qq.trim());
				user.setQq(qq);
			}
			sql.append("' WHERE id='");
			sql.append(sugu_uid);
			sql.append("'");
			if (name != null && !"".equals(name.trim())) {
				sql.append(" AND isname='N'");
			}
			try {
				userDao.merge(user);
			} catch (Exception e) {
				e.printStackTrace();
				return showMessage(request, response, "用户信息修改失败！",
						"/userAction.do?method=user");
			}

		}
//		List<Map<String, Object>> users = null;
		if (user!=null)
			request.setAttribute("user", user);
		request.setAttribute("tag", "user");
		
		ActionForward forward = mapping.findForward("userInfo");
		return forward;
	}

}