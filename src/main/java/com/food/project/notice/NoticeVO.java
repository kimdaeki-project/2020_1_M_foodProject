package com.food.project.notice;

import java.sql.Date;

import com.food.project.board.BoardVO;

public class NoticeVO extends BoardVO {

	private Date modDate;
	private String title;
	private int views;
	
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
}
