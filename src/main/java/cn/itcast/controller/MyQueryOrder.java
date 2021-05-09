package cn.itcast.controller;

import cn.itcast.domain.AOrders;
import cn.itcast.domain.Pages;
import cn.itcast.domain.QueryOrder;
import cn.itcast.service.MyCenterService;
import cn.itcast.service.impl.MyCenterServiceimpl;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyQueryOrder
 */
@Controller
@RequestMapping("/myQueryOrder")
public class MyQueryOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private MyCenterService service;

	@RequestMapping("/selectAll")
	@ResponseBody
	protected Pages<QueryOrder> selectAll(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		List<QueryOrder> lists = service.selectQueryOrder(username);
		//创建分页对象
		Pages<QueryOrder> page = new Pages<QueryOrder>();
		//设置当前页码
		String currentPage = request.getParameter("currentPage");
		if(currentPage != null) {
		page.setCurrentPage(Integer.parseInt(currentPage));
		}
		//设置数据总量 
		page.setDataTotal(lists.size());		
		//设置每页每页数据量
		String pageCount = request.getParameter("pageCount");
		if(pageCount != null) {
		page.setPageCount(Integer.parseInt(pageCount));
		}	
		//当前页的数据设置
		lists = service.selectQueryOrder(username,(page.getCurrentPage()-1)*page.getPageCount(),page.getPageCount());
		page.setPages(lists);
		return page;
	}

	@RequestMapping("/selectAllPage")
	protected String selectAllPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		List<QueryOrder> lists = service.selectQueryOrder(username);
		//创建分页对象
		Pages<QueryOrder> page = new Pages<QueryOrder>();
		//设置当前页码
		String currentPage = request.getParameter("currentPage");
		if(currentPage != null) {
		page.setCurrentPage(Integer.parseInt(currentPage));
		}
		//设置数据总量 
		page.setDataTotal(lists.size());		
		//设置每页每页数据量
		String pageCount = request.getParameter("pageCount");
		if(pageCount != null) {
		page.setPageCount(Integer.parseInt(pageCount));
		}	
		//当前页的数据设置
		lists = service.selectQueryOrder(username,(page.getCurrentPage()-1)*page.getPageCount(),page.getPageCount());
		page.setPages(lists);
		request.setAttribute("page", page);
		return "/personalCenter/query_order2";
	}

	@RequestMapping("/selectOne")
	protected void selectOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String ordernumber = request.getParameter("ordernumber");
		List<AOrders> lists = service.selectAOrders(ordernumber, null);
		//创建分页对象
		Pages<AOrders> page = new Pages<AOrders>();
		//设置当前页码
		String currentPage = request.getParameter("currentPage");
		if(currentPage != null) {
		page.setCurrentPage(Integer.parseInt(currentPage));
		}
		//设置数据总量 
		page.setDataTotal(lists.size());		
		//设置每页每页数据量
		String pageCount = request.getParameter("pageCount");
		if(pageCount != null) {
		page.setPageCount(Integer.parseInt(pageCount));
		}	
		//当前页的数据设置
		lists = service.selectAOrders(ordernumber, page);
		page.setPages(lists);
		request.setAttribute("page", page);
		request.setAttribute("ordernumber", ordernumber);
		request.getRequestDispatcher("/personalCenter/a_orders.jsp").forward(request, response);
	}

	@RequestMapping("/updateAllPage")
	protected String updateAllPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String ordernumber = request.getParameter("ordernumber");
		service.updateQueryOrder(ordernumber);
		List<QueryOrder> lists = service.selectQueryOrder(username);
		//创建分页对象
		Pages<QueryOrder> page = new Pages<QueryOrder>();
		//设置当前页码
		String currentPage = request.getParameter("currentPage");
		if(currentPage != null) {
		page.setCurrentPage(Integer.parseInt(currentPage));
		}
		//设置数据总量 
		page.setDataTotal(lists.size());		
		//设置每页每页数据量
		String pageCount = request.getParameter("pageCount");
		if(pageCount != null) {
		page.setPageCount(Integer.parseInt(pageCount));
		}	
		//当前页的数据设置
		lists = service.selectQueryOrder(username,(page.getCurrentPage()-1)*page.getPageCount(),page.getPageCount());
		if(lists.size() == 0) {
			if(Integer.parseInt(currentPage)!=1) {
			page.setCurrentPage(Integer.parseInt(currentPage)-1);
			lists = service.selectQueryOrder(username,(page.getCurrentPage()-1)*page.getPageCount(),page.getPageCount());
			}
		}
		page.setPages(lists);
		request.setAttribute("page", page);
		return "/personalCenter/query_order2";
	}
}
