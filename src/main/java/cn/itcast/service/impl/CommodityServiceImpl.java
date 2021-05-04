package cn.itcast.service.impl;

import cn.itcast.dao.CommodityDao;
import cn.itcast.domain.Commodity;
import cn.itcast.domain.Page;
import cn.itcast.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.util.List;

@Service
public class CommodityServiceImpl implements CommodityService {
	@Autowired
	private CommodityDao commodityDao;

	@Override
	public boolean addCommodity( Commodity commodity) {
		return commodityDao.addCommodity(commodity);
	}

	@Override
	public boolean modifyCommodity( Commodity commodity) {
		return commodityDao.modifyCommodity(commodity);
	}

	@Override
	public boolean removeCommodity( int cid, String show) {
		return commodityDao.removeCommodity(cid, show);
	}

	@Override
	public Commodity queryCommodity( int cid) {
		return commodityDao.queryCommodity(cid);
	}

	@Override
	public List<Commodity> queryCommodityAll( Page<Commodity> page) {
		return commodityDao.queryCommodityAll(page);
	}

	@Override
	public Commodity queryCommodity( String name) {
		return commodityDao.queryCommodity(name);
	}

}
