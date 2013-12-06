package com.smj.orm;

 

public class CommInfoId implements java.io.Serializable {

	// Fields

	private Integer commdId;
	private Integer storeId;

	// Constructors

	/** default constructor */
	public CommInfoId() {
	}

	/** full constructor */
	public CommInfoId(Integer commdId, Integer storeId) {
		this.commdId = commdId;
		this.storeId = storeId;
	}

	// Property accessors

	public Integer getCommdId() {
		return this.commdId;
	}

	public void setCommdId(Integer commdId) {
		this.commdId = commdId;
	}

	public Integer getStoreId() {
		return this.storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CommInfoId))
			return false;
		CommInfoId castOther = (CommInfoId) other;

		return ((this.getCommdId() == castOther.getCommdId()) || (this
				.getCommdId() != null
				&& castOther.getCommdId() != null && this.getCommdId().equals(
				castOther.getCommdId())))
				&& ((this.getStoreId() == castOther.getStoreId()) || (this
						.getStoreId() != null
						&& castOther.getStoreId() != null && this.getStoreId()
						.equals(castOther.getStoreId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getCommdId() == null ? 0 : this.getCommdId().hashCode());
		result = 37 * result
				+ (getStoreId() == null ? 0 : this.getStoreId().hashCode());
		return result;
	}

}