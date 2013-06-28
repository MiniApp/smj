package com.smj.orm;

import java.sql.Timestamp;

/**
 * Leaveword entity. @author MyEclipse Persistence Tools
 */

public class Leaveword implements java.io.Serializable {

	// Fields

	private Integer leavId;
	private Integer storeId;
	private Integer custId;
	private String leavContent;
	private Timestamp leavTime;
	private String ansContent;
	private Timestamp ansTime;
	private Integer ansUser;

	// Constructors

	/** default constructor */
	public Leaveword() {
	}

	/** full constructor */
	public Leaveword(Integer storeId, Integer custId, String leavContent,
			Timestamp leavTime, String ansContent, Timestamp ansTime,
			Integer ansUser) {
		this.storeId = storeId;
		this.custId = custId;
		this.leavContent = leavContent;
		this.leavTime = leavTime;
		this.ansContent = ansContent;
		this.ansTime = ansTime;
		this.ansUser = ansUser;
	}

	// Property accessors

	public Integer getLeavId() {
		return this.leavId;
	}

	public void setLeavId(Integer leavId) {
		this.leavId = leavId;
	}

	public Integer getStoreId() {
		return this.storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public Integer getCustId() {
		return this.custId;
	}

	public void setCustId(Integer custId) {
		this.custId = custId;
	}

	public String getLeavContent() {
		return this.leavContent;
	}

	public void setLeavContent(String leavContent) {
		this.leavContent = leavContent;
	}

	public Timestamp getLeavTime() {
		return this.leavTime;
	}

	public void setLeavTime(Timestamp leavTime) {
		this.leavTime = leavTime;
	}

	public String getAnsContent() {
		return this.ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public Timestamp getAnsTime() {
		return this.ansTime;
	}

	public void setAnsTime(Timestamp ansTime) {
		this.ansTime = ansTime;
	}

	public Integer getAnsUser() {
		return this.ansUser;
	}

	public void setAnsUser(Integer ansUser) {
		this.ansUser = ansUser;
	}

}