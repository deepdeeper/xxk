package com.lzzyyy.xxk.user.service;

import java.util.List;

import com.lzzyyy.xxk.user.pojo.User;
import com.lzzyyy.xxk.user.pojo.UserTeam;

public interface UserTeamService {
	
   public List<UserTeam> findAllTeam();
   public UserTeam findTime(String teamName);
   public List<UserTeam> findTeamByUser(User user);
   
}
