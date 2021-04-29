package cn.itcast.domain;


public class OrdersAdmin {
	private String orderNumber;		//订单编号
	private String commodityName;	//商品名称
	private int number;			//数量
	private String picture;			//图片路径
	private Commodity price;   		//商品单价
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getCommodityName() {
		return commodityName;
	}
	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Commodity getPrice() {
		return price;
	}
	public void setPrice(Commodity price) {
		this.price = price;
	}
	
	public OrdersAdmin(String orderNumber, String commodityName, int number, String picture, Commodity price) {
		super();
		this.orderNumber = orderNumber;
		this.commodityName = commodityName;
		this.number = number;
		this.picture = picture;
		this.price = price;
	}
	public OrdersAdmin() {
		super();
	}
	
	

}
