package com.smj.orm;



/**
 * Cateory entity. @author MyEclipse Persistence Tools
 */

public class Cateory  implements java.io.Serializable {


    // Fields    

     private Integer cateId;
     private Integer name;
     private Integer parentId;
     private Integer catgrade;
     private Integer deleted;


    // Constructors

    /** default constructor */
    public Cateory() {
    }

    
    /** full constructor */
    public Cateory(Integer name, Integer parentId, Integer catgrade, Integer deleted) {
        this.name = name;
        this.parentId = parentId;
        this.catgrade = catgrade;
        this.deleted = deleted;
    }

   
    // Property accessors

    public Integer getCateId() {
        return this.cateId;
    }
    
    public void setCateId(Integer cateId) {
        this.cateId = cateId;
    }

    public Integer getName() {
        return this.name;
    }
    
    public void setName(Integer name) {
        this.name = name;
    }

    public Integer getParentId() {
        return this.parentId;
    }
    
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getCatgrade() {
        return this.catgrade;
    }
    
    public void setCatgrade(Integer catgrade) {
        this.catgrade = catgrade;
    }

    public Integer getDeleted() {
        return this.deleted;
    }
    
    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }
   








}