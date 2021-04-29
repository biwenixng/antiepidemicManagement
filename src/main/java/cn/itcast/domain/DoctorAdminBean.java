package cn.itcast.domain;

/**
 * @author zj
 *医生管理
 */
public class DoctorAdminBean {
	private String userName; // 医生用户名
	private String passWord; // 密码
	private String name; // 姓名
	private String synopsis; // 简介
	private String imgPath; // 图片路径
	private String show = "1";	//是否删除
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	
	
	public DoctorAdminBean(String userName, String passWord, String name, String synopsis, String imgPath, String show) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.name = name;
		this.synopsis = synopsis;
		this.imgPath = imgPath;
		this.show = show;
	}
	public DoctorAdminBean() {
		
	}
	
	
}
