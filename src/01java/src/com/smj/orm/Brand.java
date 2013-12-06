package com.smj.orm;

public class Brand implements java.io.Serializable {
        
	// Fields
	
	private Integer brandId;
	private Integer recommend;
	private String cateId;
	private String brandName;

	// Constructors

	/** default constructor */
	public Brand() {
	}
	
	public Brand(Integer brandId,Integer recommend,String cateId,String brandName){
		this.brandId = brandId;
		this.recommend = recommend;
		this.cateId = cateId;
		this.brandName = brandName;
	}
	
    public Integer getBrandId(){
    	return brandId;
    }
    
    public void setBrandId(Integer brandId){
    	this.brandId = brandId;
    }
    
    public Integer getRecommend(){
    	return recommend;
    }
    
    public void setRecommend(Integer recommend){
    	this.recommend = recommend;
    }
    
    public String getCateId(){
    	return cateId;
    }
    
    public void setCateId(String cateId){
        this.cateId = cateId;	
    }
    
    public String getBrandName(){
    	return brandName;
    }
    
    public void setBrandName(String brandName){
    	this.brandName = brandName;
    }
}

