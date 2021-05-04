package cn.itcast.service.impl;

import cn.itcast.dao.HomePageContentDao;
import cn.itcast.domain.AMessageBean;
import cn.itcast.domain.Page;
import cn.itcast.domain.UserBean;
import cn.itcast.service.HomePageContentService;
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
	public List<AMessageBean> selectToday(Page<AMessageBean> page) {
		return hpc.selectToday(null,page);
	}

	@Override
	public List<UserBean> selectStateInformation(String State,Page<UserBean> page) {
			
		return hpc.selectStateInformation(State,page);
	}

	@Override
	public List<AMessageBean> selectAll(Page<AMessageBean> page) {
		return hpc.selectAll(page);
	}

}
