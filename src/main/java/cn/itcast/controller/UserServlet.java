package cn.itcast.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.itcast.domain.Site;
import cn.itcast.domain.User;
import cn.itcast.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Servlet implementation class UserServlet
 */
@Controller
@RequestMapping("/userServlet")
public class UserServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService service;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String value = req.getParameter("method");
		if(value.equals("selectByUsername")) {
			selectByUsername(req, resp);
		}else if(value.equals("selectSiteAll")) {
			selectSiteAll(req,resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

	@RequestMapping("/selectByUsername")
	@ResponseBody
	protected User selectByUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession();
		String uname = (String) session.getAttribute("username");
		User user = service.selectByUsername(uname);
		return user;
	}

	@RequestMapping("/selectSiteAll")
	@ResponseBody
	protected List<Site> selectSiteAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		List<Site> list = service.selectSiteAll();
		return list;
	}
}
