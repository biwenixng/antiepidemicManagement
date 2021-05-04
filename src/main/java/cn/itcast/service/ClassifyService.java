package cn.itcast.service;

import cn.itcast.domain.Classify;

import java.sql.Connection;
import java.util.List;



public interface ClassifyService {
	List<Classify> queryClassify();
	Classify queryClassify(String classIfy);
}
