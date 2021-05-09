package cn.itcast.controller;

import cn.itcast.domain.AUser;
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
 * Servlet implementation class query_Code
 */
@Controller
@RequestMapping("/query_Code")
public class query_Code extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private MyCenterService service;

    @RequestMapping("/selectAUser")
	@ResponseBody
	protected List<AUser> selectAUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		/* String path = request.getContextPath(); */
		String username = request.getParameter("username");
		List<AUser> lists = service.selectAUser(username);
		return lists;
	}
}
