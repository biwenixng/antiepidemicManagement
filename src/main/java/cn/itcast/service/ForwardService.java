package cn.itcast.service;

import cn.itcast.domain.Forward;
import java.util.List;


public interface ForwardService {
	/**
	 *所有预约
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
	List<Forward> queryTimeMessage( String doctorName,String link);
}
