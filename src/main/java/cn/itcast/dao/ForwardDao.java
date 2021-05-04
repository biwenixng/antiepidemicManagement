package cn.itcast.dao;

import cn.itcast.domain.Forward;
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
	boolean removeReservation(String show, int fid);

	/**
	 * 查看当天预约消息
	 * @param doctorName
	 * @param link
	 * @return
	 */
	List<Forward> queryTimeMessage(String doctorName, String link);
}
