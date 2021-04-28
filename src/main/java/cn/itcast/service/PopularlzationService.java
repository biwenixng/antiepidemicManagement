package cn.itcast.service;

import cn.itcast.domain.Popularlzations;

import java.sql.Connection;
import java.util.List;


public interface PopularlzationService {

	List<Popularlzations> selectAll();
	Popularlzations selectInfo(int nid);
	
}
