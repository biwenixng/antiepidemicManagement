package cn.itcast.domain;


/**
 * @author zj 每日信息上传
 */
public class AMessageBean {

	private String username;	//用户

	private String name; //用户名
	
	private double temperature; // 体温

	private String state;// 健康状态

	private String journey;// 行程

	private String uploadtime; // 上传时间

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getTemperature() {
		return temperature;
	}

	public void setTemperature(double temperature) {
		this.temperature = temperature;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getJourney() {
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

	@Override
	public String toString() {
		return "AMessageBean{" +
				"username='" + username + '\'' +
				", name='" + name + '\'' +
				", temperature=" + temperature +
				", state='" + state + '\'' +
				", journey='" + journey + '\'' +
				", uploadtime='" + uploadtime + '\'' +
				'}';
	}
}
