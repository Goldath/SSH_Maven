package com.gx.po;
// Generated 2017-11-3 14:43:34 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * WebArticle generated by hbm2java
 */
public class WebArticle implements java.io.Serializable {

	private Integer WId;
	private String WTitle;
	private String WAuthor;
	private String WImages;
	private String WContent;
	private String WDescription;
	private Date WTime;
	private Date editTime;
	private Integer hit;

	//表示所属分类
	private BasicAttributes attributes;
		
	public BasicAttributes getAttributes() {
		return attributes;
	}

	public void setAttributes(BasicAttributes attributes) {
		this.attributes = attributes;
	}

	public WebArticle() {
	}

	public WebArticle(String WTitle, String WAuthor, String WImages, String WContent,
			String WDescription, Date WTime, Date editTime, Integer hit) {
		this.WTitle = WTitle;
		this.WAuthor = WAuthor;
		this.WImages = WImages;
		this.WContent = WContent;
		this.WDescription = WDescription;
		this.WTime = WTime;
		this.editTime = editTime;
		this.hit = hit;
	}

	public Integer getWId() {
		return this.WId;
	}

	public void setWId(Integer WId) {
		this.WId = WId;
	}

	public String getWTitle() {
		return this.WTitle;
	}

	public void setWTitle(String WTitle) {
		this.WTitle = WTitle;
	}


	public String getWAuthor() {
		return this.WAuthor;
	}

	public void setWAuthor(String WAuthor) {
		this.WAuthor = WAuthor;
	}

	public String getWImages() {
		return this.WImages;
	}

	public void setWImages(String WImages) {
		this.WImages = WImages;
	}

	public String getWContent() {
		return this.WContent;
	}

	public void setWContent(String WContent) {
		this.WContent = WContent;
	}

	public String getWDescription() {
		return this.WDescription;
	}

	public void setWDescription(String WDescription) {
		this.WDescription = WDescription;
	}

	public Date getWTime() {
		return this.WTime;
	}

	public void setWTime(Date WTime) {
		this.WTime = WTime;
	}

	public Date getEditTime() {
		return this.editTime;
	}

	public void setEditTime(Date editTime) {
		this.editTime = editTime;
	}

	public Integer getHit() {
		return this.hit;
	}

	public void setHit(Integer hit) {
		this.hit = hit;
	}

}
