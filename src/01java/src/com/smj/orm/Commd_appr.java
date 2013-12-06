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
 * 商品评价表封装实体
 * 对应表Commd_appr
 * 
 * 
 * */
@Entity
@Table(name="Commd_appr")
public class Commd_appr implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -887191284018800036L;

	private Integer u_id;//ID
	private Integer commd_id;//商品ID
	private Integer store_id;//店铺ID
	private Integer integral;//分数
	private String taste;//口感
	private String content;//内容
	private Date date;//日期
	
	public Commd_appr(){}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="u_id",unique=true,nullable=false)
	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public Integer getCommd_id() {
		return commd_id;
	}

	public void setCommd_id(Integer commd_id) {
		this.commd_id = commd_id;
	}

	public Integer getStore_id() {
		return store_id;
	}

	public void setStore_id(Integer store_id) {
		this.store_id = store_id;
	}

	public Integer getIntegral() {
		return integral;
	}

	public void setIntegral(Integer integral) {
		this.integral = integral;
	}

	public String getTaste() {
		return taste;
	}

	public void setTaste(String taste) {
		this.taste = taste;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Temporal( TemporalType.DATE)
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
	
}
