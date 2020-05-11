package com.food.project.board;

import java.sql.Date;

public class BoardVO {
	private long boardNum;
	private long memberNum;
	private long marketNum;
	private long imageNum;
	private String contents;
	private Date regDate;
	private long ref;
	private long step;
	private long depth;
	
	
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
	public long getMarketNum() {
		return marketNum;
	}
	public void setMarketNum(long marketNum) {
		this.marketNum = marketNum;
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
	public long getRef() {
		return ref;
	}
	public void setRef(long ref) {
		this.ref = ref;
	}
	public long getStep() {
		return step;
	}
	public void setStep(long step) {
		this.step = step;
	}
	public long getDepth() {
		return depth;
	}
	public void setDepth(long depth) {
		this.depth = depth;
	}
	
	
	
}
