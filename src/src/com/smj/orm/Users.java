package com.smj.orm;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String name;
	private String username;
	private String isCert;
	private String mobile;
	private String email;
	private String qq;
	private String userPwd;
	private Integer integral;
	private Integer isValidate;
	private Integer userRank;
	private Date regsterDate;
	private String radomStr1;
	private String radomStr2;
	private Integer userState;

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** full constructor */
	public Users(String name, String username, String isCert, String mobile,
			String email, String qq, String userPwd, Integer integral,
			Integer isValidate, Integer userRank, Timestamp regsterDate,
			String radomStr1, String radomStr2, Integer userState) {
		this.name = name;
		this.username = username;
		this.isCert = isCert;
		this.mobile = mobile;
		this.email = email;
		this.qq = qq;
		this.userPwd = userPwd;
		this.integral = integral;
		this.isValidate = isValidate;
		this.userRank = userRank;
		this.regsterDate = regsterDate;
		this.radomStr1 = radomStr1;
		this.radomStr2 = radomStr2;
		this.userState = userState;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getIsCert() {
		return this.isCert;
	}

	public void setIsCert(String isCert) {
		this.isCert = isCert;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getUserPwd() {
		return this.userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public Integer getIntegral() {
		return this.integral;
	}

	public void setIntegral(Integer integral) {
		this.integral = integral;
	}

	public Integer getIsValidate() {
		return this.isValidate;
	}

	public void setIsValidate(Integer isValidate) {
		this.isValidate = isValidate;
	}

	public Integer getUserRank() {
		return this.userRank;
	}

	public void setUserRank(Integer userRank) {
		this.userRank = userRank;
	}

	public Date getRegsterDate() {
		return this.regsterDate;
	}

	public void setRegsterDate(Date regsterDate) {
		this.regsterDate = regsterDate;
	}

	public String getRadomStr1() {
		return this.radomStr1;
	}

	public void setRadomStr1(String radomStr1) {
		this.radomStr1 = radomStr1;
	}

	public String getRadomStr2() {
		return this.radomStr2;
	}

	public void setRadomStr2(String radomStr2) {
		this.radomStr2 = radomStr2;
	}

	public Integer getUserState() {
		return this.userState;
	}

	public void setUserState(Integer userState) {
		this.userState = userState;
	}

}