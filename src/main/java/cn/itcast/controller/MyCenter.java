package cn.itcast.controller;

import cn.itcast.domain.Pages;
import cn.itcast.domain.QueryUploadInformation;
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
 * Servlet implementation class MyCenter
 */
@Controller
@RequestMapping("/myCenter")
public class MyCenter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private MyCenterService service;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String value = request.getParameter("method");
		if(value.equals("selectAll")) {
			selectAll(request,response);
		}
		if(value.equals("selectAllPage")) {
			selectAllPage(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
	}

	@RequestMapping("/selectAll")
	@ResponseBody
	protected Pages<QueryUploadInformation> selectAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		List<QueryUploadInformation> lists = service.selectQueryUploadInformation(username,null);
		//创建分页对象
		Pages<QueryUploadInformation> page = new Pages<QueryUploadInformation>();
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
		lists = service.selectQueryUploadInformationPage(username,(page.getCurrentPage()-1)*page.getPageCount(),page.getPageCount());
		for(int i = 0 ; i < lists.size() ; i++){
		    if(lists.get(i).getState().equals("2")) {
	           	 lists.get(i).setState("确诊");
	        }
            if(lists.get(i).getState().equals("1")) {
           	 lists.get(i).setState("正常");
            }
            if(lists.get(i).getState().equals("0")) {
           	 lists.get(i).setState("疑似");
            }
       }
		//集合 >> json
		page.setPages(lists);
	    return page;
	}

	@RequestMapping("/selectAllPage")
	protected String selectAllPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		List<QueryUploadInformation> lists = service.selectQueryUploadInformation(username,null);
		//创建分页对象
		Pages<QueryUploadInformation> page = new Pages<QueryUploadInformation>();
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
		lists = service.selectQueryUploadInformationPage(username,(page.getCurrentPage()-1)*page.getPageCount(),page.getPageCount());
		for(int i = 0 ; i < lists.size() ; i++){
			if(lists.get(i).getState().equals("2")) {
	           	 lists.get(i).setState("确诊");
	        }
            if(lists.get(i).getState().equals("1")) {
           	 lists.get(i).setState("正常");
            }
            if(lists.get(i).getState().equals("0")) {
           	 lists.get(i).setState("疑似");
            }
       }		
		page.setPages(lists);
		request.setAttribute("page", page);
		return "/personalCenter/query_upload_information2";
		
	}

}
