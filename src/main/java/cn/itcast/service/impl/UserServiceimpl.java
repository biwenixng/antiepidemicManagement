package cn.itcast.service.impl;
import cn.itcast.domain.AUserRegistered;
import cn.itcast.dao.UserDao;
import cn.itcast.domain.Message;
import cn.itcast.domain.Site;
import cn.itcast.domain.User;
import cn.itcast.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceimpl implements UserService {
	@Autowired
	private UserDao udao;
	@Override
	public User selectByUsername(String username) {
		// TODO Auto-generated method stub
		return udao.selectByUsername(username);
	}

	@Override
	public boolean uploadInfo(Message msg) {
		// TODO Auto-generated method stub
		return udao.uploadInfo(msg);
	}

	@Override
	public void updateJfHealth(User user) {
		// TODO Auto-generated method stub
		udao.updateJfHealth(user);
	}

	@Override
	public List<Site> selectSiteAll() {
		// TODO Auto-generated method stub
		return udao.selectSiteAll();
	}

	@Override
	public void updatePasssword(String username, String newpsw) {
		// TODO Auto-generated method stub
		udao.updatePasssword(username, newpsw);
	}

	@Override
	public void updatePhone(String username, String newPhone) {
		// TODO Auto-generated method stub
		udao.updatePhone(username, newPhone);
	}

	@Override
	public List<AUserRegistered> userFindPhone() {
		// TODO Auto-generated method stub
		
		return udao.userFindPhone();
	}
	
	@Override
	public int selectPhone(String phone) {
		// TODO Auto-generated method stub
		return udao.selectPhone(phone);
	}

	@Override
	public String selectPSW(String username) {
		// TODO Auto-generated method stub
		return udao.selectPSW(username);
	}
}
