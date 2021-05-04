package cn.itcast.dao;


import cn.itcast.domain.AMessageBean;
import cn.itcast.domain.Page;
import cn.itcast.domain.UserBean;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public abstract interface HomePageContentDao {
//	/**
//	 * 查状态人数
//	 * @param State 状态 0(疑似)/1(健康)/2(确诊)
//	 * @return
//	 */
	int selevtStateSum(String health);
		
	/**
	 * 日期查所有上传信息
	 * @return
	 */
	List<AMessageBean> selectToday(String time, Page<AMessageBean> page);
	List<AMessageBean> selectAll(Page<AMessageBean> page);
	/**
	 * 查状态人的信息
	 * @param State 状态 0(疑似)/1(健康)/2(确诊)
	 * @return
	 */
	List<UserBean> selectStateInformation(String State,Page<UserBean> page);
	
}
