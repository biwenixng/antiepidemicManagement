package cn.itcast.dao;

import cn.itcast.domain.Special;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.util.List;

@Repository
public interface SpecialDao {
	List<Special> querySpecial();
	Special querySpecial(String special);
}
