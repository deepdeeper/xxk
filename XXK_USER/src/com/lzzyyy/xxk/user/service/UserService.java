package com.lzzyyy.xxk.user.service;

import java.util.List;

import com.lzzyyy.xxk.user.pojo.User;
import com.lzzyyy.xxk.user.utils.PageBean;
import com.lzzyyy.xxk.user.web.vo.SysUserVo;

public interface UserService {
    
	public User frindByUserId(User user);
	public void addUser(User user);
	public void  deleteUser(User user);
	public int findCount(User user);
	public List<User> findUserByPageBean(PageBean bean,User user);
	public SysUserVo changUser2Vo(User user);
	
	
}
