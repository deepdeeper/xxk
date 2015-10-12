package com.lzzyyy.xxk.user.dao;

import java.util.List;

import com.lzzyyy.xxk.user.pojo.User;
import com.lzzyyy.xxk.user.pojo.UserTeam;

public interface UserTeamDao extends EntityDao<UserTeam, Integer> {
	  public UserTeam findUserTeam(User user);
	  public List<UserTeam> findTeamByUser(User user);

}
