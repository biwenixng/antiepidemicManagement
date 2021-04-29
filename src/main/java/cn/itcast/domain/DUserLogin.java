package cn.itcast.domain;

public class DUserLogin {
	private String username;
	private String password;
	private String Show;
	
	public String getShow() {
		return Show;
	}

	public void setShow(String show) {
		Show = show;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setUserpassword(String password) {
		this.password = password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}
	public DUserLogin() {}
	public DUserLogin(String username, String password,String Show) {
		this.username = username;
		this.password = password;
		this.Show = Show;
	}

}
