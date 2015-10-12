package com.lzzyyy.xxk.user.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class User {
	private String userId;
	private String userName;
	private String userPwd;
	private String userRealName;
	private String remark;
	private SysRole role;
	private java.util.Date addDate;
	// private UserTeam team;
	private Department dept;
	private String pictureUrl;// 用户头像的地址
	private Set<WorkRecord> records = new HashSet<WorkRecord>();
	private String status;//启用状态
	
	

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public java.util.Date getAddDate() {
		return addDate;
	}

	public void setAddDate(java.util.Date addDate) {
		this.addDate = addDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserRealName() {
		return userRealName;
	}

	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public SysRole getRole() {
		return role;
	}

	public void setRole(SysRole role) {
		this.role = role;
	}

	public Set<WorkRecord> getRecords() {
		return records;
	}

	public void setRecords(Set<WorkRecord> records) {
		this.records = records;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	

}
