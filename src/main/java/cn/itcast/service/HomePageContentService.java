package cn.itcast.service;

import cn.itcast.domain.AMessageBean;
import cn.itcast.domain.Page;
import cn.itcast.domain.UserBean;

import java.util.List;


public abstract interface HomePageContentService {
//	/**
//	 * 查状态人数
//	 *
//	 * @param State 状态 0(疑似)/1(健康)/2(确诊)
//	 * @return
//	 */
	int selevtStateSum(String health);

	/**
	 * 日期查所有上传信息
	 * 
	 * @return
	 */
	List<AMessageBean> selectToday(String time, int limit ,int offset);

	List<AMessageBean> selectAll(int limit ,int offset);

	/**
	 * 查状态人的信息
	 * 
	 * @param State 状态 0(疑似)/1(健康)/2(确诊)
	 * @return
	 */
	List<UserBean> selectStateInformation(String State,int limit ,int offset);
}
