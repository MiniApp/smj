package com.smj.orm;

 
public class CommdSaleTotal implements java.io.Serializable {

	// Fields

	private Integer storeId;
	private Integer commdId;
	private Integer commdSaleNum;
	private Double commdSaleAmt;

	// Constructors

	/** default constructor */
	public CommdSaleTotal() {
	}

	/** full constructor */
	public CommdSaleTotal(Integer commdId, Integer commdSaleNum,
			Double commdSaleAmt) {
		this.commdId = commdId;
		this.commdSaleNum = commdSaleNum;
		this.commdSaleAmt = commdSaleAmt;
	}

	// Property accessors

	public Integer getStoreId() {
		return this.storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public Integer getCommdId() {
		return this.commdId;
	}

	public void setCommdId(Integer commdId) {
		this.commdId = commdId;
	}

	public Integer getCommdSaleNum() {
		return this.commdSaleNum;
	}

	public void setCommdSaleNum(Integer commdSaleNum) {
		this.commdSaleNum = commdSaleNum;
	}

	public Double getCommdSaleAmt() {
		return this.commdSaleAmt;
	}

	public void setCommdSaleAmt(Double commdSaleAmt) {
		this.commdSaleAmt = commdSaleAmt;
	}

}