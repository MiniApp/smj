package com.smj.orm;

import java.sql.Timestamp;

/**
 * UserLoginSession entity. @author MyEclipse Persistence Tools
 */

public class UserSession implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String name;
	private String userName;
	private String email;
	private String telephone;
	private String qq;
	private String userPwd;
	private Integer integral;
	private Integer isvalidate;
	private String userRank;
	private Timestamp registerDate;
	private String ip;

	// Constructors

	/** default constructor */
	public UserSession() {
	}

	/** full constructor */
	public UserSession(String name, String userName, String email,
			String telephone, String qq, String userPwd, Integer integral,
			Integer isvalidate, String userRank, Timestamp registerDate,
			String ip) {
		this.name = name;
		this.userName = userName;
		this.email = email;
		this.telephone = telephone;
		this.qq = qq;
		this.userPwd = userPwd;
		this.integral = integral;
		this.isvalidate = isvalidate;
		this.userRank = userRank;
		this.registerDate = registerDate;
		this.ip = ip;
	}

	// Property accessors

 

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
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

	public Integer getIsvalidate() {
		return this.isvalidate;
	}

	public void setIsvalidate(Integer isvalidate) {
		this.isvalidate = isvalidate;
	}

	public String getUserRank() {
		return this.userRank;
	}

	public void setUserRank(String userRank) {
		this.userRank = userRank;
	}

	public Timestamp getRegisterDate() {
		return this.registerDate;
	}

	public void setRegisterDate(Timestamp registerDate) {
		this.registerDate = registerDate;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}