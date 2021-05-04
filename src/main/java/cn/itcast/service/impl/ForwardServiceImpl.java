package cn.itcast.service.impl;

import cn.itcast.dao.ForwardDao;
import cn.itcast.domain.Forward;
import cn.itcast.service.ForwardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.util.List;
@Service
public class ForwardServiceImpl implements ForwardService {
    @Autowired
	private cn.itcast.dao.ForwardDao ForwardDao;
	
	@Override
	public List<Forward> queryForwardAll( String doctorName) {
		return ForwardDao.queryForwardAll(doctorName);
	}

	@Override
	public boolean removeReservation( String show, int fid) {
		return ForwardDao.removeReservation(show, fid);
	}

	@Override
	public List<Forward> queryTimeMessage( String doctorName, String link) {
		return ForwardDao.queryTimeMessage(doctorName, link);
	}
}
