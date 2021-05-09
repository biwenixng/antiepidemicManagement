package cn.itcast.dao;

import cn.itcast.domain.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShoppingsDao {
	/**\
	 * 查询所有商品
	 * @return
	 */
	List<Shoponline> selectAll_online();

	/**
	 * 查询单个商品
	 * @param cid
	 * @return
	 */
	Shoponline selectInfo(int cid);

	List<Shoptype> selectType(String specialname);

	List<Shopuse> selectUse(String usename);

	List<Shopclass> selectClass(String productname);

	/**
	 * 查询商品
	 * @param synopsis
	 * @return
	 */
	List<Shopselect> selectLike(@Param("synopsis") String synopsis);

	List<Shopsortpriceup> selectPriceup();

	List<Shopsortpricedown> selectPricedown();

	List<Shopsortinv> selectInv();

	List<Shoppriceto> selectPriceto(String price1, String price2);

	Shoporder shoporder(String ordernumber);

	void orderadd(Shoporderadd orders);

	/**
	 *
	 * @param aorders
	 */
	void a_orderadd(Aorder aorders);

	/**
	 *
	 * @param borders
	 */
	void b_orderadd(ShopOrders borders);

	/**
	 * 更新
	 * @param inventorys
	 */
	void update(Shopinventory inventorys);
}
