package com.food.project.review;

import com.food.project.board.BoardVO;
import com.food.project.member.MemberVO;
import com.food.project.ordered.OrderedVO;

public class ReviewVO extends BoardVO{

	private int rating;
	private long marketNum;
	private long ref;
	private long step;
	private long depth;
	private long orderNum;
	private long isReply;
	
	

	private MemberVO memberVO;
	private OrderedVO orderedVO;
 	
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public OrderedVO getOrderedVO() {
		return orderedVO;
	}
	public void setOrderedVO(OrderedVO orderedVO) {
		this.orderedVO = orderedVO;
	}
	
	
	
	
	
	public long getIsReply() {
		return isReply;
	}
	public void setIsReply(long isReply) {
		this.isReply = isReply;
	}
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
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
