package com.food.project.board;

import java.sql.Date;

public class BoardVO {
	private long boardNum;
	private long memberNum;
	private long imageNum;
	private String contents;
	private Date regDate;
	
	public long getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(long boardNum) {
		this.boardNum = boardNum;
	}
	public long getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(long memberNum) {
		this.memberNum = memberNum;
	}
	public long getImageNum() {
		return imageNum;
	}
	public void setImageNum(long imageNum) {
		this.imageNum = imageNum;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}
