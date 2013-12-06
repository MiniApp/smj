/**    
 * Class Name：	
 *			BillInfoBean.java
 * Version：	1.1   
 * Date：	2013-8-9       
 * Copyright	
 */
package com.smj.service.bean;

import java.util.Date;

/**    
 *         
 * Class Name：
 *			BillInfoBean    
 * Description：    
 *			订单bean
 * @Author：	suhao    
 * @Date：	2013-8-9 上午10:50:55    
 * @version	
 *     
 */
public class BillInfoBean {
	private Integer billId;// 订单ID
	private Date billDate;// 交易日期
	private Integer custId;// 用户ID
	private Integer billType;// 单据类型
	private String custName;// 顾客姓名
	private String custTel;// 顾客联系电话
	private String custAddr;// 顾客地址
	private Integer accu;// 积分
	private String isInvoice;// 是否开发票
	private String isVintegral;// 送积分标志
	private Double amt;// 总金额
	private String billState;// 单据状态
	private Integer payType;// 支付方式
	private String rejectFlg;// 退单标志
	private String rejectCause;// 退单原因
	private Date rejectTime;// 退单时间
	private Double deliverFee;// 外送费用
	private String billAppr;// 评价内容
	private String userAppr;// 评价人
	private Date apprTime;// 评价日期
	private Date deliverTime;// 送货时间
	private String memo;// 备注

	public Integer getBillId() {
		return billId;
	}

	public void setBillId(Integer billId) {
		this.billId = billId;
	}

	public Date getBillDate() {
		return billDate;
	}

	public void setBillDate(Date billDate) {
		this.billDate = billDate;
	}

	public Integer getCustId() {
		return custId;
	}

	public void setCustId(Integer custId) {
		this.custId = custId;
	}

	public Integer getBillType() {
		return billType;
	}

	public void setBillType(Integer billType) {
		this.billType = billType;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustTel() {
		return custTel;
	}

	public void setCustTel(String custTel) {
		this.custTel = custTel;
	}

	public String getCustAddr() {
		return custAddr;
	}

	public void setCustAddr(String custAddr) {
		this.custAddr = custAddr;
	}

	public Integer getAccu() {
		return accu;
	}

	public void setAccu(Integer accu) {
		this.accu = accu;
	}

	public String getIsInvoice() {
		return isInvoice;
	}

	public void setIsInvoice(String isInvoice) {
		this.isInvoice = isInvoice;
	}

	public String getIsVintegral() {
		return isVintegral;
	}

	public void setIsVintegral(String isVintegral) {
		this.isVintegral = isVintegral;
	}

	public Double getAmt() {
		return amt;
	}

	public void setAmt(Double amt) {
		this.amt = amt;
	}

	public String getBillState() {
		return billState;
	}

	public void setBillState(String billState) {
		this.billState = billState;
	}

	public Integer getPayType() {
		return payType;
	}

	public void setPayType(Integer payType) {
		this.payType = payType;
	}

	public String getRejectFlg() {
		return rejectFlg;
	}

	public void setRejectFlg(String rejectFlg) {
		this.rejectFlg = rejectFlg;
	}

	public String getRejectCause() {
		return rejectCause;
	}

	public void setRejectCause(String rejectCause) {
		this.rejectCause = rejectCause;
	}

	public Date getRejectTime() {
		return rejectTime;
	}

	public void setRejectTime(Date rejectTime) {
		this.rejectTime = rejectTime;
	}

	public Double getDeliverFee() {
		return deliverFee;
	}

	public void setDeliverFee(Double deliverFee) {
		this.deliverFee = deliverFee;
	}

	public String getBillAppr() {
		return billAppr;
	}

	public void setBillAppr(String billAppr) {
		this.billAppr = billAppr;
	}

	public String getUserAppr() {
		return userAppr;
	}

	public void setUserAppr(String userAppr) {
		this.userAppr = userAppr;
	}

	public Date getApprTime() {
		return apprTime;
	}

	public void setApprTime(Date apprTime) {
		this.apprTime = apprTime;
	}

	public Date getDeliverTime() {
		return deliverTime;
	}

	public void setDeliverTime(Date deliverTime) {
		this.deliverTime = deliverTime;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

}
