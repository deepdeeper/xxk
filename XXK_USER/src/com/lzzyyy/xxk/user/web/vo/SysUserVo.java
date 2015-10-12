package com.lzzyyy.xxk.user.web.vo;

import java.sql.Timestamp;
import java.util.List;

/**
 * 
 * @author 向才鹏
 * @version 1.0 Copyright (C), 2009,www.soujava.cn所有 Program Name:鹏哥伟业 Date: Apr
 *          18, 2010 10:41:55 PM
 */
public class SysUserVo {
	private String id;
	private String userId;
	private String userName;
	private int userModel;
	private String userPwd;
	private String realName;
	private String regionId;
	private String regionName;
	private String regionModel;

	private String unitId;
	private String unitName;
	private String unitModel;

	private String departmentId;
	private String departmentName;
	private String departmentModel;
	private String state;
	private Timestamp loginTime;
	private String loginIp;
	private String remark;

	private String userSystemRoleName;

	// private PortalRole role; //用户权限
	private String roleId;
	private String roleName;

	// 栏目
	private String classIds;
	private String classNames;
	private List<String> classIdSet;

	// private Set<SysClass> xunWangClasses = new HashSet<SysClass>(0);

	private String subjectId;
	private String subjectName;
	private String fileName;
	private String shuiying;
	private String teamName; // 小组名称
	private String addDate;
	private String userRealName;

	public String getUserRealName() {
		return userRealName;
	}

	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getShuiying() {
		return shuiying;
	}

	public void setShuiying(String shuiying) {
		this.shuiying = shuiying;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getClassIds() {
		return classIds;
	}

	public void setClassIds(String classIds) {
		this.classIds = classIds;
	}

	public String getClassNames() {
		return classNames;
	}

	public void setClassNames(String classNames) {
		this.classNames = classNames;
	}

	public List<String> getClassIdSet() {
		return classIdSet;
	}

	public void setClassIdSet(List<String> classIdSet) {
		this.classIdSet = classIdSet;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getDepartmentModel() {
		return departmentModel;
	}

	public void setDepartmentModel(String departmentModel) {
		this.departmentModel = departmentModel;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Timestamp getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((departmentId == null) ? 0 : departmentId.hashCode());
		result = prime * result
				+ ((departmentModel == null) ? 0 : departmentModel.hashCode());
		result = prime * result
				+ ((departmentName == null) ? 0 : departmentName.hashCode());
		result = prime * result
				+ ((realName == null) ? 0 : realName.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result
				+ ((userName == null) ? 0 : userName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final SysUserVo other = (SysUserVo) obj;
		if (departmentId == null) {
			if (other.departmentId != null)
				return false;
		} else if (!departmentId.equals(other.departmentId))
			return false;
		if (departmentModel == null) {
			if (other.departmentModel != null)
				return false;
		} else if (!departmentModel.equals(other.departmentModel))
			return false;
		if (departmentName == null) {
			if (other.departmentName != null)
				return false;
		} else if (!departmentName.equals(other.departmentName))
			return false;
		if (realName == null) {
			if (other.realName != null)
				return false;
		} else if (!realName.equals(other.realName))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		return true;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getRegionId() {
		return regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getRegionModel() {
		return regionModel;
	}

	public void setRegionModel(String regionModel) {
		this.regionModel = regionModel;
	}

	public String getUnitId() {
		return unitId;
	}

	public void setUnitId(String unitId) {
		this.unitId = unitId;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getUnitModel() {
		return unitModel;
	}

	public void setUnitModel(String unitModel) {
		this.unitModel = unitModel;
	}

	public String getUserSystemRoleName() {
		return userSystemRoleName;
	}

	public void setUserSystemRoleName(String userSystemRoleName) {
		this.userSystemRoleName = userSystemRoleName;
	}

	public String getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getUserModel() {
		return userModel;
	}

	public void setUserModel(int userModel) {
		this.userModel = userModel;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
}