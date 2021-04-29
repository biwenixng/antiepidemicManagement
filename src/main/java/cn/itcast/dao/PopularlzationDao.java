package cn.itcast.dao;

import cn.itcast.domain.Popularlzations;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.util.List;

@Repository
public interface PopularlzationDao {

	/**
	 * 查询所有
	 * @return
	 */
	public List<Popularlzations> selectAll();
//	public Popularlzations selectInfo(int pid);
}
