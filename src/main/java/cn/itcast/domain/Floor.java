package cn.itcast.domain;

public class Floor {
    private int floorid;
    private String schoolname;
    private String floorname;
	public int getFloorid() {
		return floorid;
	}
	public void setFloorid(int floorid) {
		this.floorid = floorid;
	}
	public String getSchoolname() {
		return schoolname;
	}
	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}
	public String getFloorname() {
		return floorname;
	}
	public void setFloorname(String floorname) {
		this.floorname = floorname;
	}
	
	public Floor() {}
	
	public Floor(int floorid, String schoolname, String floorname) {
		super();
		this.floorid = floorid;
		this.schoolname = schoolname;
		this.floorname = floorname;
	}
    
}
