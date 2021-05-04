package cn.itcast.controller;

import cn.itcast.domain.AUserRegistered;
import cn.itcast.domain.Dormitory;
import cn.itcast.domain.Floor;
import cn.itcast.domain.School;
import cn.itcast.service.impl.UserLogin;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

@Controller
@RequestMapping("/userRegisteredServlet")
public class UserRegisteredServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserLogin userLogin;

	@RequestMapping("/registerNO1")
	protected String registerNO1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String idnumber = request.getParameter("cid");
		String name = request.getParameter("cname");
		String xq = request.getParameter("tower");
		String ld = request.getParameter("floor");
		String qs = request.getParameter("room");
		String residence = xq+ld+qs;
		String phone = request.getParameter("cphone");
		request.setAttribute("idnumber", idnumber);
		request.setAttribute("name", name);
		request.setAttribute("residence", residence);
		request.setAttribute("phone", phone);
		return "/user/user_login/user_registered2";
	}

	@RequestMapping("/findSchool")
	@ResponseBody
	protected List<School> findSchool(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		List<School> lists = userLogin.findSchool();
		return lists;
	}

	@RequestMapping("/userIdNumber")
	@ResponseBody
	protected void userIdNumber(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String cid = request.getParameter("cid");
		String message = userLogin.userIdNumber(cid);
		response.getWriter().print(message);
	}

	@RequestMapping("/findFloor")
	@ResponseBody
	protected List<Floor> findFloor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 楼栋
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String tower = request.getParameter("tower");
		List<Floor> lists = userLogin.findFloor(tower);
		return lists;
	}

	@RequestMapping("/findDormitory")
	@ResponseBody
	protected List<Dormitory> findDormitory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 寝室
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String floor = request.getParameter("floor");
		List<Dormitory> lists = userLogin.findDormitory(floor);
		return  lists;
	}

	@RequestMapping("/userPhone")
	@ResponseBody
	protected int userPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//检查手机号
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String cphone = request.getParameter("cphone");
		int message = userLogin.userPhone(cphone);
		return message;
	}


	@RequestMapping(value = "/userRegistered",produces = "text/html;charset=utf8")
	protected String userRegistered(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String idnumber = request.getParameter("idnumber");
		String name = request.getParameter("name");
		String residence = request.getParameter("residence");
		String phone = request.getParameter("phone");
		String username = request.getParameter("uid");
		String userpassword = request.getParameter("newpwd");
		AUserRegistered user = new AUserRegistered();
		user.setIdnumber(idnumber);
		user.setName(name);
		user.setPhone(phone);
		user.setResidence(residence);
		user.setUsername(username);
		//加密
		String newpwd = DigestUtils.md5Hex(userpassword);
		user.setPassword(newpwd);
		String message = userLogin.userRegistered(user);
		request.setAttribute("message", message);
		if(message.equals("注册成功")){
			return "/user/user_login/user_login";
		}else{
			return message;
		}
	}

	@RequestMapping("/userRegisteredUid")
	@ResponseBody
	protected String userRegisteredUid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//检查用户名
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String uid = request.getParameter("uid");
		String message = userLogin.userRegistered(uid);
		return message;
	}
//	@RequestMapping("/loginByPhone")
//	protected synchronized void  loginByPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=utf-8");
//		String mobile = request.getParameter("sjhm");
//		System.out.println(mobile);
//		String yzm = request.getParameter("yzm");
//		System.out.println(yzm);
//		HttpSession session = request.getSession();
//		String code = (String) session.getAttribute("code");
//		if (userLogin.userLogin2(mobile) == 1) {
//			if (yzm.equals(code)) {
//				// 登录成功，拿到用户名
//				String username = userLogin.phoneFindUserName(mobile);
//				Cookie cookie = new Cookie("username", username);
//				cookie.setMaxAge(60 * 60 * 2);
//				response.addCookie(cookie);
//				HttpSession session1 = request.getSession();
//				for (HttpSession k : UserLoginServlet.kk) {
//					if (username.equals(k.getAttribute("username"))) {
//						request.setAttribute("message", "此用户已在登录状态");
//						request.getRequestDispatcher("/user/user_login/user_login.jsp").forward(request, response);
//						return;
//					}
//				}
//				session1.setAttribute("username", username);
//				UserLoginServlet.kk.add(session1);
//				request.setAttribute("username",username );
//				request.getRequestDispatcher("/web/index.jsp").forward(request, response);
//			} else {
//				request.setAttribute("message", "验证码不正确，请重试");
//				request.getRequestDispatcher("/user/user_login/user_login2.jsp").forward(request, response);
//			}
//		}else if(userLogin.userLogin2(mobile) == 2) {
//			request.setAttribute("message", "该用户已登录，无法重复登录!");
//			request.getRequestDispatcher("/user/user_login/user_login2.jsp").forward(request, response);
//
//		}
//	}
}
