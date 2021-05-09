package cn.itcast.service;

import cn.itcast.domain.AUserRegistered;
import cn.itcast.domain.Message;
import cn.itcast.domain.Site;
import cn.itcast.domain.User;

import java.util.List;


public interface UserService {
	
	/**
	 * @param username
	 * @return
	 *	用户名查用户状态信息
	 */
	public User selectByUsername(String username);
		
	/**
	 * 	上传用户信息
	 * @return 返回是否修改成功
	 */
	public int uploadInfo(Message msg);
	
	/**
	 * 改（更新）积分（上传+20积分）和健康状态
	 */
	public void updateJfHealth(User user);   
	
	/**
	 * @return 地点集合List<Site>
	 *	查询地点
	 */
	public List<Site> selectSiteAll();
	
	/**
	 * 修改密码
	 */
	public int updatePasssword(String username,String newpsw);
	
	/**
	 * 修改电话号码
	 */
	public void updatePhone(String username,String newPhone);
	
	/**
	 * 用户结果集
	 */
	public List<AUserRegistered> userFindPhone();
	
	/**
	 * @param phone
	 * @return 查找结果
	 */
	public int selectPhone(String phone);
	
	/**
	 * @param username 用户名
	 * @return 查询原密码
	 */
	public String selectPSW(String username);
}
