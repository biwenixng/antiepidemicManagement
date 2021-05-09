package cn.itcast.dao;

import cn.itcast.domain.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface MyCenterDao {


	/**
	 * 查询所有上传记录
	 * @param username
	 * @param page
	 * @return
	 */
	List<QueryUploadInformation> selectQueryUploadInformation(@Param("username")String username, Pages<QueryUploadInformation> page);

	/**
	 * 查询上传记录
	 * @param username
	 * @param limit
	 * @param offset
	 * @return
	 */
	List<QueryUploadInformation> selectQueryUploadInformationPage(@Param("username")String username, @Param("limit")int limit,@Param("offset")int offset);
	/**
    * @return
    * -查询预约记录
    */
	List<QueryMake> selectQueryMake(@Param("auser")String auser, Pages<QueryMake> page);

	/**
	 * @return
	 * -查询预约记录分页
	 */
	List<QueryMake> selectQueryMakePage(@Param("auser")String auser, @Param("limit")int limit,@Param("offset")int offset);
	/**
	 * @return
	 * -删除预约记录
	*/
	void updateQueryMake(int fid);
	
	/**
	* @return
	* -查询购物记录
	*/
	List<QueryOrder> selectQueryOrder(@Param("username")String username,@Param("limit")int limit ,@Param("offset")int offset);

	List<QueryOrder> selectQueryOrderAll(@Param("username")String username);
	/**
	* @return
	* -删除购物记录
	*/
	void updateQueryOrder(String ordernumber);
	/**
	* @return
	* -查询订单详情
	*/
	List<AOrders> selectAOrders(String ordernumber, Pages<AOrders> page);
	
	/**
	* @return
	* -上传健康码
	*/
	void updateAUser(@Param("healthpath")String healthpath,@Param("username")String username);
	/**
	* @return
	* -查看健康码
	*/
	List<AUser> selectAUser(@Param("username")String username);
	/**
	* @return
	* -上传头像
	*/
	void updateHead(@Param("headimg")String headimg,@Param("username")String username);
	
	/**
	* @return
	* -查询寝室
	*/
	public List<Area> getAreaQs(String floorname);
	
	/**
	* @return
	* -查询楼层
	*/
	public List<Area> getAreaByParentno(String schoolname);
	
	/**
	* @return
	* -查询校区
	*/
	public List<Areax> getAreaXq();
	
	/**
	* @return
	* -修改住址
	*/
	void updatedizi(@Param("residence") String residence, @Param("username")String username);
}
