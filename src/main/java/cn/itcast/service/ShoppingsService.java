package cn.itcast.service;

import cn.itcast.domain.*;

import java.util.List;


public interface ShoppingsService {
	
	List<Shoponline> selectAll_online();
	
	Shoponline selectInfo(int cid);
	
	List<Shoptype> selectType(String specialname);
	
	List<Shopuse> selectUse(String usename);
	
	List<Shopclass> selectClass(String productname);
	
	List<Shopselect> selectLike(String synopsis);
	
	List<Shopsortpriceup> selectPriceup();
	
	List<Shopsortpricedown> selectPricedown();
	
	List<Shopsortinv> selectInv();
	
	List<Shoppriceto> selectPriceto(String price1,String price2);
	
	Shoporder shoporder(String ordernumber);
	
	void orderadd(Shoporderadd orders);
	
	void a_orderadd(Aorder aorders);
	
	void b_orderadd(ShopOrders borders);
	
	void update(Shopinventory inventorys);
}
