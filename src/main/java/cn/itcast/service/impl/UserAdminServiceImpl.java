package cn.itcast.service.impl;

import cn.itcast.dao.UserAdminDao;
import cn.itcast.domain.AMessageBean;
import cn.itcast.domain.Page;
import cn.itcast.domain.UserBean;
import cn.itcast.service.UserAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserAdminServiceImpl implements UserAdminService {
	@Autowired
	private UserAdminDao user;
	@Override
	public List<UserBean> selectAll(Page<UserBean> page) {
		return user.selectAll(page);
	}

	@Override
	public List<UserBean> selectname(String name) {
		return user.selectname(name);
	}
	@Override
	public List<UserBean> selectnameu(String userName) {
		return user.selectnameu(userName);
	}

	@Override
	public List<AMessageBean> selectHistoricalStatus(String userName, Page<AMessageBean> page) {
		return user.selectHistoricalStatus(userName,page);
	}

	@Override
	public Boolean alterUserPassword(String userName, String passWord) {
		return user.alterUserPassword(userName, passWord);
	}

	@Override
	public void forbiddenUser(String userName, String state) {
		user.forbiddenUser(userName, state);
		
	}

}
