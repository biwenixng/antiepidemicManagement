package cn.itcast.controller;

import cn.itcast.domain.Pages;
import cn.itcast.domain.QueryMake;
import cn.itcast.service.MyCenterService;
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
 * Servlet implementation class QueryMake
 */
@Controller
@RequestMapping("/myQueryMake")
public class MyQueryMake extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private MyCenterService service;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value = request.getParameter("method");
		if(value.equals("selectAll")) {
			selectAll(request,response);
		}
		if(value.equals("selectAllPage")) {
			selectAllPage(request,response);
		}
		if(value.equals("updateAllPage")) {
			updateAllPage(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	@RequestMapping("/selectAll")
	@ResponseBody
	protected Pages<QueryMake> selectAll(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String auser = request.getParameter("auser");
		List<QueryMake> lists = service.selectQueryMake(auser,null);
		//创建分页对象
		Pages<QueryMake> page = new Pages<QueryMake>();
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
		lists = service.selectQueryMakePage(auser,(page.getCurrentPage()-1)*page.getPageCount(),page.getPageCount());
		page.setPages(lists);
		return page;
	}

	@RequestMapping("/selectAllPage")
	protected String selectAllPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String auser = request.getParameter("auser");
		List<QueryMake> lists = service.selectQueryMake(auser,null);
		//创建分页对象
		Pages<QueryMake> page = new Pages<QueryMake>();
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
		lists = service.selectQueryMakePage(auser,(page.getCurrentPage()-1)*page.getPageCount(),page.getPageCount());
		page.setPages(lists);
		request.setAttribute("page", page);
		return "/personalCenter/query_make2";
	}

	@RequestMapping("/updateAllPage")
	protected String updateAllPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String auser = request.getParameter("auser");
		String fid = request.getParameter("fid");
		service.updateQueryMake(Integer.parseInt(fid));
		List<QueryMake> lists = service.selectQueryMake(auser,null);
		//创建分页对象
		Pages<QueryMake> page = new Pages<QueryMake>();
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
		lists = service.selectQueryMake(auser,page);
		if(lists.size() == 0) {
			if(Integer.parseInt(currentPage)!=1) {
			page.setCurrentPage(Integer.parseInt(currentPage)-1);
				lists = service.selectQueryMakePage(auser,(page.getCurrentPage()-1)*page.getPageCount(),page.getPageCount());
			}
		}
		page.setPages(lists);
		request.setAttribute("page", page);
		return "/personalCenter/query_make2";
	}
}
