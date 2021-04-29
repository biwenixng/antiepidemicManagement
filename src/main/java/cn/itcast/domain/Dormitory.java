package cn.itcast.domain;

public class Dormitory {

	private int dormitory;
	private String floorname;
	private String dormitoryname;

	public int getDormitory() {
		return dormitory;
	}

	public void setDormitory(int dormitory) {
		this.dormitory = dormitory;
	}

	public String getFloorname() {
		return floorname;
	}

	public void setFloorname(String floorname) {
		this.floorname = floorname;
	}

	public String getDormitoryname() {
		return dormitoryname;
	}

	public void setDormitoryname(String dormitoryname) {
		this.dormitoryname = dormitoryname;
	}

	public Dormitory() {
	}

	public Dormitory(int dormitory, String floorname, String dormitoryname) {
		this.dormitory = dormitory;
		this.floorname = floorname;
		this.dormitoryname = dormitoryname;
	}

}
