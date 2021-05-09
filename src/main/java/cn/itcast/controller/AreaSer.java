package cn.itcast.controller;

import cn.itcast.domain.Area;
import cn.itcast.domain.Areax;
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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Area
 */
@Controller
@RequestMapping("/areaSer")
public class AreaSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private MyCenterService service;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value = request.getParameter("method");
		if(value.equals("selectAll")) {
			selectAll(request,response);
		}	
		if(value.equals("selectOne")) {
			selectOne(request,response);
		}
		if(value.equals("selectAllPage")) {
			selectAllPage(request,response);
		}
		if(value.equals("update")) {
			update(request,response);
		}
	}

	@RequestMapping("/update")
	private String update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String area = request.getParameter("area");
		String residence = province+city+area;
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		service.updatedizi(residence, username);
		request.setAttribute("msg", "修改成功！");
		return "personalCenter/a_dizi";
	}

	@RequestMapping("/selectAllPage")
	private List<Area>  selectAllPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String floorname = request.getParameter("floorname");
		List<Area> lists = service.getAreaQs(floorname);
		return lists;
	}

	@RequestMapping("/selectOne")
	private List<Area> selectOne(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String schoolname = request.getParameter("schoolname");
		List<Area> lists = service.getAreaByParentno(schoolname);
		return lists;
	}

	@RequestMapping("/selectAll")
	@ResponseBody
	private List<Areax> selectAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		List<Areax> lists = service.getAreaXq();
		return lists;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
