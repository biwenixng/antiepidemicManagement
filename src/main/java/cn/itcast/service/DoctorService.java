package cn.itcast.service;

import cn.itcast.domain.Doctor;

import java.sql.Connection;
import java.util.List;


public interface DoctorService {
	List<Doctor> queryDoctorAll();
}
