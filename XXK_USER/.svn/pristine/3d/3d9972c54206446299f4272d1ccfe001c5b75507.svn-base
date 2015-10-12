package com.lzzyyy.xxk.user.dao.impl;


import org.hibernate.Query;
import org.hibernate.Session;

import com.lzzyyy.xxk.user.dao.UserDao;
import com.lzzyyy.xxk.user.pojo.User;

public class UserDaoImpl extends EntityDaoImpl<User, Integer> implements UserDao {

	void addUser(User user) {
	 try {
		this.saveOrUpdate(user);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	}

	public User findUserByName(String userName) {
		
		String sql = "from User where User.userName =? ";
	     ;
		Query q  = super.getSession().createQuery(sql).setString(0, userName);
		
		return  (User) q.uniqueResult();
	}

}
