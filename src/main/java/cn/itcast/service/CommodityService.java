package cn.itcast.service;

import cn.itcast.domain.Commodity;
import cn.itcast.domain.Page;

import java.sql.Connection;
import java.util.List;


public interface CommodityService {
	public boolean addCommodity( Commodity commodity);
	public boolean modifyCommodity( Commodity commodity);
	public boolean removeCommodity( int cid, String show);
	public Commodity queryCommodity( int cid);
	public List<Commodity> queryCommodityAll( Page<Commodity> page);
	public Commodity queryCommodity( String name);
}
