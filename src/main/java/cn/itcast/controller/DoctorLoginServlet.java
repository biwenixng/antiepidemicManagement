package cn.itcast.controller;

import cn.itcast.domain.DUserLogin;
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
@RequestMapping("/doctorLoginServlet")
public class DoctorLoginServlet extends HttpServlet {
    @Autowired
	private UserLogin service;
	private static final long serialVersionUID = 1L;

	public static List<HttpSession> kk = new ArrayList<HttpSession>();

    @RequestMapping("/doctorLogin")
	protected String doctorLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String uid = request.getParameter("did");
		String pwd = request.getParameter("dpwd");
		String npwd;
		if(uid == null && pwd == null){
			HttpSession session = request.getSession();
			uid = (String) session.getAttribute("doctorname");
			pwd = (String) session.getAttribute("password");
		}
		if (pwd.length() == 32) {
			npwd = pwd;
		} else {
			npwd = DigestUtils.md5Hex(pwd);
		}
		DUserLogin newLogin = new DUserLogin();
		newLogin.setUsername(uid);
		newLogin.setUserpassword(npwd);
		String message = service.doctorLogin(newLogin);
		if (message.equals("登录成功")) {
		    HttpSession session = request.getSession();
			session.setAttribute("doctorname", uid);
			session.setAttribute("password", npwd);
			kk.add(session);
			request.setAttribute("username", uid);
			return "/doctorindex/index";
		} else {
			request.setAttribute("message", message);
			return "/user/user_login/doctor_login";
		}
	}

}
