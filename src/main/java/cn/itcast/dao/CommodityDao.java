package cn.itcast.dao;

import cn.itcast.domain.Commodity;
import cn.itcast.domain.Page;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.util.List;


@Repository
public interface CommodityDao {
	public boolean addCommodity( Commodity commodity);
	public boolean modifyCommodity( Commodity commodity);
	public boolean removeCommodity( int cid, String show);
	public Commodity queryCommodity( int cid);
	public List<Commodity> queryCommodityAll( Page<Commodity> page);
	public Commodity queryCommodity( String name);
}
