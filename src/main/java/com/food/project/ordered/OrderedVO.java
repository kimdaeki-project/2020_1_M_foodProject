package com.food.project.ordered;

import java.sql.Date;

public class OrderedVO {
	
	private long num;
	private long memberNum;
	private long marketNum;
	private long menuNum;
	private String marketName;
	private String menuName;
	private String menuThumbImg;
	private String cateMenuOptions;
	private int pcs;
	private int	amount;
    private String imp_uid;
    private String merchant_uid; 
    private String pg;
    private String pay_method;
    private String apply_num;
    private int cancleType;
    private String cancleDetail;
    private int isOrderChecked;
    private int isReview;
    private int timeLag;   
    private Date createAt;
    private Date deleteAt;
    
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
	public String getMarketName() {
		return marketName;
	}
	public void setMarketName(String marketName) {
		this.marketName = marketName;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuThumbImg() {
		return menuThumbImg;
	}
	public void setMenuThumbImg(String menuThumbImg) {
		this.menuThumbImg = menuThumbImg;
	}
	public String getCateMenuOptions() {
		return cateMenuOptions;
	}
	public void setCateMenuOptions(String cateMenuOptions) {
		this.cateMenuOptions = cateMenuOptions;
	}
	public int getPcs() {
		return pcs;
	}
	public void setPcs(int pcs) {
		this.pcs = pcs;
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
	public String getApply_num() {
		return apply_num;
	}
	public void setApply_num(String apply_num) {
		this.apply_num = apply_num;
	}
	public int getCancleType() {
		return cancleType;
	}
	public void setCancleType(int cancleType) {
		this.cancleType = cancleType;
	}
	public String getCancleDetail() {
		return cancleDetail;
	}
	public void setCancleDetail(String cancleDetail) {
		this.cancleDetail = cancleDetail;
	}
	public int getIsOrderChecked() {
		return isOrderChecked;
	}
	public void setIsOrderChecked(int isOrderChecked) {
		this.isOrderChecked = isOrderChecked;
	}
	public int getIsReview() {
		return isReview;
	}
	public void setIsReview(int isReview) {
		this.isReview = isReview;
	}
	public int getTimeLag() {
		return timeLag;
	}
	public void setTimeLag(int timeLag) {
		this.timeLag = timeLag;
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

	public String toString() {
	
		System.out.println("=======================================");
		System.out.println(this.getNum());
		System.out.println(this.getMemberNum());
		System.out.println(this.getMarketNum());
		System.out.println(this.getMenuNum());
		System.out.println(this.getMarketName());
		System.out.println(this.getMenuName());
		System.out.println(this.getMenuThumbImg());
		System.out.println(this.getCateMenuOptions());
		System.out.println(this.getPcs());
		System.out.println(this.getAmount());
		System.out.println(this.getCancleType());
		System.out.println(this.getCancleDetail());
		System.out.println(this.getIsOrderChecked());
		System.out.println(this.getIsReview());
		System.out.println(this.getTimeLag());
		
		return null;
	}
}
