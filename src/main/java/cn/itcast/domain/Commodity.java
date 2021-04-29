package cn.itcast.domain;

import java.math.BigDecimal;

public class Commodity {
	private int cid;
	private String commodityName;
	private BigDecimal price;
	private int inventory;
	private Special special;
	private Use use;
	private String synopsis;
	private Classify classify;
	private String shoppingImg;
	private int weight;
	private String vaildty;
	private String show;

	public Commodity() {
	}

	public Commodity(int cid, String commodityName, BigDecimal price, int inventory, Special special, Use use,
			String synopsis, Classify classify, String shoppingImg, int weight, String vaildty) {
		this.cid = cid;
		this.commodityName = commodityName;
		this.price = price;
		this.inventory = inventory;
		this.special = special;
		this.use = use;
		this.synopsis = synopsis;
		this.classify = classify;
		this.shoppingImg = shoppingImg;
		this.weight = weight;
		this.vaildty = vaildty;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public Special getSpecial() {
		return special;
	}

	public void setSpecial(Special special) {
		this.special = special;
	}

	public Use getUse() {
		return use;
	}

	public void setUse(Use use) {
		this.use = use;
	}

	public String getSynopsis() {
		return synopsis;
	}

	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}

	public Classify getClassify() {
		return classify;
	}

	public void setClassify(Classify classify) {
		this.classify = classify;
	}

	public String getShoppingImg() {
		return shoppingImg;
	}

	public void setShoppingImg(String shoppingImg) {
		this.shoppingImg = shoppingImg;
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

	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	@Override
	public String toString() {
		return "Commodity [cid=" + cid + ", commodityName=" + commodityName + ", price=" + price + ", inventory="
				+ inventory + ", special=" + special + ", use=" + use + ", synopsis=" + synopsis + ", classify="
				+ classify + ", shoppingImg=" + shoppingImg + ", weight=" + weight + ", vaildty=" + vaildty + ", show="
				+ show + "]";
	}

}
