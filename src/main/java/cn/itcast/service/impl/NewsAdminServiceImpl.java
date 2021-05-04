package cn.itcast.service.impl;



import cn.itcast.dao.NewsAdminDao;
import cn.itcast.domain.Page;
import cn.itcast.domain.PopularlZation;
import cn.itcast.service.NewsAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsAdminServiceImpl implements NewsAdminService {
	@Autowired
	private NewsAdminDao news;
	@Override
	public Boolean insertIntoNews(String title, String center, String imageurl) {
		return news.insertIntoNews( title, center,imageurl);
	}

	@Override
	public List<PopularlZation> selectNewstitle(String title, Page<PopularlZation> page) {
		return news.selectNewstitle(title,page);
	}

	@Override
	public List<PopularlZation> selectNewstime(String addtime,Page<PopularlZation> page) {
		return news.selectNewstime(addtime,page);
	}

	@Override
	public List<PopularlZation> selectAllNews(Page<PopularlZation> page) {
		return news.selectAllNews(page);
	}

	@Override
	public void updateNews(int pid, String title, String center) {
		news.updateNews(pid, title, center);

	}

	@Override
	public void deleteNews(int pid, String show) {
		news.deleteNews(pid, show);

	}

	@Override
	public PopularlZation selectNewsDetalls(int pid) {
		return news.selectNewsDetalls(pid);
	}

}
