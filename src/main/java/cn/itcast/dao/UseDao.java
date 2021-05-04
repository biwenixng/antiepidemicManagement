package cn.itcast.dao;

import cn.itcast.domain.Use;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.util.List;

@Repository
public interface UseDao {
	List<Use> queryUse();
	Use queryUse(String use);
}
