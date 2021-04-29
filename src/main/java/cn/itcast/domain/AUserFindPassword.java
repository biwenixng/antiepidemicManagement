package cn.itcast.domain;

public class AUserFindPassword {

	private String phone;
	private String userpassword;
	public String getPhone() {
		return phone;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public AUserFindPassword() {}
	public AUserFindPassword(String phone, String userpassword) {
		this.phone = phone;
		this.userpassword = userpassword;
	}

}
