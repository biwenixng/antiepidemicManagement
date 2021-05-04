package cn.itcast.controller;

import cn.itcast.domain.*;
import cn.itcast.service.*;
import cn.itcast.service.impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("/doctorServlet")
public class DoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 655357892L;
	@Autowired
	private ClassifyService cService;
	@Autowired
	private SpecialService sService;
	@Autowired
	private UseService uService;
	@Autowired
	private CommodityService commService ;
	@Autowired
	private DoctorService doctorService ;
	@Autowired
	private ForwardService forwardService;
	@Autowired
	private UserLogin service ;
	@Autowired
	private UserLogin dao;

//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		Commodity commodity = new Commodity();
//		String realPath = request.getSession().getServletContext().getRealPath("/");
//		DiskFileItemFactory factory = new DiskFileItemFactory();
//		factory.setSizeThreshold(3 * 1024 * 1024);
//		File tempFile = new File(realPath + "/temp");
//		tempFile.mkdirs();
//		factory.setRepository(tempFile);
//		ServletFileUpload upload = new ServletFileUpload(factory);
//		upload.setSizeMax(3 * 1024 * 1024);
//		upload.setFileSizeMax(2 * 1024 * 1024);
//		if (upload.isMultipartContent(request)) {
//			try {
//				List<FileItem> items = upload.parseRequest(request);
//				FileItem fileItem = items.get(0);
//
//				Commodity queryCommodity = commService.queryCommodity(fileItem.getString("UTF-8"));
//				if (queryCommodity != null) {
//					request.setAttribute("msg", "select");
//					request.getRequestDispatcher("/doctorindex/append_commodity.jsp").forward(request, response);
//					return;
//				}
//				List<String> values = new ArrayList<String>();
//				for (FileItem item : items) {
//					if (item.isFormField()) {
//						values.add(item.getString("UTF-8"));
//					} else {
//						String name = item.getName();
//						String ftm[] = { ".jpg", ".gif", ".png" };
//						boolean value = false;
//						for (String fm : ftm) {
//							if (name.endsWith(fm)) {
//								value = true;
//							}
//						}
//
//						if (!value) {
//							request.setAttribute("msg", "format");
//							request.getRequestDispatcher("/doctorindex/append_commodity.jsp").forward(request,
//									response);
//							return;
//						}
//
//						Date date = new Date();
//						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//						String time = sdf.format(date);
//						String descPath = realPath + "/images/drug/" + time;
//						File descFile = new File(descPath);
//						descFile.mkdirs();
//						String[] listFiles = descFile.list();
//						value = false;
//						for (String file : listFiles) {
//							if (name.equals(file)) {
//								value = true;
//								break;
//							}
//						}
//						if (value) {
//							String end = name.substring(name.lastIndexOf("."));
//							name = UUID.randomUUID().toString().replace("-", "").toUpperCase() + end;
//						}
//						values.add("/images/drug/" + time + "/" + name);
//						File fastPath = new File(descFile, name);
//						item.write(fastPath);
//
//						File file = new File("F:/EP/EP/WebContent/images/drug/" + time + "/");
//						file.mkdirs();
//						File file2 = new File(file, name);
//						if (file2.exists()) {
//							file2.createNewFile();
//						}
//						OutputStream os = new FileOutputStream(file2);
//						byte[] bs = item.get();
//						os.write(bs);
//						os.flush();
//
//						if (os != null) {
//							os.close();
//						}
//
//						commodity = new Commodity();
//						commodity.setCommodityName(values.get(0));
//						commodity.setPrice(new BigDecimal(values.get(1)));
//						commodity.setInventory(Integer.parseInt(values.get(2)));
//						Special special = sService.querySpecial( values.get(3));
//						commodity.setSpecial(special);
//						Use use = uService.queryUse( values.get(4));
//						commodity.setUse(use);
//						commodity.setSynopsis(values.get(5));
//						Classify classify = cService.queryClassify( values.get(6));
//						commodity.setClassify(classify);
//						commodity.setWeight(Integer.parseInt(values.get(7)));
//						commodity.setVaildty(values.get(8));
//						commodity.setShoppingImg(values.get(9));
//
//						commService.addCommodity( commodity);
//
//
//						request.setAttribute("msg", "success");
//						request.getRequestDispatcher("/doctorindex/append_commodity.jsp").forward(request, response);
//					}
//				}
//			} catch (Exception e) {
//				request.setAttribute("msg", "size");
//				request.getRequestDispatcher("/doctorindex/append_commodity.jsp").forward(request, response);
//				return;
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//	}

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("queryDoctor".equals(method)) {
			queryDoctor(request, response);
		} else if ("subScribe".equals(method)) {
			subScribe(request, response);
		} else if ("showCommodity".equals(method)) {
			showCommodity(request, response);
		} else if ("queryClassify".equals(method)) {
			queryClassify(request, response);
		} else if ("querySpecial".equals(method)) {
			querySpecial(request, response);
		} else if ("queryUse".equals(method)) {
			queryUse(request, response);
		} else if ("modifyState".equals(method)) {
			modifyState(request, response);
		} else if ("modifyCommodity".equals(method)) {
			modifyCommodity(request, response);
		} else if ("confirmModification".equals(method)) {
			confirmModification(request, response);
		} else if ("showMessage".equals(method)) {
			showMessage(request, response);
		} else if ("showCurrentPage".equals(method)) {
			showCurrentPage(request, response);
		} else if ("queryCommodityId".equals(method)) {
			queryCommodityId(request, response);
		} else if ("queryDoctor".equals(method)) {
			queryDoctor(request, response);
		} else if ("appointment".equals(method)) {
			appointment(request, response);
		} else if ("removeReservation".equals(method)) {
			removeReservation(request, response);
		} else if ("showTimeMessage".equals(method)) {
			showTimeMessage(request, response);
		} else if ("queryDrug".equals(method)) {
			queryDrug(request, response);
		} else if ("exit".equals(method)) {
			exit(request, response);
		}
	}

	@RequestMapping("/showTimeMessage")
	protected void showTimeMessage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		String doctorName = null;
		for (Cookie cookie : cookies) {
			if ("doctorname".equals(cookie.getName())) {
				doctorName = cookie.getValue();
				break;
			}
		}
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String format = sdf.format(date);
		

		List<Forward> queryTimeMessage = forwardService.queryTimeMessage( doctorName, format);

		if (queryTimeMessage.size() == 0) {
			request.setAttribute("message", "error");
			request.setAttribute("msg", null);
			request.getRequestDispatcher("/doctorindex/query_message2.jsp").forward(request, response);
			return;
		}

		
		request.setAttribute("message", queryTimeMessage);
		request.getRequestDispatcher("/doctorindex/query_message2.jsp").forward(request, response);
	}

	protected void removeReservation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fid = request.getParameter("fid");
		String show = request.getParameter("show");
		

		forwardService.removeReservation( show, Integer.parseInt(fid));

		Cookie[] cookies = request.getCookies();
		String doctorName = null;
		for (Cookie cookie : cookies) {
			if ("doctorname".equals(cookie.getName())) {
				doctorName = cookie.getValue();
				break;
			}
		}

		List<Forward> queryForwardAll = forwardService.queryForwardAll( doctorName);
		request.setAttribute("message", queryForwardAll);
		request.getRequestDispatcher("/doctorindex/query_message2.jsp").forward(request, response);
	}

	protected void queryDrug(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");

		if (name == "") {
			String page = request.getParameter("page");
			request.setAttribute("msg", "error");
			request.getRequestDispatcher("/doctorindex/" + page).forward(request, response);
			return;
		}

		
		Commodity queryCommodity = commService.queryCommodity( name);

		if (queryCommodity == null) {
			String page = request.getParameter("page");
			request.setAttribute("msg", "warning");
			request.getRequestDispatcher("/doctorindex/" + page).forward(request, response);
			return;
		}

		
		request.setAttribute("item", queryCommodity);
		request.getRequestDispatcher("/doctorindex/show_commodity.jsp").forward(request, response);
	}

	@RequestMapping("/queryDoctor")
	@ResponseBody
	protected List<Doctor> queryDoctor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Doctor> queryDoctorAll = doctorService.queryDoctorAll();
		return queryDoctorAll;
	}
	@RequestMapping("/showMessage")
	@ResponseBody
	protected List<Forward>  showMessage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String doctorName = (String) session.getAttribute("doctorname");
		List<Forward> queryForwardAll = forwardService.queryForwardAll(doctorName);
		return queryForwardAll;
	}

	protected void queryCommodityId(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cid = request.getParameter("cid");
		Commodity queryCommodity = commService.queryCommodity(Integer.parseInt(cid));
//		String json = gson.toJson(queryCommodity);
//		response.getWriter().print(json);
	}

	protected void confirmModification(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cid = request.getParameter("cid");
		String productName = request.getParameter("productName");
		String price = request.getParameter("price");
		String inventory = request.getParameter("inventory");
		String special = request.getParameter("special");
		String use = request.getParameter("use");
		String synopsis = request.getParameter("synopsis");
		String classify = request.getParameter("classify");
		String weight = request.getParameter("weight");
		String expirationDate = request.getParameter("expirationDate");
		
		Commodity commodity = new Commodity();
		commodity.setCommodityName(productName);
		commodity.setPrice(new BigDecimal(price));
		commodity.setInventory(Integer.parseInt(inventory));
		Special specia = sService.querySpecial(special);
		commodity.setSpecial(specia);
		Use queryUse = uService.queryUse(use);
		commodity.setUse(queryUse);
		commodity.setSynopsis(synopsis);
		Classify queryClassify = cService.queryClassify( classify);
		commodity.setClassify(queryClassify);
		commodity.setWeight(Integer.parseInt(weight));
		commodity.setVaildty(expirationDate);
		commodity.setCid(Integer.parseInt(cid));

		boolean modifyCommodity = commService.modifyCommodity( commodity);
		if (modifyCommodity) {
			request.setAttribute("msg", "success");
		}
		else {
			request.setAttribute("msg", "error");
			request.getRequestDispatcher("/doctorindex/alter_commodity.jsp").forward(request, response);
		}
	}

	protected void modifyCommodity(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cid = request.getParameter("cid");
		Commodity commodity = commService.queryCommodity(Integer.parseInt(cid));
		request.setAttribute("commodity", commodity);
		request.getRequestDispatcher("/doctorindex/commodity_commodity.jsp").forward(request, response);
	}

	protected void modifyState(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String show = request.getParameter("show");
		String cid = request.getParameter("cid");
		if (show.equals("1")) {
			show = "0";
		} else {
			show = "1";
		}

		commService.removeCommodity(Integer.parseInt(cid), show);
		showCurrentPage(request, response);
	}

	protected void showCommodity(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Commodity> queryCommodityAll = commService.queryCommodityAll(null);
		Page<Commodity> page = new Page<Commodity>();
		String currentPage = request.getParameter("currentPage");
		if (currentPage != null) {
			page.setCurrentPage(Integer.parseInt(currentPage));
		}
		page.setDateTotal(queryCommodityAll.size());
		String pageTotal = request.getParameter("pageTotal");
		if (pageTotal != null) {
			page.setPageTotal(Integer.parseInt(pageTotal));
		}
		List<Commodity> currentList = commService.queryCommodityAll( page);
		page.setPages(currentList);
//		String json = gson.toJson(page);
//		response.getWriter().println(json);
	}

	protected void showCurrentPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Commodity> queryCommodityAll = commService.queryCommodityAll(null);
		Page<Commodity> page = new Page<Commodity>();
		String currentPage = request.getParameter("currentPage");
		if (currentPage != null) {
			page.setCurrentPage(Integer.parseInt(currentPage));
		}
		page.setDateTotal(queryCommodityAll.size());
		String pageTotal = request.getParameter("pageTotal");
		if (pageTotal != null) {
			page.setPageTotal(Integer.parseInt(pageTotal));
		}
		List<Commodity> currentList = commService.queryCommodityAll( page);
		page.setPages(currentList);
		request.setAttribute("page", page);
		String transmit = request.getParameter("transmit");
		request.getRequestDispatcher("/doctorindex/" + transmit).forward(request, response);
	}

	protected void queryClassify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Classify> queryClassify = cService.queryClassify();
//		String json = gson.toJson(queryClassify);
//		response.getWriter().println(json);
	}

	protected void querySpecial(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Special> querySpecial = sService.querySpecial();
//		String json = gson.toJson(querySpecial);
//		response.getWriter().println(json);
	}

	protected void queryUse(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Use> queryUse = uService.queryUse();
//		String json = gson.toJson(queryUse);
//		response.getWriter().println(json);
	}

	@RequestMapping("/subScribe")
	protected String subScribe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		HttpSession session = request.getSession();
		String sessionName = (String) session.getAttribute("username");
		if (sessionName == null) {
			return "user/user_login/user_login";
		}
		AUserLogin aUserLogin = new AUserLogin();
		aUserLogin.setUsername(sessionName);

		AUserLogin user = service.getUser(aUserLogin);
		request.setAttribute("username", username);
		request.setAttribute("name", name);
		request.setAttribute("user", user);
		return "/doctor/user_forward";
	}
	@RequestMapping("/appointment")
	protected String appointment(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String doctorUser = req.getParameter("doctorUser");
		String patientUser = req.getParameter("patientUser");
		String phone = req.getParameter("phone");
		String appointmentTime = req.getParameter("appointmentTime");

		appointmentTime = appointmentTime.replace("T", " ");
		appointmentTime += ":00";

		Date data = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Forward forward = new Forward();
		forward.setDuser(doctorUser);
		forward.setAuser(patientUser);
		forward.setPhone(phone);
		forward.setAppointmentTime(appointmentTime);
		forward.setAppointTime(sdf.format(data));
		
		int forWord = service.forWord(forward);
		if (forWord == 1) {
			req.setAttribute("msg", "success");
		} else {
			req.setAttribute("msg", "error");
		}
		return "/doctor/user_forward";
	}
	@RequestMapping("/exit")
	protected String exit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		return "/user/user_login/doctor_login";
	}
}
