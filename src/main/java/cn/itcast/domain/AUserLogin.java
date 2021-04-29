package cn.itcast.domain;

public class AUserLogin {

	private String username;
	private String userpassword;
	private String idnumber;
	private String phone;	


	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	public String getUserpassword() {
		return userpassword;
	}
		
	public String getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	public AUserLogin() {}

	public AUserLogin(String username, String userpassword, String idnumber, String phone) {
		this.username = username;
		this.userpassword = userpassword;
		this.idnumber = idnumber;
		this.phone = phone;
	}
	
	
}
