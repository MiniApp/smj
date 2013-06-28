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
 * 订单信息表封装实体
 * 对应表bill_info
 * 
 * 
 * */
@Entity
@Table(name="bill_info")
public class Bill_info implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1919759583143366206L;
	
	private Integer bill_info;//订单ID
	private Date bill_date;//交易日期
	private Integer cust_id;//用户ID
	private Integer bill_type;//单据类型
	private String cust_name;//顾客姓名
	private String cust_tel;//顾客联系电话
	private String cust_addr;//顾客地址
	private Integer accu;//积分
	private String is_invoice;//是否开发票
	private String is_vintegral;//送积分标志
	private Double amt;//总金额
	private String bill_state;//单据状态
	private Integer pay_type;//支付方式
	private String reject_flg;//退单标志
	private String reject_cause;//退单原因
	private Date reject_time;//退单时间
	private Double deliver_fee;//外送费用
	private String bill_appr;//评价内容
	private String user_appr;//评价人
	private Date appr_time;//评价日期
	private Date deliver_time;//送货时间
	private String memo;//备注
	
	public Bill_info(){}
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="bill_info",unique=true,nullable=false)
	public Integer getBill_info() {
		return bill_info;
	}

	public void setBill_info(Integer bill_info) {
		this.bill_info = bill_info;
	}
	@Temporal( TemporalType.DATE)
	public Date getBill_date() {
		return bill_date;
	}

	public void setBill_date(Date bill_date) {
		this.bill_date = bill_date;
	}

	public Integer getCust_id() {
		return cust_id;
	}

	public void setCust_id(Integer cust_id) {
		this.cust_id = cust_id;
	}

	public Integer getBill_type() {
		return bill_type;
	}

	public void setBill_type(Integer bill_type) {
		this.bill_type = bill_type;
	}

	public String getCust_name() {
		return cust_name;
	}

	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}

	public String getCust_tel() {
		return cust_tel;
	}

	public void setCust_tel(String cust_tel) {
		this.cust_tel = cust_tel;
	}

	public String getCust_addr() {
		return cust_addr;
	}

	public void setCust_addr(String cust_addr) {
		this.cust_addr = cust_addr;
	}

	public Integer getAccu() {
		return accu;
	}

	public void setAccu(Integer accu) {
		this.accu = accu;
	}

	public String getIs_invoice() {
		return is_invoice;
	}

	public void setIs_invoice(String is_invoice) {
		this.is_invoice = is_invoice;
	}

	public String getIs_vintegral() {
		return is_vintegral;
	}

	public void setIs_vintegral(String is_vintegral) {
		this.is_vintegral = is_vintegral;
	}

	public Double getAmt() {
		return amt;
	}

	public void setAmt(Double amt) {
		this.amt = amt;
	}

	public String getBill_state() {
		return bill_state;
	}

	public void setBill_state(String bill_state) {
		this.bill_state = bill_state;
	}

	public Integer getPay_type() {
		return pay_type;
	}

	public void setPay_type(Integer pay_type) {
		this.pay_type = pay_type;
	}

	public String getReject_flg() {
		return reject_flg;
	}

	public void setReject_flg(String reject_flg) {
		this.reject_flg = reject_flg;
	}

	public String getReject_cause() {
		return reject_cause;
	}

	public void setReject_cause(String reject_cause) {
		this.reject_cause = reject_cause;
	}
	@Temporal( TemporalType.DATE)
	public Date getReject_time() {
		return reject_time;
	}

	public void setReject_time(Date reject_time) {
		this.reject_time = reject_time;
	}

	public Double getDeliver_fee() {
		return deliver_fee;
	}

	public void setDeliver_fee(Double deliver_fee) {
		this.deliver_fee = deliver_fee;
	}

	public String getBill_appr() {
		return bill_appr;
	}

	public void setBill_appr(String bill_appr) {
		this.bill_appr = bill_appr;
	}

	public String getUser_appr() {
		return user_appr;
	}

	public void setUser_appr(String user_appr) {
		this.user_appr = user_appr;
	}
	@Temporal( TemporalType.DATE)
	public Date getAppr_time() {
		return appr_time;
	}

	public void setAppr_time(Date appr_time) {
		this.appr_time = appr_time;
	}
	@Temporal( TemporalType.DATE)
	public Date getDeliver_time() {
		return deliver_time;
	}

	public void setDeliver_time(Date deliver_time) {
		this.deliver_time = deliver_time;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	
	
	
	
	
	

}
