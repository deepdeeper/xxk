package com.lzzyyy.xxk.user.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.lzzyyy.xxk.user.dao.UserTeamDao;
import com.lzzyyy.xxk.user.pojo.User;
import com.lzzyyy.xxk.user.pojo.UserTeam;

public class UserTeamService implements
		com.lzzyyy.xxk.user.service.UserTeamService { 
	
 	private  UserTeamDao  stDao ;
 	

	public UserTeamDao getStDao() {
		return stDao;
	}


	public void setStDao(UserTeamDao stDao) {
		this.stDao = stDao;
	}


	public List<UserTeam> findAllTeam() {
		List<UserTeam> teams  = stDao.findAll(UserTeam.class, "teamId", true, new UserTeam());
		return teams;
	}


	public UserTeam findTime(String TeamName) {
		
		return stDao.findUniqueByProperty(UserTeam.class, "teamName", TeamName);
	}


	public List<UserTeam> findTeamByUser(User user) {
		
		return stDao.findTeamByUser(user);
	}



}