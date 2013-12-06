package com.smj.orm;

import java.util.Date;

 

public class Appriase implements java.io.Serializable {

	// Fields

	private Integer appriId;
	private Integer storeId;
	private String appriContent;
	private Integer speed;
	private Integer integrity;
	private Integer service;
	private Date date;
	private String isValidate;
	private String isAsk;

	// Constructors

	/** default constructor */
	public Appriase() {
	}

	/** full constructor */
	public Appriase(Integer storeId, String appriContent, Integer speed,
			Integer integrity, Integer service, Date date, String isValidate,
			String isAsk) {
		this.storeId = storeId;
		this.appriContent = appriContent;
		this.speed = speed;
		this.integrity = integrity;
		this.service = service;
		this.date = date;
		this.isValidate = isValidate;
		this.isAsk = isAsk;
	}

	// Property accessors

	public Integer getAppriId() {
		return this.appriId;
	}

	public void setAppriId(Integer appriId) {
		this.appriId = appriId;
	}

	public Integer getStoreId() {
		return this.storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public String getAppriContent() {
		return this.appriContent;
	}

	public void setAppriContent(String appriContent) {
		this.appriContent = appriContent;
	}

	public Integer getSpeed() {
		return this.speed;
	}

	public void setSpeed(Integer speed) {
		this.speed = speed;
	}

	public Integer getIntegrity() {
		return this.integrity;
	}

	public void setIntegrity(Integer integrity) {
		this.integrity = integrity;
	}

	public Integer getService() {
		return this.service;
	}

	public void setService(Integer service) {
		this.service = service;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getIsValidate() {
		return this.isValidate;
	}

	public void setIsValidate(String isValidate) {
		this.isValidate = isValidate;
	}

	public String getIsAsk() {
		return this.isAsk;
	}

	public void setIsAsk(String isAsk) {
		this.isAsk = isAsk;
	}

}