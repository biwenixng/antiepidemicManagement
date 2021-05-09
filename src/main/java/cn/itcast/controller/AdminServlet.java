package cn.itcast.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.domain.*;
import cn.itcast.service.*;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * @author zj
 *
 */
@Controller
@RequestMapping("/adminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private AdminBossService admin;
	@Autowired
	private DoctorAdminService doctor1;
	@Autowired
	private OrderAdminService from;
	@Autowired
	private NewsAdminService news;
	@Autowired
	private UserAdminService useradmin;
	@Autowired
	private HomePageContentService home;
	private Gson gson = new Gson();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getParameter("method");
		if ("adminAll".equals(method)) {
			adminAll(request, response);
		} else if ("adminPageAll".equals(method)) {
			adminPageAll(request, response);
		} else if ("removeAdmin".equals(method)) {
			removeAdmin(request, response);
		} else if ("addAdmin".equals(method)) {
			addAdmin(request, response);
		}	

		else if ("doctorAll".equals(method)) {
			doctorAll(request, response);
		} else if ("doctorPageAll".equals(method)) {
			doctorPageAll(request, response);
		} else if ("removeDoctor".equals(method)) {
			removeDoctor(request, response);
		}else if ("removeDoctorTow".equals(method)) {
			removeDoctorTow(request, response);
		}	else if ("revamapDoctor".equals(method)) {
			revamapDoctor(request, response);
		}else if ("selectNamed".equals(method)) {
			selectNamed(request, response);
		}

		else if ("fromAll".equals(method)) {
			fromAll(request, response);
		} else if ("fromPageAll".equals(method)) {
			fromPageAll(request, response);
		}else if ("selectfromt".equals(method)) {
			selectfromt(request, response);
		}

		else if ("newsAll".equals(method)) {
			newsAll(request, response);
		} else if ("newsPageAll".equals(method)) {
			newsPageAll(request, response);
		} else if ("removeNews".equals(method)) {
			removeNews(request, response);
		} else if ("newsTime".equals(method)) {
			newsTime(request, response);
		} else if ("newsTit".equals(method)) {
			newsTit(request, response);
		} else if ("selectTimen".equals(method)) {
			selectTimen(request, response);
		} else if ("selectTitlen".equals(method)) {
			selectTitlen(request, response);
		}else if ("removeNewsTow".equals(method)) {
			removeNewsTow(request, response);
		} 

		else if ("useradminAll".equals(method)) {
			useradminAll(request, response);
		} else if ("useradminPageAll".equals(method)) {
			useradminPageAll(request, response);
		} else if ("removeUseradmin".equals(method)) {
			removeUseradmin(request, response);
		}else if ("removeUseradminTow".equals(method)) {
			removeUseradminTow(request, response);
		} else if ("revamapUser".equals(method)) {
			revamapUser(request, response);
		}	else if ("selectNameu".equals(method)) {
			selectNameu(request, response);
		}
		
		else if ("homeAll".equals(method)) {
			homeAll(request, response);
		} else if ("homePageAll".equals(method)) {
			homePageAll(request, response);
		
		} else if ("homeNum".equals(method)) {
			homeNum(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String realPath = request.getSession().getServletContext().getRealPath("/");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置缓存大小
		factory.setSizeThreshold(3 * 1024 * 1024);
		// 设置临时目录
		File tempFile = new File(realPath + "/temp");
		tempFile.mkdirs();
		factory.setRepository(tempFile);
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(3 * 1024 * 1024);
		// 设定单个表单项的大小
		upload.setFileSizeMax(2 * 1024 * 1024);
		List<String> values = new ArrayList<String>();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> items = upload.parseRequest(request);
				for (FileItem item : items) {
					if (item.isFormField()) {
						values.add(item.getString("utf-8"));
					} else {
						String name = item.getName();
						boolean value = false;
						Date date = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
						String time = sdf.format(date);
						String descPath = realPath + "/images/drug/" + time;
						File descFile = new File(descPath);
						descFile.mkdirs();
						String[] listFiles = descFile.list();
						for (String file : listFiles) {
							if (name.equals(file)) {
								value = true;
								break;
							}
						}
						if (value) {
							String end = name.substring(name.lastIndexOf("."));
							name = UUID.randomUUID().toString().replace("-", "").toUpperCase() + end;
						}
						
						values.add("/images/drug/" + time + "/" + name);						
						File fastPath = new File(descFile, name);
						item.write(fastPath);
						File file = new File("D:/zhuomian/wengjian/EP/WebContent/images/drug/" + time + "/");
						file.mkdirs();
						File file2 = new File(file, name);
						if (file2.exists()) {
							file2.createNewFile();
						}
						OutputStream os = new FileOutputStream(file2);
						byte[] bs = item.get();
						os.write(bs);
						os.flush();

						if (os != null) {
							os.close();
						}
						String password = values.get(2);
						String passWord = DigestUtils.md5Hex(password);
						Boolean yes = doctor1.insertIntoDoctor(values.get(0),passWord, values.get(3), values.get(4), values.get(5));
						if(yes == true) {
							request.setAttribute("msgs", "添加医生成功");
							request.getRequestDispatcher("/admin/add_doctor.jsp").forward(request, response);
						}else {
							request.setAttribute("msgs", "添加医生失败!输入错误");
							request.getRequestDispatcher("/admin/add_doctor.jsp").forward(request, response);
						}
					}
				}
			} catch (FileUploadException e) {
				request.setAttribute("msgs", "文件大小过大！");
				request.getRequestDispatcher("/admin/add_doctor.jsp").forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	}
	
	
	//管理员
	protected void adminAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<AdminBoss> adminBoss = admin.selectAdmin(null);
		Page<AdminBoss> page = new Page<AdminBoss>();
		String currentPage = request.getParameter("currentPage");
		int i = Integer.parseInt(currentPage);
		// 当前页数
		page.setCurrentPage(i);
		// 设置数据总量
		page.setDateTotal(adminBoss.size());
		String pageTotal = request.getParameter("pageTotal");
		// 设置每页数据量
		page.setPageTotal(Integer.parseInt(pageTotal));
		List<AdminBoss> pageAdmin = admin.selectAdmin(page);
		// 设置显示数据
		page.setPages(pageAdmin);
		String json = gson.toJson(page);
		response.getWriter().print(json);
	}

	protected void adminPageAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<AdminBoss> adminBoss = admin.selectAdmin(null);
		Page<AdminBoss> page = new Page<AdminBoss>();
		String currentPage = request.getParameter("currentPage");
		// 当前页数
		page.setCurrentPage(Integer.parseInt(currentPage));
		// 设置数据总量
		page.setDateTotal(adminBoss.size());
		String pageTotal = request.getParameter("pageTotal");
		// 设置每页数据量
		page.setPageTotal(Integer.parseInt(pageTotal));
		List<AdminBoss> pageAdmin = admin.selectAdmin(page);
		// 设置显示数据
		page.setPages(pageAdmin);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/admin/del_admin2.jsp").forward(request, response);
	}

	protected void removeAdmin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String show = request.getParameter("show");
		String userName = request.getParameter("userName");
		admin.delectAdmin(userName, show);
		adminPageAll(request, response);
	}

	protected void addAdmin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("user");
		String password = request.getParameter("pwd");
		Map<String, Boolean> maps = new HashMap<>();
		List<AdminBoss> usern = admin.selectAdmin(null);
		usern.get(0);
		String passWord = DigestUtils.md5Hex(password);
		Boolean ifs;
		for(int i = 0; i < usern.size();i++) {
			if(usern.get(i).getUserName() == userName) {
				ifs = false;
				break;
			}else {
				ifs = true;
			}
		}
		ifs = admin.addAdmin(userName, passWord);
		maps.put("ifs", ifs);
		String json = gson.toJson(maps);
		response.getWriter().print(json);
	}

	// 医生
	protected void doctorAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<DoctorAdminBean> doctorAll = doctor1.selectAllDoctor(null);
		Page<DoctorAdminBean> page = new Page<>();
		// 设置每页数据量
		String pageTotal = request.getParameter("pageTotal");
		page.setPageTotal(Integer.parseInt(pageTotal));
		String currentPage = request.getParameter("currentPage");
		// 当前页数
		page.setCurrentPage(Integer.parseInt(currentPage));
		// 设置数据总量
		page.setDateTotal(doctorAll.size());
		List<DoctorAdminBean> pagedoctor = doctor1.selectAllDoctor(page);
		// 设置显示数据
		page.setPages(pagedoctor);
		String json = gson.toJson(page);
		response.getWriter().print(json);
	}

	protected void doctorPageAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<DoctorAdminBean> doctorAll = doctor1.selectAllDoctor(null);
		Page<DoctorAdminBean> page = new Page<>();
		String currentPage = request.getParameter("currentPage");
		// 当前页数
		page.setCurrentPage(Integer.parseInt(currentPage));
		// 设置数据总量
		page.setDateTotal(doctorAll.size());
		String pageTotal = request.getParameter("pageTotal");
		// 设置每页数据量
		page.setPageTotal(Integer.parseInt(pageTotal));
		List<DoctorAdminBean> pagedoctor = doctor1.selectAllDoctor(page);
		// 设置显示数据
		page.setPages(pagedoctor);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/admin/query_doctor2.jsp").forward(request, response);
	}

	protected void removeDoctor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String show = request.getParameter("show");
		String userName = request.getParameter("userName");
		doctor1.deleteDoctor(userName, show);
		doctorPageAll(request, response);

	}
	protected void removeDoctorTow(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String show = request.getParameter("show");
		String userName = request.getParameter("userName");
		doctor1.deleteDoctor(userName, show);
		List<DoctorAdminBean> page = doctor1.selectDoctoru(userName);
		request.setAttribute("page",page);
		request.getRequestDispatcher("/admin/query_doctor3.jsp").forward(request, response);
		
	}
	

	protected void revamapDoctor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("userName");
		List<DoctorAdminBean> page = doctor1.selectDoctoru(username);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/admin/revamapDoctor.jsp").forward(request, response);
	}
	protected void selectNamed(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String name = request.getParameter("selname");
			if(name == "") {
				request.setAttribute("msg","请输入校医姓名");
				request.getRequestDispatcher("/admin/query_doctor3.jsp").forward(request, response);
			}else {
				List<DoctorAdminBean> page =doctor1.selectDoctor(name);
				request.setAttribute("page",page);
				request.getRequestDispatcher("/admin/query_doctor3.jsp").forward(request, response);
			}
		
	}
	
	
	
	
	// -----------------------------------订单-------------------------------

	protected void fromAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<OrderAdmin> froms = from.selectOrder(null);
		Page<OrderAdmin> page = new Page<>();
		// 设置每页数据量
		String pageTotal = request.getParameter("pageTotal");
		page.setPageTotal(Integer.parseInt(pageTotal));
		String currentPage = request.getParameter("currentPage");
		// 当前页数
		page.setCurrentPage(Integer.parseInt(currentPage));
		// 设置数据总量
		page.setDateTotal(froms.size());
		List<OrderAdmin> pagefrom = from.selectOrder(page);
		// 设置显示数据
		page.setPages(pagefrom);
		String json = gson.toJson(page);
		response.getWriter().print(json);
	}

	protected void fromPageAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<OrderAdmin> froms = from.selectOrder(null);
		Page<OrderAdmin> page = new Page<>();
		// 设置每页数据量
		String pageTotal = request.getParameter("pageTotal");
		page.setPageTotal(Integer.parseInt(pageTotal));
		String currentPage = request.getParameter("currentPage");
		// 当前页数
		page.setCurrentPage(Integer.parseInt(currentPage));
		// 设置数据总量
		page.setDateTotal(froms.size());
		List<OrderAdmin> pagefrom = from.selectOrder(page);
		// 设置显示数据
		page.setPages(pagefrom);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/admin/query_from2.jsp").forward(request, response);
	}

	protected void fromtimePageAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String time = request.getParameter("time");
		List<OrderAdmin> fromtime = from.selectOrder(time, null);
		Page<OrderAdmin> page = new Page<OrderAdmin>();
		String currentPage = request.getParameter("currentPage");
		// 当前页数
		page.setCurrentPage(Integer.parseInt(currentPage));
		// 设置数据总量
		page.setDateTotal(fromtime.size());
		String pageTotal = request.getParameter("pageTotal");
		// 设置每页数据量
		page.setPageTotal(Integer.parseInt(pageTotal));
		List<OrderAdmin> froms = from.selectOrder(time, page);
		// 设置显示数据
		page.setPages(froms);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/admin/query_from2.jsp").forward(request, response);
	}
	protected void selectfromt(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String time = request.getParameter("addtimes");
			if(time=="") {
				request.setAttribute("msg","请输入日期");
				request.getRequestDispatcher("/admin/query_from3.jsp").forward(request, response);
			}else {
			List<OrderAdmin> page = from.selectOrder(time, null);
			request.setAttribute("page",page);
			request.getRequestDispatcher("/admin/query_from3.jsp").forward(request, response);
			}
	}

	// -新闻----------------------------------------
	protected void newsAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<PopularlZation> pop = news.selectAllNews(null);
		Page<PopularlZation> page = new Page<PopularlZation>();
		String currentPage = request.getParameter("currentPage");
		// 当前页数
		page.setCurrentPage(Integer.parseInt(currentPage));
		// 设置数据总量
		page.setDateTotal(pop.size());
		String pageTotal = request.getParameter("pageTotal");
		// 设置每页数据量
		page.setPageTotal(Integer.parseInt(pageTotal));
		List<PopularlZation> pagepop = news.selectAllNews(page);
		// 设置显示数据
		page.setPages(pagepop);
		String json = gson.toJson(page);
		response.getWriter().print(json);
	}

	protected void newsPageAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<PopularlZation> pop = news.selectAllNews(null);
		Page<PopularlZation> page = new Page<PopularlZation>();
		String currentPage = request.getParameter("currentPage");
		// 当前页数
		page.setCurrentPage(Integer.parseInt(currentPage));
		// 设置数据总量
		page.setDateTotal(pop.size());
		String pageTotal = request.getParameter("pageTotal");
		// 设置每页数据量
		page.setPageTotal(Integer.parseInt(pageTotal));
		List<PopularlZation> pagepop = news.selectAllNews(page);
		// 设置显示数据
		page.setPages(pagepop);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/admin/query_knowledge2.jsp").forward(request, response);
	}

	protected void removeNews(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String show = request.getParameter("show");
		String pids = request.getParameter("pid");
		int pid = Integer.parseInt(pids);
		news.deleteNews(pid, show);
		newsPageAll(request, response);
	}
	protected void removeNewsTow(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String show = request.getParameter("show");
		String pids = request.getParameter("pid");
		int pid = Integer.parseInt(pids);
		news.deleteNews(pid, show);
		PopularlZation page = news.selectNewsDetalls(pid);
		request.setAttribute("page", page);
		newsPageAll(request, response);
	}

	protected void newsTime(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String addtime = request.getParameter("addtime");
		List<PopularlZation> pop = news.selectNewstime(addtime, null);
		Page<PopularlZation> page = new Page<PopularlZation>();
		String currentPage = request.getParameter("currentPage");
		// 当前页数
		page.setCurrentPage(Integer.parseInt(currentPage));
		// 设置数据总量
		page.setDateTotal(pop.size());
		String pageTotal = request.getParameter("pageTotal");
		// 设置每页数据量
		page.setPageTotal(Integer.parseInt(pageTotal));
		List<PopularlZation> pagepop = news.selectNewstime(addtime, page);
		// 设置显示数据
		page.setPages(pagepop);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/admin/query_knowledge2.jsp").forward(request, response);
	}

	protected void newsTit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		List<PopularlZation> pop = news.selectNewstitle(title, null);
		Page<PopularlZation> page = new Page<PopularlZation>();
		String currentPage = request.getParameter("currentPage");
		// 当前页数
		page.setCurrentPage(Integer.parseInt(currentPage));
		// 设置数据总量
		page.setDateTotal(pop.size());
		String pageTotal = request.getParameter("pageTotal");
		// 设置每页数据量
		page.setPageTotal(Integer.parseInt(pageTotal));
		List<PopularlZation> pagepop = news.selectNewstitle(title, null);
		// 设置显示数据
		page.setPages(pagepop);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/admin/query_knowledge2.jsp").forward(request, response);
	}
	protected void selectTimen(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String time = request.getParameter("times");
			if(time=="") {
				request.setAttribute("msg","请输入信息");
				request.getRequestDispatcher("/admin/query_knowledge3.jsp").forward(request, response);
			}else {
				List<PopularlZation> page = news.selectNewstime(time, null);
				if(page==null) {
					request.setAttribute("msg","输入错误,或没有当天信息");
					request.getRequestDispatcher("/admin/query_knowledge3.jsp").forward(request, response);
				}
				request.setAttribute("page",page);
				request.getRequestDispatcher("/admin/query_knowledge3.jsp").forward(request, response);

			}

		
	}
	protected void selectTitlen(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String title = request.getParameter("titles");
			if(title=="") {
				request.setAttribute("msg","请输入标题");
				request.getRequestDispatcher("/admin/query_knowledge3.jsp").forward(request, response);
			}else {

			List<PopularlZation> page = news.selectNewstitle(title, null);
			request.setAttribute("page",page);
			request.getRequestDispatcher("/admin/query_knowledge3.jsp").forward(request, response);
			}
		
	}


	// -------管理员--------------------------------

	protected void useradminAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<UserBean> userAll = useradmin.selectAll(null);
		Page<UserBean> page = new Page<>();
		// 设置每页数据量
		String pageTotal = request.getParameter("pageTotal");
		page.setPageTotal(Integer.parseInt(pageTotal));
		String currentPage = request.getParameter("currentPage");
		// 当前页数
		page.setCurrentPage(Integer.parseInt(currentPage));
		// 设置数据总量
		page.setDateTotal(userAll.size());
		List<UserBean> pagedoctor = useradmin.selectAll(page);
		// 设置显示数据
		page.setPages(pagedoctor);
		String json = gson.toJson(page);
		response.getWriter().print(json);
	}

	protected void useradminPageAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<UserBean> userAll = useradmin.selectAll(null);
		Page<UserBean> page = new Page<>();
		// 设置每页数据量
		String pageTotal = request.getParameter("pageTotal");
		page.setPageTotal(Integer.parseInt(pageTotal));
		String currentPage = request.getParameter("currentPage");
		// 当前页数
		page.setCurrentPage(Integer.parseInt(currentPage));
		// 设置数据总量
		page.setDateTotal(userAll.size());
		List<UserBean> pagedoctor = useradmin.selectAll(page);
		// 设置显示数据
		page.setPages(pagedoctor);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/admin/query_user2.jsp").forward(request, response);
	}

	protected void removeUseradmin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String state = request.getParameter("state");
		String userName = request.getParameter("userName");
		useradmin.forbiddenUser(userName, state);
		useradminPageAll(request, response);
	}
	protected void removeUseradminTow(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String state = request.getParameter("state");
		String userName = request.getParameter("userName");
		useradmin.forbiddenUser(userName, state);
		List<UserBean> page = useradmin.selectnameu(userName);
		
		request.setAttribute("page",page);
		request.getRequestDispatcher("/admin/query_user3.jsp").forward(request, response);
		
	}
	
	protected void revamapUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		request.setAttribute("user", userName);
		request.getRequestDispatcher("/admin/revamapUser.jsp").forward(request, response);
	}
	
	protected void selectNameu(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("selname");
		if(name == "") {
			request.setAttribute("msg","请输入用户姓名");
			request.getRequestDispatcher("/admin/query_user3.jsp").forward(request, response);
		}else {
			List<UserBean> page = useradmin.selectname(name);
			request.setAttribute("page",page);
			request.getRequestDispatcher("/admin/query_user3.jsp").forward(request, response);
		}
	}

	// -------主页------------------------------------
    @RequestMapping("/homeAll")
	@ResponseBody
	protected Page<AMessageBean> homeAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Page<AMessageBean> page = new Page<AMessageBean>();
		//获取时间
		Date data = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String datetime = dateFormat.format(data);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		// 当前页数
		page.setCurrentPage(currentPage);
		int pageTotal = Integer.parseInt(request.getParameter("pageTotal"));
		List<AMessageBean> mess = home.selectToday(null,-1,-1);
		List<AMessageBean> messAll = home.selectAll(-1,-1);
		// 设置每页数据量
		page.setPageTotal(pageTotal);
		if (mess.size() != 0) {
			// 设置数据总量
			page.setDateTotal(mess.size());
			page.setPages(home.selectToday(datetime,(currentPage-1)*pageTotal,pageTotal));
		} else {
			page.setDateTotal(messAll.size());
			page.setPages(home.selectAll((currentPage-1)*pageTotal,pageTotal));

		}
		return page;
	}

	@RequestMapping("/homePageAll")
	protected String homePageAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Date data = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String datetime = dateFormat.format(data);
		Page<AMessageBean> page = new Page<AMessageBean>();

		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		// 当前页数
		page.setCurrentPage(currentPage);
		int pageTotal = Integer.parseInt(request.getParameter("pageTotal"));
		// 设置每页数据量
		page.setPageTotal(pageTotal);
		List<AMessageBean> mess = home.selectToday(null,(currentPage-1)*pageTotal,pageTotal);
		List<AMessageBean> messAll = home.selectAll(-1,-1);
		if (mess.size() != 0) {
			// 设置数据总量
			page.setDateTotal(mess.size());
			page.setPages(home.selectToday(datetime,(currentPage-1)*pageTotal,pageTotal));
		} else {
			page.setDateTotal(messAll.size());
			page.setPages(home.selectAll((currentPage-1)*pageTotal,pageTotal));
		}
		// 设置显示数据
		request.setAttribute("page", page);
		return "/admin/Home_page_content2";
	}

	@RequestMapping("/homeNum")
	@ResponseBody
	protected Map<String, Integer>  homeNum(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int numyes = home.selevtStateSum("1");
		int numnot = home.selevtStateSum("0");
		int numdel = home.selevtStateSum("2");
		Map<String, Integer> maps = new HashMap<>();
		maps.put("numyess", numyes);
		maps.put("numnots", numnot);
		maps.put("numdels", numdel);
		return maps;
	}

}
