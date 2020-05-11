package com.food.project.menuOption;

public class MenuOptionVO {
    
    private long num;
    private long categoryNum;
    private String name;
    private int price;
	
    public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(long categoryNum) {
		this.categoryNum = categoryNum;
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
}
