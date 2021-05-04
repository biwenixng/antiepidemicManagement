package cn.itcast.dao;

import cn.itcast.domain.Doctor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 毕文星
 */
@Repository
public interface DoctorDao {
	/**
	 * 查询所有医生
	 * @return
	 */
	List<Doctor> queryDoctorAll();
}
