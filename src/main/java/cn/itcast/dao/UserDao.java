package cn.itcast.dao;

import cn.itcast.domain.AUserRegistered;
import cn.itcast.domain.Message;
import cn.itcast.domain.Site;
import cn.itcast.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserDao {
	
	/**
	 * @param username
	 * @return
	 *	用户名查用户状态信息
	 */
	public User selectByUsername(String username);
		
	/**
	 * 	上传用户信息
	 */
	public int uploadInfo(Message msg);
	
	/**
	 * 改（更新）积分（上传+20积分）和健康状态
	 */
	public void updateJfHealth(User user);   
	
	/**
	 * @return
	 *	查询地点
	 */
	public List<Site> selectSiteAll();
	
	
	/**
	 * 修改密码
	 */
	public int updatePasssword(@Param("username") String username, @Param("newpsw") String newpsw);
	
	/**
	 * 修改电话号码
	 */
	public void updatePhone(String username,String newPhone);
	
	/**
	 * @param phone
	 * @return 查找结果
	 */
	public int selectPhone(String phone);
	
	/**
	 * 用户结果集
	 */
	public List<AUserRegistered> userFindPhone();
	
	/**
	 * 查询原密码
	 */
	public String selectPSW(String username);
	
}