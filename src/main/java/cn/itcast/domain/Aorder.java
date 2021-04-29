package cn.itcast.domain;

import java.math.BigDecimal;
import java.util.List;

public class Aorder {
	private String orderNumber;
	private String userName;
	private String orderTime;
	private BigDecimal coupon;
	private BigDecimal actualAmount;
	private BigDecimal totalMoney;
	private int totalQuantity;
	private String paystatus;
	private String distribution;
	private String address;
	private String phone;
	private List<ShopOrders> orders;

	public Aorder() {
		super();
	}

	public Aorder(String orderNumber, String userName, String orderTime, BigDecimal coupon, BigDecimal actualAmount,
			BigDecimal totalMoney, int totalQuantity, String paystatus, String distribution, String address,
			String phone, List<ShopOrders> orders) {
		super();
		this.orderNumber = orderNumber;
		this.userName = userName;
		this.orderTime = orderTime;
		this.coupon = coupon;
		this.actualAmount = actualAmount;
		this.totalMoney = totalMoney;
		this.totalQuantity = totalQuantity;
		this.paystatus = paystatus;
		this.distribution = distribution;
		this.address = address;
		this.phone = phone;
		this.orders = orders;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public BigDecimal getCoupon() {
		return coupon;
	}

	public void setCoupon(BigDecimal coupon) {
		this.coupon = coupon;
	}

	public BigDecimal getActualAmount() {
		return actualAmount;
	}

	public void setActualAmount(BigDecimal actualAmount) {
		this.actualAmount = actualAmount;
	}

	public BigDecimal getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(BigDecimal totalMoney) {
		this.totalMoney = totalMoney;
	}

	public int getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public String getPaystatus() {
		return paystatus;
	}

	public void setPaystatus(String paystatus) {
		this.paystatus = paystatus;
	}

	public String getDistribution() {
		return distribution;
	}

	public void setDistribution(String distribution) {
		this.distribution = distribution;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public List<ShopOrders> getOrders() {
		return orders;
	}

	public void setOrders(List<ShopOrders> orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "Aorder [orderNumber=" + orderNumber + ", userName=" + userName + ", orderTime=" + orderTime
				+ ", coupon=" + coupon + ", actualAmount=" + actualAmount + ", totalMoney=" + totalMoney
				+ ", totalQuantity=" + totalQuantity + ", paystatus=" + paystatus + ", distribution=" + distribution
				+ ", address=" + address + ", phone=" + phone + ", orders=" + orders + "]";
	}

}
