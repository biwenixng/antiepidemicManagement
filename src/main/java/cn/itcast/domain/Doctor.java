package cn.itcast.domain;

public class Doctor {
	private String userName;
	private String passWord;
	private String name;
	private String synopsis;
	private String imgPath;

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

	public Doctor() {
		super();
	}

	public Doctor(String userName, String passWord, String name, String synopsis, String imgPath) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.name = name;
		this.synopsis = synopsis;
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "Doctor [userName=" + userName + ", passWord=" + passWord + ", name=" + name + ", synopsis=" + synopsis
				+ ", imgPath=" + imgPath + "]";
	}
}
