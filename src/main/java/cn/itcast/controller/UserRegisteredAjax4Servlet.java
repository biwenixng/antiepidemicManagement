package cn.itcast.controller;

import cn.itcast.domain.School;
import cn.itcast.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping("/userRegisteredAjax4Servlet")
public class UserRegisteredAjax4Servlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService userService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		List<School> lists = userService.findSchool();
//		Gson gson = new Gson();
//		String json = gson.toJson(lists);
//		response.getWriter().println(json);
	}

}
