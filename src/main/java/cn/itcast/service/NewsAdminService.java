package cn.itcast.service;

import cn.itcast.domain.Page;
import cn.itcast.domain.PopularlZation;

import java.util.List;



public interface NewsAdminService {
//	/**
//	 * 添加新闻
//	 * @param Pid 科普编号
//	 * @param title 科普标题
//	 * @param Center 科普内容
//	 * @param addTime 添加时间
//	 * @param imageurl 图片路径
//	 * @return
//	 */
	Boolean insertIntoNews(String title,String center,String imageurl);
	
	/**
	 * 新闻标题查询新闻
	 * @param title 新闻标题
	 * 编号 标题 添加时间 新闻状态
	 * @return
	 */
	List<PopularlZation> selectNewstitle(String title, Page<PopularlZation> page);
	PopularlZation selectNewsDetalls(int pid);
//	/**
//	 * 新闻添加时间查询新闻
//	 * @param addtime新闻添加时间
//	 * @return
//	 */
	List<PopularlZation> selectNewstime(String addtime, Page<PopularlZation> page);
	
	/**
	 * 查所有新闻的编号,标题,添加时间
	 * @return
	 */
	List<PopularlZation> selectAllNews(Page<PopularlZation> page);

	
//	/**
//	 * 修改新闻
//	 * @param Pid 科普编号(条件)
//	 *
//	 * @param title 科普标题
//	 * @param Center 科普内容
//	 * @param imageurl 图片路径
//	 * @return
//	 *
//	 */
	void updateNews(int pid,String title,String center);

//	/**
//	 * 删除新闻
//	 * @param Pid(条件)
//	 */
	void  deleteNews(int pid,String show);

}
