package com.food.project.market;

import java.sql.Date;

public class MarketVO {
	private long num;
	private long userNum;
	private String crn;
	private String marketName;
	private String openTime;
	private String closeTime;
	private int isOpen;  //default : 1
	private int canOrder; //default : 1
	private String marketIntro;
	private String thumbImg;
	private Date createAt;
	private Date updateAt;
	private Date deleteAt;
	
	
	
	
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public Date getUpdateAt() {
		return updateAt;
	}
	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}
	public Date getDeleteAt() {
		return deleteAt;
	}
	public void setDeleteAt(Date deleteAt) {
		this.deleteAt = deleteAt;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public long getUserNum() {
		return userNum;
	}
	public void setUserNum(long userNum) {
		this.userNum = userNum;
	}
	public String getCrn() {
		return crn;
	}
	public void setCrn(String crn) {
		this.crn = crn;
	}
	public String getMarketName() {
		return marketName;
	}
	public void setMarketName(String marketName) {
		this.marketName = marketName;
	}
	
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}
	public int getIsOpen() {
		return isOpen;
	}
	public void setIsOpen(int isOpen) {
		this.isOpen = isOpen;
	}
	public int getCanOrder() {
		return canOrder;
	}
	public void setCanOrder(int canOrder) {
		this.canOrder = canOrder;
	}
	public String getMarketIntro() {
		return marketIntro;
	}
	public void setMarketIntro(String marketIntro) {
		this.marketIntro = marketIntro;
	}
	public String getThumbImg() {
		return thumbImg;
	}
	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}
	
	
	
}
