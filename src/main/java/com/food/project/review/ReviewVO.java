package com.food.project.review;

import com.food.project.board.BoardVO;

public class ReviewVO extends BoardVO{

	private int rating;
	private long marketNum;
	private long ref;
	private long step;
	private long depth;
	
	

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public long getMarketNum() {
		return marketNum;
	}

	public void setMarketNum(long marketNum) {
		this.marketNum = marketNum;
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
