package com.food.project.map;

import java.sql.Date;

import com.food.project.market.MarketVO;

public class MapVO {

	private MarketVO marketVO;
	private double latitude;
	private double longitude;
	
	public MarketVO getMarketVO() {
		return marketVO;
	}
	public void setMarketVO(MarketVO marketVO) {
		this.marketVO = marketVO;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
	public String toString() {
		
		System.out.println("marketVO.num : "+marketVO.getNum());
		System.out.println("marketVO.userNum : "+marketVO.getUserNum());
		System.out.println("marketVO.categoryNum : "+marketVO.getCategoryNum());
		System.out.println("marketVO.crn : "+marketVO.getCrn());
		System.out.println("marketVO.marketName : "+marketVO.getMarketName());
		System.out.println("marketVO.address : "+marketVO.getAddress());
		System.out.println("marketVO.openTime : "+marketVO.getOpenTime());
		System.out.println("marketVO.closeTime : "+marketVO.getCloseTime());
		System.out.println("marketVO.isOpen : "+marketVO.getIsOpen());
		System.out.println("marketVO.canOrder : "+marketVO.getCanOrder());
		System.out.println("marketVO.marketIntro : "+marketVO.getMarketIntro());
		System.out.println("marketVO.thumbImg : "+marketVO.getThumbImg());
		System.out.println("marketVO.createAt : "+marketVO.getCreateAt());
		System.out.println("marketVO.updateAt : "+marketVO.getUpdateAt());
		System.out.println("marketVO.deleteAt : "+marketVO.getDeleteAt());
		System.out.println("latitude : "+this.getLatitude());
		System.out.println("longitude : "+this.getLongitude());
		
		return null;
	}
}
