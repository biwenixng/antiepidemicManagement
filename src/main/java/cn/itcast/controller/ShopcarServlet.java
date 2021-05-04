package cn.itcast.controller;
import cn.itcast.domain.*;
import cn.itcast.service.ShoppingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ShopcarServlet
 */
@Controller
@RequestMapping("/shopcarServlet")
public class ShopcarServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	@Autowired
	private ShoppingsService service;
	private List<Shoponline> attribute=null;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String value = request.getParameter("method");	
		if ("selectAll_online".equals(value)) {
			selectAll_online(request, response);
		}
		if ("selectOne".equals(value)) {
			selectOne(request, response);
		}
		if ("selectBy".equals(value)) {
			selectBy(request, response);
		}
		if ("selectUse".equals(value)) {
			selectUse(request, response);
		}
		if ("selectClass".equals(value)) {
			selectClass(request, response);
		}
		if ("selectLike".equals(value)) {
			selectLike(request, response);
		}
		if ("selectPriceup".equals(value)) {
			selectPriceup(request, response);
		}
		if ("selectPricedown".equals(value)) {
			selectPricedown(request, response);
		}if ("selectInv".equals(value)) {
			selectInv(request, response);
		}
		if ("selectPriceto".equals(value)) {
			selectPriceto(request, response);
		}
		if ("selectshopcar".equals(value)) {
			selectshopcar(request, response);
		}
		if ("selectOrder".equals(value)) {
			selectOrder(request, response);
		}
		//if ("selectOrder1".equals(value)) {
			//selectOrder1(request, response);
		//}
		if ("orderAdd".equals(value)) {
			orderAdd(request, response);
		}
		
	}

	@RequestMapping("/selectAll_online")
	@ResponseBody
	protected List<Shoponline> selectAll_online(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		List<Shoponline> lists = service.selectAll_online();
		return lists;
	}

	@RequestMapping("/selectOne")
	protected String selectOne(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String cid = request.getParameter("cid");
		int id = 0;
		if (cid != null) {
			id = Integer.parseInt(cid);
		}
		Shoponline nes = service.selectInfo(id);
		request.setAttribute("shoponline", nes);
		return "/shop/select_shopping";
	}

	@RequestMapping("/selectBy")
	@ResponseBody
	protected List<Shoptype>  selectBy(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String specialname = request.getParameter("specialname");
		List<Shoptype> lists = service.selectType(specialname);
		return lists;
	}

	@RequestMapping("/selectUse")
	@ResponseBody
	protected List<Shopuse> selectUse(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String usename = request.getParameter("usename");
		List<Shopuse> lists = service.selectUse(usename);
		return lists;
	}

	@RequestMapping("/selectClass")
	@ResponseBody
	protected List<Shopclass> selectClass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String productname = request.getParameter("productname");
		List<Shopclass> lists = service.selectClass(productname);
		return lists;
	}


	@RequestMapping("/selectLike")
	@ResponseBody
	protected List<Shopselect> selectLike(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String synopsis = request.getParameter("synopsis");		
		List<Shopselect> lists = service.selectLike(synopsis);
		return lists;
	}

	@RequestMapping("/selectPriceup")
	@ResponseBody
	protected List<Shopsortpriceup> selectPriceup(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("-----------------");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		List<Shopsortpriceup> lists = service.selectPriceup();
		return lists;
	}

	@RequestMapping("/selectPricedown")
	@ResponseBody
	protected List<Shopsortpricedown> selectPricedown(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("-----------------");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		List<Shopsortpricedown> lists = service.selectPricedown();
		return lists;
	}

	@RequestMapping("/selectInv")
	@ResponseBody
	protected List<Shopsortinv> selectInv(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("-----------------");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		List<Shopsortinv> lists = service.selectInv();
		return lists;
	}

	@RequestMapping("/selectPriceto")
	@ResponseBody
	protected List<Shoppriceto>  selectPriceto(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String price1 = request.getParameter("price1");
		String price2 = request.getParameter("price2");	
		List<Shoppriceto> lists = service.selectPriceto(price1,price2);
		return lists;
	}

	@RequestMapping("/selectshopcar")
	protected String selectshopcar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("username") == null){
			return "user/user_login/user_login";
		}
		String cid = request.getParameter("cid");
		int id = 0;
		if (cid != null) {
			id = Integer.parseInt(cid);
		}
		Shoponline nes = service.selectInfo(id);
		//request.setAttribute("shoponline", nes);		
		//HttpSession session = request.getSession();
		//List<Shoponline> attribute =(List<Shoponline>) session.getAttribute("shoponlines");	
		
		if(attribute == null) {	
		
		attribute = new ArrayList<>();
		};
		if(id!=0) {
		attribute.add(nes);
		};
		//System.out.println("attribute:"+attribute);
		//session.setAttribute("shoponlines",attribute);
		request.setAttribute("shoponlines", attribute);
		return "/shop/shopcar";
	}
	@RequestMapping("/selectOrder")
	protected void selectOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String ordernumber = request.getParameter("ordernumber");
		Shoporder nes = service.shoporder(ordernumber);
		request.setAttribute("shoporder", nes);
		request.getRequestDispatcher("/shop/myorder.jsp").forward(request, response);
	}
	/*protected void selectOrder1(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String shopname = request.getParameter("shopname");
		Shoporder nes = service.shoporder(shopname);
		request.setAttribute("shoporder", nes);
		request.getRequestDispatcher("/shop/index1.jsp").forward(request, response);
	}*/


	@RequestMapping("/orderAdd")
	protected synchronized String orderAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String ordernumber = request.getParameter("ordernumber");
		String username = request.getParameter("username");
		String ordertime = request.getParameter("ordertime");
		String coupon = request.getParameter("coupon");
		String actualamount = request.getParameter("actualamount");
		String totalmoney = request.getParameter("totalmoney");
		String totalquantity = request.getParameter("totalquantity");
		String distribution = request.getParameter("distribution");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String cid = request.getParameter("cid");
		String number = request.getParameter("number");
		String picture = request.getParameter("picture");
		String inventory=request.getParameter("inventory");
		
		ordertime = ordertime.replace("/","-");
		ordertime = ordertime.replace("上午", "");
		ordertime = ordertime.replace("下午", "");
		picture = picture.substring(picture.lastIndexOf(request.getContextPath()) + request.getContextPath().length());
		Aorder aorders=new Aorder();
		aorders.setOrderNumber(ordernumber);
		aorders.setUserName(username);
		aorders.setOrderTime(ordertime);
		aorders.setCoupon(new BigDecimal(coupon));
		aorders.setActualAmount(new BigDecimal(actualamount));
		aorders.setTotalMoney(new BigDecimal(totalmoney));
		aorders.setTotalQuantity(Integer.parseInt(totalquantity));
		aorders.setDistribution(distribution);
		aorders.setAddress(address);
		aorders.setPhone(phone);
		//System.out.println(aorders);
		
		ShopOrders borders=new ShopOrders();
		borders.setOrderNumber(ordernumber);
		borders.setCid(Integer.parseInt(cid));
		borders.setNumber(Integer.parseInt(number));
		borders.setPicture(picture);
		
		Shopinventory inventorys=new Shopinventory();
		inventorys.setInventory(Integer.parseInt(inventory));
		inventorys.setCid(Integer.parseInt(cid));
		
		service.a_orderadd(aorders);
		service.b_orderadd(borders);
		service.update(inventorys);
		
		request.setAttribute("WIDout_trade_no", ordernumber);
		request.setAttribute("WIDtotal_amount", actualamount);
		request.setAttribute("WIDsubject",ordertime);
		request.setAttribute("WIDbody",cid);
		return "/pay/index1";
	}
}
