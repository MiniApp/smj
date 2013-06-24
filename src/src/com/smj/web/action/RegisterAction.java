package com.smj.web.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.smj.dao.IRedionDao;
import com.smj.dao.IUserAddressDao;
import com.smj.dao.IUserDao;
import com.smj.orm.Region;
import com.smj.orm.UserAddress;
import com.smj.orm.Users;
import com.smj.util.Base648;
import com.smj.util.Common;
import com.smj.util.CookieHelper;
import com.smj.util.MD5;
import com.smj.util.Mail;
import com.smj.web.form.RegisterForm;

/**
 * 用户Action
 * 
 * @author Fengyu
 */
public class RegisterAction extends BaseAction {
	private static final Log logger = LogFactory.getLog(RegisterAction.class);

	private IUserDao userDao;
	private IRedionDao regionDao;
	private IUserAddressDao addressDao;

	public IRedionDao getRegionDao() {
		return regionDao;
	}

	public IUserAddressDao getAddressDao() {
		return addressDao;
	}

	public void setAddressDao(IUserAddressDao addressDao) {
		this.addressDao = addressDao;
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
			HttpServletRequest request, HttpServletResponse response) {
		List provList = regionDao.findByPid("0001");
		request.setAttribute("province", provList);
		ActionForward forward = mapping.findForward("register");
		return forward;
	}

	/**
	 * 验证码
	 */
	public ActionForward seccode(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String seccode = mkSeccode();
		request.getSession().setAttribute("seccode", seccode);// session保存值
		int width = 100, height = 30;
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		g.setColor(getRandColor(200, 235));
		g.fillRect(0, 0, width, height);
		g.setFont(new Font("Times New Roman", Font.BOLD, 22));
		for (int i = 0; i < 4; i++) {
			g.setColor(new Color(20 + Common.rand(110), 20 + Common.rand(110),
					20 + Common.rand(110)));
			int x = Common.rand(width);
			int y = Common.rand(height);
			int xl = Common.rand(width);
			int yl = Common.rand(height);
			g.drawLine(x, y, x + xl, y + yl);
		}
		for (int i = 0; i < 4; i++) {
			char rand = seccode.charAt(i);
			g.setColor(getRandColor(10, 150));
			g.drawString(String.valueOf(rand), 24 * i + Common.rand(4),
					22 + Common.rand(6));
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

	/**
	 * 随机生成验证码串
	 * 
	 * @return
	 */
	private String mkSeccode() {
		int seccode = Integer.parseInt(Common.getRandStr(6, true));
		String s = Integer.toString(seccode, 24);
		while (s.length() < 4) {
			s = "0" + s;
		}
		String seccodeUnits = "bcefghjkmpqrtvwxy2346789";
		StringBuffer secCodeHiddenBuf = new StringBuffer(4);
		for (int i = 0; i < 4; i++) {
			int unit = s.charAt(i);
			if (unit >= 0x30 && unit <= 0x39) {
				secCodeHiddenBuf.append(seccodeUnits.charAt(unit - 0x30));
			} else {
				secCodeHiddenBuf.append(seccodeUnits.charAt(unit - 0x57));
			}
		}
		return secCodeHiddenBuf.toString();
	}

	private Color getRandColor(int fc, int bc) {
		if (fc > 255) {
			fc = 255;
		}
		if (bc > 255) {
			bc = 255;
		}
		int r = fc + Common.rand(bc - fc);
		int g = fc + Common.rand(bc - fc);
		int b = fc + Common.rand(bc - fc);
		return new Color(r, g, b);
	}

	public ActionForward checkusername(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String username = request.getParameter("username");
		Document returnXml = DocumentHelper.createDocument();
		Element result = returnXml.addElement("result");
		response.setContentType("text/html;charset=UTF-8");
		if (username == null || "".equals(username.trim())) {
			result.addAttribute("state", "ERR");
			response.getWriter().write(result.asXML());
			return null;
		}
		Users user = (Users) userDao.findByUsername(username.trim());
		// int count = dataBaseService.findRows(sql.toString());
		if (user == null)
			result.addAttribute("state", "YES");
		else
			result.addAttribute("state", "NO");
		response.getWriter().write(result.asXML());
		return null;
	}

	public ActionForward querySeccode(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String seccode = (String) request.getSession().getAttribute("seccode");

		response.getWriter().write(seccode);
		return null;
	}

	public ActionForward queryRegion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String fid = request.getParameter("fid");
		List<Region> provList = regionDao.findByPid(fid);
		Document returnXml = DocumentHelper.createDocument();
		Element result = returnXml.addElement("result");
		response.setContentType("text/html;charset=UTF-8");

		for (Region region : provList) {
			Element street = result.addElement("street");
			street.addAttribute("id", region.getClassId());
			street.setText(region.getName());
		}
		response.getWriter().write(result.asXML());
		return null;
	}

	private boolean checkLenth(String str, int sml, int max) {
		if (str == null || str.trim().length() < sml
				|| str.trim().length() > max)
			return true;
		else
			return false;
	}

	/**
	 * 用户注册
	 */
	public ActionForward register(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		RegisterForm rform = (RegisterForm) form;
		HttpSession session = request.getSession();
		//request.setCharacterEncoding("UTF-8");
		String token = request.getParameter("token");// 令牌
		String MES = "";// 提示信息
		String reg = "";// 正则表达式
		JSONObject jo = new JSONObject();
		// if(token!=null &&
		// token.trim().equals(session.getAttribute("token"))){
		session.removeAttribute("token");
		String seccode = rform.getSeccode();
		if (seccode == null || !seccode.equals(session.getAttribute("seccode"))) {
			MES += "验证码错误;";
		}
		String username = rform.getUsername();
		if (checkLenth(username, 6, 20)) {
			MES += "账号控制在6-20个字符以内;";
		}
		String password = rform.getPassword();
		if (checkLenth(password, 6, 20)) {
			MES += "密码控制在6-20个字符以内;";
		}
		String name = rform.getName();
		if (checkLenth(name, 2, 10)) {
			MES += "真实姓名控制在2-10个字符以内;";
		}
		String email = rform.getEmail();
		reg = "([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})";
		if (!Common.matchMachine(email, reg, "1")) {
			MES += "保密邮箱非法;";
		}
		String address = rform.getAddress();
		// if(checkLenth(address,2,50)){MES+="详细地址非法;";}
		String mobile = rform.getMobile();
		// if(checkLenth(mobile,11,20)){MES+="手机号码非法;";}
		// String type = request.getParameter("type");
		// String borough_no = request.getParameter("borough_no");//区
		// String street_no = request.getParameter("street_no");//街道
		// String sid = request.getParameter("signs_all");//楼盘
		// if(Common.empty(sid)){MES+="所在楼盘非法";}
		String telephone = rform.getTelephone();
		String qq = rform.getQq();
		String provincename = rform.getProvincename();
		String cityname = rform.getCityname();
		String regionname = rform.getRegionname();
		if (!"".equals(MES)) {
			// return showMessage(request,response,MES,"/uregister.jsp");
			jo.put("value", "failure");
			jo.put("text", MES);
			response.getWriter().write(jo.toString());
			return null;
		}
		int count = userDao.findByName(username).size();
		String pwdstr = Common.getRandStr(4, false);
		String emailstr = Common.getRandStr(4, true);
		Users user = new Users();
		if (count <= 0) {
	
			user.setName(name);
			int dataid = 0;
			user.setUsername(username);
			user.setUserPwd(MD5.getMD5(
					MD5.getMD5(password.trim()).trim() + pwdstr).trim());
			user.setEmail(email);
			// user.setMobile(telephone);
			user.setMobile(mobile);

			user.setQq(qq);
			user.setRegsterDate(new Date());
			user.setRadomStr1(pwdstr);
			user.setRadomStr2(emailstr);

			UserAddress adress = new UserAddress();
			//adress.setAddress2(address);
			//adress.setAddress1(provincename + "" + cityname + "" + regionname+"  "+address);
			//adress.setUserId(dataid);
			//adress.setIsdefault("Y");

			try {
				dataid = userDao.save(user);
				 //adress.setUserId(dataid);
				 addressDao.save(adress);
				 int cookieTime = Common.intval(request.getParameter("cookietime"));
					String authCode = Common.authCode(user.getUserPwd()+ "\t" + user.getUserId(), "ENCODE", null, 0);
					CookieHelper.setCookie(request, response, "smj", authCode, cookieTime == 0 ? -1 : cookieTime);
					CookieHelper.setCookie(request, response, "loginuser", (String) user.getUsername(), 31536000);
					request.getSession().setAttribute("sGlobal",null);
					jo.put("value", "success");
					response.getWriter().write(jo.toString());
					return null;
			} catch (Exception e) {
				logger.error(e);
//				request.setAttribute("info", "系统异常，请稍后再试！");
				// ActionForward forward = mapping.findForward("info");
				// return
				// showMessage(request,response,"系统异常，请稍后再试！","/uregister.jsp");
				// return forward;
				jo.put("value", "failure");
				jo.put("text", e);
				
			}

			//
		}
		// 发送验证邮件
		try {
			Mail mail = new Mail(request, response);
			StringBuffer message = new StringBuffer();
			message.append("Hi,&nbsp;&nbsp;");
			message.append(name.trim());
			message.append("<br/>");
			message.append("&nbsp;&nbsp;&nbsp;&nbsp;尚佰味网欢迎您的加入，祝您用餐愉快！<br/>请点击下面链接验证：（<font color=red>*&nbsp;如非您本人注册，请勿点击</font>）<br/><a href=\"");
			message.append(Common.getSiteUrl(request));
			message.append("userAction.do?method=validate&vstr=");
			message.append(Base648.encode(username + "&&&" + emailstr, "UTF8"));
			message.append("\">");
			message.append(Common.getSiteUrl(request));
			message.append("reigsterAction.do?method=validate&vstr=");
			message.append(Base648.encode(username + "&&&" + emailstr, "UTF8"));
			message.append("</a>");
			boolean is = mail.sendMessage(null, email.trim(), "注册用户验证",
					message.toString());
			// return
			// showMessage(request,response,"恭喜您，注册成功！<br/>请到您的邮箱"+email.trim()+"中点击连接验证您的账号！");
			// request.setAttribute("info",
			// "恭喜您，注册成功！<br/>请到您的邮箱"+email.trim()+"中点击连接验证您的账号！");
			// ActionForward forward = mapping.findForward("info");

			jo.put("value", "恭喜您，注册成功！<br/>请到您的邮箱" + email.trim()
					+ "中点击连接验证您的账号！");
			Map<String, Object> sGlobal = (Map<String, Object>) request.getAttribute("sGlobal");
			sGlobal.put("smj_userid", user.getUserId());
			response.getWriter().write(jo.toString());
			return null;
//			ActionForward forward = mapping.findForward("index");
//			return forward;
		} catch (Exception e) {
			e.printStackTrace();
		}
		// }
		response.getWriter().write(jo.toString());
		return null;
	}

	/**
	 * 用户验证
	 */
	public ActionForward validate(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String vstr = request.getParameter("vstr");
		if (Common.empty(vstr))
			return showMessage(request, response, "参数异常，请勿非法访问！", "/index.jsp");
		String str = Base648.decode(vstr.trim(), "UTF8");
		String[] strs = str.split("&&&");
		if (strs.length == 2) {
			String username = strs[0].trim();
			String emailstr = strs[1].trim();
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE snack_users SET isemail='Y',emailstr='' WHERE username='");
			sql.append(username);
			sql.append("' AND emailstr='");
			sql.append(emailstr);
			sql.append("'");
			// int i = dataBaseService.executeUpdate(sql.toString());
			int i = 1;
			if (i > 0)
				return showMessage(request, response, "验证通过，请登录！",
						"/user/login.jsp");
			else
				return showMessage(request, response, "验证失败，如有疑问请与客服联系！",
						"/index.jsp");
		} else
			return showMessage(request, response, "验证失败，如有疑问请与客服联系！",
					"/index.jsp");
	}

}