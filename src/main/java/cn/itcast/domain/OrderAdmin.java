
package cn.itcast.domain;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author zj 订单
 */
public class OrderAdmin {

	// 1:订单
	private String orderNumber; // 订单编号1
	private String userName; // 用户名1
	private String orderTime; // 下单时间1
	private BigDecimal coupon; // 优惠金额
	private BigDecimal actualamount; // 实际金额1
	private BigDecimal totalmoney; // 总金额
	private int totalquantity; // 总数量
	private String paystatus; // 支付状态1
	private List<OrdersAdmin> orders;// 订单商品
	private String show; // 删除
	// 配送方式
	private String address;// 配送地址

	public List<OrdersAdmin> getOrders() {
		return orders;
	}

	public void setOrders(List<OrdersAdmin> orders) {
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

	public BigDecimal getActualamount() {
		return actualamount;
	}

	public void setActualamount(BigDecimal actualamount) {
		this.actualamount = actualamount;
	}

	public BigDecimal getTotalmoney() {
		return totalmoney;
	}

	public void setTotalmoney(BigDecimal totalmoney) {
		this.totalmoney = totalmoney;
	}

	public int getTotalquantity() {
		return totalquantity;
	}

	public void setTotalquantity(int totalquantity) {
		this.totalquantity = totalquantity;
	}

	public String getPaystatus() {
		return paystatus;
	}

	public void setPaystatus(String paystatus) {
		this.paystatus = paystatus;
	}

	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public OrderAdmin() {
		super();
	}

	public OrderAdmin(String orderNumber, String userName, String orderTime, BigDecimal coupon, BigDecimal actualamount,
			BigDecimal totalmoney, int totalquantity, String paystatus, List<OrdersAdmin> orders, String show,
			String address) {
		super();
		this.orderNumber = orderNumber;
		this.userName = userName;
		this.orderTime = orderTime;
		this.coupon = coupon;
		this.actualamount = actualamount;
		this.totalmoney = totalmoney;
		this.totalquantity = totalquantity;
		this.paystatus = paystatus;
		this.orders = orders;
		this.show = show;
		this.address = address;
	}

	@Override
	public String toString() {
		return "OrderAdmin [orderNumber=" + orderNumber + ", userName=" + userName + ", orderTime=" + orderTime
				+ ", coupon=" + coupon + ", actualamount=" + actualamount + ", totalmoney=" + totalmoney
				+ ", totalquantity=" + totalquantity + ", paystatus=" + paystatus + ", orders=" + orders + ", show="
				+ show + ", address=" + address + "]";
	}


}
