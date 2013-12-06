package com.smj.orm;

public class CommdArchives implements java.io.Serializable {

	// Fields
	
	private Integer id;
	private Integer commdId;
	private String commdName;
	private String newDimension;
	private String oldDimension;
	private String smallImg;
	private String medImg;
	private String largeImg;
	// Constructors

	/** default constructor */
	public CommdArchives() {
	}
	
	public CommdArchives(Integer id,Integer commdId,String commdName,String newDimension,String oldDimension,
	     String smallImg,String medImg,String largeImg){
		
		this.id = id;
		this.commdId = commdId;
		this.commdName = commdName;
		this.newDimension = newDimension;
		this.oldDimension = oldDimension;
		this.smallImg = smallImg;
		this.medImg = medImg;
		this.largeImg = largeImg;
	}
	
	public Integer getId(){
		return id;
	}
	
	public void setId(Integer id){
		this.id = id;
	}
	
	public Integer getCommdId(){
		return commdId;
	}
	
	public void setCommdId(Integer commdId){
		this.commdId = commdId;
	}
	
	public String getCommdName(){
	     return commdName;	
	}
	public void setCommdName(String commdName){
		this.commdName = commdName;
	}
	
	public String getNewDimension(){
		return newDimension;
	}
	
	public void setNewDimension(String newDimension){
		this.newDimension = newDimension;
	}
	
	public String getOldDimension(){
		return oldDimension;
	}
	
	public void setOldDimension(String oldDimension){
		this.oldDimension = oldDimension;
	}
	
	public String getSmallImg(){
		return smallImg;
	}
	
	public void setSmallImg(String smallImg){
		this.smallImg = smallImg;
	}
	
	public String getMedImg(){
		return medImg;
	}
	
	public void setMedImg(String medImg){
		this.medImg = medImg;
	}
	
	public String getLargeImg(){
		return largeImg;
	}
	
	public void setLargeImg(String largeImg){
		this.largeImg = largeImg;
	}	
}
