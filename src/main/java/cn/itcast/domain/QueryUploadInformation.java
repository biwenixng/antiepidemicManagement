package cn.itcast.domain;



public class QueryUploadInformation {
	//用户名
	private String username;
	//姓名
	private String name;
	//体温
	private double temperature;
	//状态
	private String state;
	//行程
	private String journey;
	//上传时间
	private String uploadtime;
	
	
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
	
	
}
