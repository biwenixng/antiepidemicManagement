package cn.itcast.dao;


import cn.itcast.domain.AMessageBean;
import cn.itcast.domain.Page;
import cn.itcast.domain.UserBean;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public abstract interface HomePageContentDao {
	/**
	 * 查状态人数
	 * @param health
	 * @return
	 */
	int selevtStateSum(@Param("health") String health);
		
	/**
	 * 日期查所有上传信息
	 * @return
	 */
	List<AMessageBean> selectToday(@Param("time")String time,@Param("limit")int limit ,@Param("offset")int offset);
	List<AMessageBean> selectAll(@Param("limit")int limit ,@Param("offset") int offset);
	/**
	 * 查状态人的信息
	 * @param State 状态 0(疑似)/1(健康)/2(确诊)
	 * @return
	 */
	List<UserBean> selectStateInformation(String State,@Param("limit")int limit ,@Param("offset") int offset);
	
}
