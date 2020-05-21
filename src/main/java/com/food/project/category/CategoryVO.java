package com.food.project.category;

import java.util.List;

import com.food.project.menuOption.MenuOptionVO;

public class CategoryVO {

	private long num;
	private long menuNum;
	private String name;
	
	private List<MenuOptionVO> menuOptionVOs;
	
	public List<MenuOptionVO> getMenuOptionVOs() {
		return menuOptionVOs;
	}
	public void setMenuOptionVOs(List<MenuOptionVO> menuOptionVOs) {
		this.menuOptionVOs = menuOptionVOs;
	}

	
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public long getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(long menuNum) {
		this.menuNum = menuNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
