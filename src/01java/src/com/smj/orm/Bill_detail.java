package com.smj.orm;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 订单明细表封装实体
 * 对应表bill_detail
 * 
 * 
 * */
@Entity
@Table(name="bill_detail")
public class Bill_detail implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2943055243508224794L;
	
	private Date bill_date;//订货日期
	private Integer store_id;//店铺ID
	private Integer bill_id;//订单ID
	private Integer commd_id;//商品ID
	private Integer commd_num;//商品数量
	
	public Bill_detail(){}
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="bill_id",unique=true,nullable=false)
	public Integer getBill_id() {
		return bill_id;
	}
	public void setBill_id(Integer bill_id) {
		this.bill_id = bill_id;
	}
	
	@Temporal( TemporalType.DATE)
	public Date getBill_date() {
		return bill_date;
	}
	public void setBill_date(Date bill_date) {
		this.bill_date = bill_date;
	}
	public Integer getStore_id() {
		return store_id;
	}
	public void setStore_id(Integer store_id) {
		this.store_id = store_id;
	}
	
	
	
	public Integer getCommd_id() {
		return commd_id;
	}
	public void setCommd_id(Integer commd_id) {
		this.commd_id = commd_id;
	}
	public Integer getCommd_num() {
		return commd_num;
	}
	public void setCommd_num(Integer commd_num) {
		this.commd_num = commd_num;
	}
	
	
	

}
