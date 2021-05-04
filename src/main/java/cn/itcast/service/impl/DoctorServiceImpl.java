package cn.itcast.service.impl;

import cn.itcast.dao.DoctorDao;
import cn.itcast.domain.Doctor;
import cn.itcast.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.util.List;

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
	private DoctorDao doctorDao;
	
	@Override
	public List<Doctor> queryDoctorAll() {
		return doctorDao.queryDoctorAll();
	}	
}
