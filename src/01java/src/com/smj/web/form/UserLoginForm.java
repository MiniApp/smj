package com.smj.web.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

public class UserLoginForm extends ActionForm {
	private String password;

	/** loginName property */
	private String username;
	
	private String cookietime;
	
	public String getCookietime() {
		return cookietime;
	}

	public void setCookietime(String cookietime) {
		this.cookietime = cookietime;
	}

	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		ActionMessages msg = new ActionMessages();	
		if(username!=null)
			//msg.add("loginError", new ActionMessage("user.nousername"));
		 
		errors.add(msg);
		return errors;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

 
}
