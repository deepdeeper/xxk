package com.lzzyyy.xxk.user.pojo;

import java.util.HashSet;
import java.util.Set;

public class Department {

	private String deptId;
	private String deptName;
	private String deptRemark;

	private Department parentDept;
	private Set<Department> childDept;
	//private Set<UserTeam>  teams;
	private Set<User> users = new HashSet<User>(0);

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptRemark() {
		return deptRemark;
	}

	public void setDeptRemark(String deptRemark) {
		this.deptRemark = deptRemark;
	}

	public Department getParentDept() {
		return parentDept;
	}

	public void setParentDept(Department parentDept) {
		this.parentDept = parentDept;
	}

	public Set<Department> getChildDept() {
		return childDept;
	}

	public void setChildDept(Set<Department> childDept) {
		this.childDept = childDept;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	
	
	

}
