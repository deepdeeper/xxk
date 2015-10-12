package com.lzzyyy.xxk.user.pojo;

/**
 * 
 * @作者 yaxiu
 * @时间 2015-9-1 工作中涉及到的硬件信息
 */
public class HardWare {
	private Integer hwId;
	private String hwName;
	private String hwRemark;
	private Integer hwState;//硬件的状态

	public Integer getHwId() {
		return hwId;
	}

	public void setHwId(Integer hwId) {
		this.hwId = hwId;
	}

	public String getHwName() {
		return hwName;
	}

	public void setHwName(String hwName) {
		this.hwName = hwName;
	}

	public String getHwRemark() {
		return hwRemark;
	}

	public void setHwRemark(String hwRemark) {
		this.hwRemark = hwRemark;
	}

	public Integer getHwState() {
		return hwState;
	}

	public void setHwState(Integer hwState) {
		this.hwState = hwState;
	}

}
