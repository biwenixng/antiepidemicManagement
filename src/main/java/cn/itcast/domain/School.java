package cn.itcast.domain;

public class School {
	private int schoolid;
	private String schoolname;

	public int getSchoolid() {
		return schoolid;
	}

	public void setSchoolid(int schoolid) {
		this.schoolid = schoolid;
	}

	public String getSchoolname() {
		return schoolname;
	}

	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}

	public School() {
	}

	public School(int schoolid, String schoolname) {
		this.schoolid = schoolid;
		this.schoolname = schoolname;
	}

}
