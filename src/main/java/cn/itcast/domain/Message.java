package cn.itcast.domain;


public class Message {
	private String Username;
	private double Temperature;
	private String State;
	private String Journey;
	private String Uploadtime;
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}

	public double getTemperature() {
		return Temperature;
	}
	public void setTemperature(double temperature) {
		Temperature = temperature;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getJourney() {
		return Journey;
	}
	public void setJourney(String journey) {
		Journey = journey;
	}
	public String getUploadtime() {
		return Uploadtime;
	}
	public void setUploadtime(String uploadtime) {
		Uploadtime = uploadtime;
	}
	
	
}
