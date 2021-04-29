package cn.itcast.domain;

public class UserBean {
	
	private String userName;	//用户名
	
	private String password;    //密码
	
	private OrderAdmin  address; //配送地址
	
	private String residence;	//用户住址
	
	private String name;		//用户姓名
	
	private String phone;		//用户电话
	
	private String idNumber;	//用户身份证号
	
	private int integral;		//积分
	
	private String state;        //账号状态
	
	private String health;	   //健康状态
	
	private String healthPath;//健康码路径
	
	private String headimg;	   //头像路径

	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public OrderAdmin getAddress() {
		return address;
	}

	public void setAddress(OrderAdmin address) {
		this.address = address;
	}

	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public String getName() {
		return name;
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

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public int getIntegral() {
		return integral;
	}

	public void setIntegral(int integral) {
		this.integral = integral;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getHealth() {
		return health;
	}

	public void setHealth(String health) {
		this.health = health;
	}

	public String getHealthPath() {
		return healthPath;
	}

	public void setHealthPath(String healthPath) {
		this.healthPath = healthPath;
	}

	public String getHeadimg() {
		return headimg;
	}

	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}

	

	public UserBean(String userName, String password, OrderAdmin address, String residence, String name, String phone,
			String idNumber, int integral, String state, String health, String healthPath, String headimg) {
		super();
		this.userName = userName;
		this.password = password;
		this.address = address;
		this.residence = residence;
		this.name = name;
		this.phone = phone;
		this.idNumber = idNumber;
		this.integral = integral;
		this.state = state;
		this.health = health;
		this.healthPath = healthPath;
		this.headimg = headimg;
	}

	public UserBean() {
		super();
	}

	

	
	
}
