package com.lzzyyy.xxk.user.dao;

import com.lzzyyy.xxk.user.pojo.User;

public interface UserDao extends EntityDao<User, Integer>{
	
	public User findUserByName(String userName);
	

}