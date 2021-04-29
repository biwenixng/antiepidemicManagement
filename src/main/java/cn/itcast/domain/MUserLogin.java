package cn.itcast.domain;

public class MUserLogin {
	private String username;
	private String password;
	private String Show;
	private String juisdiction;
	
	public String getJuisdiction() {
		return juisdiction;
	}

	public void setJuisdiction(String juisdiction) {
		this.juisdiction = juisdiction;
	}

	public String getShow() {
		return Show;
	}

	public void setShow(String show) {
		Show = show;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public MUserLogin() {}
	public MUserLogin(String username, String password,String Show,String juisdiction) {
		this.username = username;
		this.password = password;
		this.Show = Show;
		this.juisdiction = juisdiction;
	}

}
