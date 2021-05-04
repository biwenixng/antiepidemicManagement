package cn.itcast.service;
import cn.itcast.domain.AdminBoss;
import cn.itcast.domain.Page;

import java.util.List;



public interface AdminBossService {

	/**
	 * 管理员添加
	 * @param userName 添加的账号
	 * @param passWord 添加的密码
	 * @return成功/失败
	 */
	Boolean addAdmin(String userName,String passWord);
	
	/**
	 * 查询0小管理员
	 * 管理员账户 密码 管理员权限 是否禁用
	 * @return 
	 */
	List<AdminBoss> selectAdmin(Page<AdminBoss> page);
	
	/**
	 * 删除管理员
	 * @param userName 管理员账号 
	 * @return
	 */
	void delectAdmin(String userName,String show);
	
}
