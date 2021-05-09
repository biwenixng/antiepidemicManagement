package cn.itcast.service.impl;

import cn.itcast.dao.HomePageContentDao;
import cn.itcast.domain.AMessageBean;
import cn.itcast.domain.Page;
import cn.itcast.domain.UserBean;
import cn.itcast.service.HomePageContentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class HomePageContentServiceImpl implements HomePageContentService {
	@Autowired
	private HomePageContentDao hpc;
	@Override
	public int selevtStateSum(String health) {
		return hpc.selevtStateSum(health);
	}


	@Override
	public List<AMessageBean> selectToday(String time, int limit , int offset) {
		return hpc.selectToday(time,limit,offset);
	}


	@Override
	public List<UserBean> selectStateInformation(String State, int limit , int offset) {
			
		return hpc.selectStateInformation(State,limit,offset);
	}


	@Override
	public List<AMessageBean> selectAll(int limit , int offset) {
		return hpc.selectAll(limit,offset);
	}

}
