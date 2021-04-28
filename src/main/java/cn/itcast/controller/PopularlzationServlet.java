package cn.itcast.controller;

import cn.itcast.domain.Popularlzations;
import cn.itcast.service.PopularlzationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@Controller
@RequestMapping("/popularlzation")
public class PopularlzationServlet extends HttpServlet {
	
	private static final long serialVersionUID = 2342343243325432L;
	@Autowired
	private PopularlzationService service;

	@Override
	@RequestMapping("/doget")
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {

	}

	@RequestMapping("/selectAll")
	@ResponseBody
	protected List<Popularlzations> selectAll()  {
		List<Popularlzations> list = service.selectAll();
		return list;
	}

	@RequestMapping("/selectOne")
	protected void selectOne(){

	}
}
