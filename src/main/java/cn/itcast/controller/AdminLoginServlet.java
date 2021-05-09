package cn.itcast.controller;

import cn.itcast.domain.MUserLogin;
import cn.itcast.service.impl.UserLogin;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("/adminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

	@Autowired
	private UserLogin service;
	private static final long serialVersionUID = 1L;
	public static List<HttpSession> kk = new ArrayList<HttpSession>();

	@RequestMapping("/adminLogin")
	protected synchronized String adminLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		if(user == null && pwd == null){
			HttpSession session = request.getSession();
			user = (String) session.getAttribute("username");
			pwd = (String) session.getAttribute("password");
		}
		String npwd = DigestUtils.md5Hex(pwd);
		MUserLogin login = new MUserLogin();
		login.setUsername(user);
		login.setPassword(npwd);
		String message = service.adminLogin(login);
		if(message.equals("登录成功")) {
			Cookie cookie = new Cookie("username",user);
			cookie.setMaxAge(60*60*2);
			response.addCookie(cookie);
			HttpSession session = request.getSession();
			session.setAttribute("username", user);
			session.setAttribute("password",pwd);
			kk.add(session);
			String judge = service.AdminJudge(user);
			if(judge.equals("0")) {
				request.setAttribute("username",user );
				return "/admin/adminindex";
			}else {
				request.setAttribute("username",user );
				return "/admin/adminindex2";
			}			
		}else {
			request.setAttribute("message", message);
			return "/user/user_login/admin_login";
		}
		
	}

	@RequestMapping("/adminExit")
	protected String adminExit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		AdminLoginServlet.kk.remove(session);
		session.invalidate();
		return "redirect:/user/user_login/admin_login.jsp";
	}

}
