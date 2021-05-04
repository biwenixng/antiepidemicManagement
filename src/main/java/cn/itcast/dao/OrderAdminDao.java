package cn.itcast.dao;


import cn.itcast.domain.OrderAdmin;
import cn.itcast.domain.OrdersAdmin;
import cn.itcast.domain.Page;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public abstract interface OrderAdminDao {
	
	/**
	 * @param time 时间
	 * 订单编号\用户名\下单时间\总金额\优惠金额\实际金额\支付状态
	 * @return
	 * 查订单
	 */
	List<OrderAdmin> selectOrder(String time, Page<OrderAdmin> page);
	List<OrderAdmin> selectOrder(Page<OrderAdmin> page);
//	/**
//	 * @param Ordernumber 订单编号
//	 * 订单商品\单价\数量
//	 * @return
//	 * 订单详情
//	 */
	List<OrdersAdmin> selectOrderBig(String ordernumber, Page<OrderAdmin> page);
	
//	/**
//	 * 删除订单
//	 * @param Ordernumber订单编号
//	 *
//	 */
	void updateOrder(String ordernumber,String show);
}
