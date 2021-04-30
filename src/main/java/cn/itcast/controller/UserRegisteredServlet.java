package cn.itcast.controller;

import cn.itcast.domain.AUserRegistered;
import cn.itcast.domain.Dormitory;
import cn.itcast.domain.Floor;
import cn.itcast.domain.School;
import cn.itcast.service.impl.UserService;
import org.apache.commons.codec.digest.DigestUtils;
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
@Controller
@RequestMapping("/userRegisteredServlet")
public class UserRegisteredServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService userService;

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
		request.getRequestDispatcher("/user/user_login/user_registered2.jsp").forward(request, response);
		return "/user/user_login/user_registered2";
	}

	@RequestMapping("/findSchool")
	@ResponseBody
	protected List<School> findSchool(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		List<School> lists = userService.findSchool();
		return lists;
	}

	@RequestMapping("/userIdNumber")
	@ResponseBody
	protected void userIdNumber(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String cid = request.getParameter("cid");
		String message = userService.userIdNumber(cid);
		response.getWriter().print(message);
	}

	@RequestMapping("/findFloor")
	@ResponseBody
	protected List<Floor> findFloor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 楼栋
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String tower = request.getParameter("tower");
		List<Floor> lists = userService.findFloor(tower);
		return lists;
	}

	@RequestMapping("/findDormitory")
	@ResponseBody
	protected List<Dormitory> findDormitory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 寝室
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String floor = request.getParameter("floor");
		List<Dormitory> lists = userService.findDormitory(floor);
		return  lists;
	}

	@RequestMapping("/userPhone")
	@ResponseBody
	protected int userPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//检查手机号
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String cphone = request.getParameter("cphone");
		int message = userService.userPhone(cphone);
		return message;
	}


	@RequestMapping("/userRegistered")
	@ResponseBody
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
		String message = userService.userRegistered(user);
		request.setAttribute("message", message);
		return message;
	}
}
