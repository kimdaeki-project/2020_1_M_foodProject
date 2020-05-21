package com.food.project.ordered;

import java.sql.Date;

public class OrderedVO {
	
	private long num;
	private long memberNum;
	private long marketNum;
	private long menuNum;
	private String cateMenuOptions;
	private int	amount;
    private String imp_uid;
    private String merchant_uid; 
    private String pg;
    private String pay_method;
    private Date createAt;
    private Date deleteAt;
    private String cancleReason;
    
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
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
	public long getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(long menuNum) {
		this.menuNum = menuNum;
	}
	public String getCateMenuOptions() {
		return cateMenuOptions;
	}
	public void setCateMenuOptions(String cateMenuOptions) {
		this.cateMenuOptions = cateMenuOptions;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getPg() {
		return pg;
	}
	public void setPg(String pg) {
		this.pg = pg;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public Date getDeleteAt() {
		return deleteAt;
	}
	public void setDeleteAt(Date deleteAt) {
		this.deleteAt = deleteAt;
	}
	public String getCancleReason() {
		return cancleReason;
	}
	public void setCancleReason(String cancleReason) {
		this.cancleReason = cancleReason;
	}
}
