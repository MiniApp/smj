package com.smj.orm;

import java.sql.Timestamp;

/**
 * EAdmininfo entity. @author MyEclipse Persistence Tools
 */

public class EAdmininfo implements java.io.Serializable {

	// Fields

	private Integer adminId;
	private Integer storeId;
	private String adminName;
	private String adminPwd;
	private Integer adminType;
	private String adminState;
	private Integer errorCount;
	private Timestamp regDate;

	// Constructors

	/** default constructor */
	public EAdmininfo() {
	}

	/** full constructor */
	public EAdmininfo(Integer storeId, String adminName, String adminPwd,
			Integer adminType, String adminState, Integer errorCount,
			Timestamp regDate) {
		this.storeId = storeId;
		this.adminName = adminName;
		this.adminPwd = adminPwd;
		this.adminType = adminType;
		this.adminState = adminState;
		this.errorCount = errorCount;
		this.regDate = regDate;
	}

	// Property accessors

	public Integer getAdminId() {
		return this.adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public Integer getStoreId() {
		return this.storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public String getAdminName() {
		return this.adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPwd() {
		return this.adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public Integer getAdminType() {
		return this.adminType;
	}

	public void setAdminType(Integer adminType) {
		this.adminType = adminType;
	}

	public String getAdminState() {
		return this.adminState;
	}

	public void setAdminState(String adminState) {
		this.adminState = adminState;
	}

	public Integer getErrorCount() {
		return this.errorCount;
	}

	public void setErrorCount(Integer errorCount) {
		this.errorCount = errorCount;
	}

	public Timestamp getRegDate() {
		return this.regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

}