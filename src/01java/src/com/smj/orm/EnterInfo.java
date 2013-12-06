package com.smj.orm;

import java.sql.Timestamp;
import java.util.Date;

/**
 * EnterInfo entity. @author MyEclipse Persistence Tools
 */

public class EnterInfo implements java.io.Serializable {

	// Fields

	private Integer enterId;
	private String enterName;
	private String legalReprId;
	private String legalReprName;
	private String certType;
	private String certId;
	private Date regDate;
	private String enterAddr;
	private String respbPerson;
	private String telNo;
	private Integer enterState;
	private String enterBussLicen;
	private String enterBussLicenImg;

	// Constructors

	/** default constructor */
	public EnterInfo() {
	}

	/** full constructor */
	public EnterInfo(String enterName, String legalReprId,
			String legalReprName, String certType, String certId,
			Timestamp regDate, String enterAddr, String respbPerson,
			String telNo, Integer enterState, String enterBussLicen,
			String enterBussLicenImg) {
		this.enterName = enterName;
		this.legalReprId = legalReprId;
		this.legalReprName = legalReprName;
		this.certType = certType;
		this.certId = certId;
		this.regDate = regDate;
		this.enterAddr = enterAddr;
		this.respbPerson = respbPerson;
		this.telNo = telNo;
		this.enterState = enterState;
		this.enterBussLicen = enterBussLicen;
		this.enterBussLicenImg = enterBussLicenImg;
	}

	// Property accessors

	public Integer getEnterId() {
		return this.enterId;
	}

	public void setEnterId(Integer enterId) {
		this.enterId = enterId;
	}

	public String getEnterName() {
		return this.enterName;
	}

	public void setEnterName(String enterName) {
		this.enterName = enterName;
	}

	public String getLegalReprId() {
		return this.legalReprId;
	}

	public void setLegalReprId(String legalReprId) {
		this.legalReprId = legalReprId;
	}

	public String getLegalReprName() {
		return this.legalReprName;
	}

	public void setLegalReprName(String legalReprName) {
		this.legalReprName = legalReprName;
	}

	public String getCertType() {
		return this.certType;
	}

	public void setCertType(String certType) {
		this.certType = certType;
	}

	public String getCertId() {
		return this.certId;
	}

	public void setCertId(String certId) {
		this.certId = certId;
	}

	public Date getRegDate() {
		return this.regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getEnterAddr() {
		return this.enterAddr;
	}

	public void setEnterAddr(String enterAddr) {
		this.enterAddr = enterAddr;
	}

	public String getRespbPerson() {
		return this.respbPerson;
	}

	public void setRespbPerson(String respbPerson) {
		this.respbPerson = respbPerson;
	}

	public String getTelNo() {
		return this.telNo;
	}

	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}

	public Integer getEnterState() {
		return this.enterState;
	}

	public void setEnterState(Integer enterState) {
		this.enterState = enterState;
	}

	public String getEnterBussLicen() {
		return this.enterBussLicen;
	}

	public void setEnterBussLicen(String enterBussLicen) {
		this.enterBussLicen = enterBussLicen;
	}

	public String getEnterBussLicenImg() {
		return this.enterBussLicenImg;
	}

	public void setEnterBussLicenImg(String enterBussLicenImg) {
		this.enterBussLicenImg = enterBussLicenImg;
	}

}