package com.smj.orm;



/**
 * UserAddress entity. @author MyEclipse Persistence Tools
 */

public class UserAddress  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Integer custId;
     private String userAdd;
     private String isDefault;


    // Constructors

    /** default constructor */
    public UserAddress() {
    }

    
    /** full constructor */
    public UserAddress(Integer custId, String userAdd, String isDefault) {
        this.custId = custId;
        this.userAdd = userAdd;
        this.isDefault = isDefault;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCustId() {
        return this.custId;
    }
    
    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getUserAdd() {
        return this.userAdd;
    }
    
    public void setUserAdd(String userAdd) {
        this.userAdd = userAdd;
    }

    public String getIsDefault() {
        return this.isDefault;
    }
    
    public void setIsDefault(String isDefault) {
        this.isDefault = isDefault;
    }
   








}