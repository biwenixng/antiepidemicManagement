package cn.itcast.domain;


/**
 * @author zj
 *防疫新闻管理
 */
public class PopularlZation {
	
	 private int pid; 			// 科普编号
	 private String title;		//科普标题
	 private String center;		//科普内容
	 private String addTime;		//添加时间
	 private String imageurl;	//图片路径
	 private String show;      //是否删除
	 
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCenter() {
		return center;
	}
	public void setCenter(String center) {
		this.center = center;
	}
	public String getAddTime() {
		return addTime;
	}
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	
	
	public PopularlZation() {
		super();
	}
	public PopularlZation(int pid, String title, String center, String addTime, String imageurl, String show) {
		super();
		this.pid = pid;
		this.title = title;
		this.center = center;
		this.addTime = addTime;
		this.imageurl = imageurl;
		this.show = show;
	}
	

	 
}
