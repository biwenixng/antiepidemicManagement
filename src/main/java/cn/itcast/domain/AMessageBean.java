package cn.itcast.domain;


/**
 * @author zj 每日信息上传
 */
public class AMessageBean {

	private UserBean userName;	//用户名
	
	private double temperature; // 体温

	private String state;// 健康状态

	private String journey;// 行程

	private String uploadtime; // 上传时间
	
	public UserBean getUserName() {
		return userName;
	}

	public void setUserName(UserBean userName) {
		this.userName = userName;
	}

	public String getState() {
		return state;
	}

	public String getJourney() {
		return journey;
	}

	public double getTemperature() {
		return temperature;
	}

	public void setTemperature(double temperature) {
		this.temperature = temperature;
	}

	public String getstate() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getjourney() {
		return journey;
	}

	public void setJourney(String journey) {
		this.journey = journey;
	}

	public String getUploadtime() {
		return uploadtime;
	}

	public void setUploadtime(String uploadtime) {
		this.uploadtime = uploadtime;
	}

	public AMessageBean() {
	}

	public AMessageBean(UserBean userName, double temperature, String state, String journey, String uploadtime) {
		super();
		this.userName = userName;
		this.temperature = temperature;
		this.state = state;
		this.journey = journey;
		this.uploadtime = uploadtime;
	}
	
	

}
