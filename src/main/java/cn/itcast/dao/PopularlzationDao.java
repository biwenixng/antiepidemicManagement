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
	@Select({"SELECT * FROM a_popularlzation where `show`='1'"})
	public List<Popularlzations> selectAll();
	/**
	 * 查询一条
	 * @param pid
	 * @return
	 */
	@Select({"SELECT * FROM a_popularlzation WHERE pid = ?"})
	public Popularlzations selectInfo(int pid);
}
