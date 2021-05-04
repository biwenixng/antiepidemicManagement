package cn.itcast.dao;

import cn.itcast.domain.DoctorAdminBean;
import cn.itcast.domain.Page;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public abstract interface DoctorAdminDao {
//	/**
//	 * 添加校医
//	 * @param uesrName 校医用户名
//	 * @param passWord	密码
//	 * @param name 姓名
//	 * @param synopsis 简介
//	 * @param imgPath 图片路径
//	 * @return
//	 */
	Boolean insertIntoDoctor(String userName,String passWord,
			String name,String synopsis ,String imgPath);
		
//	/**
//	 * 查询校医信息
//	 * @param name 医生姓名
//	 * 校医用户名 姓名 简介 图片路径 是否显示
//	 * @return
//	 */
	List<DoctorAdminBean> selectDoctor(String name);
	List<DoctorAdminBean> selectDoctoru(String username);
//	/**
//	 * 查所有校医
//	 * 校医用户名 姓名 简介 图片路径 是否显示
//	 * @return
//	 */
	List<DoctorAdminBean> selectAllDoctor(Page<DoctorAdminBean> page);
	

//	/**
//	 * @param userNameOld用户名
//	 * @param passWord 新密码
//	 * @param name  新姓名
//	 * @param synopsis 新简介
//	 * @param imgPath 新图片地址
//	 * 修改校医
//	 */
	Boolean alterDoctor(String userNameOld ,String passWord,
			String name,String synopsis );

	/**
	 * @param userName 用户名,显示状态1默认.0删
	 * 删除校医
	 */
	void deleteDoctor(String userName,String show);
}
