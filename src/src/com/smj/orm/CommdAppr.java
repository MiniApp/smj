package com.smj.orm;

import java.sql.Timestamp;


/**
 * CommdAppr entity. @author MyEclipse Persistence Tools
 */

public class CommdAppr  implements java.io.Serializable {


    // Fields    

     private Integer UId;
     private Integer commdId;
     private Integer storeId;
     private Integer integral;
     private String taste;
     private String content;
     private Timestamp date;


    // Constructors

    /** default constructor */
    public CommdAppr() {
    }

    
    /** full constructor */
    public CommdAppr(Integer commdId, Integer storeId, Integer integral, String taste, String content, Timestamp date) {
        this.commdId = commdId;
        this.storeId = storeId;
        this.integral = integral;
        this.taste = taste;
        this.content = content;
        this.date = date;
    }

   
    // Property accessors

    public Integer getUId() {
        return this.UId;
    }
    
    public void setUId(Integer UId) {
        this.UId = UId;
    }

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

    public Integer getIntegral() {
        return this.integral;
    }
    
    public void setIntegral(Integer integral) {
        this.integral = integral;
    }

    public String getTaste() {
        return this.taste;
    }
    
    public void setTaste(String taste) {
        this.taste = taste;
    }

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getDate() {
        return this.date;
    }
    
    public void setDate(Timestamp date) {
        this.date = date;
    }
   








}