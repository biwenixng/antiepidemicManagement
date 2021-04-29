package cn.itcast.domain;

public class AdminBoss {
	private String userName;	//用户名
	private String passWord;	//密码
	private String juisdIction;	//管理员权限
	private String show; 		//删除
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
	public String getJuisdIction() {
		return juisdIction;
	}
	public void setJuisdIction(String juisdIction) {
		this.juisdIction = juisdIction;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	
	
	public AdminBoss() {
		super();
	}
	public AdminBoss(String userName, String passWord, String juisdIction, String show) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.juisdIction = juisdIction;
		this.show = show;
	}
	
	
}
