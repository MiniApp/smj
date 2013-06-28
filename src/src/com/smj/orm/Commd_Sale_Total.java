package com.smj.orm;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商品销售统计表封装实体
 * 对应表Commd_Sale_Total
 * 
 * 
 * */
@Entity
@Table(name="Commd_Sale_Total")
public class Commd_Sale_Total implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7895339633654790041L;
	
	
	private Integer store_id;//店铺ID
	private Integer commd_id;//商品ID
	private Integer commd_sale_num;//销售数量
	private Double commd_sale_amt;//销售金额

	
	public Commd_Sale_Total(){}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="store_id",unique=true,nullable=false)
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


	public Integer getCommd_sale_num() {
		return commd_sale_num;
	}


	public void setCommd_sale_num(Integer commd_sale_num) {
		this.commd_sale_num = commd_sale_num;
	}


	public Double getCommd_sale_amt() {
		return commd_sale_amt;
	}


	public void setCommd_sale_amt(Double commd_sale_amt) {
		this.commd_sale_amt = commd_sale_amt;
	}
	
	
	
}
