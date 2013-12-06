package com.smj.web.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

public class RegisterForm extends ActionForm {
	String seccode  ;
 
	String username;
//	if(checkLenth(username,6,20)){MES+="账号控制在6-20个字符以内;";}
	String password ;
	String password2 ;
//	if(checkLenth(password,6,20)){MES+="密码控制在6-20个字符以内;";}
	String name ;
//	if(checkLenth(name,2,10)){MES+="真实姓名控制在2-10个字符以内;";}
	String email ;
//	reg="([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})";
//	if(!Common.matchMachine(email,reg,"1")){MES+="保密邮箱非法;";}
	String address ;
//	if(checkLenth(address,2,50)){MES+="详细地址非法;";}
	String mobile;
//	if(checkLenth(mobile,11,20)){MES+="手机号码非法;";}
//	String type = request.getParameter("type");
//	String borough_no = request.getParameter("borough_no");//区
//	String street_no = request.getParameter("street_no");//街道
//	String sid = request.getParameter("signs_all");//楼盘
//	if(Common.empty(sid)){MES+="所在楼盘非法";}
	String telephone  ;
	
	String qq ;
	String provincename ;
	String cityname ;
	String regionname ;
	
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		ActionMessages msg = new ActionMessages();	
		if(username!=null)
			//msg.add("registerError", new ActionMessage("user.nousername"));
		 
		errors.add(msg);
		return errors;
	}
	public String getSeccode() {
		return seccode;
	}

	public void setSeccode(String seccode) {
		this.seccode = seccode;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getProvincename() {
		return provincename;
	}

	public void setProvincename(String provincename) {
		this.provincename = provincename;
	}

	public String getCityname() {
		return cityname;
	}

	public void setCityname(String cityname) {
		this.cityname = cityname;
	}

	public String getRegionname() {
		return regionname;
	}

	public void setRegionname(String regionname) {
		this.regionname = regionname;
	}



	 
}
