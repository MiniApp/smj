package com.smj.orm;

import java.util.Date;



public class CustInfo implements java.io.Serializable {

	// Fields

	private Integer custId;
	private String name;
	private String nickName;
	private String isCert;
	private String mobile;
	private String email;
	private String qq;
	private String pwd;
	private Integer accu;
	private Integer isValidate;
	private Integer userRank;
	private Date regDate;
	private String radomStr1;
	private String radomStr2;
	private String userState;

	// Constructors

	/** default constructor */
	public CustInfo() {
	}

	/** full constructor */
	public CustInfo(String name, String nickName, String isCert, String mobile,
			String email, String qq, String pwd, Integer accu,
			Integer isValidate, Integer userRank, Date regDate,
			String radomStr1, String radomStr2, String userState) {
		this.name = name;
		this.nickName = nickName;
		this.isCert = isCert;
		this.mobile = mobile;
		this.email = email;
		this.qq = qq;
		this.pwd = pwd;
		this.accu = accu;
		this.isValidate = isValidate;
		this.userRank = userRank;
		this.regDate = regDate;
		this.radomStr1 = radomStr1;
		this.radomStr2 = radomStr2;
		this.userState = userState;
	}

	// Property accessors

	public Integer getCustId() {
		return this.custId;
	}

	public void setCustId(Integer custId) {
		this.custId = custId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return this.nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Integer getAccu() {
		return this.accu;
	}

	public void setAccu(Integer accu) {
		this.accu = accu;
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

	public Date getRegDate() {
		return this.regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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

	public String getUserState() {
		return this.userState;
	}

	public void setUserState(String userState) {
		this.userState = userState;
	}

}