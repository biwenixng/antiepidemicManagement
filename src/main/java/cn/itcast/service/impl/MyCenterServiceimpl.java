package cn.itcast.service.impl;

import cn.itcast.dao.MyCenterDao;
import cn.itcast.domain.*;
import cn.itcast.service.MyCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class MyCenterServiceimpl implements MyCenterService {
	@Autowired
	private MyCenterDao dao;
	 /**
	 * @return
	 * -查询信息上传
	 */
	@Override
	public List<QueryUploadInformation> selectQueryUploadInformation(String username, Pages<QueryUploadInformation> page) {
		// TODO Auto-generated method stub
		return dao.selectQueryUploadInformation(username,page);
	}

	@Override
	public List<QueryUploadInformation> selectQueryUploadInformationPage(String username,int limit,int offset) {
		return dao.selectQueryUploadInformationPage(username,limit,offset);
	}

	/**
	    * @return
	    * -查询预约记录
	    */
	@Override
	public List<QueryMake> selectQueryMake(String auser, Pages<QueryMake> page) {
		// TODO Auto-generated method stub
		return dao.selectQueryMake(auser,page);
	}

	@Override
	public List<QueryMake> selectQueryMakePage(String auser, int limit, int offset) {
		return dao.selectQueryMakePage(auser, limit, offset);
	}

	/**
	* @return
	* -查询购物记录
	*/
	@Override
	public List<QueryOrder> selectQueryOrder(String username, int limit, int offset) {
		// TODO Auto-generated method stub
		return dao.selectQueryOrder(username, limit,offset);
	}

	@Override
	public List<QueryOrder> selectQueryOrder(String username) {
		// TODO Auto-generated method stub
		return dao.selectQueryOrderAll(username);
	}
	/**
	* @return
	* -查询订单详情
	*/
	@Override
	public List<AOrders> selectAOrders(String ordernumber, Pages<AOrders> page) {
		// TODO Auto-generated method stub
		return dao.selectAOrders(ordernumber, page);
	}


	/**
	 * @return
	 * -删除预约记录
	*/
	@Override
	public void updateQueryMake(int fid) {
		dao.updateQueryMake(fid);
		
	}

	/**
	* @return
	* -删除购物记录
	*/
	@Override
	public void updateQueryOrder(String ordernumber) {
		dao.updateQueryOrder(ordernumber);
		
	}
	/**
	* @return
	* -上传健康码
	*/
	@Override
	public void updateAUser(String healthpath, String username) {
		dao.updateAUser(healthpath, username);
		
	}
	/**
	* @return
	* -查看健康码
	*/
	@Override
	public List<AUser> selectAUser(String username) {
		return dao.selectAUser(username);
	}
	

	/**
	* @return
	* -上传头像
	*/
	@Override
	public void updateHead(String headimg, String username) {
		dao.updateHead(headimg, username);
		
	}
	
	/**
	* @return
	* -查询寝室
	*/
	@Override
	public List<Area> getAreaQs(String floorname) {
		// TODO Auto-generated method stub
		return dao.getAreaQs(floorname);
	}

	/**
	* @return
	* -查询楼层
	*/
	@Override
	public List<Area> getAreaByParentno(String schoolname) {
		// TODO Auto-generated method stub
		return dao.getAreaByParentno(schoolname);
	}

	/**
	* @return
	* -查询校区
	*/
	@Override
	public List<Areax> getAreaXq() {
		// TODO Auto-generated method stub
		return dao.getAreaXq();
	}
	
	/**
	* @return
	* -修改住址
	*/
	@Override
	public void updatedizi(String residence, String username) {
		dao.updatedizi(residence, username);
		
	}


}
