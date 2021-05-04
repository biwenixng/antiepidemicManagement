package cn.itcast.service.impl;

import cn.itcast.dao.AdminBossDao;
import cn.itcast.domain.AdminBoss;
import cn.itcast.domain.Page;
import cn.itcast.service.AdminBossService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminBossServiceImpl implements AdminBossService {
	@Autowired
	private AdminBossDao admin;
	@Override
	public Boolean addAdmin(String userName, String passWord) {
		Boolean bool ;
		bool = admin.insertIntoAdmin(userName, passWord);
		return bool;
	}

	@Override
	public List<AdminBoss> selectAdmin(Page<AdminBoss> page) {
		return admin.selectAdmin(page);
	}

	@Override
	public void delectAdmin(String userName, String show) {
		admin.delectAdmin(userName, show);
	}

}
