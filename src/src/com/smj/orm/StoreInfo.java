package com.smj.orm;

import java.sql.Time;
import java.sql.Timestamp;


/**
 * StoreInfo entity. @author MyEclipse Persistence Tools
 */

public class StoreInfo  implements java.io.Serializable {


    // Fields    

     private Integer storeId;
     private Integer enterId;
     private String storeName;
     private Integer storeLevel;
     private String storeAddr;
     private String contPerson;
     private String contTel;
     private String contQq;
     private String storeLogo;
     private String service;
     private Time busiStartHour;
     private Time busiEndHour;
     private Double deliverPrice;
     private Double shippingFee;
     private Integer respTime;
     private Integer storeState;
     private Timestamp regDate;
     private Integer storeType;
     private Integer storeRankAccu;
     private String storeRank;
     private String storeCredit;
     private Integer orderNum;
     private Integer accessNum;
     private String deliverRange;


    // Constructors

    /** default constructor */
    public StoreInfo() {
    }

    
    /** full constructor */
    public StoreInfo(Integer enterId, String storeName, Integer storeLevel, String storeAddr, String contPerson, String contTel, String contQq, String storeLogo, String service, Time busiStartHour, Time busiEndHour, Double deliverPrice, Double shippingFee, Integer respTime, Integer storeState, Timestamp regDate, Integer storeType, Integer storeRankAccu, String storeRank, String storeCredit, Integer orderNum, Integer accessNum, String deliverRange) {
        this.enterId = enterId;
        this.storeName = storeName;
        this.storeLevel = storeLevel;
        this.storeAddr = storeAddr;
        this.contPerson = contPerson;
        this.contTel = contTel;
        this.contQq = contQq;
        this.storeLogo = storeLogo;
        this.service = service;
        this.busiStartHour = busiStartHour;
        this.busiEndHour = busiEndHour;
        this.deliverPrice = deliverPrice;
        this.shippingFee = shippingFee;
        this.respTime = respTime;
        this.storeState = storeState;
        this.regDate = regDate;
        this.storeType = storeType;
        this.storeRankAccu = storeRankAccu;
        this.storeRank = storeRank;
        this.storeCredit = storeCredit;
        this.orderNum = orderNum;
        this.accessNum = accessNum;
        this.deliverRange = deliverRange;
    }

   
    // Property accessors

    public Integer getStoreId() {
        return this.storeId;
    }
    
    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public Integer getEnterId() {
        return this.enterId;
    }
    
    public void setEnterId(Integer enterId) {
        this.enterId = enterId;
    }

    public String getStoreName() {
        return this.storeName;
    }
    
    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public Integer getStoreLevel() {
        return this.storeLevel;
    }
    
    public void setStoreLevel(Integer storeLevel) {
        this.storeLevel = storeLevel;
    }

    public String getStoreAddr() {
        return this.storeAddr;
    }
    
    public void setStoreAddr(String storeAddr) {
        this.storeAddr = storeAddr;
    }

    public String getContPerson() {
        return this.contPerson;
    }
    
    public void setContPerson(String contPerson) {
        this.contPerson = contPerson;
    }

    public String getContTel() {
        return this.contTel;
    }
    
    public void setContTel(String contTel) {
        this.contTel = contTel;
    }

    public String getContQq() {
        return this.contQq;
    }
    
    public void setContQq(String contQq) {
        this.contQq = contQq;
    }

    public String getStoreLogo() {
        return this.storeLogo;
    }
    
    public void setStoreLogo(String storeLogo) {
        this.storeLogo = storeLogo;
    }

    public String getService() {
        return this.service;
    }
    
    public void setService(String service) {
        this.service = service;
    }

    public Time getBusiStartHour() {
        return this.busiStartHour;
    }
    
    public void setBusiStartHour(Time busiStartHour) {
        this.busiStartHour = busiStartHour;
    }

    public Time getBusiEndHour() {
        return this.busiEndHour;
    }
    
    public void setBusiEndHour(Time busiEndHour) {
        this.busiEndHour = busiEndHour;
    }

    public Double getDeliverPrice() {
        return this.deliverPrice;
    }
    
    public void setDeliverPrice(Double deliverPrice) {
        this.deliverPrice = deliverPrice;
    }

    public Double getShippingFee() {
        return this.shippingFee;
    }
    
    public void setShippingFee(Double shippingFee) {
        this.shippingFee = shippingFee;
    }

    public Integer getRespTime() {
        return this.respTime;
    }
    
    public void setRespTime(Integer respTime) {
        this.respTime = respTime;
    }

    public Integer getStoreState() {
        return this.storeState;
    }
    
    public void setStoreState(Integer storeState) {
        this.storeState = storeState;
    }

    public Timestamp getRegDate() {
        return this.regDate;
    }
    
    public void setRegDate(Timestamp regDate) {
        this.regDate = regDate;
    }

    public Integer getStoreType() {
        return this.storeType;
    }
    
    public void setStoreType(Integer storeType) {
        this.storeType = storeType;
    }

    public Integer getStoreRankAccu() {
        return this.storeRankAccu;
    }
    
    public void setStoreRankAccu(Integer storeRankAccu) {
        this.storeRankAccu = storeRankAccu;
    }

    public String getStoreRank() {
        return this.storeRank;
    }
    
    public void setStoreRank(String storeRank) {
        this.storeRank = storeRank;
    }

    public String getStoreCredit() {
        return this.storeCredit;
    }
    
    public void setStoreCredit(String storeCredit) {
        this.storeCredit = storeCredit;
    }

    public Integer getOrderNum() {
        return this.orderNum;
    }
    
    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Integer getAccessNum() {
        return this.accessNum;
    }
    
    public void setAccessNum(Integer accessNum) {
        this.accessNum = accessNum;
    }

    public String getDeliverRange() {
        return this.deliverRange;
    }
    
    public void setDeliverRange(String deliverRange) {
        this.deliverRange = deliverRange;
    }
   








}