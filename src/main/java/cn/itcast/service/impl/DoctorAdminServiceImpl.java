package cn.itcast.service.impl;

import cn.itcast.dao.DoctorAdminDao;
import cn.itcast.domain.DoctorAdminBean;
import cn.itcast.domain.Page;
import cn.itcast.service.DoctorAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DoctorAdminServiceImpl implements DoctorAdminService {
	@Autowired
	private DoctorAdminDao doc;
	@Override
	public Boolean insertIntoDoctor(String userName, String passWord, String name, String synopsis, String imgPath) {
		Boolean bool;
		bool= doc.insertIntoDoctor(userName, passWord, name, synopsis, imgPath);
		return bool;
	}

	@Override
	public List<DoctorAdminBean> selectDoctor(String name) {
		return doc.selectDoctor(name);
	}
	@Override
	public List<DoctorAdminBean> selectDoctoru(String username) {
		return doc.selectDoctoru(username);
	}
	@Override
	public List<DoctorAdminBean> selectAllDoctor(Page< DoctorAdminBean> page) {
		return doc.selectAllDoctor(page);
	}

	@Override
	public Boolean alterDoctor(String userNameOld, String passWord, String name, String synopsis) {
		return doc.alterDoctor(userNameOld, passWord, name, synopsis);

	}

	@Override
	public void deleteDoctor(String userName, String show) {
		doc.deleteDoctor(userName, show);

	}

}
