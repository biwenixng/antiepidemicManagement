package cn.itcast.domain;

public class Classify {
	private int productId;
	private String productname;

	public Classify() {
		
	}

	public Classify(int productId, String productname) {
		this.productId = productId;
		this.productname = productname;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	@Override
	public String toString() {
		return productId + ":" + productname;
	}
}
