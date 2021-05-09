package cn.itcast.dao;

import cn.itcast.domain.Forward;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ForwardDao {
	/**
	 * 查看所有预约消息
	 * @param doctorName
	 * @return
	 */
	List<Forward> queryForwardAll(String doctorName);

	/**
	 * 删除预约消息
	 * @param show
	 * @param fid
	 * @return
	 */
	boolean removeReservation(@Param("show") String show,@Param("fid") int fid);

	/**
	 * 查看当天预约消息
	 * @param doctorName
	 * @param link
	 * @return
	 */
	List<Forward> queryTimeMessage(@Param("doctorName") String doctorName, @Param("link") String link);
}
