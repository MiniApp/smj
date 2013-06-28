package com.smj.orm;

 

public class Cateory implements java.io.Serializable {

	// Fields

	private Integer cateId;
	private Integer name;
	private Integer parentId;
	private Integer classId;
	private Integer deleted;

	// Constructors

	/** default constructor */
	public Cateory() {
	}

	/** full constructor */
	public Cateory(Integer name, Integer parentId, Integer classId,
			Integer deleted) {
		this.name = name;
		this.parentId = parentId;
		this.classId = classId;
		this.deleted = deleted;
	}

	// Property accessors

	public Integer getCateId() {
		return this.cateId;
	}

	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}

	public Integer getName() {
		return this.name;
	}

	public void setName(Integer name) {
		this.name = name;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getClassId() {
		return this.classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Integer getDeleted() {
		return this.deleted;
	}

	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}

}