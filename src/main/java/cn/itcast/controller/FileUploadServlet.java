package cn.itcast.controller;

import cn.itcast.service.MyCenterService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class IndexServlet
 */
@Controller
@RequestMapping("/fileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private MyCenterService service;

	@RequestMapping("/updateAUser")
	protected String updateAUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String realPath = request.getSession().getServletContext().getRealPath("/");
		request.setCharacterEncoding("UTF-8");
		// 1.创建工厂类
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置缓存大小
		factory.setSizeThreshold(10 * 1024 * 1024);
		// 设置临时目录
		File temp = new File(realPath + "/personalCenter/temp");
		temp.mkdirs();
		factory.setRepository(temp);
		// 2.创建解析器
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		// 设置整个表单最大允许字节数
		upload.setSizeMax(5 * 1024 * 1024);
		// 设定单个表单项的大小
		upload.setFileSizeMax(500 * 1024);
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				@SuppressWarnings("unchecked")
				List<FileItem> items = upload.parseRequest(request);
				for (FileItem item : items) {
					// 判断普通表单项还是文件表单项
					if (item.isFormField()) {
						// 普通表单项
						System.out.println(item.getFieldName() + "：" + item.getString("UTF-8"));
					} else {
						String name = item.getName();
						// 格式要求 .jpg .gif .png
						String ftm[] = { ".jpg", ".gif", ".png" };
						boolean value = false;
						for (String fm : ftm) {
							if (name.endsWith(fm)) {
								value = true;
							}
						}
						if (!value) {
							request.setAttribute("msg", "文件格式不支持上传！");
							return "personalCenter/upload_code";
						}
						// 1.WEB-INF 2.目录打散 3.文件重名


						String descPath = realPath + "/personalCenter/images/code";
						//System.out.println(descPath);
						File descFile = new File(descPath);
						descFile.mkdirs();
						String files[] = descFile.list();
						value = false;
						for (String fl : files) {
							if (name.equals(fl)) {
								String end = name.substring(name.lastIndexOf("."));
								name = UUID.randomUUID().toString().replace("-", "").toUpperCase() + end;
							}
						}
						File fastPath = new File(descFile, name);
					    //System.out.println(name);
						//System.out.println(fastPath);
						File file = new File("E:/project/antiepidemic/src/main/webapp/personalCenter/images/head_images",name);
						//System.out.println(file);
						String healthpath= "/personalCenter/images/code/"+ name;
						String username = request.getParameter("username");
						service.updateAUser(healthpath, username);
						item.write(fastPath);
						item.write(file);
						request.setAttribute("msg", "上传成功！");
						return "personalCenter/upload_code";
					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				request.setAttribute("msg", "上传文件不能超过500KB！");
				return "personalCenter/upload_code";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "personalCenter/upload_code";
			}
		}
		return "personalCenter/upload_code";
	}

}
