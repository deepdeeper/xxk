package com.lzzyyy.xxk.user.dao.impl;


import java.util.List;

import com.lzzyyy.xxk.user.dao.UserTeamDao;
import com.lzzyyy.xxk.user.pojo.User;
import com.lzzyyy.xxk.user.pojo.UserTeam;

public class UserTeamDaoImpl extends EntityDaoImpl<UserTeam, Integer> implements
		UserTeamDao {

	public UserTeam findUserTeam(User user) {
	
	//	UserTeam userTeam   = findUniqueByHql("from UserTeam t where ? = t.teamId", new Object[]{user.getTeam().getTeamId()});
		return null;
	}

	public List<UserTeam> findTeamByUser(User user) {
	
		String deptId = user.getDept().getDeptId();
		
		List<UserTeam> teams = findByHql("from UserTeam t where t.dept.id = ? ", new Object[]{deptId});
		return teams;
	}


}
