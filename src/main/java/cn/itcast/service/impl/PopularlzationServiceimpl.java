package cn.itcast.service.impl;


import cn.itcast.dao.PopularlzationDao;
import cn.itcast.domain.Popularlzations;
import cn.itcast.service.PopularlzationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
@Service("popularlzationService")
public class PopularlzationServiceimpl implements PopularlzationService {
	@Autowired
	private PopularlzationDao dao;

	@Override
	public List<Popularlzations> selectAll() {
		List<Popularlzations> list = dao.selectAll();
		return list;
	}

	@Override
	public Popularlzations selectInfo(int nid) {
//		Connection conn = DBUtils.getConnection();
//		List<Popularlzations> selectAll = service.selectAll(conn);
//
//		String json = gson.toJson(selectAll);
//
//		resp.getWriter().print(json);
//		req.getRequestDispatcher(json);
		return dao.selectInfo(nid);
	}

	protected void selectOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String pid = request.getParameter("pid");
//		Connection conn = DBUtils.getConnection();
//		Popularlzations selectInfo = service.selectInfo(conn,Integer.parseInt(pid));
//		request.setAttribute("news", selectInfo);
//		DBUtils.release(conn, null, null);
//		request.getRequestDispatcher("/web/page.jsp").forward(request, response);
	}
}
