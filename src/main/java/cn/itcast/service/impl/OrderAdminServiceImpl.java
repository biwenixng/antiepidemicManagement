package cn.itcast.service.impl;

import cn.itcast.dao.OrderAdminDao;
import cn.itcast.domain.OrderAdmin;
import cn.itcast.domain.OrdersAdmin;
import cn.itcast.domain.Page;
import cn.itcast.service.OrderAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderAdminServiceImpl implements OrderAdminService {
	@Autowired
	private OrderAdminDao ord;
	@Override
	public List<OrderAdmin> selectOrder(String time, Page<OrderAdmin> page) {
		return ord.selectOrder(time,page);
	}

	@Override
	public List<OrdersAdmin> selectOrderBig(String ordernumber, Page<OrderAdmin> page) {
		return ord.selectOrderBig(ordernumber,page);
	}

	@Override
	public void updateOrder(String ordernumber, String show) {
		ord.updateOrder(ordernumber, show);

	}

	@Override
	public List<OrderAdmin> selectOrder(Page<OrderAdmin> page) {
		return ord.selectOrder(page);
	}

}
