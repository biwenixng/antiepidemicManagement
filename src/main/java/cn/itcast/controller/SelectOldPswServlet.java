package cn.itcast.controller;

import cn.itcast.service.impl.UserServiceimpl;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.net.HttpURLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/selectOldPswServlet")
public class SelectOldPswServlet extends HttpServlet{
	/**
	 * 查原手机号码
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserServiceimpl service;

	@RequestMapping("/replacePwd")
    @ResponseBody
	protected int replacePwd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		int flag = 0;
		HttpSession session = req.getSession();
		String uname = (String) session.getAttribute("username");
		String opsw = (String) session.getAttribute("password");
		String oldPsw = req.getParameter("password");
		//输入密码 md5 加密
		oldPsw = DigestUtils.md5Hex(oldPsw);
		if(opsw.equals(oldPsw) == false) {
			flag = 0;
		}else if(opsw.equals(oldPsw) == true) {
			flag = 1;
		}
		return flag;
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req,resp);
	}
	
}
