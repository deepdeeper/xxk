package com.lzzyyy.xxk.user.pojo;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 
 * @作者 yaxiu
 * @时间 2015-9-1 权限bean
 */
public class SysRole {

	private String roleId;

	private String roleName;

	private String remark;
    
	private int securityLevel;

	// 一个角色可能被多个用户拥有
	private Set<User> users = new HashSet<User>(0);

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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getSecurityLevel() {
		return securityLevel;
	}

	public void setSecurityLevel(int securityLevel) {
		this.securityLevel = securityLevel;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	
	// 一个角色可能拥有多个操作菜单

}