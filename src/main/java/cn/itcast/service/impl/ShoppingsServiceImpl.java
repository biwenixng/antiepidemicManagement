package cn.itcast.service.impl;

import cn.itcast.dao.ShoppingsDao;
import cn.itcast.domain.*;
import cn.itcast.service.ShoppingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoppingsServiceImpl implements ShoppingsService {
    @Autowired
	private ShoppingsDao dao;
	
	@Override
	public List<Shoponline> selectAll_online() {
		// TODO Auto-generated method stub
		return dao.selectAll_online();
	}
	@Override
	public Shoponline selectInfo(int cid) {
		// TODO Auto-generated method stub
		return dao.selectInfo(cid);
	}
	@Override
	public List<Shoptype> selectType(String specialname) {
		// TODO Auto-generated method stub
		return dao.selectType(specialname);
	}
	@Override
	public List<Shopuse> selectUse(String usename) {
		// TODO Auto-generated method stub
		return dao.selectUse(usename);
	}
	@Override
	public List<Shopclass> selectClass(String productname) {
		// TODO Auto-generated method stub
		return dao.selectClass(productname);
	}
	@Override
	public List<Shopselect> selectLike(String synopsis) {
		// TODO Auto-generated method stub
		return dao.selectLike(synopsis);
	}
	@Override
	public List<Shopsortpriceup> selectPriceup() {
		// TODO Auto-generated method stub
		return dao.selectPriceup();
	}
	@Override
	public List<Shopsortpricedown> selectPricedown() {
		// TODO Auto-generated method stub
		return dao.selectPricedown();
	}
	@Override
	public List<Shoppriceto> selectPriceto(String price1, String price2) {
		// TODO Auto-generated method stub
		return dao.selectPriceto(price1,price2);
	}
	@Override
	public Shoporder shoporder(String ordernumber) {
		// TODO Auto-generated method stub
		return dao.shoporder(ordernumber);
	}
	@Override
	public void orderadd(Shoporderadd orders) {
		// TODO Auto-generated method stub
		dao.orderadd(orders);
	}
	public void a_orderadd(Aorder aorders) {
		// TODO Auto-generated method stub
		dao.a_orderadd(aorders);
	}
	@Override
	public void b_orderadd(ShopOrders borders) {
		// TODO Auto-generated method stub
		dao.b_orderadd(borders);
	}
	@Override
	public void update(Shopinventory inventorys) {
		// TODO Auto-generated method stub
		dao.update(inventorys);
	}
	@Override
	public List<Shopsortinv> selectInv() {
		// TODO Auto-generated method stub
		return dao.selectInv();
	}
}
