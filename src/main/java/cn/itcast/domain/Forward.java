package cn.itcast.domain;

public class Forward {
	private int fid;
	private String duser;
	private String auser;
	private String appointTime;
	private String appointmentTime;
	private String phone;

	public Forward() {
		
	}

	public Forward(int fid, String duser, String auser, String appointTime, 
			String appointmentTime, String phone) {
		this.fid = fid;
		this.duser = duser;
		this.auser = auser;
		this.appointTime = appointTime;
		this.appointmentTime = appointmentTime;
		this.phone = phone;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getDuser() {
		return duser;
	}

	public void setDuser(String duser) {
		this.duser = duser;
	}

	public String getAuser() {
		return auser;
	}

	public void setAuser(String auser) {
		this.auser = auser;
	}

	public String getAppointTime() {
		return appointTime;
	}

	public void setAppointTime(String appointTime) {
		this.appointTime = appointTime;
	}

	public String getAppointmentTime() {
		return appointmentTime;
	}

	public void setAppointmentTime(String appointmentTime) {
		this.appointmentTime = appointmentTime;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Forward [fid=" + fid + ", duser=" + duser + ", auser=" + auser + ", appointTime=" + appointTime
				+ ", appointmentTime=" + appointmentTime + ", phone=" + phone + "]";
	}

}
