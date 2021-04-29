package cn.itcast.domain;

public class ShopOrders {
	private String orderNumber;
	private int cid;
	private String picture;
	private int number;
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public ShopOrders(String orderNumber, int cid, String picture, int number) {
		super();
		this.orderNumber = orderNumber;
		this.cid = cid;
		this.picture = picture;
		this.number = number;
	}
	public ShopOrders() {
		super();
	}
	@Override
	public String toString() {
		return "ShopOrders [orderNumber=" + orderNumber + ", cid=" + cid + ", picture=" + picture + ", number=" + number
				+ "]";
	}


}