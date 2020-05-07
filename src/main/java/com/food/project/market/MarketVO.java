package com.food.project.market;

import java.sql.Date;

public class MarketVO {
	private long num;
	private long userNum;
	private String crn;
	private String marketName;
	private Date openTime;
	private Date closeTime;
	private int isOpen;
	private int canOrder;
	private String marketIntro;
	private String thumbImg;
	
	
	
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
	public Date getOpenTime() {
		return openTime;
	}
	public void setOpenTime(Date openTime) {
		this.openTime = openTime;
	}
	public Date getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(Date closeTime) {
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
