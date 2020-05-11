package com.food.project.fileInfo;

public class FileInfoVO {
	private long num;
	private String fileName;
	private String oriName;
	private int kind;
	private long refNum;
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public long getRefNum() {
		return refNum;
	}
	public void setRefNum(long refNum) {
		this.refNum = refNum;
	}
}
