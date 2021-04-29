package cn.itcast.domain;

public class Special {
	private int specialId;
	private String specialName;

	public Special() {
		
	}

	public Special(int specialId, String specialName) {
		this.specialId = specialId;
		this.specialName = specialName;
	}

	public int getSpecialId() {
		return specialId;
	}

	public void setSpecialId(int special) {
		this.specialId = special;
	}

	public String getSpecialName() {
		return specialName;
	}

	public void setSpecialName(String specialName) {
		this.specialName = specialName;
	}

	@Override
	public String toString() {
		return specialId + ":" + specialName;
	}

}
