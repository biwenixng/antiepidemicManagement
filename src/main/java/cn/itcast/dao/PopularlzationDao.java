package cn.itcast.dao;

import cn.itcast.domain.Popularlzations;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface PopularlzationDao {

	/**
	 * 查询所有
	 * @return
	 */
	 List<Popularlzations> selectAll();
//	 Popularlzations selectInfo(int pid);
}
