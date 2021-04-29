package cn.itcast.controller;

import cn.itcast.domain.AUserLogin;
import cn.itcast.service.impl.UserService;
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
@RequestMapping("/userLoginServlet")
public class UserLoginServlet extends HttpServlet {
	@Autowired
	private UserService service;

	private static final long serialVersionUID = 1L;
	public static List<HttpSession> kk = new ArrayList<HttpSession>();

	@RequestMapping("/login")
	protected String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		String npwd ;
		if(pwd.length()==32) {
			npwd = pwd;
		}else {
			 npwd = DigestUtils.md5Hex(pwd);
		}
		AUserLogin newLogin = new AUserLogin();
		newLogin.setUsername(uid);
		newLogin.setUserpassword(npwd);
		String message = service.userLogin(newLogin);
		if (message.equals("登录成功")) {
			/*Cookie kkk = new Cookie("judge","1");
			kkk.setMaxAge(60);
			response.addCookie(kkk);*/
			String rememenber = request.getParameter("rememenber");
			if (rememenber != null) {
				Cookie cook1 = new Cookie("username", uid);
				Cookie cook2 = new Cookie("password", npwd);
				cook1.setMaxAge(60 * 60 * 2);
				cook2.setMaxAge(60 * 60 * 2);
				response.addCookie(cook1);
				response.addCookie(cook2);
			} else {
				Cookie cookie1 = new Cookie("username", uid);
				Cookie cookie2 = new Cookie("password", null);
				cookie1.setMaxAge(60*2*60);
				cookie2.setMaxAge(0);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
			}
			HttpSession session = request.getSession();
//			session.setMaxInactiveInterval(60);
//			for (HttpSession k : kk) {
//				if (uid.equals(k.getAttribute("username"))) {
//					request.setAttribute("message", "此用户已在登录状态");
//					request.getRequestDispatcher("/user/user_login/user_login.jsp").forward(request, response);
//					return;
//				}
//			}
			session.setAttribute("username", uid);
			kk.add(session);
			request.setAttribute("username",uid );
//			request.getRequestDispatcher("/web/index.jsp").forward(request, response);
			return "index";
		} else {
			request.setAttribute("message", message);
//			request.getRequestDispatcher("/user/user_login/user_login.jsp").forward(request, response);
			return "user/user_login/user_login";
		}
	}

	@RequestMapping("/logout")
	private String logout(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}
}