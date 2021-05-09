package cn.itcast.controller;

import cn.itcast.domain.Message;
import cn.itcast.domain.User;
import cn.itcast.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/sucessUploadInfoServlet")
public class SucessUploadInfoServlet extends HttpServlet{

	/**
	 * 上传用户每日信息（体温、所经过地点、更新积分、更新健康状态信息） 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService service;


	@RequestMapping("/uploadInfo")
	protected void uploadInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		Message msg = new Message();
		//cookie 获取用户
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("username");
		User user = service.selectByUsername(username);
		msg.setUsername(username);
		double temperature = Double.parseDouble(req.getParameter("userCelsius"));
		msg.setTemperature(temperature);
		// 1是正常  0是疑似  2是确诊 
		String state = "1";
		if(temperature > 37.5) {
			state = "0";
		}
		msg.setState(state);
		String itinerary = req.getParameter("LuCheng");
		itinerary = itinerary.replace(",", "_");
		msg.setJourney(itinerary);
		Date data = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd :HH:mm:ss");
		String datetime = dateFormat.format(data);
		msg.setUploadtime(datetime);
		int flag = service.uploadInfo(msg);
		if(flag == 1) {
			user.setUsername(username);
			user.setIntegral(user.getIntegral()+20);
			user.setHealth(msg.getState());
			service.updateJfHealth(user);
		}
	}
}
