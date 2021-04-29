package cn.itcast.domain;

public class AUserRegistered {
    private String username;
    private String password;
    private String residence;
    private String name;
    private String phone;
    private String idnumber;
    
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public String getResidence() {
		return residence;
	}
	public String getName() {
		return name;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIdnumber() {
		return idnumber;
	}
	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}
	public AUserRegistered() {}
	public AUserRegistered(String username, String password, String residence, String name, String phone,
			String idnumber) {
		this.username = username;
		this.password = password;
		this.residence = residence;
		this.name = name;
		this.phone = phone;
		this.idnumber = idnumber;
	}
    
    
}
