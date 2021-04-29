package cn.itcast.domain;

public class Shopselect {
	private int cid;
	private String commodityname;
	private String price;
	private String inventory;
	private String usename;
	private String synopsis;
	private String productname;
	private String shoppingimg;
	private String specialname;
	private int  weight;
	private String vaildty;
	private String show;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCommodityname() {
		return commodityname;
	}
	public void setCommodityname(String commodityname) {
		this.commodityname = commodityname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getInventory() {
		return inventory;
	}
	public void setInventory(String inventory) {
		this.inventory = inventory;
	}
	public String getUsename() {
		return usename;
	}
	public void setUsename(String usename) {
		this.usename = usename;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getShoppingimg() {
		return shoppingimg;
	}
	public void setShoppingimg(String shoppingimg) {
		this.shoppingimg = shoppingimg;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getVaildty() {
		return vaildty;
	}
	public void setVaildty(String vaildty) {
		this.vaildty = vaildty;
	}
	public String getSpecialname() {
		return specialname;
	}
	public void setSpecialname(String specialname) {
		this.specialname = specialname;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	@Override
	public String toString() {
		return "Shopselect [cid=" + cid + ", commodityname=" + commodityname + ", price=" + price + ", inventory="
				+ inventory + ", usename=" + usename + ", synopsis=" + synopsis + ", productname=" + productname
				+ ", shoppingimg=" + shoppingimg + ", specialname=" + specialname + ", weight=" + weight + ", vaildty="
				+ vaildty + ", show=" + show + "]";
	}
	
	
}
