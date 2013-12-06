package com.smj.orm;

import java.util.Date;

/**
 * Affiche entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Affiche implements java.io.Serializable {

	// Fields

	private Integer affiId;
	private String title;
	private String bclass;
	private Date date;
	private Integer enterId;
	private String content;

	// Constructors

	/** default constructor */
	public Affiche() {
	}

	/** full constructor */
	public Affiche(String title, String bclass, Date date, Integer enterId,
			String content) {
		this.title = title;
		this.bclass = bclass;
		this.date = date;
		this.enterId = enterId;
		this.content = content;
	}

	// Property accessors

	public Integer getAffiId() {
		return this.affiId;
	}

	public void setAffiId(Integer affiId) {
		this.affiId = affiId;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBclass() {
		return this.bclass;
	}

	public void setBclass(String bclass) {
		this.bclass = bclass;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getEnterId() {
		return this.enterId;
	}

	public void setEnterId(Integer enterId) {
		this.enterId = enterId;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}