package cn.itcast.dao;

import cn.itcast.domain.Classify;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.util.List;

@Repository
public interface ClassifyDao {
	List<Classify> queryClassify();
	Classify queryClassify(String classIfy);
}
