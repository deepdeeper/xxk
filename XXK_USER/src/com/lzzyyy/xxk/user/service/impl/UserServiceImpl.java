package com.lzzyyy.xxk.user.service.impl;

import java.util.List;

import com.lzzyyy.xxk.user.dao.UserDao;
import com.lzzyyy.xxk.user.dao.UserTeamDao;
import com.lzzyyy.xxk.user.pojo.User;
import com.lzzyyy.xxk.user.service.UserService;
import com.lzzyyy.xxk.user.utils.PageBean;
import com.lzzyyy.xxk.user.web.vo.SysUserVo;

public class UserServiceImpl implements UserService {
	private UserDao userDao;
	private UserTeamDao teamDao;
	
	

	public UserTeamDao getTeamDao() {
		return teamDao;
	}

	public void setTeamDao(UserTeamDao teamDao) {
		this.teamDao = teamDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User frindByUserId(User user) {

		User u = userDao.findUniqueByHql(
				"from User as u where u.userName =? and u.userPwd =?",
				new Object[] { user.getUserName(), user.getUserPwd() });
		try {

		} catch (Exception e) {

			e.printStackTrace();
		}
		return u;
	}

	public void addUser(User user) {
		try {

			userDao.saveOrUpdate(user);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteUser(User user) {

	}

	public int findCount(User user) {

		return userDao.findCountsByCriteria(User.class, user);
	}

	public List<User> findUserByPageBean(PageBean bean, User user) {
		List<User> users = userDao.findByCriteria(User.class, "userId", true,
				(bean.getCurrentPage() - 1) * bean.getPageSize(),
				bean.getPageSize(), user);
		return users;
	}

	public SysUserVo changUser2Vo(User user) {
		SysUserVo  userVo  = new SysUserVo();
		if(null!=user){
			userVo.setUserId(user.getUserId());
			userVo.setUserName(user.getUserName());
			//userVo.setTeamName(teamDao.findUserTeam(user).getTeamName());
			userVo.setAddDate(user.getAddDate().toString());
			userVo.setUserRealName(user.getUserRealName());
			
		}
	
		return userVo;
	
	}
}
