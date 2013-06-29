package com.smj.orm;

import java.sql.Timestamp;


/**
 * BillInfo entity. @author MyEclipse Persistence Tools
 */

public class BillInfo  implements java.io.Serializable {


    // Fields    

     private String billId;
     private Timestamp billDate;
     private Integer custId;
     private Integer billType;
     private String custName;
     private String custTel;
     private String custAddr;
     private Integer accu;
     private String isInvoice;
     private String isVintegral;
     private Double amt;
     private String billState;
     private Integer payType;
     private String rejectFlg;
     private String rejectCause;
     private Timestamp rejectTime;
     private Double deliverFee;
     private String billAppr;
     private String userAppr;
     private Timestamp apprTime;
     private Timestamp deliverTime;
     private String memo;


    // Constructors

    /** default constructor */
    public BillInfo() {
    }

    
    /** full constructor */
    public BillInfo(Timestamp billDate, Integer custId, Integer billType, String custName, String custTel, String custAddr, Integer accu, String isInvoice, String isVintegral, Double amt, String billState, Integer payType, String rejectFlg, String rejectCause, Timestamp rejectTime, Double deliverFee, String billAppr, String userAppr, Timestamp apprTime, Timestamp deliverTime, String memo) {
        this.billDate = billDate;
        this.custId = custId;
        this.billType = billType;
        this.custName = custName;
        this.custTel = custTel;
        this.custAddr = custAddr;
        this.accu = accu;
        this.isInvoice = isInvoice;
        this.isVintegral = isVintegral;
        this.amt = amt;
        this.billState = billState;
        this.payType = payType;
        this.rejectFlg = rejectFlg;
        this.rejectCause = rejectCause;
        this.rejectTime = rejectTime;
        this.deliverFee = deliverFee;
        this.billAppr = billAppr;
        this.userAppr = userAppr;
        this.apprTime = apprTime;
        this.deliverTime = deliverTime;
        this.memo = memo;
    }

   
    // Property accessors

    public String getBillId() {
        return this.billId;
    }
    
    public void setBillId(String billId) {
        this.billId = billId;
    }

    public Timestamp getBillDate() {
        return this.billDate;
    }
    
    public void setBillDate(Timestamp billDate) {
        this.billDate = billDate;
    }

    public Integer getCustId() {
        return this.custId;
    }
    
    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public Integer getBillType() {
        return this.billType;
    }
    
    public void setBillType(Integer billType) {
        this.billType = billType;
    }

    public String getCustName() {
        return this.custName;
    }
    
    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustTel() {
        return this.custTel;
    }
    
    public void setCustTel(String custTel) {
        this.custTel = custTel;
    }

    public String getCustAddr() {
        return this.custAddr;
    }
    
    public void setCustAddr(String custAddr) {
        this.custAddr = custAddr;
    }

    public Integer getAccu() {
        return this.accu;
    }
    
    public void setAccu(Integer accu) {
        this.accu = accu;
    }

    public String getIsInvoice() {
        return this.isInvoice;
    }
    
    public void setIsInvoice(String isInvoice) {
        this.isInvoice = isInvoice;
    }

    public String getIsVintegral() {
        return this.isVintegral;
    }
    
    public void setIsVintegral(String isVintegral) {
        this.isVintegral = isVintegral;
    }

    public Double getAmt() {
        return this.amt;
    }
    
    public void setAmt(Double amt) {
        this.amt = amt;
    }

    public String getBillState() {
        return this.billState;
    }
    
    public void setBillState(String billState) {
        this.billState = billState;
    }

    public Integer getPayType() {
        return this.payType;
    }
    
    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public String getRejectFlg() {
        return this.rejectFlg;
    }
    
    public void setRejectFlg(String rejectFlg) {
        this.rejectFlg = rejectFlg;
    }

    public String getRejectCause() {
        return this.rejectCause;
    }
    
    public void setRejectCause(String rejectCause) {
        this.rejectCause = rejectCause;
    }

    public Timestamp getRejectTime() {
        return this.rejectTime;
    }
    
    public void setRejectTime(Timestamp rejectTime) {
        this.rejectTime = rejectTime;
    }

    public Double getDeliverFee() {
        return this.deliverFee;
    }
    
    public void setDeliverFee(Double deliverFee) {
        this.deliverFee = deliverFee;
    }

    public String getBillAppr() {
        return this.billAppr;
    }
    
    public void setBillAppr(String billAppr) {
        this.billAppr = billAppr;
    }

    public String getUserAppr() {
        return this.userAppr;
    }
    
    public void setUserAppr(String userAppr) {
        this.userAppr = userAppr;
    }

    public Timestamp getApprTime() {
        return this.apprTime;
    }
    
    public void setApprTime(Timestamp apprTime) {
        this.apprTime = apprTime;
    }

    public Timestamp getDeliverTime() {
        return this.deliverTime;
    }
    
    public void setDeliverTime(Timestamp deliverTime) {
        this.deliverTime = deliverTime;
    }

    public String getMemo() {
        return this.memo;
    }
    
    public void setMemo(String memo) {
        this.memo = memo;
    }
   








}