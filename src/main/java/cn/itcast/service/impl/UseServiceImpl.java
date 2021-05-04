package cn.itcast.service.impl;

import cn.itcast.dao.UseDao;
import cn.itcast.domain.Use;
import cn.itcast.service.UseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.util.List;

@Service
public class UseServiceImpl implements UseService {
	@Autowired
	private cn.itcast.dao.UseDao UseDao;
	@Override
	public List<Use> queryUse() {
		return UseDao.queryUse();
	}
	
	@Override
	public Use queryUse(String use) {

		return UseDao.queryUse(use);
	}
	
}
