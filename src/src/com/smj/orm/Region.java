package com.smj.orm;



/**
 * Region entity. @author MyEclipse Persistence Tools
 */

public class Region  implements java.io.Serializable {


    // Fields    

     private Integer regionId;
     private String classId;
     private String parentId;
     private Integer childNum;
     private String name;
     private Integer deleted;


    // Constructors

    /** default constructor */
    public Region() {
    }

    
    /** full constructor */
    public Region(String classId, String parentId, Integer childNum, String name, Integer deleted) {
        this.classId = classId;
        this.parentId = parentId;
        this.childNum = childNum;
        this.name = name;
        this.deleted = deleted;
    }

   
    // Property accessors

    public Integer getRegionId() {
        return this.regionId;
    }
    
    public void setRegionId(Integer regionId) {
        this.regionId = regionId;
    }

    public String getClassId() {
        return this.classId;
    }
    
    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getParentId() {
        return this.parentId;
    }
    
    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public Integer getChildNum() {
        return this.childNum;
    }
    
    public void setChildNum(Integer childNum) {
        this.childNum = childNum;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public Integer getDeleted() {
        return this.deleted;
    }
    
    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }
   








}