package com.food.project.map;

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
}
