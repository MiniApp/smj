package com.smj.orm;



public class CommInfo implements java.io.Serializable {

	// Fields

	private CommInfoId id;
	private String commdName;
	private String commdLogo;
	private String img1;
	private String img2;
	private String img3;
	private String oneDimension;
	private String twoDimension;
	private Integer UId;
	private String commdWeight;
	private String commdLicense;
	private String commdCreaDate;
	private String commdProducePlace;
	private String commdSize;
	private String commdDescription;
	private Double agoraPrice;
	private Double userPrice;
	private Double salePrice;
	private Double promPrice;
	private String taste;
	private String equip;
	private Integer integral;
	private Integer mixNum;
	private Integer haveNum;
	private String qualified;
	private Integer uses;
	private Integer number;
	private Integer memo;
	private String remark1;
	private String remark2;
	private String remark3;
	private String remark4;
	private String remark5;

	// Constructors

	/** default constructor */
	public CommInfo() {
	}

	/** minimal constructor */
	public CommInfo(CommInfoId id) {
		this.id = id;
	}

	/** full constructor */
	public CommInfo(CommInfoId id, String commdName, String commdLogo,
			String img1, String img2, String img3, String oneDimension,
			String twoDimension, Integer UId, String commdWeight,
			String commdLicense, String commdCreaDate,
			String commdProducePlace, String commdSize,
			String commdDescription, Double agoraPrice, Double userPrice,
			Double salePrice, Double promPrice, String taste, String equip,
			Integer integral, Integer mixNum, Integer haveNum,
			String qualified, Integer uses, Integer number, Integer memo,
			String remark1, String remark2, String remark3, String remark4,
			String remark5) {
		this.id = id;
		this.commdName = commdName;
		this.commdLogo = commdLogo;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.oneDimension = oneDimension;
		this.twoDimension = twoDimension;
		this.UId = UId;
		this.commdWeight = commdWeight;
		this.commdLicense = commdLicense;
		this.commdCreaDate = commdCreaDate;
		this.commdProducePlace = commdProducePlace;
		this.commdSize = commdSize;
		this.commdDescription = commdDescription;
		this.agoraPrice = agoraPrice;
		this.userPrice = userPrice;
		this.salePrice = salePrice;
		this.promPrice = promPrice;
		this.taste = taste;
		this.equip = equip;
		this.integral = integral;
		this.mixNum = mixNum;
		this.haveNum = haveNum;
		this.qualified = qualified;
		this.uses = uses;
		this.number = number;
		this.memo = memo;
		this.remark1 = remark1;
		this.remark2 = remark2;
		this.remark3 = remark3;
		this.remark4 = remark4;
		this.remark5 = remark5;
	}

	// Property accessors

	public CommInfoId getId() {
		return this.id;
	}

	public void setId(CommInfoId id) {
		this.id = id;
	}

	public String getCommdName() {
		return this.commdName;
	}

	public void setCommdName(String commdName) {
		this.commdName = commdName;
	}

	public String getCommdLogo() {
		return this.commdLogo;
	}

	public void setCommdLogo(String commdLogo) {
		this.commdLogo = commdLogo;
	}

	public String getImg1() {
		return this.img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return this.img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return this.img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getOneDimension() {
		return this.oneDimension;
	}

	public void setOneDimension(String oneDimension) {
		this.oneDimension = oneDimension;
	}

	public String getTwoDimension() {
		return this.twoDimension;
	}

	public void setTwoDimension(String twoDimension) {
		this.twoDimension = twoDimension;
	}

	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

	public String getCommdWeight() {
		return this.commdWeight;
	}

	public void setCommdWeight(String commdWeight) {
		this.commdWeight = commdWeight;
	}

	public String getCommdLicense() {
		return this.commdLicense;
	}

	public void setCommdLicense(String commdLicense) {
		this.commdLicense = commdLicense;
	}

	public String getCommdCreaDate() {
		return this.commdCreaDate;
	}

	public void setCommdCreaDate(String commdCreaDate) {
		this.commdCreaDate = commdCreaDate;
	}

	public String getCommdProducePlace() {
		return this.commdProducePlace;
	}

	public void setCommdProducePlace(String commdProducePlace) {
		this.commdProducePlace = commdProducePlace;
	}

	public String getCommdSize() {
		return this.commdSize;
	}

	public void setCommdSize(String commdSize) {
		this.commdSize = commdSize;
	}

	public String getCommdDescription() {
		return this.commdDescription;
	}

	public void setCommdDescription(String commdDescription) {
		this.commdDescription = commdDescription;
	}

	public Double getAgoraPrice() {
		return this.agoraPrice;
	}

	public void setAgoraPrice(Double agoraPrice) {
		this.agoraPrice = agoraPrice;
	}

	public Double getUserPrice() {
		return this.userPrice;
	}

	public void setUserPrice(Double userPrice) {
		this.userPrice = userPrice;
	}

	public Double getSalePrice() {
		return this.salePrice;
	}

	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}

	public Double getPromPrice() {
		return this.promPrice;
	}

	public void setPromPrice(Double promPrice) {
		this.promPrice = promPrice;
	}

	public String getTaste() {
		return this.taste;
	}

	public void setTaste(String taste) {
		this.taste = taste;
	}

	public String getEquip() {
		return this.equip;
	}

	public void setEquip(String equip) {
		this.equip = equip;
	}

	public Integer getIntegral() {
		return this.integral;
	}

	public void setIntegral(Integer integral) {
		this.integral = integral;
	}

	public Integer getMixNum() {
		return this.mixNum;
	}

	public void setMixNum(Integer mixNum) {
		this.mixNum = mixNum;
	}

	public Integer getHaveNum() {
		return this.haveNum;
	}

	public void setHaveNum(Integer haveNum) {
		this.haveNum = haveNum;
	}

	public String getQualified() {
		return this.qualified;
	}

	public void setQualified(String qualified) {
		this.qualified = qualified;
	}

	public Integer getUses() {
		return this.uses;
	}

	public void setUses(Integer uses) {
		this.uses = uses;
	}

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getMemo() {
		return this.memo;
	}

	public void setMemo(Integer memo) {
		this.memo = memo;
	}

	public String getRemark1() {
		return this.remark1;
	}

	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}

	public String getRemark2() {
		return this.remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

	public String getRemark3() {
		return this.remark3;
	}

	public void setRemark3(String remark3) {
		this.remark3 = remark3;
	}

	public String getRemark4() {
		return this.remark4;
	}

	public void setRemark4(String remark4) {
		this.remark4 = remark4;
	}

	public String getRemark5() {
		return this.remark5;
	}

	public void setRemark5(String remark5) {
		this.remark5 = remark5;
	}

}