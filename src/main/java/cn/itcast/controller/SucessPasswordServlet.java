package cn.itcast.controller;

import cn.itcast.service.impl.UserServiceimpl;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

@Controller
@RequestMapping("/sucessPasswordServlet")
public class SucessPasswordServlet extends HttpServlet{

	/**
	 * 修改密码成功
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserServiceimpl service;

	@RequestMapping("/updatePasssword")
	protected String updatePasssword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();

		String username = (String) session.getAttribute("username");
		String newpsw = req.getParameter("agipsw");
		newpsw = DigestUtils.md5Hex(newpsw);
		int flag =  service.updatePasssword(username, newpsw);
		session.invalidate();
		if(flag == 1 ){
			return "redirect:/user/user_login/user_login.jsp";
		}else{
			return "/personalCenter/update_Password";
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
}
