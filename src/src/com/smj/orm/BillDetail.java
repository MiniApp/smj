package com.smj.orm;

import java.util.Date;


/**
 * BillDetail entity. @author MyEclipse Persistence Tools
 */

public class BillDetail  implements java.io.Serializable {


    // Fields    

     private BillDetailId id;
     private Date billDate;
     private Integer commdId;
     private Integer commdNum;


    // Constructors

    /** default constructor */
    public BillDetail() {
    }

	/** minimal constructor */
    public BillDetail(BillDetailId id) {
        this.id = id;
    }
    
    /** full constructor */
    public BillDetail(BillDetailId id, Date billDate, Integer commdId, Integer commdNum) {
        this.id = id;
        this.billDate = billDate;
        this.commdId = commdId;
        this.commdNum = commdNum;
    }

   
    // Property accessors

    public BillDetailId getId() {
        return this.id;
    }
    
    public void setId(BillDetailId id) {
        this.id = id;
    }

    public Date getBillDate() {
        return this.billDate;
    }
    
    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }

    public Integer getCommdId() {
        return this.commdId;
    }
    
    public void setCommdId(Integer commdId) {
        this.commdId = commdId;
    }

    public Integer getCommdNum() {
        return this.commdNum;
    }
    
    public void setCommdNum(Integer commdNum) {
        this.commdNum = commdNum;
    }
   








}