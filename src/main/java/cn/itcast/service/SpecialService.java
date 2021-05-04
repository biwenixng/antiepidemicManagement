package cn.itcast.service;

import cn.itcast.domain.Special;

import java.sql.Connection;
import java.util.List;


public interface SpecialService {
	List<Special> querySpecial();
	Special querySpecial(String special);
}
