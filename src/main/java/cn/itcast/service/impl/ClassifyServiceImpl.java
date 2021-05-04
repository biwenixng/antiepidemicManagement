package cn.itcast.service.impl;

import cn.itcast.dao.ClassifyDao;
import cn.itcast.domain.Classify;
import cn.itcast.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Service
public class ClassifyServiceImpl implements ClassifyService {
	@Autowired
	private ClassifyDao classifyDao;
	
	@Override
	public List<Classify> queryClassify() {
		return classifyDao.queryClassify();
	}

	@Override
	public Classify queryClassify(String classIfy) {
		return classifyDao.queryClassify(classIfy);
	}

}
