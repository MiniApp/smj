package com.smj.orm;

/**
 * Unit entity. @author MyEclipse Persistence Tools
 */

public class Unit implements java.io.Serializable {

	// Fields

	private Integer UId;
	private String name;
	private Integer deleted;

	// Constructors

	/** default constructor */
	public Unit() {
	}

	/** full constructor */
	public Unit(String name, Integer deleted) {
		this.name = name;
		this.deleted = deleted;
	}

	// Property accessors

	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getDeleted() {
		return this.deleted;
	}

	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}

}