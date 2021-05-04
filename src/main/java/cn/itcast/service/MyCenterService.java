package cn.itcast.service;

import cn.itcast.domain.*;

import java.util.List;



public interface MyCenterService {

	 /**
		 * @return
		 * -查询信息上传
		 */
		List<QueryUploadInformation> selectQueryUploadInformation(String username, Pages<QueryUploadInformation> page);
		
	/**
    * @return
    * -查询预约记录
    */
	List<QueryMake> selectQueryMake(String auser, Pages<QueryMake> page);
	
	/**
	 * @return
	 * -删除预约记录
	*/
	void updateQueryMake(int fid);
	
	/**
	* @return
	* -查询购物记录
	*/
	List<QueryOrder> selectQueryOrder(String username, Pages<QueryOrder> page);
	

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
	void updateAUser(String healthpath,String username);
	
	/**
	* @return
	* -查看健康码
	*/
	List<AUser> selectAUser(String username);
	
	/**
	* @return
	* -上传头像
	*/
	void updateHead(String headimg,String username);
	
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
	void updatedizi(String residence,String username);
}
