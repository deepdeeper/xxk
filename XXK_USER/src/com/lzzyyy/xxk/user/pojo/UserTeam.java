package com.lzzyyy.xxk.user.pojo;

import java.util.HashSet;
import java.util.Set;

public class UserTeam {
	private String teamId;
	private String teamName;
	private String teamRemark;
	private Set<User> users = new HashSet<User>(0);
	private Department dept;

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getTeamRemark() {
		return teamRemark;
	}

	public void setTeamRemark(String teamRemark) {
		this.teamRemark = teamRemark;
	}

}
