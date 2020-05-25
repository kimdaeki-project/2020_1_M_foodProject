package com.food.project.menu;

import java.sql.Date;
import java.util.List;

import com.food.project.category.CategoryVO;

public class MenuVO {
	
	private long num;
    private long marketNum;
    private String name;
    private int price;
    private String detail;
    private String thumbImg;
    private Date deleteAt;
    
    
    private List<CategoryVO> categoryVOs;
    
    public List<CategoryVO> getCategoryVOs() {
		return categoryVOs;
	}
	public void setCategoryVOs(List<CategoryVO> categoryVOs) {
		this.categoryVOs = categoryVOs;
	}
    
    
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public long getMarketNum() {
		return marketNum;
	}
	public void setMarketNum(long marketNum) {
		this.marketNum = marketNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getThumbImg() {
		return thumbImg;
	}
	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}
	public Date getDeleteAt() {
		return deleteAt;
	}
	public void setDeleteAt(Date deleteAt) {
		this.deleteAt = deleteAt;
	}
}
