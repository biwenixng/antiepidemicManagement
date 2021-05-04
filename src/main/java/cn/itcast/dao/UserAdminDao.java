package cn.itcast.dao;

import cn.itcast.domain.AMessageBean;
import cn.itcast.domain.Page;
import cn.itcast.domain.UserBean;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public abstract interface UserAdminDao {
	
	/**
	 * 查询所有用户信息
	 * @return
	 */
	List<UserBean> selectAll(Page<UserBean> page);
	
//	/**
//	 * 查询用户信息
//	 * @param userName 用户名
//	 * 用户名/收货地址/住址/姓名/电话/身份证号/积分/账号状态/健康状态
//	 * @return
//	 */
	List<UserBean> selectname(String name);
	List<UserBean> selectnameu(String userName);
	/**
	 * 查用户的历史状态
	 * @param userName 用户名(姓名)
	 * 时间/体温/健康状态/行程
	 * @return
	 */
	List<AMessageBean> selectHistoricalStatus(String userName, Page<AMessageBean> page);
	
//	/**
//	 * 修改用户密码
//	 * @param userName 用户名
//	 * @param password	修改的密码
//	 */
	Boolean alterUserPassword(String userName,String passWord);

	
	/**
	 * 禁用用户
	 * @param userName 用户名
	 * @param state 账号状态
	 */
	void forbiddenUser(String userName,String state);
	
	
	
	
	
	
}
