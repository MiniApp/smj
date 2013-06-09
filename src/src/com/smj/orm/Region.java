package com.smj.orm;

/**
 * Region entity. @author MyEclipse Persistence Tools
 */

public class Region implements java.io.Serializable {

	// Fields

 	private String classId;
	private String parentId;
	private Integer childNumber;
	private String name;
	private Boolean deleted;

	// Constructors

	/** default constructor */
	public Region() {
	}

	/** full constructor */
	public Region(String classId, String parentId, Integer childNumber,
			String name, Boolean deleted) {
		this.classId = classId;
		this.parentId = parentId;
		this.childNumber = childNumber;
		this.name = name;
		this.deleted = deleted;
	}

 

	public String getClassId() {
		return this.classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public Integer getChildNumber() {
		return this.childNumber;
	}

	public void setChildNumber(Integer childNumber) {
		this.childNumber = childNumber;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getDeleted() {
		return this.deleted;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}

}