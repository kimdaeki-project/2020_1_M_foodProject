package com.food.project.util;

public class Pager {

	private Long curPage;
	private Integer perPage = 10;
	private Long perBlock = 5L;
	private Long curBlock;
	
	private long startRow;
	private long lastRow;
	
	private Long totalPage;
	private Long totalBlock;
	
	private long startNum;
	private long lastNum;
	
	private String kind;
	private String search;
	private long marketNum;
	
	

	public long getMarketNum() {
		return marketNum;
	}

	public void setMarketNum(long marketNum) {
		this.marketNum = marketNum;
	}

	public void makeRow() {
		this.startRow = (this.getCurPage() - 1) * this.getPerPage() + 1;
		this.lastRow = this.getCurPage() * this.getPerPage();
		
		
//		System.out.println("maketRow");
//		System.out.println("startRow : " + this.startRow);
//		System.out.println("lastRow : "+this.lastRow);
	}
	
	public void setStartRow(long startRow) {
		this.startRow = startRow;
	}

	public void setLastRow(long lastRow) {
		this.lastRow = lastRow;
	}

	public void makePage(long totalCount) {
		
		// totalCount : 전체 글의 갯수
		
		// totalCount로 totalPage 계산
		totalPage = totalCount/this.perPage;
		if(totalCount%this.perPage != 0) {
			totalPage++;
		}
		
		// totalPage로 totalBlock 계산
		this.totalBlock = totalPage/perBlock;
		if(totalPage%perBlock != 0) {
			this.totalBlock++;
		}
		
		// 현재 블록 구하기
		this.curBlock = this.curPage/this.perBlock;
		if(this.curPage%this.perBlock != 0) {
			this.curBlock++;
		}
		
		this.startNum = this.perBlock*(this.curBlock-1) + 1;
		this.lastNum = this.perBlock*this.curBlock;
		
		if(curBlock == this.totalBlock) {
			this.lastNum = this.totalPage;
		}
	}
	
	public long getStartRow() {
		return startRow;
	}


	public long getLastRow() {
		return lastRow;
	}


	public Long getCurPage() {
		if(this.curPage == null || this.curPage == 0)
			this.curPage = 1L;
		return curPage;
	}
	public void setCurPage(Long curPage) {
		this.curPage = curPage;
	}
	public Integer getPerPage() {
		if(this.perPage == null || this.perPage == 0)
			this.setPerPage(10);
		return perPage;
	}
	public void setPerPage(Integer perPage) {
		this.perPage = perPage;
	}
	public Long getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Long totalPage) {
		this.totalPage = totalPage;
	}

	public Long getTotalBlock() {
		return totalBlock;
	}

	public Long getCurBlock() {
		return curBlock;
	}

	public long getStartNum() {
		return startNum;
	}

	public long getLastNum() {
		return lastNum;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		
		if(this.search == null)
			this.search = "";
		
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
}
