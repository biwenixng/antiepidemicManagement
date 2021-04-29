package cn.itcast.domain;

public class Use {
	private int useId;
	private String useName;

	public Use() {
		
	}

	public Use(int useId, String useName) {
		this.useId = useId;
		this.useName = useName;
	}

	public int getUseId() {
		return useId;
	}

	public void setUseId(int useId) {
		this.useId = useId;
	}

	public String getUseName() {
		return useName;
	}

	public void setUseName(String useName) {
		this.useName = useName;
	}

	@Override
	public String toString() {
		return useId + ":" + useName;
	}

}
