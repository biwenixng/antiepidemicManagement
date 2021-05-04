package cn.itcast.service;

import cn.itcast.domain.Use;

import java.sql.Connection;
import java.util.List;


public interface UseService {
	List<Use> queryUse();
	Use queryUse(String use);
}
