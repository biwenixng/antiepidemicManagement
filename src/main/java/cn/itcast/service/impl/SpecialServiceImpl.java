package cn.itcast.service.impl;

import cn.itcast.dao.SpecialDao;
import cn.itcast.domain.Special;
import cn.itcast.service.SpecialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SpecialServiceImpl implements SpecialService {
	@Autowired
	private SpecialDao specialDao;
	@Override
	public List<Special> querySpecial() {

		return specialDao.querySpecial();
	}
	@Override
	public Special querySpecial(String special) {

		return specialDao.querySpecial(special);
	}

}
